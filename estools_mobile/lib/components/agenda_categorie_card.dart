import 'package:estools_mobile/constants.dart';
import 'package:estools_mobile/utils/colors.dart';
import 'package:estools_mobile/utils/screen_dim.dart';
import 'package:estools_mobile/utils/text_style.dart';
import 'package:flutter/material.dart';

class AgendaCategCard extends StatelessWidget {
  const AgendaCategCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: EstlScreen.width(context) * 0.4,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: EstlColors.altColor1,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [myBoxShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // categ name
          Text(
            'Home Work',
            style: EstlTStyle.categorieTitle,
          ),
          // number of tasks
          Text(
            '18 tasks',
            style: TextStyle(
              color: myWhite,
            ),
          ),
          // icon
          Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.home,
              color: myWhite,
              size: 35,
            ),
          )
        ],
      ),
    );
  }
}
