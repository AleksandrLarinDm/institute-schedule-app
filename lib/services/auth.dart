import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:instituteschedule/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on FB user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map(_userFromFirebaseUser);
  }

  // sign in anon
  Future signInAnon () async {
    try{
      AuthResult authResult = await _auth.signInAnonymously();
      FirebaseUser user = authResult.user;
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  // sign in with e-mail and password
  Future signInWithEmailAndPassword(String email, String password) async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      prefs.setString("mobile_key", user.uid);
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }
  // register with e-mail and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      SharedPreferences prefs= await SharedPreferences.getInstance();
      prefs.setString("mobile_key",user.uid);
      var response =
      await http.post(
        'http://192.168.223.102:3001/cadet/mobile',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'mobile_key': prefs.getString("mobile_key"),
          'group': prefs.getString("group"),
        }),
      );
      print(response.statusCode.toString());
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    } catch (e){
      print(e.toString());
      return null;
    }
  }
}