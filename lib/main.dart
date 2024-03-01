import 'package:flutter/material.dart';
import 'package:outerspace2/pages/login_or_register_page.dart';
import 'package:provider/provider.dart';
import 'classes/catalog_provider.dart';
import 'classes/user_coins.dart';

//import 'package:outerspace2/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CatalogProvider()),
        ChangeNotifierProvider(create: (context) => UserCoins()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginOrRegisterPage(),
    );
  }
}
