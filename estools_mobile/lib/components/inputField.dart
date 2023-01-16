import 'package:flutter/material.dart';

import '../constants.dart';

// borders
class CustomBurders {
  static OutlineInputBorder myOutlinedBorder({Color? color}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: color ?? Colors.black,
          width: 2,
        ),
      );
}

class CustomInputField extends StatefulWidget {
  final String labelText;
  final bool obscured;
  final String? Function(String? e) validator;
  final TextEditingController controller;
  const CustomInputField({
    super.key,
    required this.labelText,
    this.obscured = false,
    required this.validator,
    required this.controller,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late bool hideShadow;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hideShadow = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: hideShadow ? [] : [myBoxShadow]),
      child: TextFormField(
        controller: widget.controller,
        validator: (e) {
          final result = widget.validator(e);
          if (result == null) {
            setState(() {
              hideShadow = false;
            });
          } else {
            setState(() {
              hideShadow = true;
            });
            return result;
          }
        },
        obscureText: widget.obscured,
        decoration: InputDecoration(
          filled: true,
          alignLabelWithHint: true,
          fillColor: myGrey,
          focusedBorder: CustomBurders.myOutlinedBorder(color: myDark),
          enabledBorder:
              CustomBurders.myOutlinedBorder(color: Colors.transparent),
          errorBorder: CustomBurders.myOutlinedBorder(color: myRed),
          focusedErrorBorder: CustomBurders.myOutlinedBorder(color: myRed),
          labelText: widget.labelText,
          labelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: myDark.withOpacity(0.7),
          ),
        ),
      ),
    );
  }
}

class CustomPasswordInput extends StatefulWidget {
  final String labelText;
  final String? Function(String? e) validator;
  final TextEditingController controller;
  const CustomPasswordInput(
      {super.key,
      required this.labelText,
      required this.validator,
      required this.controller});

  @override
  State<CustomPasswordInput> createState() => _CustomPasswordInputState();
}

class _CustomPasswordInputState extends State<CustomPasswordInput> {
  late bool obscured;
  late bool hideShadow;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obscured = true;
    hideShadow = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: hideShadow ? [] : [myBoxShadow]),
      child: TextFormField(
        controller: widget.controller,
        validator: (e) {
          final result = widget.validator(e);
          if (result == null) {
            setState(() {
              hideShadow = false;
            });
          } else {
            setState(() {
              hideShadow = true;
            });
            return result;
          }
        },
        obscureText: obscured,
        decoration: InputDecoration(
          filled: true,
          alignLabelWithHint: true,
          fillColor: myGrey,
          focusedBorder: CustomBurders.myOutlinedBorder(color: myDark),
          enabledBorder:
              CustomBurders.myOutlinedBorder(color: Colors.transparent),
          errorBorder: CustomBurders.myOutlinedBorder(color: myRed),
          focusedErrorBorder: CustomBurders.myOutlinedBorder(color: myRed),
          labelText: widget.labelText,
          labelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: myDark.withOpacity(0.7),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscured = !obscured;
              });
            },
            icon: Icon(
              obscured
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: myDark,
            ),
          ),
        ),
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  final Function onClick;
  SearchInput({
    super.key,
    required this.controller,
    required this.onClick,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        alignLabelWithHint: true,
        fillColor: myGrey,
        focusedBorder: CustomBurders.myOutlinedBorder(color: myDark),
        enabledBorder:
            CustomBurders.myOutlinedBorder(color: Colors.transparent),
        errorBorder: CustomBurders.myOutlinedBorder(color: myRed),
        focusedErrorBorder: CustomBurders.myOutlinedBorder(color: myRed),
        labelText: labelText,
        labelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          color: myDark.withOpacity(0.7),
        ),
        prefixIcon: IconButton(
          onPressed: () {
            onClick();
          },
          icon: Icon(
            Icons.search,
            color: myDark,
          ),
        ),
      ),
    );
  }
}
