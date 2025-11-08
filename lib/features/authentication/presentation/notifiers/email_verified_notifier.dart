import 'package:template/core/base/base_async_notifier.dart';
import 'package:template/features/authentication/domain/entites/email_verified_entity.dart';
import 'package:template/features/authentication/domain/usecase/email_verified_usecase.dart';

class EmailVerifiedNotifier extends BaseAsyncNotifier<EmailVerifiedEntity> {
  final EmailVerifiedUsecase emailVerifiedUsecase;

  EmailVerifiedNotifier(
    super.apiService,
    super.snackBarService, {
    required this.emailVerifiedUsecase,
  });

  Future<void> verifyEmail({required String otp}) async {
    await execute(
      () async {
        final result = await emailVerifiedUsecase.execute(otp: otp);
        return result;
      },
      showSuccess: true,
      successMessage: "Email verified successful!",
    );
  }
}
