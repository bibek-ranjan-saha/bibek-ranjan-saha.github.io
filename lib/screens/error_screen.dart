import 'package:Bibek/assets/animations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:routemaster/routemaster.dart';

import '../constants/values.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorConstants.blue,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: size.shortestSide * 0.8,
              width: size.shortestSide * 0.8,
              child: Lottie.asset(AppAnimationAssets.k404Error),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  surfaceTintColor: Colors.black,
                  backgroundColor: Colors.blue.shade700),
              onPressed: () {
                Routemaster.of(context).push('/');
              },
              child: const Text(
                "go to HomeScreen →",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
