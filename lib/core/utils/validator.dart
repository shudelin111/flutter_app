/// ============================================
/// 表单验证工具类
/// ============================================
/// 说明：提供各类表单验证方法
/// 包括：手机号、密码、邮箱、身份证等验证
/// ============================================

class Validator {
  /// ============================================
  /// 手机号验证
  /// ============================================
  /// 验证中国大陆手机号（11 位，1 开头）
  /// 支持：13x, 14x, 15x, 16x, 17x, 18x, 19x
  /// 
  /// 参数：
  ///   - phone: 待验证的手机号字符串
  /// 
  /// 返回：
  ///   - 验证成功返回 true
  ///   - 验证失败返回 false
  static bool validatePhone(String phone) {
    // 正则表达式匹配中国大陆手机号
    RegExp regExp = RegExp(
      r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$',
    );
    return regExp.hasMatch(phone);
  }
  
  /// 手机号验证错误提示
  static String getPhoneErrorText(String phone) {
    if (phone.isEmpty) {
      return '手机号不能为空';
    } else if (!validatePhone(phone)) {
      return '请输入正确的手机号';
    }
    return '';
  }
  
  /// ============================================
  /// 密码验证
  /// ============================================
  /// 验证密码格式
  /// 要求：6-18 位，可包含字母、数字、特殊字符
  /// 
  /// 参数：
  ///   - password: 待验证的密码字符串
  ///   - minLength: 最小长度（默认 6）
  ///   - maxLength: 最大长度（默认 18）
  /// 
  /// 返回：
  ///   - 验证成功返回 true
  ///   - 验证失败返回 false
  static bool validatePassword(
    String password, {
    int minLength = 6,
    int maxLength = 18,
  }) {
    if (password.length < minLength || password.length > maxLength) {
      return false;
    }
    // 至少包含字母或数字中的一种
    RegExp regExp = RegExp(r'^(?=.*[A-Za-z0-9]).+$');
    return regExp.hasMatch(password);
  }
  
  /// 密码强度验证（强密码要求）
  /// 要求：至少包含大写字母、小写字母、数字、特殊字符中的 3 种
  static bool validateStrongPassword(String password) {
    if (password.length < 8) {
      return false;
    }
    
    int count = 0;
    
    // 是否包含小写字母
    if (RegExp(r'[a-z]').hasMatch(password)) count++;
    
    // 是否包含大写字母
    if (RegExp(r'[A-Z]').hasMatch(password)) count++;
    
    // 是否包含数字
    if (RegExp(r'[0-9]').hasMatch(password)) count++;
    
    // 是否包含特殊字符
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) count++;
    
    return count >= 3;
  }
  
  /// 密码验证错误提示
  static String getPasswordErrorText(String password) {
    if (password.isEmpty) {
      return '密码不能为空';
    } else if (password.length < 6 || password.length > 18) {
      return '密码长度需在 6-18 位之间';
    } else if (!RegExp(r'^(?=.*[A-Za-z0-9]).+$').hasMatch(password)) {
      return '密码必须包含字母或数字';
    }
    return '';
  }
  
  /// ============================================
  /// 邮箱验证
  /// ============================================
  /// 验证邮箱格式
  static bool validateEmail(String email) {
    RegExp regExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return regExp.hasMatch(email);
  }
  
  /// 邮箱验证错误提示
  static String getEmailErrorText(String email) {
    if (email.isEmpty) {
      return '邮箱不能为空';
    } else if (!validateEmail(email)) {
      return '请输入正确的邮箱格式';
    }
    return '';
  }
  
  /// ============================================
  /// 身份证号验证
  /// ============================================
  /// 验证中国大陆身份证号（18 位）
  static bool validateIdCard(String idCard) {
    if (idCard.length != 18) {
      return false;
    }
    
    // 前 17 位必须是数字
    RegExp regExp = RegExp(r'^\d{17}[0-9Xx]$');
    if (!regExp.hasMatch(idCard)) {
      return false;
    }
    
    // TODO: 可以添加更复杂的校验逻辑（校验码验证）
    return true;
  }
  
  /// ============================================
  /// 验证码验证
  /// ============================================
  /// 验证短信验证码（6 位数字）
  static bool validateVerificationCode(String code) {
    RegExp regExp = RegExp(r'^\d{6}$');
    return regExp.hasMatch(code);
  }
  
  /// ============================================
  /// 姓名验证
  /// ============================================
  /// 验证中文姓名（2-10 个汉字）
  static bool validateChineseName(String name) {
    if (name.length < 2 || name.length > 10) {
      return false;
    }
    RegExp regExp = RegExp(r'^[\u4e00-\u9fa5]+$');
    return regExp.hasMatch(name);
  }
  
  /// ============================================
  /// URL 验证
  /// ============================================
  static bool validateUrl(String url) {
    RegExp regExp = RegExp(
      r'^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$',
    );
    return regExp.hasMatch(url);
  }
  
  /// ============================================
  /// 银行卡号验证（Luhn 算法）
  /// ============================================
  static bool validateBankCard(String cardNumber) {
    // 去除空格
    String number = cardNumber.replaceAll(' ', '');
    
    // 检查是否为纯数字
    if (!RegExp(r'^\d+$').hasMatch(number)) {
      return false;
    }
    
    // Luhn 算法验证
    int sum = 0;
    bool isEven = false;
    
    for (int i = number.length - 1; i >= 0; i--) {
      int digit = int.parse(number[i]);
      
      if (isEven) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }
      
      sum += digit;
      isEven = !isEven;
    }
    
    return sum % 10 == 0;
  }
  
  /// ============================================
  /// 非空验证
  /// ============================================
  static bool validateNotEmpty(String? value) {
    return value != null && value.trim().isNotEmpty;
  }
  
  /// 最小长度验证
  static bool validateMinLength(String value, int minLength) {
    return value.trim().length >= minLength;
  }
  
  /// 最大长度验证
  static bool validateMaxLength(String value, int maxLength) {
    return value.trim().length <= maxLength;
  }
}
