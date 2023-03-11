import 'package:flutter/material.dart';
import 'package:masr_pay/screens/topup_screen.dart';
import 'package:masr_pay/widgets/dashboard/dashboard_action_button.dart';

class DashboardActions extends StatelessWidget {
  const DashboardActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DashboardActionButton(
              title: 'Topup',
              backgroundColor: const Color(0xFFF1F9F6),
              iconColor: const Color(0xFF5BB34C),
              icon: Icons.add,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TopupScreen(),
                ),
              ),
            ),
            DashboardActionButton(
              title: 'Cashout',
              backgroundColor: const Color(0xFFFBEAEA),
              iconColor: const Color(0xFFE97453),
              icon: Icons.remove,
              onPressed: () {},
            ),
            DashboardActionButton(
              title: 'Transfer',
              backgroundColor: const Color(0xFFF0FCFD),
              iconColor: const Color(0xFF2D6BE8),
              icon: Icons.wallet,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
