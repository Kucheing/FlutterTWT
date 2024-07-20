import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Faris App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ), //themeData
      home: MyHomePage(),
    );
  }
}

class TextInputWidget extends StatefulWidget {
  final Function(String) callback;

  TextInputWidget(this.callback);

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller =
      TextEditingController(); // handles the Textfield so clearing and getting the text --
  // String text = ""; //3. text u entered pt 3

  void dispose() {
    super.dispose();
    controller.dispose();
  } //gets rid of resources when we're done with it --

  // void ChangeText(text) {
  //   if (text == "Hello World!") {
  //     controller.clear();
  //     text = "";
  //   } // this if statement basically cleares the text if the text placed here is the same as what the user has inputed
  //   setState(() {
  //     this.text = text; //1. this forces the widget to refresh and rebuilt
  //   });
  // } pt 3

  void click() {
    FocusScope.of(context).unfocus();
    controller.clear();
    widget.callback(controller.text);
  }

  @override
  Widget build(BuildContext context) {
    // return Column(children: <Widget>[ pt 3

    return TextField(
        controller: this.controller,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.message),
            labelText: "Type a message:",
            suffixIcon: IconButton(
              icon: Icon(Icons.send),
              splashColor: Colors.blue,
              tooltip: "Post message", //it pops up when u long press
              onPressed: this.click,
            )));
    // onChanged: (text) => this.ChangeText(text), pt3

    // Text(this.text) //2. redraws the widget with text from no3 pt 3
    //] );
  }
}

class PostList extends StatefulWidget {
  final List<Post> listItems;

  PostList(this.listItems);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void like(Function callback) {
    this.setState(() {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.widget.listItems.length,
      itemBuilder: (context, index) {
        var post = this.widget.listItems[index];
        return Card(
            child: Row(children: <Widget>[
          Expanded(
              child: ListTile(
            title: Text(post.body),
            subtitle: Text(post.author),
          )),
          Row(
            children: <Widget>[
              Container(
                child:
                    Text(post.likes.toString(), style: TextStyle(fontSize: 20)),
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              ),
              IconButton(
                  icon: Icon(Icons.thumb_up),
                  onPressed: () => this.like(post.likePost),
                  color: post.userLiked ? Colors.green : Colors.black)
            ],
          )
        ]));
      },
    );
  }
}

// class TestWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.red,
//       child: Text('Monkuu world'),
//     );
//   }
// } pt 2