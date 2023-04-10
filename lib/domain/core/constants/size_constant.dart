/* -- App Sizing -- */

//App default Sizing
import 'package:flutter/cupertino.dart';

abstract class SizeConstants {
  static const tDefaultSize = 30.0;
  static const tPadding = 20.0;
  static const tSplashContainerSize = 30.0;
  static const tButtonHeight = 15.0;
  static const tFormHeight = 30.0;
  static const tDashBoardPadding = 10.0;
  static const tWhiteCard = 150.0;
}

abstract class GapConstants {
  static const gapH5 = SizedBox(height: 5.0);
  static const gapH10 = SizedBox(height: 10.0);
  static const gapH15 = SizedBox(height: 15.0);
  static const gapH20 = SizedBox(height: 20.0);
  static const gapH25 = SizedBox(height: 25.0);
  static const gapH30 = SizedBox(height: 30.0);
  static const gapH180 = SizedBox(height: 180.0);
  static const gapH320 = SizedBox(height: 320.0);
  static const gapH100 = SizedBox(height: 100.0);
  static const gapH300 = SizedBox(height: 300.0);
  static const gapH50 = SizedBox(height: 50.0);
  static const gapH80 = SizedBox(height: 80.0);
  static const gapH200 = SizedBox(height: 200.0);
}

abstract class PaddingSizeConstants {
  static const tDefaultSize = EdgeInsets.all(20.0);
  static const tDefaultButtonSize =
      EdgeInsets.symmetric(horizontal: 100.0, vertical: 25.0);
  static const tOnlyLeft = EdgeInsets.only(left: 10.0);
  static const tOnlyRight = EdgeInsets.only(right: 10.0);
  static const tOnlyTop = EdgeInsets.only(top: 10.0);
  static const tOnlyBottom = EdgeInsets.only(bottom: 10.0);
}
