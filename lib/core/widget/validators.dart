class AppValidators {
  AppValidators._();

  static String? validateEmail(String? value) {
    RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value == null) {
      return 'this field is required';
    } else if (value.trim().isEmpty) {
      return 'this field is required';
    } else if (emailRegex.hasMatch(value) == false) {
      return 'enter valid email';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? value) {
    RegExp passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])');
    if (value == null) {
      return 'this field is required';
    } else if (value.isEmpty) {
      return 'this field is required';
    } else if (value.length < 8 || !passwordRegex.hasMatch(value)) {
      return 'strong password please';
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'this field is required';
    } else if (value != password) {
      return 'same password';
    } else {
      return null;
    }
  }

  static String? validateUsername(String? value) {
    RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');
    if (value == null) {
      return 'this field is required';
    } else if (value.isEmpty) {
      return 'this field is required';
    } else if (!usernameRegex.hasMatch(value)) {
      return 'enter valid username';
    } else {
      return null;
    }
  }

  static String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'this field is required';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null) {
      return 'this field is required';
    } else if (int.tryParse(value.trim()) == null) {
      return 'enter numbers only';
    } else if (value.trim().length != 11) {
      return 'enter value must equal 11 digit';
    } else {
      return null;
    }
  }
}
