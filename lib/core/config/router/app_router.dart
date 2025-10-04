import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/features/onboarding/presentation/views/onboarding_page_view.dart';

import '../../../features/pokemons/presentation/views/favorite_pokemons_page.dart';
import '../../widgets/main_layout.dart';
import '../../../features/pokemons/presentation/views/pokemon_details_page.dart';
import '../../../features/pokemons/presentation/views/pokemon_list_page.dart';
import '../../../features/pokemons/presentation/views/coming_soon_page.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
            path: '/',
            name: 'onboarding',
            builder: (context, state) => const OnboardingPageView(),
          ),
      // Ruta principal que usa MainLayout
      ShellRoute(
        builder: (context, state, child) => MainLayout(child: child),
        routes: [
          
          // Páginas que estarán dentro del MainLayout
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (context, state) => const PokemonListPage(),
          ),
           GoRoute(
            path: '/pokemon/:id',
            name: 'pokemonDetail',
            builder: (context, state) {
              final id = int.parse(state.pathParameters['id']!);
              return PokemonDetailPage(pokemonId: id);
            },
          ),
          GoRoute(
            path: '/favorites',
            name: 'favorites',
            builder: (context, state) => const FavoritePokemonsPage(),
          ),
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
