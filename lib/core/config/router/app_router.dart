import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../features/onboarding/presentation/views/onboarding_page_view.dart';
import '../../../features/pokemons/presentation/views/pokemon_list_page.dart';

// Proveedor global del router
final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/onboarding',
    routes: [
      GoRoute(
        path: '/onboarding',
        name: OnboardingPageView.name,
        builder: (context, state) => const OnboardingPageView(),
      ),
        GoRoute(
        path: '/pokemonList',
        name: PokemonListPage.name,
        builder: (context, state) => const PokemonListPage(),
      ),
      
    ],
  );
});
