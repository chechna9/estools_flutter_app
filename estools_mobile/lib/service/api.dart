import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../models/index.dart';

String _baseUrl = "localhost:8005/";
Future<ApiResponse> authenticateUser(String email, String password) async {
  ApiResponse _apiResponse = new ApiResponse();

  try {
    final response = await http
        .post(Uri.https(_baseUrl, 'auth/signin', {'q': 'http'}), body: {
      'email': email,
      'password': password,
    });

    switch (response.statusCode) {
      case 200:
        _apiResponse.Data = User.fromJson(convert.jsonDecode(response.body));
        break;
      case 401:
        _apiResponse.ApiError =
            ApiError.fromJson(convert.jsonDecode(response.body));
        break;
      default:
        _apiResponse.ApiError =
            ApiError.fromJson(convert.jsonDecode(response.body));
        break;
    }
  } on SocketException {
    _apiResponse.ApiError = ApiError(error: "Server error. Please retry");
  }
  return _apiResponse;
}

class ApiResponse {
  // _data will hold any response converted into
  // its own object. For example user.
  late Object _data;
  // _apiError will hold the error object
  late Object _apiError;

  Object get Data => _data;
  set Data(Object data) => _data = data;

  Object get ApiError => _apiError as Object;
  set ApiError(Object error) => _apiError = error;
}

class ApiError {
  late String _error;

  ApiError({required String error}) {
    this._error = error;
  }

  String get error => _error;
  set error(String error) => _error = error;

  ApiError.fromJson(Map<String, dynamic> json) {
    _error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this._error;
    return data;
  }
}
