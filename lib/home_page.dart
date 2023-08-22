import 'package:flutter/material.dart';
import 'package:flutter_application_5/game_button.dart';
import 'package:flutter_application_5/game_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'game.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

Widget get rulesButtonOfFirst => Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      child: RawMaterialButton(
        padding: const EdgeInsets.all(24.0),
        onPressed: () {},
        shape: Border.all(color: Colors.white, width: 5),
        child: Text(
          "Rules",
          style: GoogleFonts.hubballi(
              color: Colors.white, fontSize: 26.0, fontWeight: FontWeight.bold),
        ),
      ),
    );

Widget get textOfOuFirst => Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Text(
        "${Game.gameScore}",
        style: GoogleFonts.mavenPro(
            fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );

Widget get textOfScoreFirst => Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        "Score",
        style: GoogleFonts.mavenPro(
            fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );

Widget get firstScoreOFContainer => Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.blue[900],
          border: Border.all(color: Colors.white, width: 5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [textOfScoreFirst, textOfOuFirst],
      ),
    );

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    double btnWidth = MediaQuery.of(context).size.width / 2 - 40;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            firstScoreOFContainer,
            Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              child: Center(
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: MediaQuery.of(context).size.width / 2 -
                          (btnWidth / 2) -
                          20,
                      child: Hero(
                        tag: "Rock",
                        child: gameBtn(() {
                          print("you choosed rock");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  GameScreen(GameChoice("Rock")),
                            ),
                          );
                        }, "assets/images/rock_btn.png", btnWidth),
                      ),
                    ),
                    Positioned(
                      top: btnWidth,
                      left:
                          MediaQuery.of(context).size.width / 2 - btnWidth - 40,
                      child: Hero(
                        tag: "Scisors",
                        child: gameBtn(() {
                          print("you choosed scisors");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  GameScreen(GameChoice("Scisors")),
                            ),
                          );
                        }, "assets/images/scisor_btn.png", btnWidth),
                      ),
                    ),
                    Positioned(
                      top: btnWidth,
                      right: MediaQuery.of(context).size.width / 2 -
                          btnWidth -
                          40, // we soustract the half of ther widget size and the half of the padding,
                      child: Hero(
                        tag: "Paper",
                        child: gameBtn(() {
                          print("you choosed paper");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  GameScreen(GameChoice("Paper")),
                            ),
                          );
                        }, "assets/images/paper_btn.png", btnWidth),
                      ),
                    ),
                  ],
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
                      color: Colors.white,
                      fontSize: 26.0,
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
