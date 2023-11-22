import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AboutRestoCard extends StatelessWidget {
  AboutRestoCard({super.key, required this.infos});
  String infos;
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
                    "About us ",
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: AutoSizeText(
                  "${infos ?? ''}",
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
