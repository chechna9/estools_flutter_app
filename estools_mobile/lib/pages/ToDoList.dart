import 'package:estools_mobile/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TdlPage extends StatelessWidget {
  const TdlPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: myWhite,
          child: const TasksScreen(),
        ),
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
      // mainAxisSize: MainAxisSize.max,
      children: [
        const MytasksBar(),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Flexible(child: InProgress()),
              SizedBox(
                width: 15,
              ),
              Flexible(child: Completed()),
              SizedBox(
                width: 15,
              ),
              Flexible(child: Archived()),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Task1(),
              const SizedBox(height: 20),
              const Task1(),
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

class MytasksBar extends StatelessWidget {
  const MytasksBar({
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
            topLeft: Radius.zero,
            bottomRight: Radius.zero,
            topRight: Radius.zero,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 25, bottom: 10, left: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.arrow_back_ios_new_outlined,
              color: myWhite,
            ),
            const SizedBox(width: 100),
            Text(
              'My tasks',
              style: TextStyle(
                fontSize: 26,
                color: myWhite,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Task1 extends StatelessWidget {
  const Task1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: myGrey,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          const BoxShadow(
            color: Colors.black38,
            offset: Offset(
              0.0,
              10.0,
            ),
            blurRadius: 8.0,
            spreadRadius: -6.0,
          ),
        ],
      ),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          dismissible: DismissiblePane(onDismissed: () {}),
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              autoClose: true,
              flex: 1,
              onPressed: (value) {},
              backgroundColor: myGrey,
              foregroundColor: const Color(0xff5A7736),
              icon: Icons.check_circle,
              //label: 'complete',
            ),
            SlidableAction(
              autoClose: true,
              flex: 1,
              onPressed: (value) {},
              backgroundColor: myGrey,
              foregroundColor: myRed,
              icon: Icons.archive,
              //label: 'Archive',
            ),
            SlidableAction(
              autoClose: true,
              flex: 1,
              onPressed: (value) {},
              backgroundColor: myGrey,
              foregroundColor: Colors.red,
              icon: Icons.delete,
              //label: 'Delete',
            ),
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Home Work',
                    style: TextStyle(
                      fontSize: 17,
                      color: myDark,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '18 Nov\nTo: 22 Nov',
                    style: TextStyle(
                      fontSize: 9,
                      color: myDark,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  CircularPercentIndicator(
                    radius: 20,
                    lineWidth: 4,
                    backgroundColor: myGrey,
                    progressColor: myRed,
                    percent: 0.6,
                    center: Text(
                      "60%",
                      style: TextStyle(
                        fontSize: 9,
                        color: myRed,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 13),
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: myDark,
                          size: 20,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: myDark,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InProgress extends StatelessWidget {
  const InProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 9,
        ),
        backgroundColor: myWhite,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          side: BorderSide(
            width: 1,
            color: myDark,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'In progress',
            style: TextStyle(
              fontSize: 14,
              color: myDark,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}

class Completed extends StatelessWidget {
  const Completed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 9,
        ),
        backgroundColor: myWhite,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          side: BorderSide(
            width: 1,
            color: myDark,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Completed',
            style: TextStyle(
              fontSize: 14,
              color: myDark,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}

class Archived extends StatelessWidget {
  const Archived({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 9,
        ),
        backgroundColor: myWhite,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          side: BorderSide(
            width: 1,
            color: myDark,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Archived',
            style: TextStyle(
              fontSize: 14,
              color: myDark,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      onPressed: () {},
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
