import 'package:template/core/services/network/i_api_service.dart';
import 'package:template/core/utils/api_end_points.dart';
import 'package:template/features/authentication/data/models/signin_response.dart';
import 'package:template/features/authentication/data/models/signup_response.dart';
import 'package:template/features/authentication/domain/repositories/i_auth_repository.dart';

class AuthRepository implements IAuthRepository {
  final IApiService api;
  AuthRepository(this.api);

  @override
  Future<SigninResponse> login(String email, String password) async {
    final res = await api.post(ApiEndpoints.signin, {
      "email": email,
      "password": password,
    });

    return SigninResponse.fromJson(res);
  }

  @override
  Future<SignupResponse> signup(String email, String password) async {
    final res = await api.post(ApiEndpoints.signup, {
      "email": email,
      "password": password,
    });
    return SignupResponse.fromJson(res);
  }
}
