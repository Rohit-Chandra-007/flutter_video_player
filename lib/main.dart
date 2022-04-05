import 'package:flutter/material.dart';
import 'package:flutter_video_player/login_screen.dart';
import 'package:magic_sdk/magic_sdk.dart';

void main() {
  runApp(const MyApp());
  Magic.instance = Magic("pk_live_5ED5EAD4A17D1F8D");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple),
        home: Stack(children: [
          const LoginScreen(),

          Magic.instance.relayer // Insert relayer here
        ]));
  }
}
