class ProductText {
  static ProductText? _instance;

  static ProductText get instance {
    _instance ??= ProductText._init();
    return _instance!;
  }

  ProductText._init();

  String get appTitle => 'Snack Overflow';
  String get getStarted => 'Get started';
  String get signUpWithEmail => 'Sign up with Email';
  String get goWithYourFlow => 'Go With Your flow';
}
