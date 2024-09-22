import 'package:flutter/material.dart';
import 'package:hotel_app/core/consts.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController mycontoller;
  const PasswordField({super.key, required this.mycontoller});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  late bool passwordVisible;
  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: TextInputType.visiblePassword,
        controller: widget.mycontoller,
        validator: (value) {
          if (value!.isEmpty || value.length <= 7) {
            return 'password must be at least 8 characters';
          }
          return null;
        },
        obscureText: !passwordVisible,
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.password,
              color: myorange,
            ),
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
                icon: passwordVisible
                    ? const Icon(Icons.visibility, color: myorange)
                    : const Icon(Icons.visibility_off)),
            hintText: 'Password',
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
                borderRadius: BorderRadius.circular(30))));
  }
}
