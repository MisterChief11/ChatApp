import 'package:chatapp/cubit/app_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
// My name is Vaibhav

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubitCubit(),
      child: BlocBuilder<AppCubitCubit, AppCubitState>(
        builder: (context, state) {
          return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: BlocProvider.of<AppCubitCubit>(context).state.screen);
        },
      ),
    );
  }
}
