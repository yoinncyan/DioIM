import 'package:flutter/material.dart';

// API 配置
class ApiConstants {
  static const String baseUrl = 'http://185.241.40.126:8082';
  static const String loginEndpoint = '/user/findUser';
  static const String registerEndpoint = '/user/create';
}

// 颜色常量
class AppColors {
  // Telegram 蓝色主题
  static const Color telegramBlue = Color(0xFF0088CC);
  static const Color lightBlue = Color(0xFF5DB3E5);
  static const Color darkBlue = Color(0xFF006699);
  
  // 通用颜色
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFF8E8E93);
  static const Color lightGrey = Color(0xFFF2F2F7);
  static const Color darkGrey = Color(0xFF3A3A3C);
  static const Color successGreen = Color(0xFF34C759);
  static const Color errorRed = Color(0xFFFF3B30);
  
  // 输入框颜色
  static const Color inputBackground = Color(0xFFFFFFFF);
  static const Color inputBorder = Color(0xFFE5E5EA);
  static const Color inputFocusBorder = Color(0xFF0088CC);
}

// 文本样式
class AppTextStyles {
  static const TextStyle headline1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );
  
  static const TextStyle headline2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );
  
  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
  );
  
  static const TextStyle buttonText = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  
  static const TextStyle linkText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.telegramBlue,
  );
  
  static const TextStyle hintText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.grey,
  );
}

// 尺寸常量
class AppDimensions {
  static const double borderRadius = 12.0;
  static const double buttonHeight = 50.0;
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double inputHeight = 50.0;
}

