import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/core/analytics_and_crashlytics/crashlytics/crashlytics_service.dart';
import 'analytics/analytics_service.dart';

final analyticsProvider = Provider<AnalyticsService>((ref) {
  final analytics = AnalyticsService();
  analytics.setUserId("123");
  analytics.setUserProperty("name", "tester");
  analytics.setUserProperty("country", "bangladesh");
  return analytics;
});

// Define a provider for CrashlyticsService
final crashlyticsServiceProvider = Provider<CrashlyticsService>((ref) {
  final crashlyticsService = CrashlyticsService();
  crashlyticsService.setUserIdentifier("test_user_001");
  crashlyticsService.setCustomKey("user_name", "Demo Tester");
  crashlyticsService.setCustomKey("environment", "demo_testing");

  return crashlyticsService;
});
