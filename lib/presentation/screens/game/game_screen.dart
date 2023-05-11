

import 'package:flutter/material.dart';
import 'package:tik_tok_toe/presentation/resourses/colors.dart';
import 'package:tik_tok_toe/presentation/screens/intro/intro_screen.dart';
import 'package:tik_tok_toe/presentation/widjets/w_back.dart';

import '../../widjets/w_title.dart';

class GameScreen extends StatefulWidget {
  final String currentPlayer;

  const GameScreen({
    Key? key,
    required this.currentPlayer,
  }) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> _board = [];
  String _currentPlayer = "";
  String winner = "";

  @override
  void initState() {
    _board = List.filled(9, '');
    _currentPlayer = widget.currentPlayer;
    super.initState();
  }

  void _switchPlayer() {
    _currentPlayer = _currentPlayer == 'x' ? '0' : 'x';
  }

  void _checkWinner() {
    var lines = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    for (var line in lines) {
      var a = _board[line[0]];
      var b = _board[line[1]];
      var c = _board[line[2]];
      if (a == b && b == c && a != "") {
        winner = a;
        break;
      }
    }
    if (winner == '' && !_board.contains('element')) {
      winner = "";
    }
  }

  void _playMove(int index) {
    if (_board[index] == '' && winner == '') {
      setState(() {
        _board[index] = _currentPlayer;
        _switchPlayer();
        _checkWinner();
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: WBack(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WTitle(
              title: winner == ""
                  ? "Player - $_currentPlayer"
                  : "Winnner: $winner",
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: 324,
              height: 324,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  boxShadow: [
                    const BoxShadow(
                      color: AppColors.shadow,
                      blurRadius: 10,
                    )
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: GridView.count(
                  padding: EdgeInsets.zero,
                  crossAxisCount: 3,
                  children: List.generate(
                      9,
                          (index) =>
                          GestureDetector(
                            onTap: () => _playMove(index),
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.shadow, width: 1),
                                ),
                                child: _board[index] != ''
                                    ? Center(
                                  child: Image.asset(
                                    _board[index] == '0'
                                        ? "assets/circles.png"
                                        : "assets/xcross.png",
                                    width: 40,
                                    height: 40,
                                  ),
                                )
                                    : const SizedBox()),
                          )),
                ),
              ),
            ),
            const SizedBox(height: 16,),
            if(winner != "")...{
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const IntroScreen(),), (
                      route) => false);
                }, child:
              Container(
                width: 150,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                    color: AppColors.buttonColor,
                    borderRadius: BorderRadius.circular(16)),
                child: Text(
                  "Reset",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              )
            }
          ],
        ),
      ),
    );
  }
}
