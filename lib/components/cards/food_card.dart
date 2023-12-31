import 'package:afrofood_explore/core/models/produit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'dart:math' as math show pi;

import 'package:google_fonts/google_fonts.dart';

class FoodCard extends StatefulWidget {
  Produit produit;
  FoodCard({
    Key? key,
    required this.produit,
  }) : super(key: key);
  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  TextStyle style1 = TextStyle(fontFamily: 'Aller');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: AspectRatio(
          aspectRatio: 1 / 1.5,
          child: Card(
            clipBehavior: Clip.antiAlias,
            shadowColor: Colors.grey.shade200,
            color: Colors.transparent,
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
            ),
            margin: const EdgeInsets.all(5),
            child: Stack(
              children: <Widget>[
                FadeInImage(
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  image: NetworkImage("${widget.produit.imageUrl ?? ''}"),
                  placeholder: AssetImage("assets/images/placeholdImage.png"),
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/images/placeholdImage.png',
                        fit: BoxFit.cover);
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.6),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 2),
                            child: AutoSizeText(
                              widget.produit.name ?? "",
                              presetFontSizes: const [18, 17, 15, 14, 13, 12],
                              maxLines: 2,
                              textAlign: TextAlign.justify,
                              textDirection: TextDirection.ltr,
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 2),
                            child: AutoSizeText(
                              widget.produit.description ?? "",
                              presetFontSizes: [13, 12, 11],
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                  Colors.green.shade300,
                                  Colors.green.shade300,
                                ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 8),
                              child: AutoSizeText(
                                "${widget.produit.price ?? ''} ${widget.produit.unity ?? ''}",
                                presetFontSizes: const [15, 14, 13, 12, 11],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: "Aller",
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                widget.produit.disponible == false
                    ? Center(
                        child: Transform.rotate(
                          angle: math.pi / 6,
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                  Colors.deepOrange.withOpacity(0.8),
                                  Colors.deepOrange.withOpacity(0.8),
                                ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 8),
                              child: AutoSizeText(
                                "Indisponible",
                                presetFontSizes: [
                                  20,
                                  18,
                                  16,
                                  15,
                                  14,
                                  13,
                                  12,
                                  11
                                ],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: "Aller",
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(
                        height: 1,
                      )
              ],
            ),
          )),
    );
  }
}
