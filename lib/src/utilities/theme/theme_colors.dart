import 'package:flutter/material.dart';

abstract class ColorPallet {
  Color get primaryColor;
  Color get accentColor;
  Color get scaffoldColor;
  static const green = Color(0xff42C83C);
  static const black = Colors.black;
  static const white = Color(0xffffffff);
  static const lightBackgroung = Color(0xffF2F2F2);
  static const barkBackground = Color(0xff0D0C0C);
  static const grey = Color(0xffBEBEBE);
  static const darkGrey = Color(0xff343434);
  static const Color black2 = Color(0xFF252525);
  static const Color offWhite = Color(0xFFF1F3FB);
  static const Color yellow = Colors.yellow;
  static const Color lightBgColor = Color(0xFFEFF7F6);
  static const Color grey300 = Color(0xFFeeeeee);
  static const Color grey600 = Color(0xFF234f68);
  static const Color mediumGrey = Color(0xFF53587A);
  static const Color lightGrey = Color.fromARGB(255, 239, 247, 246);
  static const Color red = Colors.red;
  static const Color darkRed = Color.fromARGB(255, 193, 26, 14);
  static const Color orange = Color.fromARGB(255, 243, 139, 17);
  static const Color darkGreen = Color(0xFF388E3D);
  static const Color lightGreen = Color(0xFF35AC39);
  static const Color transparent = Colors.transparent;
  static const Color lightBlueGrey = Color.fromARGB(48, 35, 79, 104);
  static const Color darkBlueGrey = Colors.black;
  static const Color mediumBlueGrey = Color(0XFF365E75);
  static const Color blueGrey = Color(0xFF204D6C);
  static const Color skyBlue = Color(0xFF00BBFF);
  static const Color darkSkyBlue = Color(0xFF0096cc);
  static const Color blue = Color.fromARGB(255, 10, 148, 246);
  static const Color rating = Color(0xFFFFC42D);
  static const Color lightPink = Color(0xFFD8A2BF);
  static const Color shimmerHighlight = Color.fromARGB(255, 235, 237, 237);
  static const Color drawerIconColor = Color(0xFF71839B);
  static const Color drawerTextColor = Color(0xFF324054);
  static const Color greyBorderColor = Color.fromARGB(255, 229, 231, 235);
  static const Color greyTextColor = Color.fromARGB(255, 164, 164, 164);
  static const Color lightGreyColor = Color(0xFFf2f2f2);
  static const Color authContainerLightGreen = Color(0xFF5cba96);
  static const Color logoColor = Color(0xFFD15e04);

  static final Paint dialogShaderPaint = Paint()
    ..shader = const LinearGradient(
      colors: <Color>[
        Color(0xff628EFF),
        Color(0xffBFD5FF),
        Color(0xffE9A0FE),
      ],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  static final Gradient onBoardingImageGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: <Color>[
      lightGreen.withOpacity(0.09),
      lightGreen.withOpacity(0.06),
      transparent,
    ],
  );
  static final Gradient profileBackgroundColorGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.center,
    colors: <Color>[
      ColorPallet.yellow.withOpacity(0.2),
    ],
  );

  static final Gradient circularBackgroundGradient = RadialGradient(
    colors: <Color>[
      ColorPallet.green.withOpacity(0.3),
      ColorPallet.green.withOpacity(0.2),
      ColorPallet.green.withOpacity(0.1),
      ColorPallet.green.withOpacity(0.04),
    ],
    stops: const <double>[0.6, 0.7, 0.85, 1],
  );

  static final Gradient circularBackgroundGradientGrey = RadialGradient(
    colors: <Color>[
      ColorPallet.mediumGrey.withOpacity(0.3),
      ColorPallet.mediumGrey.withOpacity(0.2),
      ColorPallet.mediumGrey.withOpacity(0.1),
      ColorPallet.mediumGrey.withOpacity(0.04),
    ],
    stops: const <double>[0.6, 0.7, 0.85, 1],
  );

  static const Gradient circularButtonGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      grey600,
      darkGreen,
    ],
  );

  static final Gradient circularButtonGradientGrey = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      grey600.withOpacity(0.42),
      grey600,
    ],
  );

  static final Gradient galleryScreenGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: <Color>[
      const Color(0xFF141A48).withOpacity(0.3),
      const Color(0xFF141A48).withOpacity(0.15),
      transparent,
    ],
    stops: const <double>[0.3, 0.6, 1],
  );

  static final List<BoxShadow> bottomNavBarShadow = <BoxShadow>[
    BoxShadow(
      color: ColorPallet.black.withOpacity(0.3),
      blurRadius: 10,
      offset: const Offset(0, 0),
      spreadRadius: 2,
    )
  ];

  static List<BoxShadow> buttonShadow({Color? color}) {
    return <BoxShadow>[
      BoxShadow(
        color: (color ?? Colors.grey).withOpacity(0.5),
        spreadRadius: -5.0,
        blurRadius: 10.0,
        offset: const Offset(0, 5.0),
      )
    ];
  }

  static final List<BoxShadow> drawerShadow = <BoxShadow>[
    BoxShadow(
      color: ColorPallet.black.withOpacity(0.2),
      blurRadius: 20,
      offset: const Offset(0, 0),
      spreadRadius: 2,
    )
  ];

  static final List<BoxShadow> drawerSelectedItemShadow = <BoxShadow>[
    BoxShadow(
      color: ColorPallet.black.withOpacity(0.3),
      blurRadius: 10,
      offset: const Offset(0, 0),
      spreadRadius: 2,
    )
  ];

  static final List<BoxShadow> topDialogShadow = <BoxShadow>[
    BoxShadow(
      color: ColorPallet.black.withOpacity(0.5),
      blurRadius: 20,
      offset: const Offset(0, 0),
      spreadRadius: 4,
    )
  ];
  static final List<BoxShadow> cardShadow = <BoxShadow>[
    BoxShadow(
      color: ColorPallet.grey.withOpacity(0.3),
      offset: const Offset(1, 1),
      blurRadius: 4, // 30
      spreadRadius: 0.3, //4
    )
  ];
}

class DarkPallet extends ColorPallet {
  @override
  Color get primaryColor => Colors.green;

  @override
  Color get accentColor => Colors.white;

  @override
  Color get scaffoldColor => ColorPallet.green;
}

class LightPallet extends ColorPallet {
  @override
  Color get primaryColor => Colors.green;

  @override
  Color get accentColor => ColorPallet.black;

  @override
  Color get scaffoldColor => ColorPallet.white;
}
