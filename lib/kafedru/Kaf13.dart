import 'package:flutter/material.dart';
class Kaf22  extends StatefulWidget {
  @override
  _Kaf22State createState() => _Kaf22State();




}

class _Kaf22State extends State<Kaf22> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Row(children: [
          FlatButton(
            onPressed: (){

            },
          )
        ],),
      ),
      body: Center(

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
      ),

    );
  }
}
