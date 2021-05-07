import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/app_cubit_cubit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    try {
      if (FirebaseAuth.instance.currentUser == null) {
        BlocProvider.of<AppCubitCubit>(context).screendecider(false);
        print(FirebaseAuth.instance.currentUser);
        print("1");
      } else {
        BlocProvider.of<AppCubitCubit>(context).screendecider(true);
        print("2");
      }
    } catch (e) {
      BlocProvider.of<AppCubitCubit>(context).screendecider(false);
      print(e);
      print("3");
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Center(child: Text("loading..."))],
      ),
    );
  }
}
