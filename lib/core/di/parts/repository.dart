part of "../dependency_injection.dart";

@riverpod
IAuthRepository authRepository(Ref ref) {
  final api = ref.watch(apiServiceProvider);
  return AuthRepository(api);
}

@riverpod
IProfileRepository profileRepository(Ref ref) {
  return ProfileRepository(ref.watch(apiServiceProvider));
}
