import 'package:estools_mobile/constants.dart';
import 'package:estools_mobile/utils/colors.dart';
import 'package:estools_mobile/utils/screen_dim.dart';
import 'package:estools_mobile/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TdlCategCard extends StatelessWidget {
  final String categName;
  final int numberOfTasks;
  final IconData icon;
  final Color bgColor;
  final int progress;
  const TdlCategCard({
    super.key,
    required this.categName,
    required this.numberOfTasks,
    required this.icon,
    required this.bgColor,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: EstlScreen.width(context) * 0.4,
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          padding: const EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // categ name
            Text(
              categName,
              style: EstlTStyle.categorieTitle,
            ),
            // number of tasks
            Text(
              numberOfTasks > 1
                  ? '$numberOfTasks tasks'
                  : '$numberOfTasks task',
              style: TextStyle(
                color: myWhite,
                height: 0.7,
                fontSize: 10,
              ),
            ),
            // Progress
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(0, 4),
                    blurRadius: 10,
                    spreadRadius: -10,
                  ),
                ],
              ),
              child: LinearPercentIndicator(
                percent: progress / 100,
                progressColor: EstlColors.greenDone,
                backgroundColor: myWhite,
                lineHeight: 8,
                barRadius: const Radius.circular(25),
              ),
            ),
            // icon
            Align(
              alignment: Alignment.center,
              child: Icon(
                icon,
                color: myWhite,
                size: 35,
              ),
            )
          ],
        ),
      ),
    );
  }
}
