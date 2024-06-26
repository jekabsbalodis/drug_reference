import 'package:drug_reference/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromRGBO(229, 114, 0, 1),
    brightness: Brightness.light,
  ),
  textTheme: GoogleFonts.openSansTextTheme(),
);
final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromRGBO(139, 70, 0, 1),
    brightness: Brightness.dark,
  ),
  textTheme: GoogleFonts.openSansTextTheme(),
);

const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
const supabaseKey = String.fromEnvironment('SUPABASE_KEY');

Future<void> main() async {
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  static final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medikamentu pārbaude',
      theme: theme,
      darkTheme: darkTheme,
      locale: const Locale('lv', 'LV'),
      home: const Welcome(),
    );
  }
}
