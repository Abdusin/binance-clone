import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TradeScreenController extends GetxController {
  bool isBuyMode = true;
  int activePercent = 0;

  var priceController = TextEditingController();
  var priceFocusNode = FocusNode();
  num get price => num.tryParse(priceController.text.trim()) ?? 0;

  var amountController = TextEditingController();
  var amountFocusNode = FocusNode();
  num get amount => num.tryParse(amountController.text.trim()) ?? 0;

  void onPriceIncrementClick() {
    priceController.text = (price + 1).toString();
    update();
  }

  void onPriceDecrementClick() {
    priceController.text = (price - 1).toString();
    update();
  }

  void onAmounIncrementClick() {
    amountController.text = (amount + 1).toString();
    update();
  }

  void onAmountDecrementClick() {
    amountController.text = (amount - 1).toString();
    update();
  }

  void onPercentChange(int perct) {
    activePercent = perct;
    update();
  }

  void setBuyMode(bool isBuyMode) {
    this.isBuyMode = isBuyMode;
    update();
  }
}
