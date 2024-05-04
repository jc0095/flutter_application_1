import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/widgets.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 30, 135, 161),
      width: double.infinity,
      height: double.infinity,
      child: Stack(children: [
        AuthBackgorundC1(),
        SafeArea(
            child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 30),
          child: const Icon(
            Icons.person_pin_circle_rounded,
            color: Color.fromARGB(255, 7, 3, 1),
            size: 100,
          ),
        )),
        child,
      ]),
    );
  }
}
