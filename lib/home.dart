import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:rock_paper_scissor_game/main.dart';

String res = '', res1 = '';
String won = '';
int i = 0, j = 0, p1 = 0, p2 = 0;

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Scaffold(
        backgroundColor: Colors.lightBlue.shade400,
        appBar: AppBar(
          actions: <Widget>[
            // Padding(
            //     padding: EdgeInsets.only(right: 20.0),
            //     child: GestureDetector(
            //       onTap: () {},
            //       child: Icon(
            //         Icons.search,
            //         size: 26.0,
            //       ),
            //     )),
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.logout),
                )),
          ],
          title: Text('Rock Paper Scissors',
              style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        drawer: Drawer(),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('myimages/rcs.webp'),
                fit: BoxFit.fitWidth,
                scale: 4),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                '3 Points to Win Game',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 500,
                child: Row(
                  children: [
                    RotatedBox(
                        quarterTurns: 1,
                        child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.red),
                            onPressed: () {
                              setState(() {
                                won = '';
                                int x = Random().nextInt(4) + 1;
                                print(x.toString());
                                if (x == 1) {
                                  res = 'Rock';
                                } else if (x == 2) {
                                  res = 'Paper';
                                } else if (x == 3) {
                                  res = 'Scissor';
                                }

                                i += 1;
                                win();
                                if (p1 == 3) {
                                  won = 'PLAYER 1 WON THE GAME!!!';

                                  Timer(
                                      Duration(seconds: 1),
                                      () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => MyHomePage1(),
                                          )));
                                }
                              });
                            },
                            child: Text('Player 1',
                                textDirection: TextDirection.ltr))),
                    RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          res,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        )),
                    Spacer(),
                    RotatedBox(
                        quarterTurns: -1,
                        child: Text(
                          res1,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900),
                        )),
                    RotatedBox(
                        quarterTurns: -1,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                won = '';
                                int x = Random().nextInt(4) + 1;
                                print(x.toString());
                                if (x == 1) {
                                  res1 = 'Rock';
                                } else if (x == 2) {
                                  res1 = 'Paper';
                                } else if (x == 3) {
                                  res1 = 'Scissor';
                                }
                                j += 1;
                                win();
                                if (p2 == 3) {
                                  won = 'PLAYER 2 WON THE GAME!!!';
                                  MyHomePage();
                                  Timer(
                                      Duration(seconds: 1),
                                      () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => MyHomePage1(),
                                          )));
                                }
                              });
                            },
                            child: Text(
                              'Player 2',
                            )))
                  ],
                ),
              ),
              Text(
                won,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      p1.toString(),
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                    Spacer(),
                    Text(
                      p2.toString(),
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}

win() {
  if (i == j) {
    if (res == 'Rock' && res1 == 'Rock') {
      won = 'Draw!';
    } else if (res == 'Rock' && res1 == 'Scissor') {
      won = 'Player1 Won!';
      p1 += 1;
    } else if (res == 'Rock' && res1 == 'Paper') {
      won = 'Player2 Won!';
      p2 += 1;
    } else if (res == 'Paper' && res1 == 'Rock') {
      won = 'Player1 Won!';
      p1 += 1;
    } else if (res == 'Paper' && res1 == 'Paper') {
      won = 'Draw!';
    } else if (res == 'Paper' && res1 == 'Scissor') {
      won = 'Player2 Won!';
      p2 += 1;
    } else if (res == 'Scissor' && res1 == 'Rock') {
      won = 'Player2 Won!';
      p2 += 1;
    } else if (res == 'Scissor' && res1 == 'Paper') {
      won = 'Player1 Won!';
      p1 += 1;
    } else if (res == 'Scissor' && res1 == 'Scissor') {
      won = 'Draw!';
    }
  } else if (i > j) {
    won = 'Wait for Player2';
  } else if (i < j) {
    won = 'Wait for Player1';
  }

  // if (p2 == 3) {
  //   won = 'PLAYER 2 WON THE GAME!!!';
  //   MyHomePage();
  // }
}
