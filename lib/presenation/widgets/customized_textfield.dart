import 'package:flutter/material.dart';

import '../styles/color.dart';

class CustomizedTextField extends StatelessWidget {
  final String hintTextData;
  const CustomizedTextField({super.key, required this.hintTextData});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height / 28.5,
      width: width / 14,
      child: TextField(
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          suffixIconColor: teal,
          focusColor: teal,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: teal, width: 2.0),
            borderRadius: BorderRadius.circular(24.0),
          ),
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          hintText: hintTextData,
          hintStyle: const TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
