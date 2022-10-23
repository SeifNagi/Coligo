import 'package:flutter/material.dart';

class CustomizedButton extends StatelessWidget {
  final String buttonText;
  final Function navigationPath;
  const CustomizedButton(
      {super.key, required this.buttonText, required this.navigationPath});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        navigationPath();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 68, 179, 167))),
      child: Text(buttonText),
    );
  }
}
