import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../models/index.dart';

String _baseUrl = "localhost:8085/";
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
        _apiResponse.Data =
            UserModel.fromJson(convert.jsonDecode(response.body));
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
