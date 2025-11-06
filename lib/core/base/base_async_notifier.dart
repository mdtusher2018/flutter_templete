import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/core/network/api_result.dart';
import 'package:template/core/network/safe_api.dart';

/// Generic AsyncNotifier that wraps API calls safely
abstract class BaseAsyncNotifier<T> extends AsyncNotifier<T> {
  late final SafeApi safeApi;

  void setApi(SafeApi api) => safeApi = api;

  /// Generic method to call any API and auto-handle AsyncValue state
  Future<void> execute(Future<ApiResult<T>> Function() task) async {
    state = const AsyncValue.loading();
    try {
      final result = await task();

      if (result.hasData) {
        state = AsyncValue.data(result.data as T);
      } else {
        state = AsyncValue.error(result.error ?? 'Unknown error',StackTrace.current);
      }
    } catch (e, st) {
      state = AsyncValue.error(e,st);
    }
  }
}
