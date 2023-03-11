import 'package:flutter/material.dart';
import 'package:masr_pay/constants.dart';

class DashboardInfoCard extends StatelessWidget {
  const DashboardInfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            height: height * 0.18,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Masr Pay',
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  '0 E£',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Account no.',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '#' ' user_0fsfsfsf',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.bottomCenter,
          width: width * 0.22,
          height: height * 0.18,
          decoration: const BoxDecoration(
            color: Colors.lightGreen,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: const CircleBorder(), //<-- SEE HERE
                  padding: const EdgeInsets.all(10),
                ),
                onPressed: () {},
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Active',
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
