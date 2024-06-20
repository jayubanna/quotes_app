import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/provider/home_provider.dart';
import 'package:quotes_app/view/home_page.dart';
import 'package:quotes_app/view/likequotes_page.dart';
import 'package:quotes_app/view/splashscreen_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuotesProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/":(context) => SplashScreen(),
          "home_page": (context) => HomePage(),
          "LikeQuotes_page": (context) => LikeQuotes(),
        },
      ),
    );
  }
}