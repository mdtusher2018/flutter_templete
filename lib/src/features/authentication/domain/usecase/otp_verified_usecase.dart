import 'package:template/src/core/services/storage/i_local_storage_service.dart';
import 'package:template/src/core/services/storage/storage_key.dart';
import 'package:template/src/core/utils/extension/validator_extension.dart';
import 'package:template/src/features/authentication/domain/entites/otp_verified_entity.dart';
import 'package:template/src/features/authentication/domain/repositories/i_auth_repository.dart';

class OTPVerifiedUsecase {
  final IAuthRepository authRepository;
  final ILocalStorageService localStorage;

  OTPVerifiedUsecase({
    required this.authRepository,
    required this.localStorage,
  });

  Future<OTPVerifiedEntity> execute({required String otp}) async {
    if (otp.isNullOrEmpty) {
      throw Exception("OTP is required");
    }

    final response = await authRepository.otpVerification(otp);

    final otpVerifiedEntity = OTPVerifiedEntity(
      accessToken: response.data.accessToken,
    );

    localStorage.saveKey(StorageKey.accessToken, otpVerifiedEntity.accessToken);

    return otpVerifiedEntity;
  }
}
