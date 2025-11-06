import 'package:template/core/network/api_client.dart';
import 'package:template/core/network/api_result.dart';

class SafeApi {
  final ApiClient api;

  SafeApi(this.api);

  Future<ApiResult<T>> call<T>(
    Future<T> Function() task,
  ) async {
    try {
      final res = await task();
      return ApiResult.success(res);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
