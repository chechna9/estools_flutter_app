import 'package:estools_mobile/constants.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final bool activated;
  const FilterButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.activated = true});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        backgroundColor: activated ? myRed : myWhite,
        shape: RoundedRectangleBorder(
          side: activated ? BorderSide.none : const BorderSide(),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: activated ? myWhite : myDark,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
