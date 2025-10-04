import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../features/pokemons/presentation/views/favorite_pokemons_page.dart';
import '../../../features/pokemons/presentation/views/main_layout.dart';
import '../../../features/pokemons/presentation/views/pokemon_list_page.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      // Ruta principal que usa MainLayout
      ShellRoute(
        builder: (context, state, child) => MainLayout(child: child),
        routes: [
          // Páginas que estarán dentro del MainLayout
          GoRoute(
            path: '/',
            name: 'home',
            builder: (context, state) => const PokemonListPage(),
          ),
          GoRoute(
            path: '/favorites',
            name: 'favorites',
            builder: (context, state) => const FavoritePokemonsPage(),
          ),
          GoRoute(
            path: '/regions',
            name: 'regions',
            builder: (context, state) => Container(
              color: Colors.blue,
              child: const Center(child: Text('Regiones')),
            ),
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (context, state) => Container(
              color: Colors.green,
              child: const Center(child: Text('Perfil')),
            ),
          ),
        ],
      ),
    ],
  );
});