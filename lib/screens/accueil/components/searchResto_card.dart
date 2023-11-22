import 'package:afrofood_explore/theme/colors/appColors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';

class SearchMedocsCard extends StatefulWidget {
  //QuizCategory quizCat;
  SearchMedocsCard({
    super.key,
    //required this.quizCat
  });

  @override
  State<SearchMedocsCard> createState() => _ModuleElementCardState();
}

class _ModuleElementCardState extends State<SearchMedocsCard> {
  TextStyle style = const TextStyle(
    fontFamily: 'Poppins',
    color: Colors.white,
    fontWeight: FontWeight.w200,
    fontSize: 16,
  );
  TextStyle style2 = const TextStyle(fontFamily: "Poppins", fontSize: 16.0);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onTap: (() {}),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shadowColor: Colors.lightBlueAccent.withOpacity(0.2),
          color: Colors.white,
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: const EdgeInsets.all(5),
          surfaceTintColor: Colors.white,
          child: SizedBox(
            //height: 120,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.32,
                        padding: const EdgeInsets.all(1),
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                AppColors.blueColor.withOpacity(0.05),
                                AppColors.blueColor.withOpacity(0.01),
                              ]),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(1),
                          child: Image.asset(
                            "assets/illustrations/iced coffee-amico.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: AutoSizeText(
                                      "Search Restaurant...",
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
                                  SizedBox(
                                    width: 100,
                                    child: Divider(
                                      color: Colors.grey.shade400,
                                      height: 1,
                                    ),
                                  ),
                                ]),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: AutoSizeText(
                                "Search for nearby restaurants with ease",
                                presetFontSizes: [12, 11, 10],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      AppColors.primaryColor.withOpacity(0.9),
                                  backgroundColor:
                                      AppColors.primaryColor.withOpacity(0.9),
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                      color: Colors.white60,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  disabledForegroundColor:
                                      Colors.white.withOpacity(0.38),
                                  disabledBackgroundColor:
                                      Colors.white.withOpacity(0.12),
                                  elevation: 1.0,
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width, 40),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                ),
                                onPressed: () {
                                  
                                },
                                child: AutoSizeText(
                                  "Search ...",
                                  presetFontSizes: [13, 12, 11, 10],
                                  maxLines: 1,
                                  style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                /* Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                      padding: EdgeInsets.all(2),
                      constraints: const BoxConstraints(
                        minWidth: 10,
                        minHeight: 10,
                      ),
                      child: Icon(Icons.circle, color: AppColors.ColorGreen)),
                ),*/
              ],
            ),
          ),
        ),
      ),
      /* Positioned(
        right: 0,
        top: 0,
        child: Transform.rotate(
          angle: math.pi / 4.0,
          child: Container(
            padding: EdgeInsets.all(2),
            constraints: const BoxConstraints(
              minWidth: 15,
              minHeight: 15,
            ),
            child: Image.asset(
              "assets/images/cachet/vip_7108023.png",
              height: 20,
              width: 20,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),*/
    ]);
  }
}
