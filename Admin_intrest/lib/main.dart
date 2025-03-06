import 'package:flutter/material.dart';
import 'package:intrest/Screens/A_mainscreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intrest/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase (without .env)
  try {
    await Supabase.initialize(
      url: 'https://kittmqkvgvmsjnyzmvxq.supabase.co', // Your Supabase URL
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtpdHRtcWt2Z3Ztc2pueXptdnhxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDEyMzA2MzksImV4cCI6MjA1NjgwNjYzOX0.SojuZ9NBkD1G_1FLWlbTSLKQsJp55DG_pdtHo6MigRs', // Your Supabase Anon Key
    );
    debugPrint('✅ Supabase initialized successfully');
  } catch (e) {
    debugPrint('❌ Supabase initialization failed: $e');
  }

  runApp(const MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Splashscreen(),
        '/admin_dashboard': (context) => const A_mainscreen(),
      },
    );
  }
}
