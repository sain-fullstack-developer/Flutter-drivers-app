import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ola_drivers_app/loginScreen/login_screen.dart';
import 'package:ola_drivers_app/mainScreen/main_screen.dart';
import 'package:ola_drivers_app/registerScreen/register_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  setTimer() {
    Timer(const Duration(seconds: 2), () async {
      Navigator.push(
          context, MaterialPageRoute(builder: (e) => const RegisterScreen()));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'https://res.cloudinary.com/dlzukac2w/image/upload/v1693334110/logo1_mnbgda.png'),
            SizedBox(height: 10),
            const Text(
              'Welcome to Drivers App',
              style: TextStyle(
                  color: Colors.white70, decoration: TextDecoration.none),
            )
          ],
        ));
  }
}
