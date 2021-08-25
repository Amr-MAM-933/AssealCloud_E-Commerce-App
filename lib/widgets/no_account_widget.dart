import 'package:asseal_cloud/theme.dart';
import 'package:flutter/material.dart';
import '/screens/signup/signup_screen.dart';

class NoAccountWidget extends StatelessWidget {
  const NoAccountWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account? "),
        TextButton(
          child: Text(
            "Sign Up",
            style: TextStyle(color: theme.primaryColor),
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              SignUpScreen.screenId,
            );
          },
        ),
      ],
    );
  }
}
