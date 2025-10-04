import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageService {
  final FlutterSecureStorage _storage;
  
  static const _keyOnboardingSeen = 'onboarding_seen';
  static const _keyFavorites = 'favorites';

  LocalStorageService({FlutterSecureStorage? storage})
      : _storage = storage ?? const FlutterSecureStorage();

  Future<void> setOnboardingSeen() async {
    await _storage.write(key: _keyOnboardingSeen, value: 'true');
  }

  Future<bool> hasSeenOnboarding() async {
    final value = await _storage.read(key: _keyOnboardingSeen);
    return value == 'true';
  }

  Future<void> setFavorites(List<int> favoriteIds) async {
    final favoritesString = favoriteIds.join(',');
    await _storage.write(key: _keyFavorites, value: favoritesString);
  }

  Future<List<int>> getFavorites() async {
    final favoritesString = await _storage.read(key: _keyFavorites);
    if (favoritesString == null || favoritesString.isEmpty) {
      return [];
    }
    return favoritesString.split(',').map(int.parse).toList();
  }
}