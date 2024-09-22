// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hotel_app/core/consts.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.isEmpty || value.length <= 2) {
          return 'username must be at least 3 characters';
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: 'Enter your username',
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
