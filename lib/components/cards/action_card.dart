import 'package:afrofood_explore/theme/colors/appColors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionCard extends StatelessWidget {
  ActionCard({
    super.key,
    required this.titre,
    required this.subTitre,
    required this.imageUrl,
    required this.onPress,
  });

  String titre, subTitre, imageUrl;

  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress as void Function()?,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        surfaceTintColor: AppColors.secondColor.withOpacity(0.2),
        borderOnForeground: false,
        shadowColor: Colors.blueAccent.shade100,
        elevation: 1.0,
        color: AppColors.secondColor.withOpacity(0.2),
        margin: const EdgeInsets.all(5),
        child: SizedBox(
          width: 150,
          height: 150,
          child: Stack(children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
                image: DecorationImage(
                    image: AssetImage(imageUrl), fit: BoxFit.cover),
              ),
            ),
            Opacity(
              opacity: 0.3,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  color: AppColors.secondColor,
                ),
              ),
            ),
            Positioned(
              bottom: -25,
              right: -25,
              child: Container(
                height: 110,
                width: 110,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: AppColors.witeColor.withOpacity(0.2),
                    shape: BoxShape.circle),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 5, left: 5, right: 20, bottom: 5),
                      child: AutoSizeText(
                        titre,
                        presetFontSizes: const [12, 11],
                        maxLines: 2,
                        textDirection: TextDirection.ltr,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.witeColor.withOpacity(0.9),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: AutoSizeText(
                        subTitre,
                        presetFontSizes: const [12, 11, 10],
                        maxLines: 1,
                        textDirection: TextDirection.ltr,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.witeColor.withOpacity(0.9),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
