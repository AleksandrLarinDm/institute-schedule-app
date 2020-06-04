import 'package:flutter/material.dart';
class Kaf21  extends StatefulWidget {
  @override
  _Kaf21State createState() => _Kaf21State();




}

class _Kaf21State extends State<Kaf21> {
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
