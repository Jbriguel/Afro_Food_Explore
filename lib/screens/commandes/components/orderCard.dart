import 'package:afrofood_explore/theme/colors/appColors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatefulWidget {
  String etat;
  OrderCard({super.key, required this.etat});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin:
          const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 10),
      clipBehavior: Clip.antiAlias,
      shadowColor: Colors.lightBlueAccent.shade100,
      surfaceTintColor: Colors.transparent,
      color: Colors.transparent,
      elevation: 1.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        //height: 160,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: AssetImage(
                "assets/images/back1.jpg",
              ),
              fit: BoxFit.cover),
          border: Border.all(color: AppColors.witeColor, width: 1),
        ),
        child: SizedBox(
          child: Stack(children: [
            Opacity(
              opacity: 0.95,
              child: Container(
                // constraints: const BoxConstraints.expand(),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        //AppColors.ColorGreen,
                        Colors.white,
                        Colors.white,
                      ]),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fait le',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "18-02-2023",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      //presence date
                      Text(
                        widget.etat,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Objet',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(height: 4),
                  AutoSizeText(
                    "Objet de la demande",
                    presetFontSizes: const [13, 12, 11],
                    maxLines: 1,
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Pharmacie',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 4),
                  AutoSizeText(
                    "Nom de le Pharmacie",
                    presetFontSizes: const [13, 12, 11],
                    maxLines: 1,
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
