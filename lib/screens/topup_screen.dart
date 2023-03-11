import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masr_pay/services/topup_service.dart';
import 'package:masr_pay/widgets/topup/topup_form.dart';
import 'package:masr_pay/widgets/topup/topup_info_card.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TopupScreen extends StatelessWidget {
  const TopupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var errorText = '';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Topup'),
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const TopupInfoCard(),
            const SizedBox(height: 10),
            TopupForm(
              onSubmit: (String value) async {
                await handleResponse(context,
                    await TopupService.topup(int.parse(value).toDouble()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> handleResponse(BuildContext context, dynamic response) async {
  if (response.statusCode == 200) {
    // If the response code is 200, navigate to the WebView
    final responseData = jsonDecode(response.body);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Successful'),
        content: Text(responseData['data']['topupWalletUser']['iframeUrl']),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  } else {
    // If the response code is not 200, display an AlertDialog
    final responseData = jsonDecode(response.body);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Error'),
        content: Text(responseData['errors']['message']),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
