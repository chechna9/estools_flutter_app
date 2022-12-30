// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:estools_mobile/utils/colors.dart';
import 'package:estools_mobile/utils/text_style.dart';
import 'package:estools_mobile/constants.dart';
import 'package:intl/intl.dart';

import 'package:estools_mobile/models/action_model.dart';
import 'package:estools_mobile/models/agenda_model.dart';
import 'package:estools_mobile/components/agenda_categorie_card.dart';
import 'package:estools_mobile/pages/agenda/action_card.dart';

class EsTimer extends StatefulWidget {
  const EsTimer({super.key});

  @override
  State<EsTimer> createState() => _EsTimerState();
}

class _EsTimerState extends State<EsTimer> {
  int _seconds = 00;
  int _minutes = 25;
  Timer? _timer;
  var f = NumberFormat("00");

  void _stopTimer() {
    _timer?.cancel();
    _seconds = 0;
    _minutes = 25;
  }

  void _startTimer() {
    if (_timer != null) {
      _timer?.cancel();
    }
    if (_minutes > 0) {
      _seconds = _minutes * 60;
    }
    if (_seconds > 60) {
      _minutes = (_seconds / 60).floor();
      _seconds = _seconds - (_minutes * 60);
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          if (_minutes > 0) {
            _seconds = 59;
            _minutes--;
          } else {
            _timer?.cancel();
            print("Timer Complete");
          }
        }
      });
    });
  }

  Future openDialogue() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Set Timer"),
          content: TextField(),
        ),
      );

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: myDark,
        centerTitle: true,
        title: Text(
          'Timer',
          style: EstlTStyle.appBarTitle,
        ),
      ),
      backgroundColor: myWhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 190.0,
                height: 190.0,
                child: Center(
                  child: Text(
                    "${f.format(_minutes)} : ${f.format(_seconds)}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 48,
                    ),
                  ),
                ),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: myGrey),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          SizedBox(
            width: 190,
            height: 70,
            child: ElevatedButton(
              onPressed: () {
                openDialogue();
              },
              child: Text(
                'Set Timer',
                style: TextStyle(
                  color: myWhite,
                  fontSize: 20,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: myDark,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.16,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _stopTimer();
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.all(36.0),
                    child: Text(
                      'Stop',
                      style: TextStyle(
                        color: myWhite,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    shape: CircleBorder(
                      side: BorderSide(
                        color: myGrey,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _startTimer();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Text(
                      'Start',
                      style: TextStyle(
                        color: myWhite,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: myRed,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: myDark,
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.timer_3,
                  color: myWhite,
                ),
                label: 'Timer',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.timer,
                  color: myWhite,
                ),
                label: 'Stopwatch',
              )
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    ));
    ;
  }
}