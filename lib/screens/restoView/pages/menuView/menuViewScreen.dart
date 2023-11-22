import 'package:afrofood_explore/core/models/category.dart';
import 'package:afrofood_explore/core/models/restaurant.dart';
import 'package:afrofood_explore/screens/restoView/pages/profil_resto/profilResto_screen.dart';
import 'package:afrofood_explore/theme/colors/appColors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math show pi;

import '../../../../components/IconBtnWithCounter.dart';
import '../../../../core/services/controllers/appState.dart';
import '../../components/cartDrawer.dart';
import 'components/body.dart';

class MenuViewScreen extends StatefulWidget {
  List<DocumentReference<Map<String, dynamic>>> listRefCat;
  Restaurant restoData;
  MenuViewScreen({Key? key, required this.listRefCat, required this.restoData})
      : super(key: key);
  @override
  _MenuViewScreenState createState() => _MenuViewScreenState();
}

class _MenuViewScreenState extends State<MenuViewScreen> {
  late List<ExampleDestination> _items;
  String _headline = "";
  AssetImage _avatarImg = AssetImage('assets/images/logo/logo1.png');

  final GlobalKey<ScaffoldState> scaffoldKey1 = GlobalKey<ScaffoldState>();

  List<Category> listCat = [];
  List<Category> allCategories = [];
  Future<List<DocumentSnapshot>> getDocumentsFromReferences() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    List<DocumentSnapshot> documents = [];
    allCategories.clear();
    for (DocumentReference<Map<String, dynamic>> reference
        in widget.listRefCat) {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await reference.get(); // Récupère le document
      if (snapshot.exists) {
        Category categorie = Category.fromSnapshot(snapshot);
        allCategories.add(categorie);
        documents.add(snapshot); // Ajoute le document à la liste
      } else {
        print('Le document $reference n\'existe pas.');
      }
    }
    print("allCategories : ${allCategories}");
    return documents; // Retourne la liste de documents récupérés
  }

  Future<List<Category>> getDocumentsAllCategories() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    List<DocumentSnapshot> documents = [];
    allCategories.clear();
    for (DocumentReference<Map<String, dynamic>> reference
        in widget.listRefCat) {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await reference.get(); // Récupère le document
      if (snapshot.exists) {
        Category categorie = Category.fromSnapshot(snapshot);
        allCategories.add(categorie);
        documents.add(snapshot); // Ajoute le document à la liste
      } else {
        print('Le document $reference n\'existe pas.');
      }
    }
    // _items = _generateItems;
    return allCategories; // Retourne la liste de documents récupérés
  }

  @override
  void initState() {
    super.initState();

    //_items = _generateItems;
    initData();
    // _headline = _items.firstWhere((item) => item.isSelected).text;
  }

  openPanierDrawer() {
    setState(() {
      scaffoldKey1.currentState!.openDrawer();
    });
  }

  getClientInfos(Map infos) {}

  /* List<ExampleDestination> get _generateItems {
    return List<ExampleDestination>.generate(
      allCategories.length,
      (index) => ExampleDestination(
        'page 0',
        Card(
          clipBehavior: Clip.antiAlias,
          shadowColor: Colors.grey.shade200,
          color: Colors.transparent,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: const EdgeInsets.all(5),
          child: FadeInImage(
            width: 35,
            height: 35,
            fit: BoxFit.cover,
            image: NetworkImage("${allCategories[index].imageUrl!}"),
            placeholder: AssetImage("assets/images/placeholdImage.png"),
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset('assets/images/warning.png',
                  fit: BoxFit.cover);
            },
          ),
        ),
        Card(
          clipBehavior: Clip.antiAlias,
          shadowColor: Colors.grey.shade200,
          color: Colors.transparent,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.deepOrange.shade400,
            ),
            borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
          ),
          margin: const EdgeInsets.all(5),
          child: FadeInImage(
            width: 35,
            height: 35,
            fit: BoxFit.cover,
            image: NetworkImage("${allCategories[index].imageUrl!}"),
            placeholder: AssetImage("assets/images/placeholdImage.png"),
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset('assets/images/warning.png',
                  fit: BoxFit.cover);
            },
          ),
        ),
      ),
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldKey1,
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(LineAwesomeIcons.arrow_left),
              onPressed: () {
                Navigator.of(context).pop();
              },
              tooltip: 'retour',
            );
          },
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
          child: Text(
            "Menu",
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            child: IconBtnWithCounter(
              icon: LineAwesomeIcons.info_circle, 
              numOfitem: 0,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        RestaurantProfil(restoData: widget.restoData),
                  ),
                );
              },
              backCouleur: AppColors.witeColor,
              couleur: AppColors.secondColor,
            ),
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, child) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              child: IconBtnWithCounter(
                icon: LineAwesomeIcons.shopping_cart,
                numOfitem: appState.monPanier!.LignesPanier.length,
                press: () {
                  openPanierDrawer();
                },
                backCouleur: AppColors.witeColor,
                couleur: AppColors.secondColor,
              ),
            ),
          ),
          SizedBox.square(
            dimension: 5,
          ),
        ],
      ),
      drawer: CartDrawer(),
      body: //SafeArea(child: buildDrawerScaffold(context)),
          FutureBuilder<List<Category>>(
        future: getDocumentsAllCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: AppColors.secondColor,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      "Loading ...",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Aller',
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ); // Indicateur de chargement
          } else if (snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: AppColors.secondColor,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      'Erreur: ${snapshot.error}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Aller',
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: Image.asset(
                    "assets/images/empty.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      "Empty!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Aller',
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            // Affichez ou utilisez vos documents ici
            return SafeArea(child: buildDrawerScaffold(context, snapshot.data));
          }
        },
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 2, left: 5, right: 5, bottom: 2),
              child: Center(
                child: Text(
                  "Floystech © 2023 . Tous droits réservés",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Aller',
                    fontSize: 10,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int screenIndex = 0;
  late bool showNavigationDrawer;

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
    });
  }

  initData() {
    //handleScreenChanged(widget.catIndex);
  }

  void openDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  Widget buildDrawerScaffold(BuildContext context, List<Category>? data) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        bottom: false,
        top: false,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: NavigationRail(
                minWidth: 50,
                destinations: List<ExampleDestination>.generate(
                  data != null ? data.length : 0,
                  (index) => ExampleDestination(
                    'page 0',
                    Card(
                      clipBehavior: Clip.antiAlias,
                      shadowColor: Colors.grey.shade200,
                      color: Colors.transparent,
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: const EdgeInsets.all(5),
                      child: FadeInImage(
                        width: 35,
                        height: 35,
                        fit: BoxFit.cover,
                        image: NetworkImage("${data![index].imageUrl!}"),
                        placeholder:
                            AssetImage("assets/images/placeholdImage.png"),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset('assets/images/warning.png',
                              fit: BoxFit.cover);
                        },
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.antiAlias,
                      shadowColor: Colors.grey.shade200,
                      color: Colors.transparent,
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.deepOrange.shade400,
                        ),
                        borderRadius:
                            BorderRadius.circular(10.0), //<-- SEE HERE
                      ),
                      margin: const EdgeInsets.all(5),
                      child: FadeInImage(
                        width: 35,
                        height: 35,
                        fit: BoxFit.cover,
                        image: NetworkImage("${data![index].imageUrl!}"),
                        placeholder:
                            AssetImage("assets/images/placeholdImage.png"),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset('assets/images/warning.png',
                              fit: BoxFit.cover);
                        },
                      ),
                    ),
                  ),
                ).map((ExampleDestination destination) {
                  return NavigationRailDestination(
                    label: Text(destination.label),
                    icon: destination.icon,
                    selectedIcon: destination.selectedIcon,
                  );
                }).toList(),
                selectedIndex: screenIndex,
                useIndicator: true,
                indicatorColor: Colors.orange.shade100,
                onDestinationSelected: (int index) {
                  setState(() {
                    screenIndex = index;
                  });
                },
              ),
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: MenuViewBody(cat: data![screenIndex]),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    showNavigationDrawer = MediaQuery.of(context).size.width >= 150;
  }
}

class ExampleDestination {
  const ExampleDestination(this.label, this.icon, this.selectedIcon);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}
