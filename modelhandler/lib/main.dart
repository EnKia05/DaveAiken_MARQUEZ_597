import 'package:flutter/material.dart';
import 'package:modelhandler/screen/chat_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://kaivyjnquxtevppbtuwa.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImthaXZ5am5xdXh0ZXZwcGJ0dXdhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE4Nzc5OTksImV4cCI6MjA4NzQ1Mzk5OX0.cY73HcjszLlc6uTGUrBqv7FST2ceC25HMfL8ZMK7mFs',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ChatPage(username: 'Dave Aiken P. Marquez'),
      debugShowCheckedModeBanner: false,
    );
  }
}
