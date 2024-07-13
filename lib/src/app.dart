import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = ThemeData(
      useMaterial3: true,

      // Paleta de colores principal
      primaryColor: const Color(0xFF8EC90B),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF8EC90B),
        primary: const Color(0xFF8EC90B),
        secondary: const Color(0xFFBAD620),
        tertiary: const Color(0xFFBAD620),
      ),

      // Colores de fondo
      scaffoldBackgroundColor:
          const Color(0xFFCAA8F5),
      canvasColor: Colors.white,

      // Tipografía
      fontFamily: 'Inria Sans', // O elige una fuente que se adapte a tu marca

      // Estilos de botones
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF8EC90B), 
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 18),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(12)), // Bordes más redondeados
          elevation: 4, // Sombra más pronunciada
        ),
      ),

      /*// Estilos de input
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF86469C)),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFBC7FCD), width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        labelStyle:
            const TextStyle(color: Color(0xFF666666)), // Etiqueta gris oscuro
        hintStyle:
            const TextStyle(color: Color(0xFF999999)), // Placeholder gris claro
      ),

      // Tipografía y colores de texto (mejorados)
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Color(0xFF86469C), // Morado oscuro para títulos principales
        ),
        headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Color(0xFF86469C), // Morado oscuro para títulos secundarios
        ),
        bodyLarge: TextStyle(
          // Reemplazo de bodyText1
          fontSize: 16,
          color: Color(0xFF333333), // Negro para texto principal
        ),
        bodyMedium: TextStyle(
          // Reemplazo de bodyText2
          fontSize: 14,
          color: Color(0xFF666666), // Gris oscuro para texto secundario
        ),
        labelSmall: TextStyle(
          // Reemplazo de caption
          fontSize: 12,
          color: Color(0xFF999999), // Gris claro para texto pequeño
        ),
      ),

      // Otros estilos
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF86469C),
        foregroundColor:
            Colors.white, // Color del texto y los iconos de la AppBar
        elevation: 0, // Sin sombra en la AppBar
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF86469C),
        unselectedItemColor: Colors.grey[600],
      ),*/
    );

    return MaterialApp(
      title: 'APPHP',
      theme: appTheme,
      routes: {
        '/': (context) => const Row(),
      },
    );
  }
}