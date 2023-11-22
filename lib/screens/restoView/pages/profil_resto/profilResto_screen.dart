import 'package:afrofood_explore/core/models/restaurant.dart';
import 'package:afrofood_explore/screens/restoView/pages/profil_resto/conponents/aboutCard.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../theme/colors/appColors.dart';
import '../../../profil/components/actionCard.dart';
import '../booking/booking_screen.dart';
import 'conponents/miniMapCard.dart';

class RestaurantProfil extends StatefulWidget {
  Restaurant restoData;
  RestaurantProfil({super.key, required this.restoData});

  @override
  State<RestaurantProfil> createState() => _RestaurantProfilState();
}

class _RestaurantProfilState extends State<RestaurantProfil> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/back1.jpg"), fit: BoxFit.cover),
        ),
      ),
      Opacity(
        opacity: 0.6,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.white.withOpacity(0.1),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                LineAwesomeIcons.arrow_left,
                color: Colors.black,
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            widget.restoData.name ?? '',
            style: const TextStyle(
              fontFamily: "Poppins",
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
                width: double.infinity,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shadowColor: Colors.lightBlueAccent.shade100,
                  color: Colors.white,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  margin: const EdgeInsets.all(10),
                  child: Image.asset(
                    "assets/images/food2.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              bottomInfos(),
              AboutRestoCard(),
              Card(
                color: Colors.white,
                surfaceTintColor: Colors.white,
                elevation: 1.0,
                shadowColor: Colors.blueAccent.shade200,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.grey.shade100,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Container(
                  height: 150,
                  margin: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: MiniMapCard(),
                ),
              ),
              ActionCard(
                  title: 'Faire une réservation',
                  text: 'Mettre à jour vos données',
                  icon: LineAwesomeIcons.book_open,
                  backColors: const [
                    Colors.white,
                    Colors.white,
                  ],
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const BookingScreen(),
                      ),
                    );
                  },
                  textColor: Colors.black,
                  titleColor: AppColors.primaryColor),
              ActionCard(
                  title: 'Appeler ( 14:30 - 18:00 )',
                  text: '---',
                  icon: LineAwesomeIcons.phone,
                  backColors: const [
                    Color.fromARGB(255, 215, 107, 93),
                    Color.fromARGB(255, 246, 108, 70)
                  ],
                  press: () {
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const EditProfilScreen(),
                      ),
                    );*/
                  },
                  textColor: Colors.white,
                  titleColor: Colors.white),
            ],
          ),
        ),
      ),
    ]);
  }

  bottomInfos() => ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        leading: CircleAvatar(
          backgroundColor: AppColors.secondColor.withOpacity(0.1),
          child: FadeInImage(
            width: 30,
            height: 30,
            fit: BoxFit.cover,
            image: NetworkImage("${widget.restoData.logoUrl ?? ''}"),
            placeholder: AssetImage("assets/images/food2.png"),
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset("assets/images/food2.png", fit: BoxFit.cover);
            },
          ),
        ),
        title: AutoSizeText(widget.restoData.name ?? '',
            presetFontSizes: [13, 12, 11, 10],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                color: AppColors.secondColor,
                fontWeight: FontWeight.bold,
              ),
            )),
        subtitle: AutoSizeText(
          widget.restoData.address ?? '',
          presetFontSizes: [11, 10],
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: AppColors.secondColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
}
