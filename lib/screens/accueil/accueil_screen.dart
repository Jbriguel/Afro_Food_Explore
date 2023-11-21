import 'package:afrofood_explore/components/cards/action_card.dart';
import 'package:afrofood_explore/components/cards/restaurant_card.dart';
import 'package:afrofood_explore/components/cards/restoCat_card.dart';
import 'package:afrofood_explore/components/recherche_card.dart';
import 'package:afrofood_explore/theme/colors/appColors.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../components/sectin_title.dart';
import 'components/searchResto_card.dart';

class AccueilScreen extends StatelessWidget {
  const AccueilScreen({super.key});

  List<Map<String, dynamic>> _getRestoCatData() {
    List<Map<String, dynamic>> list = [
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

  List<Map<String, dynamic>> _getActionData() {
    List<Map<String, dynamic>> list = [
      {
        "titre": 'Lorem ipsum dolor sit amet',
        "subTitre": 'Pressed',
        "imageUrl": "assets/images/food1.jpg",
        "onPress": null,
      },
      {
        "titre": 'Lorem ipsum dolor sit amet',
        "imageUrl": "assets/images/food2.png",
        "subTitre": 'Pressed',
        "onPress": null,
      },
      {
        "titre": 'Lorem ipsum dolor sit amet',
        "imageUrl": "assets/images/food1.jpg",
        "subTitre": 'Pressed',
        "onPress": null,
      },
    ];
    return list;
  }

  List<Map<String, dynamic>> _getEcoleData() {
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
                titre: "Quelques Spécialités",
                showVoirToutes: false,
                press: null),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
              child: SizedBox(
                height: 150,
                child: ListView.builder(
                  itemCount: _getActionData().length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> action = _getActionData()[index];
                    return ActionCard(
                      titre: action["titre"],
                      subTitre: action["subTitre"],
                      imageUrl: action["imageUrl"],
                      onPress: action["onPress"],
                    );
                  },
                ),
              ),
            ),
            SearchMedocsCard(),
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
            SectionTitle(
                titre: "Quelques Restaurants",
                showVoirToutes: true,
                press: () {}),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              child: SizedBox(
                height: 320,
                child: ListView.builder(
                  itemCount: _getEcoleData().length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> resto = _getEcoleData()[index];
                    return SizedBox(
                      width: 320,
                      child: RestaurantCard(
                        titre: resto['titre'],
                        subTitre: resto['subTitre'],
                        image: resto['image'],
                        setSecondaryColor: true,
                      ),
                    );
                  },
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
