import 'package:flutter/material.dart';
import 'package:hotel_app/core/consts.dart';

class PassWithConfrim extends StatefulWidget {
  final TextEditingController mycontoller;
  const PassWithConfrim({super.key, required this.mycontoller});

  @override
  State<PassWithConfrim> createState() => _PassWithConfrimState();
}

class _PassWithConfrimState extends State<PassWithConfrim> {
  String? password;
  late bool passwordVisible1;
  late bool passwordVisible2;
  @override
  void initState() {
    super.initState();
    passwordVisible1 = false;
    passwordVisible2 = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        TextFormField(
          keyboardType: TextInputType.visiblePassword,
          controller: widget.mycontoller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSaved: (newValue) {
            password = newValue;
          },
          validator: (value) {
            if (value!.isEmpty || value.length <= 7) {
              return 'password must be at least 8 characters';
            }
            return null;
          },
          obscureText: !passwordVisible1,
          decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.password,
                color: myorange,
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordVisible1 = !passwordVisible1;
                    });
                  },
                  icon: passwordVisible1
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
                  borderRadius: BorderRadius.circular(30))),
        ),
        const Text(
          'Confrim Password',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        TextFormField(
          keyboardType: TextInputType.visiblePassword,
          validator: (value) {
            if (password != value) {
              return 'Password mismatch';
            }
            return null;
          },
          obscureText: !passwordVisible2,
          decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.password,
                color: myorange,
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordVisible2 = !passwordVisible2;
                    });
                  },
                  icon: passwordVisible2
                      ? const Icon(Icons.visibility, color: myorange)
                      : const Icon(
                          Icons.visibility_off,
                        )),
              hintText: 'Re-enter your password',
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
        )
      ],
    );
  }
}
