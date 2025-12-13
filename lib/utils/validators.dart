class Validators {
  // 验证用户名
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return '请输入用户名';
    }
    if (value.length < 3) {
      return '用户名至少需要3个字符';
    }
    return null;
  }

  // 验证密码
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return '请输入密码';
    }
    if (value.length < 6) {
      return '密码至少需要6个字符';
    }
    return null;
  }

  // 验证确认密码
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return '请再次输入密码';
    }
    if (value != password) {
      return '两次密码输入不一致';
    }
    return null;
  }

  // 验证手机号
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return '请输入手机号';
    }
    // 中国手机号格式：11位数字
    final phoneRegex = RegExp(r'^1[3-9]\d{9}$');
    if (!phoneRegex.hasMatch(value)) {
      return '请输入正确的手机号码';
    }
    return null;
  }

  // 验证邮箱
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return '请输入邮箱';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value)) {
      return '请输入正确的邮箱格式';
    }
    return null;
  }

  // 检查密码强度
  static String getPasswordStrength(String password) {
    if (password.isEmpty) return '';
    if (password.length < 6) return '弱';
    if (password.length < 10) {
      // 检查是否包含数字和字母
      bool hasDigits = password.contains(RegExp(r'[0-9]'));
      bool hasLetters = password.contains(RegExp(r'[a-zA-Z]'));
      if (hasDigits && hasLetters) return '中';
      return '弱';
    }
    // 长度>=10，检查复杂度
    bool hasDigits = password.contains(RegExp(r'[0-9]'));
    bool hasLetters = password.contains(RegExp(r'[a-zA-Z]'));
    bool hasSpecialChars = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    if (hasDigits && hasLetters && hasSpecialChars) return '强';
    if ((hasDigits && hasLetters) || (hasDigits && hasSpecialChars) || (hasLetters && hasSpecialChars)) {
      return '中';
    }
    return '弱';
  }
}

