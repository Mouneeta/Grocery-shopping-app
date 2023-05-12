
import 'package:flutter/material.dart';

class Widgettest extends StatefulWidget {
  const Widgettest({Key? key}) : super(key: key);

  @override
  State<Widgettest> createState() => _WidgettestState();
}

class _WidgettestState extends State<Widgettest> {
  List<int> text = [1,2,3,4,5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children:text.map((e) => Container(
            height: MediaQuery.of(context).size.height *.1,
            width: MediaQuery.of(context).size.width *.5,
            color: Colors.blueAccent,
            child: Card(
              child: Text("Hello Wordld ${e}"),
            ),
          )).toList()
        ),
      ),
    );
  }
}
