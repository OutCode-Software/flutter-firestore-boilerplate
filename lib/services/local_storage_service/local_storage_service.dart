import 'dart:async';

abstract class LocalStorageService {
  String userKey = '';
  String localeKey = '';

  FutureOr<void> init();
  String? get currentUserId;
  String get locale;

  Future<bool> setCurrentUserId(String userId);
  Future<bool> setLocale(String locale);
  Future<bool> clearCache();

  void setValue({required String key, required dynamic value});
  dynamic getValue({required String key});
}
