// domain/usecases/signup_usecase.dart

import 'package:template/core/base/base_async_notifier.dart';
import 'package:template/features/authentication/domain/entites/signup_entity.dart';
import 'package:template/features/authentication/domain/usecase/signup_usecase.dart';

class SignupNotifier extends BaseAsyncNotifier<SignupEntity> {
  final SignupUseCase signupUseCase;

  SignupNotifier(
    super.apiService,
    super.snackBarService, {
    required this.signupUseCase,
  });

  Future<void> signup({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    await execute(() async {
      // Delegate to SignupUseCase for actual logic
      final response = await signupUseCase.execute(
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );

      return response;
    });
  }
}
