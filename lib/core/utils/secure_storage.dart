import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();
  static const _key = 'onboarding_seen';
  static const _keyFav = 'favorites';

  Future<void> setOnboardingSeen() async =>
      _storage.write(key: _key, value: 'false');

  Future<bool> hasSeenOnboarding() async =>
      (await _storage.read(key: _key)) == 'false';


  Future<List<String>> getFavorites() async {
    final raw = await _storage.read(key: _keyFav);
    if (raw == null) return [];
    return raw.split(',');
  }

  Future<void> toggleFavorite(String name) async {
    final favs = (await getFavorites()).toSet();
    if (favs.contains(name)) {
      favs.remove(name);
    } else {
      favs.add(name);
    }
    await _storage.write(key: _keyFav, value: favs.join(','));
  }
}
