import 'package:flutter/material.dart';

class TicTacToePage extends StatefulWidget {
  const TicTacToePage({Key? key}) : super(key: key);

  @override
  State<TicTacToePage> createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  int user = 0;
  late List<String> images;
  final board = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0],
  ];
  List<String> imageAssets = [
    '/assets/images/player0.png',
    '/assets/images/player1.png',
    '/assets/images/player2.png',
  ];
  @override
  void initState() {
    super.initState();
    setState(() {
      images = [
        imageAssets[0],
        imageAssets[0],
        imageAssets[0],
        imageAssets[0],
        imageAssets[0],
        imageAssets[0],
        imageAssets[0],
        imageAssets[0],
        imageAssets[0],
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(
          images.length,
          (index) {
            return Card(
              child: Column(
                children: [
                  Image.network(images[index]),
                  SizedBox(height: 10),
                  Text('Image $index'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
