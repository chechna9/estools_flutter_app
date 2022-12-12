import 'package:estools_mobile/constants.dart';
import 'package:estools_mobile/models/action_model.dart';
import 'package:flutter/material.dart';

class ActionCard extends StatelessWidget {
  final ActionModele action;

  const ActionCard({
    super.key,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // time and date
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: myDark,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                action.time,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: myWhite,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          // name
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: myBoxShadow.copyWith(
                color: myGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        action.name,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: myDark,
                        ),
                      ),
                      Text(
                        'estimation  : 2H',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w100,
                          color: myDark.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.home,
                    color: myRed,
                    size: 35,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
