import 'package:afrofood_explore/components/cards/restaurant_card.dart';
import 'package:afrofood_explore/components/cards/restoCat_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../components/recherche_card.dart';
import '../../components/sectin_title.dart';

class AllRestaurantsScreen extends StatefulWidget {
  const AllRestaurantsScreen({super.key});

  @override
  State<AllRestaurantsScreen> createState() => _AllRestaurantsScreenState();
}

class _AllRestaurantsScreenState extends State<AllRestaurantsScreen> {
  List<Map<String, dynamic>> _getRestoCatData() {
    List<Map<String, dynamic>> list = [
      {"text": "All", "icon": LineAwesomeIcons.list, "onPress": () {}},
      {
        "text": "Catégorie 1",
        "icon": LineAwesomeIcons.coffee,
        "onPress": () {}
      },
      {
        "text": "Catégorie 1",
        "icon": LineAwesomeIcons.concierge_bell,
        "onPress": () {}
      },
      {
        "text": "Catégorie 1",
        "icon": LineAwesomeIcons.pizza_slice,
        "onPress": () {}
      },
      {
        "text": "Catégorie 1",
        "icon": LineAwesomeIcons.cocktail,
        "onPress": () {}
      },
    ];
    return list;
  }

  List<Map<String, dynamic>> _getRestoData() {
    List<Map<String, dynamic>> list = [
      {
        "titre": " Nom de l'Etablissement",
        "subTitre":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris nibh felis, condimentum ut nisi a, tempor rutrum risus. ",
        "image": "assets/images/food2.png",
      },
      {
        "titre": " Nom de l'Etablissement",
        "subTitre":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris nibh felis, condimentum ut nisi a, tempor rutrum risus. ",
        "image": "assets/images/food2.png",
      },
    ];
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: RechercheBar(
                onChanged: (String value) {},
                onClear: () {},
              ),
            ),
            SectionTitle(
                titre: "Catégories", showVoirToutes: false, press: null),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
              child: SizedBox(
                height: 40,
                child: ListView.builder(
                  itemCount: _getRestoCatData().length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    Map<String, dynamic> action = _getRestoCatData()[index];
                    return RestaurantCatClip(
                      text: action["text"],
                      icon: action["icon"],
                      onPress: action["onPress"],
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              child: ListView.builder(
                itemCount: _getRestoData().length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  Map<String, dynamic> resto = _getRestoData()[index];
                  return RestaurantCard(
                    titre: resto['titre'],
                    subTitre: resto['subTitre'],
                    image: resto['image'],
                    setSecondaryColor: true,
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
