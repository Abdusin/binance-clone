import 'package:binance_clone/Models/OfferModel.dart';
import 'package:binance_clone/controllers/TradesScreenController.dart';
import 'package:binance_clone/utils/AppSpaces.dart';
import 'package:binance_clone/utils/Colors.dart';
import 'package:binance_clone/widgets/ButtonWidgets.dart';
import 'package:binance_clone/widgets/FormWidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TradesScreen extends StatelessWidget {
  const TradesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TradeScreenController>(
        init: TradeScreenController(),
        builder: (controller) {
          return GestureDetector(
            onTap: () {
              controller.priceFocusNode.unfocus();
              controller.amountFocusNode.unfocus();
            },
            child: Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.borderColor, width: 1.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      width: Get.width,
                      height: 40.0,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          const TabButton(text: 'Convert'),
                          const TabButton(text: 'Spot', isSelected: true),
                          const TabButton(text: 'Margin'),
                          const TabButton(text: 'Fiat'),
                          const TabButton(text: 'P2P'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.sync_alt,
                            size: 20,
                          ),
                          AppSpaces.horizontal10,
                          const Text(
                            'BTC/USDT',
                            style: const TextStyle(fontSize: 20.0),
                          ),
                          AppSpaces.horizontal20,
                          const Text(
                            '-2.81%',
                            style: const TextStyle(fontSize: 13.0, color: AppColors.redColor),
                          ),
                          Spacer(),
                          const Icon(Icons.graphic_eq, size: 19, color: AppColors.greyTextColor),
                          AppSpaces.horizontal10,
                          Container(
                            padding: const EdgeInsets.all(1.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.greyTextColor, width: 1.0),
                            ),
                            child: const Center(
                              child: const Icon(Icons.attach_money, size: 17, color: AppColors.greyTextColor),
                            ),
                          ),
                          AppSpaces.horizontal10,
                          const Icon(
                            Icons.more_horiz,
                            size: 19,
                            color: AppColors.greyTextColor,
                          ),
                          AppSpaces.horizontal10,
                        ],
                      ),
                    ),
                    AppSpaces.vertical10,
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: const Radius.circular(30.0),
                            topRight: const Radius.circular(30.0),
                          ),
                          color: AppColors.darkColor,
                        ),
                        child: ListView(
                          children: [
                            AppSpaces.vertical20,
                            Container(
                              height: 320.0,
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 28,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        BuySellTabButton(
                                          isBuyMode: controller.isBuyMode,
                                          onBuyTap: () => controller.setBuyMode(true),
                                          onSellTap: () => controller.setBuyMode(false),
                                        ),
                                        const FormDropdown(
                                          prefix: const Icon(
                                            Icons.info_outline,
                                            size: 20,
                                            color: AppColors.greyTextColor,
                                          ),
                                          title: 'Limit',
                                        ),
                                        AppFormIncredableField(
                                          placeHolder: 'Price (USDT)',
                                          controller: controller.priceController,
                                          focusNode: controller.priceFocusNode,
                                          onDecrement: controller.onPriceDecrementClick,
                                          onIncrement: controller.onPriceIncrementClick,
                                        ),
                                        AppFormIncredableField(
                                          controller: controller.amountController,
                                          focusNode: controller.amountFocusNode,
                                          placeHolder: 'Amount (BTC)',
                                          onDecrement: controller.onAmountDecrementClick,
                                          onIncrement: controller.onAmounIncrementClick,
                                        ),
                                        FormPercentSlider(
                                            selectedColor:
                                                controller.isBuyMode ? AppColors.greenColor : AppColors.redColor,
                                            onChange: controller.onPercentChange,
                                            activePercent: controller.activePercent),
                                        AppFormField(
                                          controller: TextEditingController(),
                                          placeHolder: 'Total (USDT)',
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Avbl',
                                              style: const TextStyle(color: AppColors.greyTextColor, fontSize: 12),
                                            ),
                                            Spacer(),
                                            const Text(
                                              '0.00 USDT',
                                              style: const TextStyle(color: Colors.white, fontSize: 12),
                                            ),
                                            AppSpaces.horizontal10,
                                            const Icon(
                                              Icons.add_circle_outline,
                                              color: AppColors.yellowColor,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            padding: EdgeInsets.symmetric(vertical: 8.0),
                                            decoration: BoxDecoration(
                                              color: controller.isBuyMode ? AppColors.greenColor : AppColors.redColor,
                                              borderRadius: BorderRadius.circular(6.0),
                                            ),
                                            child: Center(
                                              child: Text(
                                                controller.isBuyMode ? 'Buy BTC' : 'Sell BTC',
                                                style: const TextStyle(color: Colors.white, fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  AppSpaces.horizontal20,
                                  Expanded(
                                    flex: 20,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(children: [
                                          const Text(
                                            'Price\n(USDT)',
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(color: AppColors.greyTextColor, fontSize: 11),
                                          ),
                                          const Spacer(),
                                          const Text(
                                            'Amount\n(BTC)',
                                            textAlign: TextAlign.right,
                                            style: const TextStyle(color: AppColors.greyTextColor, fontSize: 11),
                                          ),
                                        ]),
                                        Column(children: [
                                          for (int i = 0; i < sellOfferList.length; i++) ...{
                                            OfferBarButton(
                                              percent: 82 - (i * 8),
                                              color: AppColors.redColor,
                                              offer: sellOfferList[i],
                                            ),
                                          },
                                        ]),
                                        Column(children: [
                                          Text(
                                            '61189.63',
                                            style: TextStyle(color: AppColors.redColor, fontSize: 17),
                                          ),
                                          Text(
                                            '≈\$61,232.63',
                                            style: TextStyle(color: AppColors.greyTextColor, fontSize: 13),
                                          ),
                                        ]),
                                        Column(children: [
                                          for (int i = 0; i < buyOfferList.length; i++) ...{
                                            OfferBarButton(
                                              percent: 55 + (i * 8),
                                              color: AppColors.greenColor,
                                              offer: buyOfferList[i],
                                            ),
                                          },
                                        ]),
                                        Row(children: [
                                          Expanded(
                                            child: FormDropdown(
                                              title: '0.001',
                                            ),
                                          ),
                                          AppSpaces.horizontal10,
                                          FormBaseWidget(
                                            height: 24,
                                            child: Container(
                                              width: 30,
                                              child: Icon(Icons.menu),
                                            ),
                                          ),
                                        ])
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            AppSpaces.vertical20,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppSpaces.horizontal20,
                                Column(children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Open Orders (0)',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0))),
                                  ),
                                  Container(
                                    width: 20.0,
                                    height: 2.0,
                                    color: AppColors.yellowColor,
                                  ),
                                ]),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Funds',
                                      style: TextStyle(
                                        color: AppColors.greyTextColor,
                                      )),
                                ),
                                Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.file_copy, size: 15, color: AppColors.greyTextColor),
                                ),
                                AppSpaces.horizontal5,
                              ],
                            ),
                            Divider(
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
