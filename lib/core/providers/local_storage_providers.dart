import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/local_storage_service.dart';

final localStorageServiceProvider = Provider<LocalStorageService>((ref) {
  return LocalStorageService();
});

final onboardingSeenProvider = FutureProvider<bool>((ref) async {
  final storageService = ref.watch(localStorageServiceProvider);
  return await storageService.hasSeenOnboarding();
});