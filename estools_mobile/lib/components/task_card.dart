import 'package:estools_mobile/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
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
