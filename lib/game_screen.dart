import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/game.dart';
import 'package:flutter_application_5/game_button.dart';
import 'package:flutter_application_5/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class GameScreen extends StatefulWidget {
  GameScreen(this.gameChoice, {Key? key}) : super(key: key);
  GameChoice gameChoice;
  @override
  _GameScreenState createState() => _GameScreenState();
}


class _GameScreenState extends State<GameScreen> {
  String? randomChoice() {
    Random random = Random();
    int robotChoiceIndex = random.nextInt(3);
    return Game.choices[robotChoiceIndex];
  }

  
  @override
  Widget build(BuildContext context) {
    String robotChoice = randomChoice()!;
    String? robotChoicePath;
    switch (robotChoice) {
      case "Rock":
        robotChoicePath = "assets/images/rock_btn.png";
        break;
      case "Paper":
        robotChoicePath = "assets/images/paper_btn.png";
        break;
      case "Scisors":
        robotChoicePath = "assets/images/scisor_btn.png";
        break;
      default:
    }
    String? playerChoice;
    switch (widget.gameChoice.type) {
      case "Rock":
        playerChoice = "assets/images/rock_btn.png";
        break;
      case "Paper":
        playerChoice = "assets/images/paper_btn.png";
        break;
      case "Scisors":
        playerChoice = "assets/images/scisor_btn.png";
        break;
      default:
    }
    if (GameChoice.gameRules[widget.gameChoice.type]![robotChoice] ==
        "You Win") {
      setState(() {
        Game.gameScore++;
      });
    }
    double btnWidth = MediaQuery.of(context).size.width / 2 - 40;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.blue[900],
                  border: Border.all(color: Colors.white)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Score",
                      style: GoogleFonts.mavenPro(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      "${Game.gameScore}",
                      style: GoogleFonts.mavenPro(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),

            /* Setting the Game play pad */
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Hero(
                        tag: "${widget.gameChoice.type}",
                        child: gameBtn(() {}, playerChoice!, btnWidth - 20),
                      ),
                      Text(
                        "VS",
                        style: GoogleFonts.hubballi(
                            color: Colors.white,
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold),
                      ),
                      AnimatedOpacity(
                        opacity: 1,
                        duration: const Duration(seconds: 3),
                        child: gameBtn(() {}, robotChoicePath!, btnWidth - 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Text(
              "${GameChoice.gameRules[widget.gameChoice.type]![robotChoice]}",
              style: GoogleFonts.openSans(color: Colors.white, fontSize: 36.0),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              child: RawMaterialButton(
                padding: const EdgeInsets.all(24.0),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ));
                },
                shape: Border.all(color: Colors.white, width: 5),
                child: Text(
                  "Play Again",
                  style: GoogleFonts.hubballi(
                      color: Colors.yellow,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              child: RawMaterialButton(
                padding: const EdgeInsets.all(24.0),
                onPressed: () {},
                shape: Border.all(color: Colors.white, width: 5),
                child: Text(
                  "Rules",
                  style: GoogleFonts.hubballi(
                      color: Colors.red,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
