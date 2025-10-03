import 'package:freezed_annotation/freezed_annotation.dart';
part 'onboarding_page_entity.freezed.dart';
part 'onboarding_page_entity.g.dart';

@freezed
abstract class OnboardingPageEntity with _$OnboardingPageEntity {
  const factory OnboardingPageEntity({
    required String imagePath,
    required String title,
    required String subtitle,
  }) = _OnboardingPageEntity;

  factory OnboardingPageEntity.fromJson(Map<String, dynamic> json) =>
      _$OnboardingPageEntityFromJson(json);
}
