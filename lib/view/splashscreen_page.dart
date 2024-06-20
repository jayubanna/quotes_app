import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(
      Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, "home_page");
    },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff060A13),
      body: Center(
        child: Image.network("https://cdna.artstation.com/p/assets/images/images/011/894/994/large/jerry-ubah-logo3.jpg?1531974609",height: 200,),
      ),
    );
  }
}