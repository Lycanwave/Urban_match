import 'dart:convert';

import 'package:urban_match_rohit/model/commit_model.dart';
import 'package:urban_match_rohit/model/git_model.dart';
import 'package:http/http.dart' as http;
import 'package:urban_match_rohit/services/utilities/app_url.dart';

class StateServices {
  Future<List<dynamic>> fetch_Git_State_Record() async {
    final response = await http.get(Uri.parse(AppUrl.task1Url));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> fetch_Git_Last_Commit() async {
    final response = await http.get(Uri.parse(AppUrl.task2Url));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Error');
    }
  }

  Future<CommitStateModel> fetch_Commit_Data(String baseUrl) async {
    final response = await http.get(Uri.parse(baseUrl));
    //print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return CommitStateModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }
}
