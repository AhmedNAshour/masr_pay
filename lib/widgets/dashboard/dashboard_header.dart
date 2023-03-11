import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Hi, Ahmed',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              'Welcome back',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: const CircleBorder(), //<-- SEE HERE
            padding: const EdgeInsets.all(10),
          ),
          onPressed: () {},
          child: const Icon(
            Icons.notifications,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
