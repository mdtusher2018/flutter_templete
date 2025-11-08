import 'package:template/features/authentication/data/models/email_verified_model.dart';
import 'package:template/features/authentication/data/models/signin_response.dart';
import 'package:template/features/authentication/data/models/signup_response.dart';

abstract class IAuthRepository {
  Future<SigninResponse> login(String email, String password);
  Future<SignupResponse> signup(String email, String password);
  Future<EmailVerifiedResponse> emailVerification(String otp);
}
