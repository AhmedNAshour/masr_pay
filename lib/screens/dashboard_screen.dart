import 'package:flutter/material.dart';
import 'package:masr_pay/constants.dart';
import 'package:masr_pay/widgets/dashboard/dashboard_actions.dart';
import 'package:masr_pay/widgets/dashboard/dashboard_header.dart';
import 'package:masr_pay/widgets/dashboard/dashboard_info_card.dart';
import 'package:masr_pay/widgets/dashboard/dashboard_transactions.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              color: Colors.white,
              alignment: Alignment.bottomCenter,
              height: height * 0.6,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Header(),
                  const SizedBox(height: 20),
                  const DashboardInfoCard(),
                  const SizedBox(height: 40),
                  const DashboardActions(),
                  const SizedBox(height: 40),
                  Transactions(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
