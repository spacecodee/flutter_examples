import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;

  //TODO: card
  static double cardWidth = screenWidth / 1.4;
  static double cardHeight = screenHeight / 3;

  //TODO: altura dinamica, padding y margin
  static double height10 = screenHeight / 79.7;
  static double height15 = screenHeight / 53.1;
  static double height20 = screenHeight / 39.8;
  static double height30 = screenHeight / 26.5;
  static double height35 = screenHeight / 25;
  static double height40 = screenHeight / 19.9;
  static double height45 = screenHeight / 17.7;

  //TODO: anchura dinamica, padding y margin
  static double width10 = screenHeight / 79.7;
  static double width15 = screenHeight / 53.1;
  static double width20 = screenHeight / 39.8;
  static double width30 = screenHeight / 26.5;
  static double width35 = screenHeight / 25;
  static double width40 = screenHeight / 19.9;
  static double width45 = screenHeight / 17.7;

  //TODO: font size
  static double font10 = screenHeight / 79.7;
  static double font16 = screenHeight / 49.8;
  static double font20 = screenHeight / 39.8;
  static double font26 = screenHeight / 30.6;

  //TODO: radius
  static double radius15 = screenHeight / 53.1;
  static double radius20 = screenHeight / 39.8;
  static double radius30 = screenHeight / 26.5;

  //TODO: icon size
  static double iconSize16 = screenHeight / 49.8;
  static double iconSize24 = screenHeight / 33;
  static double iconSize32 = screenHeight / 22;
  static double iconSize40 = screenHeight / 19.9;

  //TODO: list view size
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextContSize = screenWidth / 3.9;

  //TODO: comidas populares
  static double popularFoodImgSize = screenHeight / 2.41;

  //TODO: bottom height
  static double bottomHeightBar = screenHeight / 7.03;
}
