import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:template/config/router/app_router.dart';
import 'package:template/core/services/network/api_client.dart';
import 'package:template/core/services/network/api_service.dart';
import 'package:template/core/services/network/i_api_service.dart';
import 'package:template/core/services/snackbar/i_snackbar_service.dart';
import 'package:template/core/services/snackbar/snackbar_service.dart';
import 'package:template/core/services/storage/i_local_storage_service.dart';
import 'package:template/core/services/storage/local_storage_service.dart';
import 'package:template/core/utils/api_end_points.dart';
import 'package:template/features/authentication/data/repositories/auth_repository.dart';
import 'package:template/features/authentication/domain/usecase/signin_usecase.dart';
import 'package:template/features/authentication/domain/usecase/signup_usecase.dart';
import 'package:template/features/profile/data/repository/profile_repository.dart';

import 'package:template/features/profile/domain/repository/i_profile_repositoty.dart';
import 'package:template/features/authentication/domain/repositories/i_auth_repository.dart';
import 'package:template/features/authentication/domain/usecase/email_verified_usecase.dart';

part 'dependency_injection.g.dart';
part 'parts/services.dart';
part 'parts/repository.dart';
part 'parts/usecase.dart';
