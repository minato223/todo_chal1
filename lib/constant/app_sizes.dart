// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';

class AppSizes {
  BuildContext context;
  late double _height;
  late double _width;
  AppSizes(this.context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
  }

  double get HEIGHT => _height;
  double get WIDTH => _width;
  double get CONTENT_PADDING => _width * 0.1;
  double get AVATAR_RADIUS => _width * .16;
  double get CONTENT_SPACE => _width * .04;
  double get TOOLBAR_HEIGHT => _height * .1;

  //Card
  double get CARD_HEIGHT => _width * .65;
  double get CARD_WIDTH => _width * .4;
  double get SPINNER_RATIO => _width * .15;
}
