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

//
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "";

  void changeText(String text) {
    this.setState(() {
      this.text = text;
    });
  } //callback function. simply changes the text above to basically what we have passed in

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text('Welcome to fariswheel world :.> ')), //menu bar
        // body: Text('My name is paris okayh')); //just a text
        body: Column(children: <Widget>[
          TextInputWidget(this
              .changeText), //callback function that we want to use when the button is pressed --
          Text(this.text) // the first main text --
        ])
        // body: Row(
        //   children: <Widget>[TestWidget(), TestWidget(), TestWidget()],
        );
  }
} //the build method

//
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
    widget.callback(controller.text);
    controller.clear();
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

// class TestWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.red,
//       child: Text('Monkuu world'),
//     );
//   }
// } pt 2