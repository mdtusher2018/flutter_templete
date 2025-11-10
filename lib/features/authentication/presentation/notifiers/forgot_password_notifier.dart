import 'package:template/core/base/base_async_notifier.dart';
import 'package:template/features/authentication/domain/entites/forgot_password_entity.dart';

import 'package:template/features/authentication/domain/usecase/forgot_password_usecase.dart';

class ForgotPasswordNotifier extends BaseAsyncNotifier<ForgotPasswordEntity> {
  final ForgotPasswordUsecase forgotPasswordUsecase;
  ForgotPasswordNotifier(
    super.apiService,
    super.snackBarService, {
    required this.forgotPasswordUsecase,
  });

  Future<void> forgotPassword({required String email}) async {
    await execute(
      () async {
        return await forgotPasswordUsecase.execute(email: email);
      },

      showSuccess: true,
      successMessage: "OTP send successful!",
    );
  }
}
