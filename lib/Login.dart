import 'package:chatapp/cubit/app_cubit_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class screen_login extends StatefulWidget {
  @override
  _screen_loginState createState() => _screen_loginState();
}

Future<void> login(context) async {
  GoogleSignIn gs = GoogleSignIn(scopes: ['email']);
  GoogleSignInAccount google_user = await gs.signIn();
  GoogleSignInAuthentication google_auth = await google_user.authentication;
  google_user.authentication;
  final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: google_auth.idToken, accessToken: google_auth.accessToken);
  final UserCredential authResult =
      await FirebaseAuth.instance.signInWithCredential(credential);
  final User user = authResult.user;
  FirebaseFirestore.instance
      .collection("Users")
      .doc(user.uid)
      .set({"Parameter": user.email});
  BlocProvider.of<AppCubitCubit>(context).screendecider(true); 
}

class _screen_loginState extends State<screen_login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              icon: Icon(Icons.login),
              onPressed: () async {
                login(context);
              })
        ],
      ),
    );
  }
}
