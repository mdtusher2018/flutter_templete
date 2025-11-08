// features/authentication/domain/usecases/login_usecase.dart

import 'package:template/core/services/storage/i_local_storage_service.dart';
import 'package:template/core/services/storage/storage_key.dart';
import 'package:template/core/utils/extension/validator_extension.dart';
import 'package:template/features/authentication/domain/entites/signin_entity.dart';
import 'package:template/features/authentication/domain/repositories/i_auth_repository.dart';

class LoginUseCase {
  final IAuthRepository authRepository;
  final ILocalStorageService localStorage;

  LoginUseCase({required this.authRepository, required this.localStorage});

  Future<SigninEntity> execute({
    required String email,
    required String password,
  }) async {
    email = email.trim();
    password = password.trim();

    // 🔹 Validation
    if (email.isNullOrEmpty && password.isNullOrEmpty) {
      throw Exception("Please enter your email and password.");
    }
    if (email.isNullOrEmpty) {
      throw Exception("Email cannot be empty.");
    }
    if (password.isNullOrEmpty) {
      throw Exception("Password cannot be empty.");
    }
    if (email.isInvalidEmail) {
      throw Exception("Please enter a valid email address.");
    }
    if (password.isInvalidPassword) {
      throw Exception("Password must be 6–16 characters long.");
    }

    // 🔹 Call repository (API)
    final response = await authRepository.login(email, password);

    if (response.data == null) {
      throw Exception("Login failed: missing token.");
    }

    final loginEntity = SigninEntity(accessToken: response.data!.accessToken);

    // 🔹 Save token locally
    await localStorage.saveKey(StorageKey.accessToken, loginEntity.accessToken);

    return loginEntity;
  }
}
