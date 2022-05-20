import 'package:ecommerce/data/api/apiClient.dart';
import 'package:ecommerce/helpers/app_constants.dart';
import 'package:ecommerce/models/signup_body_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> registration(SignupBody signupBody) async {
    return await apiClient.postData(AppConstant.REGISTRATION_URI, signupBody.toJson());
  }

  saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstant.TOKEN, token);
  }
}