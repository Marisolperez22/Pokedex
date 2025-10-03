import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_page_model.freezed.dart';
part 'onboarding_page_model.g.dart';

@freezed
class OnboardingPageModel with _$OnboardingPageModel {
  const factory OnboardingPageModel({
    required String title,
    required String description,
    required String imageAsset,
  }) = _OnboardingPageModel;

  factory OnboardingPageModel.fromJson(Map<String, dynamic> json) =>
      _$OnboardingPageModelFromJson(json);
}
