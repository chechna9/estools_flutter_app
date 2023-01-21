// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:async';

import 'package:estools_mobile/components/Drawer.dart';
import 'package:flutter/material.dart';

import 'package:estools_mobile/utils/text_style.dart';
import 'package:estools_mobile/constants.dart';
import 'package:intl/intl.dart';

class EsTimer extends StatefulWidget {
  const EsTimer({super.key});

  @override
  State<EsTimer> createState() => _EsTimerState();
}

class _EsTimerState extends State<EsTimer> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _seconds = 00;
  int _minutes = 25;
  Timer? _timer;
  var f = NumberFormat("00");
  void setTimer(int value) {
    setState(() {
      _minutes = value;
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _seconds = 0;
    _minutes = int.parse(controller.text);
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

  Future<String?> openDialogue() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Set Timer"),
          content: Form(
            key: _formKey,
            child: TextFormField(
              keyboardType: TextInputType.number,
              autofocus: true,
              decoration:
                  const InputDecoration(hintText: "Number between 0-59"),
              controller: controller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter the number';
                } else if (int.parse(value) > 59) {
                  return 'Too long ';
                } else {
                  return null;
                }
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: (() {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                submit();
              }),
              child: const Text('Submit'),
            ),
          ],
        ),
      );

  int _currentIndex = 0;

  void submit() {
    setTimer(int.parse(controller.text));
    Navigator.of(context).pop();
  }

  late TextEditingController controller;
  String name = '';

  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Material(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const MyDrawer(),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          backgroundColor: myDark,
          centerTitle: true,
          title: Text(
            'Timer',
            style: EstlTStyle.appBarTitle,
          ),
        ),
        backgroundColor: myWhite,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 190.0,
                    height: 190.0,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: myGrey),
                    child: Center(
                      child: Text(
                        "${f.format(_minutes)} : ${f.format(_seconds)}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 48,
                        ),
                      ),
                    ),
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
                  onPressed: () async {
                    final name = await openDialogue();
                    if (name == null || name.isEmpty) return;

                    setState(() => this.name = name);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: myDark,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  child: Text(
                    'Set Timer',
                    style: TextStyle(
                      color: myWhite,
                      fontSize: 20,
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
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: CircleBorder(
                          side: BorderSide(
                            color: myGrey,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: Text(
                          'Stop',
                          style: TextStyle(
                            color: myWhite,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _startTimer();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: myRed,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
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
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
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
      ),
    );
  }
}
