import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * .4,
          height: 50,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
        )
      ],
    );
  }
}
