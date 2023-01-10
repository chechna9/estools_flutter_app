import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'index.dart';
import '../service/consts.dart';

class UserModel with ChangeNotifier {
  String? _userId;
  String? _firstname;
  String? _lastname;
  String? _email;
  String? _configuration;
  String? _token;

  UserModel(
      {String? userId,
      String? firstname,
      String? lastname,
      String? configuration,
      String? email}) {
    _userId = userId;
    _firstname = firstname;
    _lastname = lastname;
    _configuration = configuration;
    _email = email;
  }

  // Properties
  String get userId => _userId!;
  set userId(String userId) => _userId = userId;
  String get firstname => _firstname!;
  set firstname(String firstname) => _firstname = firstname;
  String get lastname => _lastname!;
  set lastname(String lastname) => _lastname = lastname;
  String get configuration => _configuration!;
  set configuration(String configuration) => _configuration = configuration;
  String get email => _email!;
  set email(String email) => _email = email;

  String get token => _token!;
  set token(String token) => _token = token;

  // create the user object from json input
  UserModel.fromJson(Map<String, dynamic> json) {
    _userId = json['_id'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _email = json['email'];
    _configuration = json['configs'];
  }

  _fromJson(Map<String, dynamic> json) {
    _userId = json['_id'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _email = json['email'];
    _configuration = json['configs'];
    notifyListeners();
  }

  // exports to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._userId;
    data['firstname'] = this._firstname;
    data['lastname'] = this._lastname;
    data['configs'] = this._configuration;
    data['email'] = this._email;
    return data;
  }

  Future<RequestSubmissionResponse> signup(
      String email, String password, String firstname, String lastname) async {
    RequestSubmissionResponse returnValue =
        RequestSubmissionResponse(isValid: false, message: "Try Again");
    try {
      var url = Uri.parse('${apiBaseUrl}auth/signup');

      final response = await http.post(url, body: {
        'email': email,
        'password': password,
        'firstname': firstname,
        'lastname': lastname,
      }).timeout(Duration(seconds: 10));
      print(url);

      final data = convert.jsonDecode(response.body);
      returnValue.message = data['message'];
      switch (response.statusCode) {
        case 200:
          print(200);
          //updating the user data
          print(data);
          // _fromJson(data);
          //geting token
          // _token = data['accessToken'];
          // print('Response Validated with token: ' + _token!);
          returnValue.message = data['message'];
          returnValue.isValid = true;
          break;
        case 401:
          print("400" + convert.jsonDecode(response.body)['message']);
          returnValue.message = data['message'];
          break;
        default:
          print("on default");
          returnValue.message = data['message'];
      }
    } catch (e) {
      print(e);
      returnValue.message = "Server Error, please try again.";
    }
    return returnValue;
  }

  Future<RequestSubmissionResponse> signin(
      String email, String password) async {
    RequestSubmissionResponse returnValue =
        RequestSubmissionResponse(isValid: false, message: "Try Again");

    try {
      var url = Uri.parse(apiBaseUrl + 'auth/signin');
      print(url);
      final response = await http.post(
        url,
        body: {
          'email': email,
          'password': password,
        },
      ).timeout(Duration(seconds: 10));

      final data = convert.jsonDecode(response.body);
      returnValue.message = data['message'];
      switch (response.statusCode) {
        case 200:
          print(200);
          //updating the user data
          _fromJson(data);
          //geting token
          _token = data['accessToken'];
          print('Response Validated with token: ' + _token!);
          print('passed toJson');
          returnValue.message = data['message'];
          returnValue.isValid = true;
          break;
        case 401:
          print("400" + convert.jsonDecode(response.body)['message']);
          returnValue.message = data['message'];
          break;
        default:
          print("on default");
          returnValue.message = data['message'];
      }
    } catch (e) {
      print(e);
      returnValue.message = "Server Error, please try again.";
    }
    return returnValue;
  }
}
