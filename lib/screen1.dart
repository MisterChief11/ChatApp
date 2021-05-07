import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/app_cubit_cubit.dart';

class Main_Screen extends StatefulWidget {
  @override
  _Main_ScreenState createState() => _Main_ScreenState();
}

class _Main_ScreenState extends State<Main_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
      ),
      appBar: AppBar(
        title: Text("Chat_App"),
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.account_box_rounded,size: 30,),
        )],
      ),
      body: GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
            BlocProvider.of<AppCubitCubit>(context).screendecider(false);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text("Thank You g")),
            ],
          )),
    );
  }
}
