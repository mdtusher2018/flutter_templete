import 'package:template/core/base/failure.dart';
import 'package:template/core/base/repository.dart';
import 'package:template/core/base/result.dart';
import 'package:template/features/profile/data/model/profile_response.dart';

abstract base class IProfileRepository extends Repository {
  Future<Result<ProfileResponse, Failure>> getProfile();
}
