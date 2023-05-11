import 'package:flutter/material.dart';
import 'package:tik_tok_toe/presentation/resourses/colors.dart';
import 'package:tik_tok_toe/presentation/screens/game/game_screen.dart';
import 'package:tik_tok_toe/presentation/widjets/w_back.dart';
import 'package:tik_tok_toe/presentation/widjets/w_button.dart';
import 'package:tik_tok_toe/presentation/widjets/w_title.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  double width = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      body: WBack(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: width,
                    height: 420,
                    child: Image.asset("assets/back2.png",
                    ),
                  ),
                  const Center(
                    child: WTitle(title: "TIC-TAC-TOE ")
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 12,),
                  const Text(
                    "Pick who goes first?",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 21,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WButton(icon: "assets/xcross.png", onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (
                            _) => const GameScreen(currentPlayer: "x",),
                        ),
                        );
                      }),
                      SizedBox(width: 25,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: WButton(icon: "assets/circles.png", onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (_) =>
                          const GameScreen(currentPlayer: "0",),
                          ),
                              (route) => false,
                          );
                        }),
                      ),
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
