import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/features/authentication/domain/entites/forgot_password_entity.dart';
import 'package:template/features/authentication/domain/entites/otp_verified_entity.dart';
import 'package:template/features/authentication/domain/usecase/forgot_password_usecase.dart';
import 'package:template/features/authentication/domain/usecase/otp_verified_usecase.dart';
import 'package:template/features/authentication/presentation/notifiers/forgot_password_notifier.dart';
import 'package:template/features/authentication/presentation/notifiers/otp_verified_notifier.dart';

import 'di/dependency_injection.dart';

//=============== auththentication=================

final forgotPasswordProvider =
    StateNotifierProvider<
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
