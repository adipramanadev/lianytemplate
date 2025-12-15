import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/constants/app_constants.dart';
import 'screens/layout/admin_layout.dart';

void main() {
  runApp(const LianyAdminApp());
}

class LianyAdminApp extends StatelessWidget {
  const LianyAdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const AdminLayout(),
    );
  }
}
