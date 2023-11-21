import 'package:auto_size_text/auto_size_text.dart'; 
import 'package:flutter/material.dart';
 
import 'components/body.dart';

class MenuScreen extends StatefulWidget {
  //ApplicationState appState;
  MenuScreen({super.key, 
  //required this.appState
  });

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar: MyAppBar(openDrawer: (() {})),
      /* appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: const Padding(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
          child: Text(
            "Menu",
            style: const TextStyle(
              fontFamily: "Aller",
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [ 
        ],
      ),*/
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
              child: Text(
                "Nos différents Plats",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: "Aller"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const AutoSizeText(
                  """A ne surtout pas rater.""",
                  presetFontSizes: [14, 12, 11, 10],
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontFamily: "Aller",
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            MenuBodyScreen(
              //appState: widget.appState,
            )
            /*  SizedBox(height: getProportionateScreenWidth(10)),
          //  BanneT(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(5),
              ),
              child: SectionTitle(title: "Catégories", press: () {}),
            ),
            const Categories(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: SectionTitle(title: "Catégories", press: () {}),
            ),
            // ProduitsCategoriesCarousel(type: ""),
            SizedBox(height: getProportionateScreenWidth(30)),
            //PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),*/
          ],
        ),
      ),
    );
  }
}
