import 'package:flutter/material.dart';
import 'tic_tac_toe_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // darkTheme: ThemeData.dark(),
      theme: ThemeData(colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.brown, backgroundColor: Colors.black,accentColor: Colors.black)),
      title: 'Tic Tac Toe',
      home: TicTacToePage(),
    );
  }
}
