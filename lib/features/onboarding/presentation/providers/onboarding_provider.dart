import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../domain/repositories/entities/on_boarding_page_entity/onboarding_page_entity.dart';


final onboardingIndexProvider = StateProvider<int>((ref) => 0);

final onboardingPagesProvider = Provider<List<OnboardingPageEntity>>((ref) {
  return const [
    OnboardingPageEntity(
      imagePath: 'assets/images/onboarding1.png',
      title: 'Todos los Pokémon en un solo lugar',
      subtitle:
          'Accede a una amplia lista de Pokémon de todas las generaciones creadas por Nintendo',
    ),
    OnboardingPageEntity(
      imagePath: 'assets/images/onboarding2.png',
      title: 'Mantén tu Pokédex actualizada',
      subtitle:
          'Regístrate y guarda tu perfil, Pokémon favoritos, configuraciones y más',
    ),
  ];
});

