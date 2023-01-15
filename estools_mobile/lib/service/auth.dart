import 'package:estools_mobile/constants.dart';
import 'package:estools_mobile/models/formSubmissionResponse.dart';
import 'package:estools_mobile/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Auth {
  // sigUp
  static void _signup(String email, String password, String firstname,
      String lastname, BuildContext context) async {
    UserModel _userModel = Provider.of<UserModel>(context, listen: false);
    try {
      if (await (_userModel.signup(email, password, firstname, lastname)
              as Future<RequestSubmissionResponse>)
          .then((value) => value.isValid)) {
        print("I'm pushing");
        Navigator.of(context).pushNamed(loginRoute);
      }
    } catch (e) {
      print(e);
    }
  }

  static void handleSignUp(
    BuildContext context,
    GlobalKey<FormState> _formKey,
    TextEditingController emailCntrl,
    TextEditingController passwordCntrl,
    TextEditingController fnameCntrl,
    TextEditingController lnameCntrl,
  ) async {
    final FormState? form = _formKey.currentState;
    if (_formKey.currentState!.validate()) {
      form!.save();
      print("emailCntrl.text " +
          emailCntrl.text +
          ", passwordCntrl.text " +
          passwordCntrl.text);

      _signup(emailCntrl.text, passwordCntrl.text, fnameCntrl.text,
          lnameCntrl.text, context);
    }
  }

  // login
  static void _signin(
      String email, String password, BuildContext context) async {
    UserModel _userModel = Provider.of<UserModel>(context, listen: false);
    try {
      if (await (_userModel.signin(email, password)
              as Future<RequestSubmissionResponse>)
          .then((value) => value.isValid)) {
        print("I'm pushing");
        Navigator.of(context).pushNamed(homeRoute);
      }
    } catch (e) {
      print(e);
    }
  }

  static void handleLogin(
      BuildContext context,
      GlobalKey<FormState> _formKey,
      TextEditingController emailCntrl,
      TextEditingController passwordCntrl) async {
    final FormState? form = _formKey.currentState;
    if (_formKey.currentState!.validate()) {
      form!.save();
      print("emailCntrl.text " +
          emailCntrl.text +
          ", passwordCntrl.text " +
          passwordCntrl.text);

      _signin(emailCntrl.text, passwordCntrl.text, context);

      // Navigator.of(context).pushNamed(homeRoute);
    }
  }
}
