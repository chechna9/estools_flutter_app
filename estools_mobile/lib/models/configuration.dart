import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import '../service/consts.dart';
import 'index.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ConfigurationModel with ChangeNotifier {
  late String _title;
  late String _id;
  late List<Note> _notes;
  late String _token;
  ConfigurationModel({
    // required String token,
    // required String title,
    required UserModel? user,
  }) {
    if (user != null) {
      _id = user.configuration[0];
      _token = user.token;
      _fetchConfig();
    }
    // _title = title;
    // _token = token;
  }
  String get title => _title;
  set title(String title) => {_title = title};

  List<Note> get notes => _notes;
  set notes(List<Note> notes) => _notes = notes;

  Map<String, dynamic> _toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = _title;
    data['notes'] = _notes.map(((note) => note.toJson()));
    return data;
  }

  _fromJson(Map<String, dynamic> data) {
    _title = data['title'];
    _notes = data['notes'].map((note) => Note.fromJson(note));
  }

  _fetchConfig() async {
    try {
      var url = Uri.parse('${apiBaseUrl}user/config');
      print(url);
      final response = await http.get(
        url,
        headers: {'x-access-token': _token},
      ).timeout(Duration(seconds: 10));

      final data = convert.jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          print(200);
          //updating the user data
          _fromJson(data);
          break;
        case 401:
          print("400" + convert.jsonDecode(response.body)['message']);
          break;
        default:
          print("on default");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<RequestSubmissionResponse> _syncConfig() async {
    //put request on config
    RequestSubmissionResponse returnValue =
        RequestSubmissionResponse(isValid: false, message: "Invalid");
    try {
      var url = Uri.parse('${apiBaseUrl}user/config');
      print(url);
      final response = await http
          .put(
            url,
            headers: {'x-access-token': _token},
            body: _toJson(),
          )
          .timeout(Duration(seconds: 10));

      final data = convert.jsonDecode(response.body);
      returnValue.message = data['message'];
      switch (response.statusCode) {
        case 200:
          print(200);
          //updating the user data
          _fromJson(data);
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
    }
    return returnValue;
  }

//notes methods
  Future<RequestSubmissionResponse> setNote(Note note) async {
    RequestSubmissionResponse returnValue =
        RequestSubmissionResponse(isValid: false, message: "Action Failed!");

    try {
      int noteIndex = _notes.indexWhere((element) => element.id == note.id);
      if (noteIndex != -1) {
        _notes[_notes.indexWhere((element) => element.id == note.id)] = note;
      } else {
        _notes.add(note);
      }
      //update in DB
      returnValue = await _syncConfig();
      notifyListeners();
    } catch (e) {
      print(e);
    }
    return returnValue;
  }
}

//notes class
class Note {
  String id;
  String title;
  String description;
  String add_date;
  String category;
  Note(
      {required this.id,
      required this.title,
      required this.description,
      required this.add_date,
      required this.category});

  Map<String, String> toJson() {
    Map<String, String> data = Map<String, String>();
    data['_id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['add_date'] = add_date;
    data['category'] = category;
    return data;
  }

  factory Note.fromJson(Map<String, dynamic> data) {
    return Note(
      id: data['_id'],
      title: data['title'],
      description: data['description'],
      add_date: data['add_date'],
      category: data['category'],
    );
  }
}
