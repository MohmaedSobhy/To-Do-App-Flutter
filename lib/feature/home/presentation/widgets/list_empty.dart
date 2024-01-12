import 'package:flutter/material.dart';

class CustomeEmptyList extends StatelessWidget {
  final String message;
  final IconData iconData;

  const CustomeEmptyList(
      {super.key, required this.message, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        Icon(
          iconData,
          size: 30,
        ),
        Text(
          message,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
