import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Welcome to fariswheel world 🐼🎡;.> ')),
        body: Body());
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String name;
  TextEditingController controller = new TextEditingController();

  void click() {
    this.name = controller.text;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: this.controller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: "Type Your Name:",
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 5, color: Colors.pink)),
                suffixIcon: IconButton(
                  icon: Icon(Icons.done),
                  splashColor: Colors.green,
                  tooltip: "Subit", //it pops up when u long press
                  onPressed: this.click,
                ),
              ),
            )));
  }
}
