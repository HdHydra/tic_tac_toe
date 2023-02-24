import 'package:flutter/material.dart';

class TicTacToePage extends StatefulWidget {
  const TicTacToePage({Key? key}) : super(key: key);

  @override
  State<TicTacToePage> createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  int user = 0;
  int turn = 1; // player 1 - nought
  int curr = 0;
  bool win = false;
  late String text;
  late List<String> images;
  // final board = [
  //   [0, 1, 0],
  //   [0, 0, 2],
  //   [2, 1, 0],
  // ];
  List<int> board = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  List<int> lock = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  final score = [0, 0];

  List<String> imageAssets = [
    'assets/images/player0.png',
    'assets/images/player1.png',
    'assets/images/player2.png',
  ];
  @override
  void initState() {
    super.initState();
    setState(() {
      resetImages();
    });
  }

  void resetImages() {
    win = false;
    turn = 1;
    board = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    lock = [0, 0, 0, 0, 0, 0, 0, 0, 0];
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
    text = 'It is turn of player 1';
  }

  void winAction(winner) {
    print("Player $winner is the winner");
    setState(() {
      win = true;
      score[winner - 1]++;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        resetImages();
      });
    });
  }

  //[0][1][2]
  //[3][4][5]
  //[6][7][8]

  void checkWinner(turn) {
    if (board[0] == turn && board[1] == turn && board[2] == turn) {
      winAction(turn);
    } else if (board[3] == turn && board[4] == turn && board[5] == turn) {
      print("Player $turn is the winner");
      winAction(turn);
    } else if (board[6] == turn && board[7] == turn && board[8] == turn) {
      print("Player $turn is the winner");
      winAction(turn);
    } else if (board[0] == turn && board[3] == turn && board[6] == turn) {
      winAction(turn);
    } else if (board[1] == turn && board[4] == turn && board[7] == turn) {
      winAction(turn);
    } else if (board[2] == turn && board[5] == turn && board[8] == turn) {
      winAction(turn);
    } else if (board[0] == turn && board[4] == turn && board[8] == turn) {
      winAction(turn);
    } else if (board[2] == turn && board[4] == turn && board[6] == turn) {
      winAction(turn);
    }
  }

  void boardState() {
    if (!board.contains(0)) {
      // print('It is full');
      setState(() {
        text = 'It\'s draw';
      });
      Future.delayed(Duration(seconds: 1), () {
        print('it is full');
        setState(() {
          resetImages();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tic-Tac-Toe'), centerTitle: true, actions: [
        IconButton(
          icon: Icon(Icons.restart_alt_rounded),
          onPressed: () {
            setState(() {
              resetImages();
              score[0] = 0;
              score[1] = 0;
            });
          },
        ),
      ]),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            child: GridView.count(
              padding: EdgeInsets.only(top: 100),
              crossAxisCount: 3,
              children: List.generate(
                images.length,
                (index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5,
                        color: Colors.black,
                      ),
                    ),
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              print('You clicked $index');
                              setState(() {
                                if (lock[index] == 0 && win == false) {
                                  if (turn == 1) {
                                    board[index] = 1;
                                    curr = 1;
                                    turn = 2;
                                  } else {
                                    board[index] = 2;
                                    curr = 2;
                                    turn = 1;
                                  }
                                  images[index] = imageAssets[board[index]];
                                  checkWinner(curr);
                                  lock[index] = 1;
                                  text = 'Turn of player $turn';
                                  boardState();
                                }
                              });
                            },
                            child: SizedBox(
                              child: Image.asset(
                                images[index],
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          // Text('Image $index'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            left: 30,
            top: 30,
            child: Text(
              'Player-1: ${score[0]}',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Positioned(
            right: 30,
            top: 30,
            child: Text(
              'Player-2: ${score[1]}',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Positioned(
            bottom: 100,
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (win)
                    ? Text(
                        'Player $curr Won',
                        style: TextStyle(color: Colors.brown, fontSize: 50),
                      )
                    // Overlay(
                    //   initialEntries: [
                    //     OverlayEntry(
                    //       builder: (context) => VictoryScreen(),
                    //       opaque: false,
                    //       maintainState: true,
                    //     )
                    //   ],
                    // )
                    : Text(
                        text,
                        style: TextStyle(color: Colors.black, fontSize: 35),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
