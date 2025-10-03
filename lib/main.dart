import 'package:flutter/material.dart';
import 'core/utils/secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'features/onboarding/presentation/views/onboarding_page_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final storage = SecureStorage();
  final seen = await storage.hasSeenOnboarding();

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: const [Locale('es'), Locale('en')],
        path: 'assets/translations',
        fallbackLocale: const Locale('es'),
        child: MyApp(showOnboarding: !seen),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool showOnboarding;
  const MyApp({super.key, required this.showOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: showOnboarding ? '/onboarding' : '/login',
      routes: {
        '/onboarding': (_) => const OnboardingPageView(),
        '/login': (_) => const Scaffold(
              body: Center(child: Text('Login Screen')),
            ),
      },
    );
  }
}
