import 'dart:convert';
import 'package:http/http.dart' as http;

class TopupService {
  static String apiHeader = 'H_0003rjebneemerch';
  static String apiKey = 'k_0003ijn4neemerch';
  static String baseUrl = 'https://sword.beta.healthpay.tech/graphql';
  static String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IkhfMDAwM3JqZWJuZWVtZXJjaCIsInN1YiI6Im1lcmNoYW50XzA0M2s4ODg4IiwiaWF0IjoxNjc4MzU4MzEzLCJleHAiOjE3MDk5MTU5MTN9.Osf9zqjNnWExsShi_yfl6fhPZCfBTFXyEeDCJGXkW00';
  static String userToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6MjYxNSwic3ViIjoxNCwiaXNQcm92aWRlciI6dHJ1ZSwiaWF0IjoxNjc4NTI2MzkzLCJleHAiOjE3MTAwODM5OTN9.nv75h_I2B2a8yOQvuGyoAo3JnLpaOWoup3_LfVDsPks';

  static Future<dynamic> topup(double amount) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'api-header': apiHeader
    };

    final body = jsonEncode({
      'query':
          'mutation topupWalletUser(\$userToken: String!, \$amount: Float!) { topupWalletUser(userToken: \$userToken, amount: \$amount) { iframeUrl } }',
      'variables': {'userToken': userToken, 'amount': amount},
    });

    final response =
        await http.post(Uri.parse(baseUrl), headers: headers, body: body);

    return response;
  }
}
