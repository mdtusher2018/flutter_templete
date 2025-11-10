import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/core/services/network/api_client.dart';
import 'package:template/core/services/network/api_service.dart';
import 'package:template/core/services/network/i_api_service.dart';
import 'package:template/core/services/snackbar/i_snackbar_service.dart';
import 'package:template/core/services/snackbar/snackbar_service.dart';
import 'package:template/core/services/storage/i_local_storage_service.dart';
import 'package:template/core/services/storage/local_storage_service.dart';
import 'package:template/core/utils/api_end_points.dart';
import 'package:template/features/authentication/data/repositories/auth_repository.dart';
import 'package:template/features/authentication/domain/entites/email_verified_entity.dart';
import 'package:template/features/authentication/domain/entites/forgot_password_entity.dart';
import 'package:template/features/authentication/domain/entites/otp_verified_entity.dart';
import 'package:template/features/authentication/domain/entites/signin_entity.dart';
import 'package:template/features/authentication/domain/entites/signup_entity.dart';
import 'package:template/features/authentication/domain/usecase/email_verified_usecase.dart';
import 'package:template/features/authentication/domain/usecase/forgot_password_usecase.dart';
import 'package:template/features/authentication/domain/usecase/otp_verified_usecase.dart';
import 'package:template/features/authentication/domain/usecase/signin_usecase.dart';
import 'package:template/features/authentication/domain/usecase/signup_usecase.dart';
import 'package:template/features/authentication/presentation/notifiers/email_verified_notifier.dart';
import 'package:template/features/authentication/presentation/notifiers/forgot_password_notifier.dart';
import 'package:template/features/authentication/presentation/notifiers/otp_verified_notifier.dart';
import 'package:template/features/authentication/presentation/notifiers/signin_notifier.dart';
import 'package:template/features/authentication/presentation/notifiers/signup_notifier.dart';

// Provider for LocalStorageService singleton
final localStorageProvider = Provider<ILocalStorageService>((ref) {
  final service = LocalStorageService();
  return service;
});

// Provide ApiClient
final apiClientProvider = Provider<ApiClient>((ref) {
  final localService = ref.watch(localStorageProvider);
  return ApiClient(baseUrl: ApiEndpoints.baseUrl, localStorage: localService);
});

// Provide ApiService
final apiServiceProvider = Provider<IApiService>((ref) {
  final client = ref.watch(apiClientProvider);
  return ApiService(client, baseUrl: ApiEndpoints.baseUrl);
});

// Provide SnackbarService
final snackBarServiceProvider = Provider<ISnackBarService>((ref) {
  return SnackBarService();
});

//=============== auththentication=================

final authRepositoryProvider = Provider((ref) {
  final api = ref.watch(apiServiceProvider); // directly from core
  return AuthRepository(api);
});

final signinProvider =
    StateNotifierProvider<LoginNotifier, AsyncValue<SigninEntity?>>((ref) {
      final localService = ref.watch(localStorageProvider);
      final apiService = ref.watch(apiServiceProvider);
      final snackbarService = ref.watch(snackBarServiceProvider);
      final authRepository = ref.watch(authRepositoryProvider);

      final loginUseCase = LoginUseCase(
        authRepository: authRepository,
        localStorage: localService,
      );

      return LoginNotifier(
        apiService,
        snackbarService,
        loginUseCase: loginUseCase,
      );
    });

final signupProvider =
    StateNotifierProvider<SignupNotifier, AsyncValue<SignupEntity?>>((ref) {
      final localService = ref.watch(localStorageProvider);
      final apiService = ref.watch(apiServiceProvider);
      final snackbarService = ref.watch(snackBarServiceProvider);
      final authRepository = ref.watch(authRepositoryProvider);

      final signupUseCase = SignupUseCase(
        localStorage: localService,
        authRepository: authRepository,
      );

      return SignupNotifier(
        apiService,
        snackbarService,
        signupUseCase: signupUseCase,
      );
    });

final emailVerificationProvider = StateNotifierProvider<
  EmailVerifiedNotifier,
  AsyncValue<EmailVerifiedEntity?>
>((ref) {
  final localStorage = ref.watch(localStorageProvider);
  final apiService = ref.watch(apiServiceProvider);
  final snackbarService = ref.watch(snackBarServiceProvider);
  final authRepository = ref.watch(authRepositoryProvider);
  final emailVerifiedUseCase = EmailVerifiedUsecase(
    authRepository: authRepository,
    localStorage: localStorage,
  );

  return EmailVerifiedNotifier(
    apiService,
    snackbarService,
    emailVerifiedUsecase: emailVerifiedUseCase,
  );
});

final forgotPasswordProvider = StateNotifierProvider<
  ForgotPasswordNotifier,
  AsyncValue<ForgotPasswordEntity?>
>((ref) {
  final localStorage = ref.watch(localStorageProvider);
  final apiService = ref.watch(apiServiceProvider);
  final snackbarService = ref.watch(snackBarServiceProvider);
  final authRepository = ref.watch(authRepositoryProvider);
  final forgotPasswordUseCase = ForgotPasswordUsecase(
    authRepository: authRepository,
    localStorageService: localStorage,
  );

  return ForgotPasswordNotifier(
    apiService,
    snackbarService,
    forgotPasswordUsecase: forgotPasswordUseCase,
  );
});

final otpVerificationProvider =
    StateNotifierProvider<OTPVerifiedNotifier, AsyncValue<OTPVerifiedEntity?>>((
      ref,
    ) {
      final localStorage = ref.watch(localStorageProvider);
      final apiService = ref.watch(apiServiceProvider);
      final snackbarService = ref.watch(snackBarServiceProvider);
      final authRepository = ref.watch(authRepositoryProvider);
      final otpVerifiedUseCase = OTPVerifiedUsecase(
        authRepository: authRepository,
        localStorage: localStorage,
      );

      return OTPVerifiedNotifier(
        apiService,
        snackbarService,
        otpVerifiedUsecase: otpVerifiedUseCase,
      );
    });
