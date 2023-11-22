import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AboutRestoCard extends StatelessWidget {
  const AboutRestoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        margin: EdgeInsets.only(top: 2.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: AutoSizeText(
                    "A propos de nous ",
                    presetFontSizes: [13, 12, 11],
                    maxLines: 1,
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 100,
                  child: Divider(
                    color: Colors.grey.shade400,
                    height: 1,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              const Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: AutoSizeText(
                  "Le à propos de la pharmacie",
                  presetFontSizes: const [13, 12, 11],
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
