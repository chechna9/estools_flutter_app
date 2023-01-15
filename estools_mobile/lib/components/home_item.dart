import 'package:estools_mobile/constants.dart';
import 'package:estools_mobile/utils/colors.dart';
import 'package:estools_mobile/utils/screen_dim.dart';
import 'package:estools_mobile/utils/text_style.dart';
import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  final String name;
  final String image;
  final Color bgColor;
  final Function onPressed;
  const HomeItem({
    super.key,
    required this.image,
    required this.bgColor,
    required this.name,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: TextButton(
        onPressed: () => onPressed(),
        style: TextButton.styleFrom(
          elevation: 10,
          backgroundColor: bgColor,
          padding: const EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // item name
            Text(
              name,
              style: EstlTStyle.categorieTitle.copyWith(color: myDark),
            ),

            // image
            Expanded(
              child: Image.asset(
                image,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
