import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'homepage.dart';
import 'login_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   appBarTheme: AppBarTheme(backgroundColor: Colors.teal.shade400),
      //   colorScheme: ColorScheme.dark(
      //     primary: Colors.teal.shade400,
      //     onPrimary: Colors.white,
      //   ),
      // ),
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal,
        ).copyWith(secondary: Colors.tealAccent),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong!'));
          } else if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const LoginWidget();
          }
        },
      ),
    );
  }
}
