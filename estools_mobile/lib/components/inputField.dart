import 'package:flutter/material.dart';

import '../constants.dart';

class CustomInputField extends StatelessWidget {
  final String labelText;
  final bool obscured;
  final String? Function(String? e) validator;
  final TextEditingController controller;
  const CustomInputField(
      {super.key,
      required this.labelText,
      this.obscured = false,
      required this.validator,
      required this.controller});
// borders
  OutlineInputBorder myOutlinedBorder({Color? color}) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: color ?? Colors.black,
          width: 2,
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [myBoxShadow]),
      child: TextFormField(
        controller: controller,
        validator: (e) => validator(e),
        obscureText: obscured,
        decoration: InputDecoration(
          filled: true,
          alignLabelWithHint: true,
          fillColor: myGrey,
          focusedBorder: myOutlinedBorder(color: myDark),
          enabledBorder: myOutlinedBorder(color: Colors.transparent),
          errorBorder: myOutlinedBorder(color: myRed),
          labelText: labelText,
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
// borders
  OutlineInputBorder myOutlinedBorder({Color? color}) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: color ?? Colors.black,
          width: 2,
        ),
      );
  late bool obscured;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obscured = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [myBoxShadow],
      ),
      child: TextFormField(
        controller: widget.controller,
        validator: (value) => widget.validator(value),
        obscureText: obscured,
        decoration: InputDecoration(
          filled: true,
          alignLabelWithHint: true,
          fillColor: myGrey,
          focusedBorder: myOutlinedBorder(color: myDark),
          enabledBorder: myOutlinedBorder(color: Colors.transparent),
          errorBorder: myOutlinedBorder(color: myRed),
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
