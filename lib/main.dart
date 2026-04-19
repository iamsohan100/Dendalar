import 'package:dendalar/core/constants/app_theme.dart';
import 'package:dendalar/core/constants/init_dependency_binding.dart';
import 'package:dendalar/routes/app_pages.dart';
import 'package:dendalar/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const Dendalar());
}

class Dendalar extends StatelessWidget {
  const Dendalar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dendalar',
      initialRoute: AppRoutes.splashPage,
      getPages: AppPages.routes,
      theme: AppTheme.lightTheme,
      initialBinding: InitDependencyBinding(),
    );
  }
}
