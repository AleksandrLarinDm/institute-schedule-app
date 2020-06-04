import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:instituteschedule/kafedru/Kaf21.dart';
import 'package:instituteschedule/kafedru/Kaf22.dart';
import 'package:instituteschedule/kafedru/Kaf23.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class Calendar extends StatefulWidget{
  Map<DateTime,List<dynamic>> events_map;
  SharedPreferences prefs;
  @override
  _CalendarState createState() => _CalendarState();
  

}

class _CalendarState extends State<Calendar>
{

  SharedPreferences prefs;
  CalendarController _controller;
  Map<DateTime,List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  bool load=false;

  var userMap;

  @override
  void initState(){
       // TODO: implement initState
      super.initState();

      _controller = CalendarController();
      _events={};
      _selectedEvents = [];
      if(prefs!=null){
        print("!=null");
        setState(() {
          prefs.setString("events", json.encode((encodeMap(_events))));
        });
      }else {
        initPrefs();

      }
      print(_events);


  }


  initPrefs() async{
    prefs = await SharedPreferences.getInstance();
    var lessons =[

      ];
    print(prefs.getString("mobile_key"));
    var response =
    await http.post(
      'http://192.168.223.102:3001/cadet/mobile/lessons',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'mobile_key': prefs.getString("mobile_key"),
      }),
    );
    print(response.body);
    if(200>=response.statusCode&&response.statusCode<400)
    {setState(() {
      print("ok");
      load=true;
      lessons=jsonDecode(response.body);
    });
    }else{
      print("false");
    }
    print(lessons);


    Map<DateTime,List<Lesson>> parus=new Map<DateTime,List<Lesson>>();
    setState(() {
     try {
       print(json.decode(prefs.getString("events")));
       _events = Map<DateTime, List<dynamic>>.from(
           decodeMap(json.decode(prefs.getString("events") ?? "{}")));
     }catch(e){
       print(e);
     }
     lessons.map((element)


        {
          print(element);
          var les= Lesson.fromJson( element);

          if(parus[DateTime.parse(les.date)]!=null)
          {

            parus[DateTime.parse(les.date)].add(les);
          }
          else{
            parus[DateTime.parse(les.date)]=[les];

          }
        });
      parus.forEach((key, value) {
        _events[key]=value;
        print(value);
      });
      prefs.setString("events", jsonEncode(encodeMap(_events)));
     });

    _events.forEach((key, value) {
      print(_events[key]);
    });







  }

  Map<String,dynamic> encodeMap(Map<DateTime,List<dynamic>> map) {
    Map<String,dynamic> newMap = {};
    print(map);
    map.forEach((key,value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }
  Map<DateTime,List<dynamic>> decodeMap(Map<String,dynamic> map) {
    Map<DateTime,List<Lesson>> parus=new Map<DateTime,List<Lesson>>();

    map.forEach((key,value) {
      for(int i=0;i<map[key].length;i++ )
      {
        map[key][i];
        var les= Lesson.fromJson( map[key][i]);

        if(parus[DateTime.parse(les.date)]!=null)
        {

          parus[DateTime.parse(les.date)].add(les);
        }
        else{
          parus[DateTime.parse(les.date)]=[les];

        }
      }
    });
    return parus;
  }
  @override
  Widget build(BuildContext context) {
    var text=hexToColor("#474f3f");
    var text_of_para=hexToColor("#df1780");
    return Scaffold(
      backgroundColor: hexToColor("#DFD7CC"),
        body:load?  Container(
              color: hexToColor("#eae3d9"),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TableCalendar(
                    events: _events,
                    initialCalendarFormat: CalendarFormat.month,

                    headerStyle: HeaderStyle(
                      centerHeaderTitle: true,
                      formatButtonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      formatButtonTextStyle: TextStyle(color: Colors.black),
                      formatButtonShowsNext: false,
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(weekdayStyle: TextStyle(color: Colors.black),weekendStyle: TextStyle(color: hexToColor("#DF1780"))),
                    onDaySelected: (date, events) {
                      print(date);
                      setState(() {
                        _selectedEvents = events;
                      });
                    },
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    weekendDays: [7],
                    builders: CalendarBuilders(
                        singleMarkerBuilder: (context,date,events)=>Container(
                         height: 6,
                         width: 6,
                         margin: EdgeInsets.all(2),
                         decoration: BoxDecoration(
                            color: hexToColor("#273583"),
                           borderRadius: BorderRadius.all(Radius.circular(100))
                         ),
                        ),
                        weekendDayBuilder: (context, date, events)=>Container(
                          child: Center(child: Text(date.day.toString(),style: TextStyle(color: hexToColor("#DF1780")),)),
                        ),
                        todayDayBuilder: (context, date,events){
                          return Container(
                              width: 50,
                              height: 55,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: hexToColor("#6F6D5B"),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Text(
                                date.day.toString(),
                                style: TextStyle(color: hexToColor("#ffd50f")),
                              )
                          );
                        },
                        selectedDayBuilder: (context, date, events) {
                            return  Container(
                                width: 50,
                                height: 55,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: hexToColor("#31372A"),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Text(
                                  date.day.toString(),
                                  style: TextStyle(color: hexToColor("#FFD50F")),
                                ));

                        }

                    ),
                    calendarController: _controller,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:Row(
                        children:[
                          ..._selectedEvents.map((event) =>
                            GestureDetector(
                              child:  Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.only(top: 10,bottom: 10),
                                decoration: BoxDecoration(
                                  color: hexToColor("#f2f2f2"),
                                  boxShadow:<BoxShadow>[
                                    BoxShadow(
                                      color: Colors.black,
                                      offset: Offset(1.0, 6.0),
                                      blurRadius: 10.0,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  border: Border.all(color: Colors.black)
                                ),
                                  height: 200,
                                      width: 185,
                                      child: Center(

                                        child:

                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border(bottom:BorderSide(color:  Colors.black))
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Text(event.couple.toString(),style: TextStyle(color: text_of_para,fontSize: 20),)
                                                ],
                                              )

                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left: 10,right: 10),
                                              child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children:[
                                                    Text(event.cafedra,style: TextStyle(color: text,fontSize: 16),),
                                                    Text(event.subject,style: TextStyle(color: text,fontSize: 16),),
                                                    Text(event.lesson_type,style: TextStyle(color: text,fontSize: 16),)
                                                  ]
                                              ),
                                            ),
                                            Center(
                                              child: Text(event.teacher1,style: TextStyle(color: text,fontSize: 16),)
                                            ),
                                            (event.teacher1_1!=null)?Center(child: Text(event.teacher1_1,style: TextStyle(fontSize: 16,color: text),),):Container(),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Center( child:Text(event.classroom1,style: TextStyle(color: text,fontSize: 16),)),
                                                (event.classroom2!=null)? Center( child:Text(event.classroom2,style: TextStyle(color: text,fontSize: 16),)):Text(""),

                                              ],
                                            )
                                          ],
                                        ),
                                      )

                                  ),
                              onTap: (){
                                final snackBar = SnackBar(
                                  content: Text('Yay! A SnackBar!'),
                                  action: SnackBarAction(
                                    label: 'Undo',
                                    onPressed: () {
                                      // Some code to undo the change.
                                    },
                                  ),
                                );

                                // Find the Scaffold in the widget tree and use
                                // it to show a SnackBar.

                                print(event.cafedra);
                                print(event.classroom1);
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => CustomDialog(
                                  event:event
                                  ),
                                );


                                      },


                            ),

                          )
                        ]
                    )
                  )
                ],
              ),
    ):Center(child:CircularProgressIndicator())

    );
  }

}
class CustomDialog extends StatelessWidget {
 final Lesson  event;


  CustomDialog({
    @required this.event,

  });

  dialogContent(BuildContext context,event) {
    return Stack(
      children: <Widget>[
        Container(

          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Navigation(event),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context,event),
    );
  }
}
class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}
 Navigation(var e)
{
  switch(e.cafedra)
  {
    case "1":
      break;
    case "2":
      break;
    case "3":
      break;
    case "4":
      break;
    case "5":
      break;
    case "6":
      break;
    case "11":
      break;
    case "12":
      break;
    case "13":
      break;
    case "21":
      return Kaf21();
      break;
    case "22":
      return Kaf22(e.classroom1);
      break;
    case "23":
     return Kaf23();
      break;
    case "31":
      break;
    case "32":
      break;
    case "33":
      break;

  }

}

class Lesson {
  final String cafedra;
  final String subject;
  final String lesson_type;
  final String teacher1;
  final String teacher1_1;
  final String classroom1;
  final String classroom2;
  final int couple;
  final String date;
  final int group;
  final int school_week;

  Lesson(
      this.cafedra,
      this.subject,
      this.lesson_type,
      this.teacher1,
      this.teacher1_1,
      this.classroom1,
      this.classroom2,
      this.couple,
      this.date,
      this.group,
      this.school_week);



  Lesson.fromJson(Map<String, dynamic> json)
      : cafedra=json['cafedra'],
        subject = json['subject'],
        lesson_type = json['lesson_type'],
        teacher1 = json['teacher1'],
        teacher1_1 = json['teacher1_1'],
        classroom1 = json['classroom1'],
        classroom2 = json['classroom2'],
        couple = json['couple'],
        date = json['date'],
        group = json['group'],
        school_week= json['couple'];

  Map<String, dynamic> toJson() =>
      {
        'cafedra':cafedra,
        'subject': subject,
        'lesson_type': lesson_type,
        'teacher1': teacher1,
        'teacher1_1': teacher1_1,
        'classroom1': classroom1,
        'classroom2': classroom2,
        'couple': couple,
        'date': date,
        'group': group,
        'school_week': school_week,
      };

  @override
  String toString() {
    return cafedra+" "+subject+" "+lesson_type+" "+teacher1+" "+classroom1+" "+couple.toString()+
        " "+date+" "+group.toString()+" "+school_week.toString()+" ";
  }
}
Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
