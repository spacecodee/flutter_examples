import 'package:flutter/material.dart';
import 'package:flutter_examples/src/utils/app_colors.dart';
import 'package:flutter_examples/src/utils/dimensions.dart';
import 'package:flutter_examples/src/widgets/build_me/button_icon_dev.dart';
import 'package:flutter_examples/src/widgets/finance_dark_mode/finance_body.dart';

class FinanceApp extends StatelessWidget {
  const FinanceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: _headerApp(context),
      body: const FinanceBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.00),
        child: _footerApp(context),
      ),
    );
  }

  //TODO: header
  PreferredSizeWidget _headerApp(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColorDark,
      shadowColor: Theme.of(context).primaryColorDark,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.drag_indicator_rounded,
            size: Dimensions.iconSize24,
          ),
          Container(
            width: Dimensions.width35,
            height: Dimensions.height35,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.whiteColor,
                style: BorderStyle.solid,
                width: 1,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/cr7.png"),
                ),
                border: Border.all(
                  color: Theme.of(context).primaryColorDark,
                  style: BorderStyle.solid,
                  width: 4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //TODO: footer
  Widget _footerApp(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).primaryColorDark,
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          ButtonIconDev(
            icon: Icon(Icons.home_rounded),
            boxDecoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.0, 1.0),
                colors: <Color>[AppColors.shadowColor2, AppColors.shadowColor1],
                tileMode: TileMode.repeated,
              ),
            ),
          ),
          ButtonIconDev(
            icon: Icon(
              Icons.equalizer_rounded,
              color: Colors.white,
            ),
          ),
          ButtonIconDev(
            icon: Icon(
              Icons.account_balance_wallet_rounded,
              color: Colors.white,
            ),
          ),
          ButtonIconDev(
            icon: Icon(
              Icons.bookmark_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
