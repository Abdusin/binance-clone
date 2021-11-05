import 'package:clippy_flutter/point.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:binance_clone/utils/AppSpaces.dart';
import 'package:binance_clone/utils/Colors.dart';

class FormBaseWidget extends StatelessWidget {
  const FormBaseWidget({Key? key, this.child, this.height}) : super(key: key);
  final Widget? child;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColors.secondryColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}

class BuySellTabButton extends StatelessWidget {
  const BuySellTabButton({Key? key, required this.isBuyMode, this.onBuyTap, this.onSellTap}) : super(key: key);
  final bool isBuyMode;
  final VoidCallback? onBuyTap;
  final VoidCallback? onSellTap;
  @override
  Widget build(BuildContext context) {
    return FormBaseWidget(
      height: 35.0,
      child: Row(
        children: isBuyMode
            ? [
                Expanded(
                  flex: 13,
                  child: GestureDetector(
                    onTap: onBuyTap,
                    child: Point(
                      triangleHeight: 15,
                      child: Container(
                        color: AppColors.greenColor,
                        child: Center(
                          child: Text('Buy'),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: GestureDetector(
                    onTap: onSellTap,
                    child: Center(
                      child: Text('Sell', style: TextStyle(color: AppColors.greyTextColor)),
                    ),
                  ),
                ),
              ]
            : [
                Expanded(
                  flex: 10,
                  child: GestureDetector(
                    onTap: onBuyTap,
                    child: Center(
                      child: Text('Buy', style: TextStyle(color: AppColors.greyTextColor)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 13,
                  child: GestureDetector(
                    onTap: onSellTap,
                    child: Point(
                      triangleHeight: 15,
                      edge: Edge.LEFT,
                      child: Container(
                        color: AppColors.redColor,
                        child: Center(
                          child: Text('Sell'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
      ),
    );
  }
}

class FormDropdown extends StatelessWidget {
  const FormDropdown({
    Key? key,
    this.prefix,
    required this.title,
  }) : super(key: key);
  final Widget? prefix;
  final String title;
  @override
  Widget build(BuildContext context) {
    return FormBaseWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(children: [
          AppSpaces.horizontal5,
          if (prefix != null) ...[
            prefix!,
            Spacer(),
          ],
          Text(
            title,
            style: TextStyle(color: AppColors.greyTextColor),
          ),
          Spacer(),
          Icon(
            Icons.arrow_drop_down_rounded,
            size: 20,
            color: AppColors.greyTextColor,
          ),
          AppSpaces.horizontal5,
        ]),
      ),
    );
  }
}

class AppFormField extends StatefulWidget {
  const AppFormField(
      {Key? key, this.maxLength, required this.controller, this.prefix, this.suffix, this.placeHolder, this.focusNode})
      : super(key: key);
  final int? maxLength;
  final TextEditingController controller;
  final Widget? prefix;
  final Widget? suffix;
  final String? placeHolder;
  final FocusNode? focusNode;
  @override
  State<AppFormField> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField> {
  @override
  Widget build(BuildContext context) {
    return FormBaseWidget(
      height: 40.0,
      child: Row(children: [
        if (widget.prefix != null) ...[
          widget.prefix!,
        ],
        Expanded(
          child: Stack(alignment: Alignment.center, children: [
            if (widget.placeHolder != null && widget.controller.text.isEmpty)
              Center(
                  child: Text(widget.placeHolder!, style: TextStyle(color: AppColors.greyTextColor, fontSize: 14.0))),
            Container(
              width: double.infinity,
              child: EditableText(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                enableInteractiveSelection: true,
                controller: widget.controller,
                focusNode: widget.focusNode ?? FocusNode(),
                onChanged: (value) {
                  if (widget.placeHolder != null) {
                    setState(() {});
                  }
                },
                style: TextStyle(color: Colors.white, fontSize: 17.0),
                cursorColor: AppColors.yellowColor,
                backgroundCursorColor: AppColors.yellowColor,
                inputFormatters: [
                  if (widget.maxLength != null) LengthLimitingTextInputFormatter(widget.maxLength),
                ],
              ),
            ),
          ]),
        ),
        if (widget.suffix != null) ...[
          widget.suffix!,
        ],
      ]),
    );
  }
}

class AppFormIncredableField extends StatelessWidget {
  const AppFormIncredableField(
      {Key? key,
      this.maxLength,
      required this.controller,
      this.onDecrement,
      this.onIncrement,
      this.placeHolder,
      this.focusNode})
      : super(key: key);
  final VoidCallback? onDecrement;
  final VoidCallback? onIncrement;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? placeHolder;
  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    return AppFormField(
      controller: controller,
      prefix: IconButton(onPressed: onDecrement ?? () {}, icon: Icon(Icons.remove)),
      suffix: IconButton(onPressed: onIncrement ?? () {}, icon: Icon(Icons.add)),
      placeHolder: placeHolder,
      maxLength: maxLength,
      focusNode: focusNode,
    );
  }
}

class FormPercentSlider extends StatelessWidget {
  const FormPercentSlider({Key? key, required this.selectedColor, required this.onChange, required this.activePercent})
      : super(key: key);
  final Color selectedColor;
  final int activePercent;
  final Function(int percent) onChange;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SliderBarWidget(percent: 25, activePercent: activePercent, onChange: onChange, selectedColor: selectedColor),
      AppSpaces.horizontal10,
      SliderBarWidget(percent: 50, activePercent: activePercent, onChange: onChange, selectedColor: selectedColor),
      AppSpaces.horizontal10,
      SliderBarWidget(percent: 75, activePercent: activePercent, onChange: onChange, selectedColor: selectedColor),
      AppSpaces.horizontal10,
      SliderBarWidget(percent: 100, activePercent: activePercent, onChange: onChange, selectedColor: selectedColor),
    ]);
  }
}

class SliderBarWidget extends StatelessWidget {
  const SliderBarWidget(
      {Key? key,
      required this.percent,
      required this.activePercent,
      required this.onChange,
      required this.selectedColor})
      : super(key: key);
  final Color selectedColor;
  final int percent;
  final int activePercent;
  final Function(int percent) onChange;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onChange(percent),
        child: Column(children: [
          Container(
            color: activePercent >= percent ? selectedColor : AppColors.secondryColor,
            height: 7.0,
          ),
          AppSpaces.vertical5,
          Text('%$percent', style: TextStyle(color: AppColors.greyTextColor, fontSize: 12.0)),
        ]),
      ),
    );
  }
}
