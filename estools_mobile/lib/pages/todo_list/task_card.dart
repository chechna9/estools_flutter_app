import 'package:estools_mobile/constants.dart';
import 'package:estools_mobile/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String startDate;
  final String endDate;
  final int progress;
  final Function onComplete;
  final Function onArchive;
  final Function onDelete;
  const TaskCard({
    Key? key,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.progress,
    required this.onComplete,
    required this.onArchive,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        extentRatio: 0.4,
        motion: const BehindMotion(),
        children: [
          // Done
          SlidableAction(
            autoClose: true,
            onPressed: (context) => onComplete(),
            backgroundColor: myWhite,
            foregroundColor: EstlColors.greenDone,
            icon: Icons.check_circle,
            // label: 'complete',
          ),
          // Archive
          SlidableAction(
            autoClose: true,
            onPressed: (context) => onArchive(),
            backgroundColor: myWhite,
            foregroundColor: myRed,
            icon: Icons.archive,
            //label: 'Archive',
          ),
          // Delete
          SlidableAction(
            autoClose: true,
            onPressed: (context) => onDelete(),
            backgroundColor: myWhite,
            foregroundColor: Colors.red,
            icon: Icons.delete,
            //label: 'Delete',
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: myGrey,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [myBoxShadow],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 17,
                    color: myDark,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '$startDate\nTo: $endDate',
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
                  percent: progress / 100,
                  center: Text(
                    progress.toString(),
                    style: TextStyle(
                      fontSize: 9,
                      color: myRed,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 13),
                  child: Icon(
                    Icons.keyboard_double_arrow_left_rounded,
                    color: myDark,
                    size: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
