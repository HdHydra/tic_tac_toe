import 'package:flutter/material.dart';
import 'pages/tic_tac_toe_page';

void main() {
  runApp(MyApp);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Tic Tac Toe', home: TicTacToePage());
  }
}
