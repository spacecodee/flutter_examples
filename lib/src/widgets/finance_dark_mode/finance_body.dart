import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_examples/src/models/card_model.dart';
import 'package:flutter_examples/src/models/product_pay.dart';
import 'package:flutter_examples/src/utils/app_colors.dart';
import 'package:flutter_examples/src/utils/dimensions.dart';

class FinanceBody extends StatefulWidget {
  const FinanceBody({Key? key}) : super(key: key);

  @override
  _FinanceBodyState createState() => _FinanceBodyState();
}

class _FinanceBodyState extends State<FinanceBody> {
  PageController pageController = PageController(viewportFraction: .85);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      //TODO: obtenemos la pagina del corrousel en la que estamos
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: Column(
        children: [
          //TODO: Slider seccion
          SizedBox(
            height: Dimensions.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: 5,
                itemBuilder: (context, position) {
                  return _buildPageItem(position, [
                    CardModel("assets/images/mastercard.png", "3829 4820"),
                    CardModel("assets/images/visa.png", "2165 4881"),
                    CardModel("assets/images/mastercard.png", "3011 4811"),
                    CardModel("assets/images/visa.png", "8541 4662"),
                    CardModel("assets/images/mastercard.png", "2012 5541"),
                  ]);
                }),
          ),
          //TODO: dots
          DotsIndicator(
              dotsCount: 5,
              position: _currentPageValue,
              decorator: DotsDecorator(
                  activeColor: AppColors.shadowColor1,
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)))),
          //TODO: lista de pagos
          SizedBox(height: Dimensions.height30),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return _buildPageProductPay(index, [
                    ProductPay("assets/images/spotify.png", "Spotify", "May 20",
                        15.00),
                    ProductPay("assets/images/grocery.png", "Grocery", "May 21",
                        150.00),
                    ProductPay(
                        "assets/images/pizza.png", "Food", "May 23", 16.35),
                    ProductPay("assets/images/spotify.png", "Spotify", "May 20",
                        15.00),
                    ProductPay("assets/images/grocery.png", "Grocery", "May 21",
                        150.00),
                    ProductPay(
                        "assets/images/pizza.png", "Food", "May 23", 16.35),
                  ]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageItem(int position, List<CardModel> cardsModel) {
    final List<CardModel> cards = cardsModel;
    //TODO: Se crear el Martrix4 para hacer animaciones segun la pagina siguiente
    Matrix4 matrix4 = Matrix4.identity();
    if (position == _currentPageValue.floor()) {
      var currentScale =
          1 - (_currentPageValue - position) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (position == _currentPageValue.floor() + 1) {
      var currentScale = _scaleFactor +
          (_currentPageValue - position + 1) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (position == _currentPageValue.floor() - 1) {
      var currentScale =
          1 - (_currentPageValue - position) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currentScale = 0.8;

      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    //TODO: Para hacer la animacion se debe colocar un Transform, y este debe tener el Matrix
    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          Container(
            width: Dimensions.cardWidth,
            height: Dimensions.cardHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20 * 2),
              color: position.isEven
                  ? AppColors.shadowColor1
                  : AppColors.shadowColor2,
            ),
            child: Padding(
              padding: EdgeInsets.all(
                Dimensions.width30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Image(
                      image: AssetImage(cards[position].logo),
                      height: Dimensions.height45,
                      width: Dimensions.height45,
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Card Number".toUpperCase(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: Dimensions.font10,
                          )),
                      SizedBox(
                        height: Dimensions.height10 / 2,
                      ),
                      Text(
                        cards[position].cardNumber,
                        style: TextStyle(
                          fontSize: Dimensions.font26,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height45,
                  ),
                  Text(
                    "Ghulam",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageProductPay(int position, List<ProductPay> productsPayModel) {
    final List<ProductPay> productsPay = productsPayModel;
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.width20,
        right: Dimensions.width20,
        bottom: Dimensions.height10,
      ),
      child: Container(
        padding: EdgeInsets.all(Dimensions.height20),
        decoration: position == 1
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Theme.of(context).hoverColor,
              )
            : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image(
                  image: AssetImage(productsPay[position].icon),
                  height: Dimensions.height45,
                  width: Dimensions.height45,
                  alignment: Alignment.topLeft,
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productsPay[position].nameProduct,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: Dimensions.font20,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Text(
                      productsPay[position].payDay,
                      style: TextStyle(
                        color: AppColors.whiteColor2,
                        fontSize: Dimensions.font10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              '-\$${productsPay[position].price}',
              style: TextStyle(
                fontSize: Dimensions.font20,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
