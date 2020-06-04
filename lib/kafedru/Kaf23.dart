import 'package:flutter/material.dart';
class Kaf23  extends StatefulWidget {
  @override
  _Kaf23State createState() => _Kaf23State();




}

class _Kaf23State extends State<Kaf23> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline,
            ),
          ],
        ),


    );
  }
}
