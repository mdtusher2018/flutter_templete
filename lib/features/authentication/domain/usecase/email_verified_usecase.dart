import 'package:template/core/services/storage/i_local_storage_service.dart';
import 'package:template/core/services/storage/storage_key.dart';
import 'package:template/core/utils/extension/validator_extension.dart';

import 'package:template/features/authentication/domain/entites/email_verified_entity.dart';
import 'package:template/features/authentication/domain/repositories/i_auth_repository.dart';

class EmailVerifiedUsecase {
  final IAuthRepository authRepository;
  final ILocalStorageService localStorage;

  EmailVerifiedUsecase({
    required this.authRepository,
    required this.localStorage,
  });

  Future<EmailVerifiedEntity> execute({required String otp}) async {
    if (otp.isNullOrEmpty) {
      throw Exception("OTP is required");
    }

    final response = await authRepository.emailVerification(otp);

    final emailVerifiedEntity = EmailVerifiedEntity(
      accessToken: response.data.accessToken,
    );

    localStorage.saveKey(
      StorageKey.accessToken,
      emailVerifiedEntity.accessToken,
    );

    return emailVerifiedEntity;
  }
}
