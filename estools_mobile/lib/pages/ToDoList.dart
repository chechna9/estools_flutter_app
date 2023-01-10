import 'dart:ffi';

import 'package:estools_mobile/components/Drawer.dart';
import 'package:estools_mobile/components/filter_button.dart';
import 'package:estools_mobile/components/task_card.dart';
import 'package:estools_mobile/constants.dart';
import 'package:estools_mobile/utils/screen_dim.dart';
import 'package:estools_mobile/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TdlPage extends StatelessWidget {
  const TdlPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
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
          'Todo List',
          style: EstlTStyle.appBarTitle,
        ),
      ),
      body: Container(
        color: myWhite,
        child: const TasksScreen(),
      ),
    );
  }
}

class TasksScreen extends StatelessWidget {
  const TasksScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // filter buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FilterButton(
                    title: 'In progress',
                    onPressed: () {},
                  ),
                  FilterButton(
                    title: 'Completed',
                    onPressed: () {},
                    activated: false,
                  ),
                  FilterButton(
                    title: 'Archived',
                    onPressed: () {},
                    activated: false,
                  ),
                ],
              ),
              const TaskCard(),

              const SizedBox(height: 70),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: myRed,
                  padding: const EdgeInsets.all(10),
                  shape: const CircleBorder(),
                ),
                onPressed: () {},
                child: Icon(
                  Icons.add,
                  color: myWhite,
                  size: 40,
                ),
              ),
              //const SizedBox(height: 10),
            ],
          ),
        ),
        const Categories(),
      ],
    );
  }
}

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Container(
                width: 150,
                margin: const EdgeInsets.only(right: 40),
                height: 140,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        offset: Offset(
                          0.0,
                          11.0,
                        ),
                        blurRadius: 8.0,
                        spreadRadius: -5.0,
                      ),
                    ],
                    color: myRed,
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Home Work",
                        style: TextStyle(
                          fontSize: 20,
                          color: myWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "10 tasks",
                        style: TextStyle(fontSize: 12, color: myWhite),
                      ),
                      const SizedBox(height: 10),
                      LinearPercentIndicator(
                        width: 125,
                        lineHeight: 8,
                        backgroundColor: myWhite,
                        progressColor: const Color(0xff85C138),
                        percent: 0.8,
                        alignment: MainAxisAlignment.center,
                        barRadius: const Radius.circular(20),
                      ),
                      const SizedBox(height: 5),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "8/10",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12, color: myWhite),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: const EdgeInsets.only(right: 40),
                height: 140,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        offset: Offset(
                          0.0,
                          11.0,
                        ),
                        blurRadius: 8.0,
                        spreadRadius: -5.0,
                      ),
                    ],
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Sport",
                        style: TextStyle(
                          fontSize: 20,
                          color: myWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "5 tasks",
                        style: TextStyle(fontSize: 12, color: myWhite),
                      ),
                      const SizedBox(height: 10),
                      LinearPercentIndicator(
                        width: 125,
                        lineHeight: 8,
                        backgroundColor: myWhite,
                        progressColor: const Color(0xff85C138),
                        percent: 0.4,
                        alignment: MainAxisAlignment.center,
                        barRadius: const Radius.circular(20),
                      ),
                      const SizedBox(height: 5),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "2/5",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12, color: myWhite),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: const EdgeInsets.only(right: 40),
                height: 140,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        offset: Offset(
                          0.0,
                          11.0,
                        ),
                        blurRadius: 8.0,
                        spreadRadius: -5.0,
                      ),
                    ],
                    color: myRed,
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Home Work",
                        style: TextStyle(
                          fontSize: 20,
                          color: myWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "10 tasks",
                        style: TextStyle(fontSize: 12, color: myWhite),
                      ),
                      const SizedBox(height: 10),
                      LinearPercentIndicator(
                        width: 125,
                        lineHeight: 8,
                        backgroundColor: myWhite,
                        progressColor: const Color(0xff85C138),
                        percent: 0.8,
                        alignment: MainAxisAlignment.center,
                        barRadius: const Radius.circular(20),
                      ),
                      const SizedBox(height: 5),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "8/10",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12, color: myWhite),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: myDark,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.zero,
            topLeft: Radius.circular(40),
            bottomRight: Radius.zero,
            topRight: Radius.circular(40),
          ),
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 17,
                    color: myWhite,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Icon(
                  Icons.more_vert,
                  color: myWhite,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const CategoriesScroller(),
          ],
        ),
      ),
    );
  }
}
