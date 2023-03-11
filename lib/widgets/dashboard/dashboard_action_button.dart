import 'package:flutter/material.dart';

class DashboardActionButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color iconColor;
  final IconData icon;
  final void Function() onPressed;

  const DashboardActionButton({
    Key? key,
    required this.title,
    required this.backgroundColor,
    required this.iconColor,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: const CircleBorder(), //<-- SEE HERE
            padding: const EdgeInsets.all(15),
          ),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
