import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/view/home.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
     ProviderScope(
       child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home:  HomePage(),
        ),
     ),
    

  );
}




