import 'package:afrofood_explore/core/models/panier.dart';
import 'package:afrofood_explore/theme/colors/appColors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../core/models/restaurant.dart';
import '../../core/services/controllers/appState.dart';
import '../../screens/restoView/pages/menuView/menuViewScreen.dart';

class RestaurantCard extends StatelessWidget {
  Restaurant restoData;
  RestaurantCard(
      {super.key, required this.restoData, setSecondaryColor = false});

  bool setSecondaryColor = false;

  Color getBackColor() =>
      setSecondaryColor ? AppColors.secondColor.withOpacity(0.8) : Colors.white;
  Color getTextColor() =>
      setSecondaryColor ? Colors.white : AppColors.secondColor.withOpacity(0.9);

  @override
  Widget build(BuildContext context) {
    return  Consumer<ApplicationState>(
        builder: (BuildContext context, appState, widget) {
          return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      surfaceTintColor: getBackColor(),
      borderOnForeground: false,
      shadowColor: Colors.blueAccent.shade100,
      elevation: 1.0,
      color: getBackColor(),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
              image: DecorationImage(
                  image: NetworkImage(restoData.imageUrl!), fit: BoxFit.cover),
            ),
            child: FadeInImage(
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              image: NetworkImage("${restoData.imageUrl ?? ''}"),
              placeholder: AssetImage("assets/images/placeholdImage.png"),
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset("assets/images/placeholdImage.png",
                    fit: BoxFit.cover);
              },
            ),
          ),
          bottomInfos(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
            child: Text(
              restoData.apropos!,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: getTextColor(),
                  fontSize: 11,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                foregroundColor: getTextColor(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                backgroundColor: getTextColor(),
                shadowColor: Colors.grey.shade500,
                elevation: 1,
                minimumSize: Size(MediaQuery.of(context).size.width * 0.7, 40),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
              onPressed: () {
                appState.monPanier = Panier(total: "0", restoUid: restoData.uid!, LignesPanier: []);
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MenuViewScreen(listRefCat: restoData.menu,restoData:restoData
                       
                      ),
                ),
              );},
              icon: const Icon(
                Icons.menu_book_sharp,
                color: Colors.white,
              ),
              label: Text(
                "View Restaurant",
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: getBackColor(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  });}

//
  bottomInfos() => ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        leading: CircleAvatar(
          backgroundColor: AppColors.secondColor.withOpacity(0.1),
          child: FadeInImage(
            width: 30,
            height: 30,
            fit: BoxFit.cover,
            image: NetworkImage("${restoData.logoUrl ?? ''}"),
            placeholder: AssetImage("assets/images/food2.png"),
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset("assets/images/food2.png", fit: BoxFit.cover);
            },
          ),
        ),
        title: AutoSizeText(restoData.name ?? "",
            presetFontSizes: [13, 12, 11, 10],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                color: getTextColor(),
                fontWeight: FontWeight.bold,
              ),
            )),
        subtitle: AutoSizeText(
          restoData.address ?? "",
          presetFontSizes: [11, 10],
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: getTextColor(),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
}
