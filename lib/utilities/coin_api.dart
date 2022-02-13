import 'dart:convert';

import 'package:http/http.dart';

class CoinDataApi {
  final String apiKey = '?apiKey=C30F7A57-C04E-45C7-B274-5262AF11319B';
  final String apiUrl = 'https://rest.coinapi.io/v1/exchangerate';

  Future<String> getExchange(String coin, String currency) async {
    try {
      Response response =
          await get(Uri.parse('$apiUrl/$coin/$currency$apiKey'));

      return jsonDecode(response.body)['rate'].toStringAsFixed(3);
    } catch (e) {
      return e;
    }
  }
}
