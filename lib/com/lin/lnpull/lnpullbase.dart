import 'package:flutter/material.dart';

typedef MStartRefrensh = void Function();

abstract class LnpullListenerState<T extends StatefulWidget> extends State<T> with SingleTickerProviderStateMixin{
  double dx;
  double dy;
  bool firstJump =false;
  double headHeight=40;
  double  headNormalHeight=40;
  bool  isTouchDown =  false;
  MStartRefrensh pointerUpListener;
  AnimationController animationController;
  Animation<double> animation;
  ScrollController scrollController;
  double len;

  @override
  initState(){
    super.initState();

    animationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animation = Tween(begin: 1.0, end: 0.0).animate(animationController);
    animation.addListener(() {
      setState(() {
        // the animation object’s value is the changed state
        headHeight = (len-headNormalHeight) *animation.value+headNormalHeight;
      });
    });
  }

  /**
   * @param child  the view need refrensh
   * @param  startRefrensh   When refrensh is start;
   * @height  the refrensh height;
   */
  getPullListener({Widget child, MStartRefrensh startRefrensh,double height}){
    this.pointerUpListener = startRefrensh;
    headNormalHeight  =height;
    if(scrollController==null){
      scrollController = ScrollController(initialScrollOffset: height);
    }
    Listener listener = new Listener( child: child, onPointerDown: pointDown,onPointerUp: pointUp,onPointerMove: pointMove,onPointerCancel: pointCancle,);
    if(!firstJump){
      setState(() {
          if(!firstJump&&scrollController.hasClients){
            firstJump =true;
            scrollController.jumpTo(headNormalHeight);
          }
      });
    }
    return listener;
  }

  pointDown(PointerDownEvent event){
    dx = event.position.dx;
    dy=event.position.dy;
    isTouchDown = true;
  }
  pointUp(PointerUpEvent event){
    if(headHeight>headNormalHeight){
      startUpAnimation(headHeight);
    }
    else{
      setState((){
        headHeight=headNormalHeight;
      });
    }

    isTouchDown = false;
  }

  pointCancle(PointerCancelEvent event){
    if(headHeight>headNormalHeight){
      startUpAnimation(headHeight);
    }
    else{
      setState((){
        headHeight=headNormalHeight;
      });
    }
    isTouchDown = false;
  }
  pointMove(PointerMoveEvent event){

//    print(_scrollController.position.pixels);
   setState(() {
      if(event.position.dy  - dy>0)
        headHeight = (event.position.dy  - dy)/2+headNormalHeight;
    });

  }


  startUpAnimation(double len) {
    this.len = len;
    if (animationController.isCompleted) {
      animationController.reset();
    }
    animationController.forward().then((_) {
      headHeight = headNormalHeight;
      pointerUpListener();
//
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (animationController != null) {
      animationController.dispose();
    }
    if(scrollController!=null){
      scrollController.dispose();
    }
  }

  finishLoading(){
     if(scrollController!=null&&scrollController.hasClients){
       scrollController.animateTo(
         headNormalHeight,
         curve: Curves.easeOut,
         duration: const Duration(milliseconds: 100),
       );
     }
  }
  getRfrenshHeader(){
    print(headHeight);
    if(headHeight==headNormalHeight&&!isTouchDown){
      return Container(
        child:   SizedBox(
          child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange)),
          height: 20.0,
          width: 20.0,
        ),
        alignment: Alignment.center,
        height:  headHeight,
      );
    }
    else{
      return getPullView();
    }
  }

  getPullView(){
    return Container(
      child:   SizedBox(
        child: Row(children: <Widget>[
//            new Image.asset('images/drop_refrensh.png'), //Add a tween animation or image
          Text("释放刷新")
        ],
          mainAxisAlignment: MainAxisAlignment.center,),
        height: 20.0,
      ),
      alignment: Alignment.center,
      height:  headHeight,
    );
  }
}


