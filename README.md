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


##Full can see the main.dar
class _MyHomePageState extends LnpullListenerState<MyHomePage> { 

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
    );
  }
  onRefrensh()  async{
    await   Future.delayed(const Duration(seconds: 3));
    setState(() {
      finishLoading();      
    });
  }


![Image text](https://github.com/dikeboy/flutter-refrensh/blob/master/image/snap1.gif)
