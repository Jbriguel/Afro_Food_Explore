import 'package:afrofood_explore/theme/colors/appColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../accueil/accueil_screen.dart';
import '../allRestaurants/allRestaurants_screen.dart';
import '../profil/profil_screen.dart';
import 'components/custom_bubble_navigation_bar/custom_navigation_bar.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  static double fontSizeValue = 1.0;
  bool hasBanner = true;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/back1.jpg"),
                fit: BoxFit.cover),
          ),
        ),
        Opacity(
          opacity: 0.1,
          child: Container(
            color: Colors.white,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: IndexedStack(
            index: _currentIndex,
            children: pages,
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: _buildFloatingBarCustom(),
          ),
        ),
      ]),
    );
  }

  List<Widget> pages = [
    AccueilScreen(),
    AllRestaurantsScreen(),
    Container(),
    ProfilScreen(),
  ];

  TextStyle styleMenuText(int index) => GoogleFonts.inter(
        textStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: _currentIndex == index
              ? AppColors.primaryColor
              : AppColors.secondColor.withOpacity(0.9),
        ),
      );

  Widget _buildFloatingBarCustom() {
    return CustomNavigationBar(
      iconSize: 22.0,
      selectedColor: AppColors.primaryColor,
      strokeColor: AppColors.primaryColor.withOpacity(0.5),
      unSelectedColor: AppColors.secondColor.withOpacity(0.9),
      backgroundColor: AppColors.witeColor,
      borderRadius: const Radius.circular(8.0),
      items: [
        CustomNavigationBarItem(
          icon: const Icon(
            LineAwesomeIcons.home,
          ),
          title: Text("Home",
              textAlign: TextAlign.center, style: styleMenuText(0)),
        ),
        CustomNavigationBarItem(
          icon: const Icon(
            Icons.restaurant_sharp,
          ),
          title: Text("Restaurants",
              textAlign: TextAlign.center, style: styleMenuText(1)),
        ),
        CustomNavigationBarItem(
          icon: const Icon(
            LineAwesomeIcons.shopping_cart,
          ),
          title: Text("Commandes",
              textAlign: TextAlign.center, style: styleMenuText(2)),
        ),
        CustomNavigationBarItem(
          icon: const Icon(
            LineAwesomeIcons.user_circle,
          ),
          title: Text("Profil",
              textAlign: TextAlign.center, style: styleMenuText(3)),
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) => setState(() => _currentIndex = index),
      isFloating: true,
    );
  }
}
