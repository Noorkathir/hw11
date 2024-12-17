import 'package:day11/pages/list_page.dart';
import 'package:day11/pages/login_page.dart';
import 'package:day11/pages/signup_page.dart';
import 'package:day11/pages/welcome_page';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
 await Supabase.initialize(
    url: "https://hjudafzzjvguvhrwvxfv.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhqdWRhZnp6anZndXZocnd2eGZ2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQzNTc0NTcsImV4cCI6MjA0OTkzMzQ1N30.fC0pDRAN0RdVB0YH8NRtGomEWyAMBEo-lkFDAbAoU_g",
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WelcomePage()
    );
  }
}

