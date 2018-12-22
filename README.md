# flutter_pull

Can use in  any  view which support  Listener;
You can replace the title with your self Frame Animation  or image


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
...
 @override
  void initState() {
    // TODO: implement initState
    super.initState();  /// 2super import
 ...
  }
  @override
  Widget build(BuildContext context) {
...
      child:  getPullListener(  //3. can use in any listview
          child:ListView.separated(
...
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
