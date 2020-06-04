import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instituteschedule/calendar/Calendar.dart';
class Kaf22  extends StatefulWidget {
  String aud="";

  Kaf22(this.aud);

  @override
  _Kaf22State createState() => _Kaf22State(aud);


}

class _Kaf22State extends State<Kaf22> {
  String aud ="";
  double width=300.0;
  double height=600.0;
  _Kaf22State(this.aud);

  @override
  void initState() {
    print(aud);
    print(width);
    print(height);

    switch(aud){
      case "221":
       setState(() {
         a221=true;
       });
        break;
      case "223":
        setState(() {
          a223=true;
        });
        break;
      case "224":
        setState(() {
          a224=true;
        });
        break;
      case "226":
        setState(() {
          a226=true;
        });
        break;
      case "230":
        setState(() {
          a230=true;
        });
        break;
      case "219":
        setState(() {
          a219=true;
        });
        break;
      case "219а":
        setState(() {
          a219a=true;
        });
        break;
    }
  }

  bool a221=false;
  bool a223=false;
  bool a224=false;
  bool a226=false;
  bool a219=false;
  bool a219a=false;
  bool a230=false;


  @override
  Widget build(BuildContext context) {
    print(a223);
    var para=hexToColor("#31372A");
    var un_para=hexToColor("#ffffff");
    var aud230=Container(
      height:75,
      decoration: BoxDecoration(
          color: a230?para:un_para,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(10))

      ),

      child: Center(
        child: Text("230 аудиторія",style: TextStyle(color: a230?Colors.white:Colors.black),),
      ),
    );
    var aud226=Container(
      height:75,
      decoration: BoxDecoration(
          color: a226?para:un_para,
          border: Border.all(color: Colors.black)
      ),
      child: Center(
        child: Text("226 аудиторія",style: TextStyle(color: a226?Colors.white:Colors.black)),
      ),
    );
    var aud224=Container(
      height: 75,
      decoration: BoxDecoration(
          color: a224?para:un_para,
          border: Border.all(color: Colors.black)
      ),
      child: Center(
        child: Text("224 аудиторія",style: TextStyle(color: a224?Colors.white:Colors.black)),
      ),
    );

    var aud228=Container(
      height: 75,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black)
      ),
      child: Center(
        child: Text("228 Лаборанська"),
      ),
    );
    var aud228a=Container(
      height: 75,
      decoration: BoxDecoration(

          border: Border.all(color: Colors.black)
      ),
      child: Center(
        child: Text("228-а ВНГ"),
      ),
    );
    var aud226a=Container(
      height: 75,
      decoration: BoxDecoration(

          border: Border.all(color: Colors.black)
      ),
      child: Center(
        child: Text("226-а Начальник кафедри"),
      ),
    );
    var wcm=Container(
      height: 75,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(10)),

          border: Border.all(color: Colors.black)
      ),
      child: Center(
        child: Text("туалет 'М'"),
      ),
    );
    var wcg=Container(
      height:  75,
      decoration: BoxDecoration(

          border: Border.all(color: Colors.black)
      ),
      child: Center(
        child: Text("туалет 'Ж'"),
      ),
    );


    var aud221=Container(
      height: 54.0,
      decoration: BoxDecoration(
          color: a221?para:un_para,
          border: Border.all(color: Colors.black)
      ),
      child: Center(
        child: Text("221 аудиторія",style: TextStyle(color: a221?Colors.white:Colors.black)),
      ),
    );
    var aud223=Container(
      height: 54.0,
      decoration: BoxDecoration(
          color: a223?para:un_para,
          border: Border.all(color: Colors.black)
      ),
      child: Center(
        child: Text("223 аудиторія",style: TextStyle(color: a223?Colors.white:Colors.black)),
      ),
    );
    var aud219=Container(
      height: 54.0,

      decoration: BoxDecoration(
          color: a219?para:un_para,
          border: Border.all(color: Colors.black)
      ),
      child: Center(
        child: Text("219 аудиторія",style: TextStyle(color: a219?Colors.white:Colors.black)),
      ),
    );
    var aud219a=Container(
      height:54.0,
      decoration: BoxDecoration(
          color: a219a?para:un_para,
          border: Border.all(color: Colors.black)
      ),
      child: Center(
        child: Text("219-а аудиторія",style: TextStyle(color: a219a?Colors.white:Colors.black)),
      ),
    );

    var aud223a=Container(
      height: 54.0,
      decoration: BoxDecoration(

          border: Border.all(color: Colors.black)
      ),
      child: Center(
        child: Text("223-а Програмісти"),
      ),
    );
    var aud225=Container(
      height: 54.0,
      decoration: BoxDecoration(

          border: Border.all(color: Colors.black)
      ),
      child: Center(
        child: Text("225 Викладацька"),
      ),
    );
    var aud217=Container(
      height:54.0,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10))
      ),
      child: Center(
        child: Text("217 Викладацька"),
      ),
    );
    var aud227=Container(
      height: 54.0,
      decoration: BoxDecoration(

          border: Border.all(color: Colors.black)
      ),
      child: Center(
        child: Text("227 Заступник Нач Каф"),
      ),
    );
    var aud229=Container(
      
      height: 54.0,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10))
      ),
      child: Center(
        child: Text("229 Викладацька"),
      ),
    );
    var aud221a=Container(
      height:54.0,
      decoration: BoxDecoration(

          border: Border.all(color: Colors.black)
      ),
      child: Center(
        child: Text("221-а Лабораторія"),
      ),
    );
    var aud221b=Container(
      height:60.0,
      decoration: BoxDecoration(

          border: Border.all(color: Colors.black)
      ),
      child: Center(
        child: Text("221-б Професорська"),
      ),
    );
    return  Container(
        decoration: BoxDecoration(
          color: un_para,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        width: 350.0,
        height: 600.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(

              width: 150.0,
              child: Column(
                children: [
                  aud217,
                  aud219a,
                  aud219,
                  aud221b,
                  aud221a,
                  aud221,
                  aud223,
                  aud223a,
                  aud225,
                  aud227,
                  aud229

                ],
              ),
            ),
            Container(

              width: 31.4,
              child: Column(
                children: [

                ],
              ),
            ),
            Container(
              width:150.0,
              child: Column(
                mainAxisAlignment:MainAxisAlignment.end ,
                children: [
                  wcm,
                  wcg,
                  aud224,
                  aud226,
                  aud226a,
                  aud228a,
                  aud228,
                  aud230
                ],
              ),
            )
          ],
        )


    );
  }

}
