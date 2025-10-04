import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/providers/local_storage_providers.dart';
import '../widgets/onboarding_content.dart';

final onboardingIndexProvider = StateProvider<int>((ref) => 0);

class OnboardingView extends ConsumerStatefulWidget {
  const OnboardingView({super.key});

  @override
  ConsumerState<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends ConsumerState<OnboardingView> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(onboardingIndexProvider);
    final pages = [
      OnboardingContent(
        imagePath: 'assets/images/onboarding1.png',
        title: 'Todos los Pokémon en un solo lugar',
        subtitle:
            'Accede a una amplia lista de Pokémon de todas las generaciones creadas por Nintendo',
      ),
      OnboardingContent(
        imagePath: 'assets/images/onboarding2.png',
        title: 'Mantén tu Pokédex actualizada',
        subtitle:
            'Regístrate y guarda tu perfil, Pokémon favoritos, configuraciones y más',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  ref.read(onboardingIndexProvider.notifier).state = index;
                },
                children: pages,
              ),
            ),
            const SizedBox(height: 16),
            SmoothPageIndicator(
              controller: _pageController,
              count: pages.length,
              effect: ExpandingDotsEffect(
                activeDotColor: Theme.of(context).colorScheme.primary,
                dotColor: Colors.grey.shade300,
                dotHeight: 8,
                dotWidth: 8,
                spacing: 8,
                expansionFactor: 3,
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final storageService = ref.read(
                      localStorageServiceProvider,
                    );

                    if (currentIndex < pages.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    } else {
                      await storageService.setOnboardingSeen();
                      if (context.mounted) {
                        Navigator.pushReplacementNamed(context, '/home');
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    currentIndex == pages.length - 1
                        ? 'Empecemos'
                        : 'Continuar',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
