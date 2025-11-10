import 'package:template/core/base/base_async_notifier.dart';
import 'package:template/features/authentication/domain/entites/otp_verified_entity.dart';
import 'package:template/features/authentication/domain/usecase/otp_verified_usecase.dart';

class OTPVerifiedNotifier extends BaseAsyncNotifier<OTPVerifiedEntity> {
  final OTPVerifiedUsecase otpVerifiedUsecase;

  OTPVerifiedNotifier(
    super.apiService,
    super.snackBarService, {
    required this.otpVerifiedUsecase,
  });

  Future<void> verifyOTP({required String otp}) async {
    await execute(
      () async {
        final result = await otpVerifiedUsecase.execute(otp: otp);
        return result;
      },
      showSuccess: true,
      successMessage: "OTP verified successful!",
    );
  }
}
