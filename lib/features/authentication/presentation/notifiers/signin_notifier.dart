// features/authentication/domain/notifiers/login_notifier.dart

import 'package:template/core/base/base_async_notifier.dart';
import 'package:template/features/authentication/domain/entites/signin_entity.dart';

import 'package:template/features/authentication/domain/usecase/signin_usecase.dart';

class LoginNotifier extends BaseAsyncNotifier<SigninEntity> {
  final LoginUseCase loginUseCase;

  LoginNotifier(
    super.apiService,
    super.snackBarService, {
    required this.loginUseCase,
  });

  Future<void> login({required String email, required String password}) async {
    await execute(
      () async {
        // Delegate all logic to the use case
        final result = await loginUseCase.execute(
          email: email,
          password: password,
        );
        return result;
      },
      showSuccess: true,
      successMessage: "Login successful!",
    );
  }
}
