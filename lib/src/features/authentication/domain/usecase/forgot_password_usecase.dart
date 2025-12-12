import 'package:template/src/core/services/storage/i_local_storage_service.dart';
import 'package:template/src/core/services/storage/storage_key.dart';
import 'package:template/src/core/utils/extension/validator_extension.dart';
import 'package:template/src/features/authentication/domain/entites/forgot_password_entity.dart';
import 'package:template/src/features/authentication/domain/repositories/i_auth_repository.dart';

class ForgotPasswordUsecase {
  final IAuthRepository authRepository;
  final ILocalStorageService localStorageService;
  ForgotPasswordUsecase({
    required this.authRepository,
    required this.localStorageService,
  });

  Future<ForgotPasswordEntity> execute({required String email}) async {
    if (email.isNullOrEmpty) {
      throw Exception("Email cannot be empty.");
    }

    if (email.isInvalidEmail) {
      throw Exception("Please enter a valid email address.");
    }
    final res = await authRepository.forgotPassword(email);

    final forgotPasswordEntity = ForgotPasswordEntity(token: res.data.token);
    localStorageService.saveKey(
      StorageKey.accessToken,
      forgotPasswordEntity.token,
    );
    return forgotPasswordEntity;
  }
}
