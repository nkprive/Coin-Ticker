import 'coin_api.dart';
import 'coin_model.dart';
import 'constants.dart';

CoinDataApi coinDataApi = CoinDataApi();

class CoinData {
  List<CoinModel> _cryptoList = [];

  // Build the to date crypto currency list with up to date Exchange Rates.
  /* Used the staticCryptoList as a template */
  buildCryptoDataList({currency}) async {
    for (CoinModel cryptoCoin in staticCryptoList) {
      var exchangeRate =
          await coinDataApi.getExchange(cryptoCoin.coin, currency);

      _cryptoList.add(
        CoinModel(
          coin: cryptoCoin.coin,
          svg: cryptoCoin.svg,
          gradient: cryptoCoin.gradient,
          exchange: double.parse(exchangeRate),
        ),
      );
    }

    // Simulate a delay
    await Future.delayed(Duration(seconds: 3), () {});
  }

  // Clear crypto data list, (the UI checks for an empty list and applies Loading UX behavior accordingly)
  // So we clear the list before rebuilding.
  clearCryptoDataList() {
    _cryptoList.clear();
  }

  getCryptoList() {
    return _cryptoList;
  }
}
