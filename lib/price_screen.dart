import 'package:bitcoin_ticker/ui/coin_value_list_item.dart';
import 'package:bitcoin_ticker/ui/main_body.dart';
import 'package:bitcoin_ticker/ui/nav_bar.dart';
import 'package:bitcoin_ticker/ui/valuta_picker.dart';
import 'package:bitcoin_ticker/utilities/coin_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'utilities/coin_data.dart';
import 'utilities/constants.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = "AUD";
  List<CoinModel> cryptoCoins = [];
  bool cryptosLoading = true;

  @override
  void initState() {
    // initial static data to display loading UI
    cryptoCoins = staticCryptoList;
    updateCoinData();
    super.initState();
  }

  void updateCoinData() async {
    CoinData coinData = CoinData();
    await coinData.buildCryptoDataList(currency: selectedCurrency);
    setState(() {
      cryptoCoins = coinData.getCryptoList();
      cryptosLoading = false;
    });
  }

  void onValutaChanged(currency) async {
    // Update Currency
    setState(() {
      cryptosLoading = true;
      selectedCurrency = currency;
    });

    // Update CoinData
    updateCoinData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NavBar(),
          Expanded(
            child: Stack(
              children: [
                MainBody(
                  loading: cryptosLoading,
                  child: Container(
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 33.0, bottom: 120.0),
                      itemCount: cryptoCoins.length,
                      itemBuilder: (context, index) {
                        CoinModel coin = cryptoCoins[index];
                        return CoinValueListItem(
                          coin: coin.coin,
                          currency: selectedCurrency,
                          gradient: coin.gradient,
                          svg: SvgPicture.asset(
                            coin.svg,
                            alignment: Alignment.centerLeft,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 120,
                  child: ValutaPicker(onChanged: onValutaChanged),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
