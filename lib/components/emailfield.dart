import 'package:flutter/material.dart';
import 'package:hotel_app/core/consts.dart';

class EmailField extends StatelessWidget {
  final TextEditingController mycontoller;
  const EmailField({super.key, required this.mycontoller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: mycontoller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (val) =>
          val!.isEmpty || !val.contains("@gmail.com") || val.length <= 10
              ? "enter a valid email"
              : null,
      decoration: InputDecoration(
          hintText: 'Enter your email',
          hintStyle: const TextStyle(fontWeight: FontWeight.w400),
          filled: true,
          fillColor: const Color.fromARGB(255, 234, 234, 234),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: myorange),
              borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: myorange),
              borderRadius: BorderRadius.circular(30)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: myorange),
              borderRadius: BorderRadius.circular(30)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: myorange),
              borderRadius: BorderRadius.circular(30))),
    );
  }
}
