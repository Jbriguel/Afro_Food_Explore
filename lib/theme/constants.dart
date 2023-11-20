import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromARGB(255, 204, 124, 33);
const kSecondaryColor = Color.fromARGB(214, 204, 124, 33);
const kSecondaryColor2 = Color.fromARGB(242, 8, 86, 78);
const kPrimaryLightColor = Color.fromARGB(255, 255, 255, 255);

final darkColor = Colors.grey.shade500;

const kRedColor = Color(0xFFE92E30);
const kGrayColor = Color(0xFFC1C1C1);
const kBlackColor = Color(0xFF101010);

const kGreenColor = Color(0xFF6AC259);

final Shader kPrimaryGradientColor = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color.fromARGB(255, 90, 98, 215),
    Color.fromARGB(255, 84, 92, 215),
    Color(0xFF3f48cc)
  ],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

final Shader kPrimaryGradientColor2 = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color.fromARGB(255, 121, 128, 228),
    Color.fromARGB(255, 116, 123, 220),
    Color.fromARGB(255, 91, 98, 187)
  ],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

const kAnimationDuration = Duration(milliseconds: 200);

//Icon Paths
const String kIconAppLogo = 'assets/images/icons/entrepreneurship_logo.png';
const String kIconGoogleSignIn = 'assets/images/icons/ic_google_sign_in_button.png';

// Size
const double kFontSizeTitleText = 32.0;
const double kSizeHeightIconGoogleSignIn = 32.0;
const double kSizeHeightLoginIcon = 32.0;
const double kSizeHeightAppIcon = 200.0;
const double kSizeWidthAppIcon = 200.0;
