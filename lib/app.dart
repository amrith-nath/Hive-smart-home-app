import 'package:flutter/material.dart';
import 'package:hive/config/routes/routes.dart';
import 'package:hive/config/routes/routes_name.dart';

class HiveApp extends StatelessWidget {
  const HiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RouteName.splash,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
