import 'package:afrofood_explore/components/cards/action_card.dart';
import 'package:afrofood_explore/components/cards/restaurant_card.dart';
import 'package:afrofood_explore/components/cards/restoCat_card.dart';
import 'package:afrofood_explore/components/recherche_card.dart';
import 'package:afrofood_explore/theme/colors/appColors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../components/sectin_title.dart';
import '../../core/models/restaurant.dart';
import 'components/searchResto_card.dart';

class AccueilScreen extends StatelessWidget {
  AccueilScreen({super.key});

  Stream<QuerySnapshot<Object?>>? stream =
      FirebaseFirestore.instance.collection("restaurants").snapshots();

  bool isLoading = false;
  ScrollController scrollController = ScrollController();
  bool buttonRefreshState = false;

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
                titre: "A few specialities",
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
                titre: "Categories", showVoirToutes: false, press: null),
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
                titre: "Some restaurants", showVoirToutes: false, press: () {}),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              child: SizedBox(
                  height: 320,
                  child:
                      AllCatsQuizs() /*ListView.builder(
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
                ),*/
                  ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget AllCatsQuizs() => StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                scrollDirection: Axis.horizontal,
                controller: scrollController,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  DocumentSnapshot<Map<String, dynamic>> data = snapshot.data!
                      .docs[index] as DocumentSnapshot<Map<String, dynamic>>;
                  print("data : ${data.data()}");
                  Restaurant restoData = Restaurant.fromDocumentSnapshot(data);

                  return SizedBox(
                    width: 320,
                    child: RestaurantCard(
                      restoData: restoData,
                      setSecondaryColor: true,
                    ),
                  );
                });
          } else if (snapshot.error != null) {
            return !buttonRefreshState
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset('assets/images/errorPage.png',
                            height: 150, width: 100),
                      ),
                      // buttonLoadMore(),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: AutoSizeText(
                            "loading...",
                            presetFontSizes: const [13, 12, 11],
                            maxLines: 2,
                            textAlign: TextAlign.justify,
                            textDirection: TextDirection.ltr,
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: CircularProgressIndicator(
                            color: AppColors.secondColor,
                          ),
                        ),
                      ]);
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.secondColor,
              ),
            );
          } else {
            return !buttonRefreshState
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset('assets/images/empty.png',
                            height: 100, width: 100, fit: BoxFit.contain),
                      ),
                      //  buttonRefresh(),
                    ],
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: AppColors.secondColor,
                    ),
                  );
          }
        },
      );
}
