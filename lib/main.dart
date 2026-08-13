import 'package:flutter/material.dart';

import 'screens/dashboard_screen.dart';

void main() {
 runApp(const VerdeSmartApp());
}

class VerdeSmartApp extends StatelessWidget {
 const VerdeSmartApp({super.key});

 @override
 Widget build(BuildContext context) {
 return MaterialApp(
 debugShowCheckedModeBanner: false,
 title: 'VerdeSmart',
 theme: ThemeData(
 colorScheme: ColorScheme.fromSeed(
 seedColor: const Color(0xFF2E7D32),
 ),
 useMaterial3: true,
 ),
 home: const DashboardScreen(),
 );
 }
}
