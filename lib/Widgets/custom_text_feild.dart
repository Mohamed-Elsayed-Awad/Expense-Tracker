import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    required this.controller,
    required this.onSubmitted,
    required this.text,
  });
  final String text;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: TextStyle(color: Colors.black),
      ),
      onSubmitted: onSubmitted,
    );
  }
}
