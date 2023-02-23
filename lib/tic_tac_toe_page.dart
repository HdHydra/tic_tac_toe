import 'package:flutter/material.dart';

class TicTacToePage extends StatefulWidget {
  const TicTacToePage({Key? key}) : super(key: key);

  @override
  State<TicTacToePage> createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  int user = 0;
  Image
  final board = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0],
  ];
  List<String> images = [
    '/assets/images/blank.png',
    '/assets/images/playerA.png',
    '/assets/images/playerB.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        image = images[$user]
                      });
                    },
                    child: SizedBox(
                      height: 100, width: 100,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
