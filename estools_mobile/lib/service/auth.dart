import 'package:estools_mobile/constants.dart';
import 'package:estools_mobile/models/formSubmissionResponse.dart';
import 'package:estools_mobile/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Auth {
  // sigUp
  static Future<RequestSubmissionResponse> signup(String email, String password,
      String firstname, String lastname, BuildContext context) async {
    UserModel _userModel = Provider.of<UserModel>(context, listen: false);
    try {
      return await _userModel.signup(email, password, firstname, lastname);
    } catch (e) {
      return RequestSubmissionResponse(isValid: false, message: e.toString());
    }
  }

  // login
  static Future<RequestSubmissionResponse> signin(
      String email, String password, BuildContext context) async {
    UserModel _userModel = Provider.of<UserModel>(context, listen: false);
    try {
      return await _userModel.signin(email, password);
    } catch (e) {
      print(e);
      return RequestSubmissionResponse(isValid: false, message: e.toString());
    }
  }
}
