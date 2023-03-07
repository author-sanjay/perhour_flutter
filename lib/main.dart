import 'package:flutter/material.dart';
import 'package:perhour_flutter/Screens/Login/Login.dart';
import 'package:perhour_flutter/User.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<Users>(
      create: (context) => Users(),
      child:
          Consumer<Users>(builder: ((context, provider, child) => MyApp()))));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Login());
  }
}
