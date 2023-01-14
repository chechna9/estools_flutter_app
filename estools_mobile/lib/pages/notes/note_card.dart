import 'package:estools_mobile/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NoteCard extends StatelessWidget {
  final String title;
  final String body;
  final String startDate;
  final Function onDelete;
  const NoteCard({
    Key? key,
    required this.title,
    required this.onDelete,
    required this.body,
    required this.startDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        extentRatio: 0.2,
        children: [
          // Delete
          SlidableAction(
            autoClose: true,
            // flex: 1,
            onPressed: (context) => onDelete(),
            backgroundColor: myWhite,
            foregroundColor: Colors.red,
            icon: Icons.delete,
            //label: 'Delete',
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: myGrey,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [myBoxShadow],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      color: myDark,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // body
                  Text(
                    body,
                    overflow: TextOverflow.ellipsis,
                    // maxLines: 1,
                    style: TextStyle(
                      fontSize: 12,
                      color: myDark,
                    ),
                  ),
                  // date
                  Text(
                    startDate,
                    style: TextStyle(
                      fontSize: 9,
                      color: myDark.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
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
      ),
    );
  }
}
