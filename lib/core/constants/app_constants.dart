import 'dart:ui';

abstract class AppConstants {
  static const String baseUrl = 'https://pokeapi.co/api/v2';
  static const String localePath = 'assets/translations';
  
  static const List<Locale> supportedLocales = [
    Locale('en', 'US'),
    Locale('es', 'ES'),
  ];
  
  static const Locale fallbackLocale = Locale('en', 'US');
}