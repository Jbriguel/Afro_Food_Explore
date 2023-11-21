import 'package:afrofood_explore/theme/colors/appColors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../screens/restoView/pages/menu/menuScreen.dart';

class RestaurantCard extends StatelessWidget {
  RestaurantCard(
      {super.key,
      required this.titre,
      required this.subTitre,
      required this.image,
      setSecondaryColor = false});

  String titre;
  String subTitre;
  String image;
  bool setSecondaryColor = false;

  Color getBackColor() =>
      setSecondaryColor ? AppColors.secondColor.withOpacity(0.8) : Colors.white;
  Color getTextColor() =>
      setSecondaryColor ? Colors.white : AppColors.secondColor.withOpacity(0.9);

  @override
  Widget build(BuildContext context) {
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
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            ),
          ),
          bottomInfos(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
            child: Text(
              subTitre,
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
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MenuScreen(),
                ),
              ),
              icon: const Icon(
                LineAwesomeIcons.info_circle,
                color: Colors.white,
              ),
              label: Text(
                "Plus d'informations",
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
  }

  bottomInfos() => ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        leading: CircleAvatar(
          backgroundColor: AppColors.secondColor.withOpacity(0.1),
          child: Image.asset(
            "assets/illustrations/food.png",
            fit: BoxFit.contain,
            width: 30,
            height: 30,
          ),
        ),
        title: AutoSizeText(titre,
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
          "Adresse",
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
