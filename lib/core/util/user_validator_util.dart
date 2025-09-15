class UserValidatorUtil {
  static String? validateEmail(String email) {
    if (email.endsWith('@gmail.com') && email.isNotEmpty) return null;
    return 'Email must end with @gmail.com and not be empty';
  }

  static String? validateFullName(String fullName) {
    if (fullName.isEmpty) return 'Full name must not be empty.';
    if (RegExp(r'[!@#\$&*~%^()]').hasMatch(fullName)) {
      return 'Full name must not contain special characters.';
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) return 'Password must not be empty';
    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[!@#\$&*~%^()]').hasMatch(password)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }
}
