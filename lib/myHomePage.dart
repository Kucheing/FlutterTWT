import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String text) {
    this.setState(() {
      posts.add(new Post(text, "Faris"));
    });
  } //callback function. simply changes the text above to basically what we have passed in

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Welcome to fariswheel world 🐼🎡;.> ')), //menu bar
        // body: Text('My name is paris okayh')); //just a text
        body: Column(children: <Widget>[
          Expanded(child: PostList(this.posts)),
          TextInputWidget(this
              .newPost) // removing allows the type a message to be at the bottom Expanded(child: Te--)
        ])
        // body: Row(
        //   children: <Widget>[TestWidget(), TestWidget(), TestWidget()],
        );
  }
} //the build method