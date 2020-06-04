import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:instituteschedule/screens/wrapper.dart';
import 'package:instituteschedule/services/auth.dart';

import 'models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Wrapper(),
//      debugShowCheckedModeBanner: false,
//      theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
//    );
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}