import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:random_app/logic/constants.dart';
import 'package:random_app/logic/api/user_model.dart' as model;

class ApiService {
  Future<List<model.UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<model.UserModel> _model = model.modelDecode(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
