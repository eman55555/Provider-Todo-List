import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'constants/colors.dart';
import 'view_model/app_view_model.dart';
import 'views/login_screen.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();

 // WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider(
      create: (context) => AppViewModel(), child: const MyApp()));

 
  
}

// whenever your initialization is completed, remove the splash screen:
   

 //FlutterNativeSplash.remove();

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
