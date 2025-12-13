import 'package:flutter/material.dart';
import '../utils/constants.dart';

class SuccessPage extends StatelessWidget {
  final String type; // "login" 或 "register"
  final String username;

  const SuccessPage({
    super.key,
    required this.type,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    final isLogin = type == 'login';
    final title = isLogin ? '登录成功' : '注册成功';
    final message = isLogin ? '恭喜您登录成功！' : '恭喜您注册成功！';

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.paddingLarge),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 成功图标
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: AppColors.successGreen.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_circle,
                    size: 60,
                    color: AppColors.successGreen,
                  ),
                ),
                const SizedBox(height: 32),
                
                // 成功标题
                Text(
                  title,
                  style: AppTextStyles.headline1.copyWith(
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 16),
                
                // 成功消息
                Text(
                  message,
                  style: AppTextStyles.bodyText.copyWith(
                    color: AppColors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                
                // 用户名
                Text(
                  '欢迎，$username',
                  style: AppTextStyles.bodyText.copyWith(
                    color: AppColors.telegramBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 48),
                
                // 返回按钮（可选）
                if (!isLogin)
                  SizedBox(
                    width: double.infinity,
                    height: AppDimensions.buttonHeight,
                    child: ElevatedButton(
                      onPressed: () {
                        // 返回到登录页面
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          '/login',
                          (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.telegramBlue,
                        foregroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppDimensions.borderRadius,
                          ),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        '前往登录',
                        style: AppTextStyles.buttonText,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

