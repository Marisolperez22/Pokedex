import 'package:pokedex/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/services/local_storage_service.dart';
import 'features/pokemons/presentation/providers/favorite_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final storage = LocalStorageService();
  final seen = await storage.hasSeenOnboarding();
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: EasyLocalization(
        path: 'assets/translations',
        fallbackLocale: const Locale('es'),
        supportedLocales: const [Locale('es'), Locale('en')],
        child: App(showOnboarding: !seen),
      ),
    ),
  );
}
