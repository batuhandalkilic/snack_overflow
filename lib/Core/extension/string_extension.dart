extension Png on String {
  String get toOnboardingPng => 'assets/png/onboarding/$this.png';
  String get toAppLogoPng => 'assets/png/applogo/$this.png';
  String get toIconPng => 'assets/png/icons/$this.png';
}
//  "assets/png/onboarding/$this.png";

extension Jpg on String {
  String get toJpg => 'assets/jpg/$this.jpg';
}
