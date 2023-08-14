import 'package:flutter/material.dart';
import 'package:lesson36/screens/registration_screen.dart';

import '../helpers/custom_button.dart';

class ChooseScreen extends StatelessWidget {
  const ChooseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 37,
            right: 37,
            bottom: 62,
          ),
          child: Column(
            children: [
              Spacer(),
              Text(
                "I am",
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 36),
              CustomButton(
                title: "Man",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistrationScreen(isMan: true),
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              CustomButton(
                title: "Woman",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistrationScreen(isMan: false),
                    ),
                  );
                },
              ),
              Spacer(),
              RichText(
                text: TextSpan(
                  text: "Already have account? ",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "Log in",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
