import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sheepmanager/Core/Utils/router.dart';

void main() {
  runApp(const SheepApp());
}

class SheepApp extends StatelessWidget {
  const SheepApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.routes,
      theme: ThemeData(
        textTheme: GoogleFonts.armataTextTheme(
          ThemeData.light().textTheme,
        ),
      ),
    );
  }
}
