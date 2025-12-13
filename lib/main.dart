import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/success_page.dart';
import 'utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telegram 风格登录',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // 设置 Telegram 蓝色主题
        primaryColor: AppColors.telegramBlue,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.telegramBlue,
          primary: AppColors.telegramBlue,
        ),
        scaffoldBackgroundColor: AppColors.white,
        
        // 配置 AppBar 主题
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.black),
          titleTextStyle: TextStyle(
            color: AppColors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        
        // 配置输入框主题
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
            borderSide: const BorderSide(color: AppColors.inputBorder),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
            borderSide: const BorderSide(color: AppColors.inputBorder),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
            borderSide: const BorderSide(
              color: AppColors.inputFocusBorder,
              width: 2,
            ),
          ),
          filled: true,
          fillColor: AppColors.inputBackground,
        ),
        
        // 配置按钮主题
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.telegramBlue,
            foregroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
            ),
            elevation: 0,
          ),
        ),
        
        // 配置文本按钮主题
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.telegramBlue,
          ),
        ),
        
        // 配置字体
        fontFamily: 'SF Pro Display',
        textTheme: const TextTheme(
          displayLarge: AppTextStyles.headline1,
          displayMedium: AppTextStyles.headline2,
          bodyLarge: AppTextStyles.bodyText,
        ),
      ),
      
      // 设置初始路由为登录页面
      initialRoute: '/login',
      
      // 配置命名路由
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
      },
      
      // 处理带参数的路由
      onGenerateRoute: (settings) {
        if (settings.name == '/success') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => SuccessPage(
              type: args['type'] as String,
              username: args['username'] as String,
            ),
          );
        }
        return null;
      },
    );
  }
}
