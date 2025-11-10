import 'package:template/features/authentication/data/models/email_verified_response.dart';
import 'package:template/features/authentication/data/models/forgot_password_response.dart';
import 'package:template/features/authentication/data/models/otp_verified_response.dart';
import 'package:template/features/authentication/data/models/signin_response.dart';
import 'package:template/features/authentication/data/models/signup_response.dart';

abstract class IAuthRepository {
  Future<SigninResponse> login(String email, String password);
  Future<SignupResponse> signup(String email, String password);
  Future<EmailVerifiedResponse> emailVerification(String otp);
  Future<ForgotPasswordResponse> forgotPassword(String email);
  Future<OtpVerifiedResponse> otpVerification(String otp);
}
