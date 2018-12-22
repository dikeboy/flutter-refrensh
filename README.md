# flutter_pull

Can use in  any  view which support  Listener;


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

How to  use:  follow  where is import 
class _MyHomePageState extends LnpullListenerState<MyHomePage> { //1.LnpullListenerState<MyHomePage> import
  List<String>  list= [];


 @override
  void initState() {
    // TODO: implement initState
    super.initState();  /// 2super import
    for(int i=0;i<100;i++){
       list.add("i am $i");
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
      child:  getPullListener(  //3. can use in any listview
          child:ListView.separated(
            itemCount: list.length+1,
            separatorBuilder: (BuildContext context, int index) => Divider(
              height: 1,
              color: Colors.transparent,
            ),
            itemBuilder: (BuildContext context, int position) {

              return getRow(position);
            },
            controller: scrollController,
            padding:EdgeInsets.all(0),
          )
          ,startRefrensh:onRefrensh,height:40),
    ),
    );
  }

  getRow(int position){
   if(position==0){
     return getRfrenshHeader();
   }
   else{
     return  Text(list[position-1]); 
   }
  }
  onRefrensh()  async{
    await   Future.delayed(const Duration(seconds: 3));
    setState(() {
      finishLoading();      
    });
  }
  @override
  void dispose() {
    super.dispose();
  }
}

![Image text](https://github.com/dikeboy/flutter-refrensh/blob/master/image/snap1.gif)
