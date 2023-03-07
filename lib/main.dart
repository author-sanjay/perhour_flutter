import 'package:flutter/material.dart';
import 'package:perhour_flutter/Screens/Login/Login.dart';
import 'package:perhour_flutter/SplashScreen.dart';
import 'package:perhour_flutter/User.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ChangeNotifierProvider<Users>(
      create: (context) => Users(),
      child:
          Consumer<Users>(builder: ((context, provider, child) => MyApp()))));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Users user = Users();

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
