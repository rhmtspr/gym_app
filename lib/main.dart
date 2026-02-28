import 'package:flutter/material.dart';
import 'package:gym_app/screens/main/main_screen.dart';
import 'package:gym_app/provider/main/index_nav_provider.dart';
import 'package:gym_app/static/navigation_route.dart';
import 'package:gym_app/style/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => IndexNavProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gym App',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      initialRoute: NavigationRoute.mainRoute.name,
      routes: {NavigationRoute.mainRoute.name: (context) => const MainScreen()},
    );
  }
}
