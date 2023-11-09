// import 'package:firebase_core/firebase_core.dart';
// import 'dart:io';

// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'constants/colors.dart';
import 'models/task_model.dart';
import 'view_model/app_view_model.dart';
import 'views/login_screen.dart';

// import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();
//Platform.isAndroid ?
  // await Firebase.initializeApp(
  //   options: FirebaseOptions(
  //     apiKey: "AIzaSyBNsjncqnHOG-hIgOUmoBwl0Y3YBsTJeUI",
  //     appId: "1:508754062753:android:6f104f82aa778cff5a6fe0",
  //     messagingSenderId: "508754062753",
  //     projectId: "todo-9479f",
  //   ),
  // ):

  //await Firebase.initializeApp();

  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox(keyTasksBox);

  runApp(ChangeNotifierProvider(
      create: (context) => AppViewModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo List',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: brown,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          )),
        ),
        home: LoginScreen());
  }
}
