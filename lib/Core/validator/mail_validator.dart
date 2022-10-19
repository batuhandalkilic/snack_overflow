// ignore_for_file: curly_braces_in_flow_control_structures

class Validator {
  static late Validator _instance;
  static Validator get instance {
    _instance = Validator._init();
    return _instance;
  }

  Validator._init();

  String? validateEmail(String? value) {
    String pattern = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Geçerli bir mail giriniz';
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    String pattern = r"^(?=.*[a-z])(?=.*[A-Z])[a-zA-Z\d]{8,}$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Rakam ve büyük, küçük harf içermiyor';
    } else {
      return null;
    }
  }
}
