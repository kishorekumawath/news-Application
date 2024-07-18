import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:news_application/provides/auth_provider.dart';
import 'package:news_application/provides/news_provider.dart';
import 'package:news_application/screens/home_screen.dart';
import 'package:news_application/screens/sign_in%20_screen.dart';
import 'package:news_application/screens/sign_up_screen.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => NewsProvider()),
      ],
      child: MaterialApp(
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SignInScreen(),
          '/signUp': (context) => SignUpScreen(),
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}