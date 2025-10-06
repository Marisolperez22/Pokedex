import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/router/app_router.dart';
import '../../features/pokemons/presentation/providers/favorite_provider.dart';

class MainLayout extends ConsumerWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final favoriteCount = ref.watch(favoritePokemonsProvider).length;
    final goRouter = ref.watch(goRouterProvider);

    final currentLocation =
        goRouter.routerDelegate.currentConfiguration.fullPath;
    final currentIndex = _getCurrentIndex(currentLocation);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => _onItemTapped(index, context, ref),
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.catching_pokemon),
            label: 'Pokedex',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const Icon(Icons.favorite),
                // if (favoriteCount > 0)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      'hola',
                      // favoriteCount > 99 ? '99+' : favoriteCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            label: 'Favoritos',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Regiones',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }

  int _getCurrentIndex(String location) {
    if (location == '/') return 0;
    if (location == '/favorites') return 1;
    if (location == '/regions') return 2;
    if (location == '/profile') return 3;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context, WidgetRef ref) {
    final goRouter = ref.read(goRouterProvider);

    switch (index) {
      case 0:
        goRouter.go('/');
        break;
      case 1:
        goRouter.go('/favorites');
        break;
      case 2:
        goRouter.go('/regions');
        break;
      case 3:
        goRouter.go('/profile');
        break;
    }
  }
}
