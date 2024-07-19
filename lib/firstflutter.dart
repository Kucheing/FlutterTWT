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
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ), //themeData
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hello World!')), //menu bar
      // body: Text('My name is paris okayh')); //just a text
      body: TextInputWidget(),
      // body: Row(
      //   children: <Widget>[TestWidget(), TestWidget(), TestWidget()],
    );
  }
}

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({super.key});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();
  // String text = ""; //3. text u entered pt 3

  void dispose() {
    super.dispose();
    controller.dispose();
  }

  // void ChangeText(text) {
  //   if (text == "Hello World!") {
  //     controller.clear();
  //     text = "";
  //   } // this if statement basically cleares the text if the text placed here is the same as what the user has inputed
  //   setState(() {
  //     this.text = text; //1. this forces the widget to refresh and rebuilt
  //   });
  // } pt 3

  @override
  Widget build(BuildContext context) {
    // return Column(children: <Widget>[ pt 3

      return TextField(
          controller: this.controller,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.message), labelText: "Type a message:"));
          // onChanged: (text) => this.ChangeText(text), pt3
          ),
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
