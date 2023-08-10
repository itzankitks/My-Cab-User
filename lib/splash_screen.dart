// ignore_for_file: use_build_context_synchronously
import "dart:async";
import "package:flutter/material.dart";
import "global/global.dart";
import "package:uber_user_clone/main_screen.dart";

class MySpalshScreen extends StatefulWidget {
  const MySpalshScreen({super.key});

  @override
  State<MySpalshScreen> createState() => _MySpalshScreenState();
}

class _MySpalshScreenState extends State<MySpalshScreen> {
  startTimer() {
    Timer(const Duration(seconds: 3), () async {
      if (await fAuth.currentUser != null) {
        currentFirebaseUser = fAuth.currentUser;
        // Send User to MainScreen if loggedin already
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MainScreen(),
          ),
        );
      } else {
        // Send User to SignUp Screen if not login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MainScreen(),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/splashLogo.jpeg"),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Uber Clone App",
              style: TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.normal,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
