import 'package:ecommerce/data/repositories/auth_repo.dart';
import 'package:ecommerce/models/response_model.dart';
import 'package:ecommerce/models/signup_body_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  bool _isLoading = false;
  bool get isLoading => isLoading;

   Future<ResponseModel> registration(SignupBody signupBody) async {
    _isLoading = true;
    late ResponseModel responseModel;

    Response response = await authRepo.registration(signupBody);
    if(response.statusCode == 200) {
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body['token']);
    } else {
       responseModel = ResponseModel(false, response.statusText!);
    }

    _isLoading = false;
    update();
    return responseModel;
  }

}