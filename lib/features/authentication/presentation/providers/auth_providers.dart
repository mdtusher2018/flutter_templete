import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/core/providers.dart';
import 'package:template/features/authentication/data/repositories/auth_repository.dart';
import 'package:template/features/authentication/domain/entites/signin_entity.dart';
import 'package:template/features/authentication/domain/entites/signup_entity.dart';
import 'package:template/features/authentication/domain/usecase/signin_usecase.dart';
import 'package:template/features/authentication/domain/usecase/signup_usecase.dart';
import 'package:template/features/authentication/presentation/notifiers/signin_notifier.dart';
import 'package:template/features/authentication/presentation/notifiers/signup_notifier.dart';

final authRepositoryProvider = Provider((ref) {
  final api = ref.watch(apiServiceProvider); // directly from core
  return AuthRepository(api);
});

final loginProvider =
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
