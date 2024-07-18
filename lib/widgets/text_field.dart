import 'package:flutter/material.dart';

TextFormField customTextField(
    {required TextEditingController controller,
      required String label,
      bool obscureText = false}) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.black45),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blue, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      fillColor: Colors.white,
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your name';
      }
      return null;
    },
  );
}