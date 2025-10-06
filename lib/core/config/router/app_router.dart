import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/pokemons/presentation/views/favorite_pokemons_page.dart';
import '../../../features/pokemons/presentation/views/pokemon_details_page.dart';
import '../../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../../features/pokemons/presentation/views/pokemon_list_page.dart';
import '../../../features/pokemons/presentation/views/coming_soon_page.dart';
import '../../providers/local_storage_providers.dart';
import '../../widgets/main_layout.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final storageService = ref.read(localStorageServiceProvider);

  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        redirect: (context, state) async {
          final hasSeenOnboarding = await storageService.hasSeenOnboarding();
          return hasSeenOnboarding ? '/home' : '/onboarding';
        },
      ),
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnboardingView(),
      ),
      // Ruta principal que usa MainLayout
      ShellRoute(
        builder: (context, state, child) => MainLayout(child: child),
        routes: [
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (context, state) => const PokemonListPage(),
          ),
         
          // GoRoute(
          //   path: '/favorites',
          //   name: 'favorites',
          //   builder: (context, state) => const FavoritePokemonsPage(),
          // ),
          GoRoute(
            path: '/regions',
            name: 'regions',
            builder: (context, state) => ComingSoonPage(),
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (context, state) => ComingSoonPage(),
          ),
        ],
      ),
    ],
  );
});
