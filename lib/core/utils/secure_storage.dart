import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();
  static const _key = 'onboarding_seen';

  Future<void> setOnboardingSeen() async =>
      _storage.write(key: _key, value: 'false');

  Future<bool> hasSeenOnboarding() async =>
      (await _storage.read(key: _key)) == 'false';
}
