import 'package:afrofood_explore/theme/colors/appColors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class foodCatCard extends StatefulWidget {
  //Category foodCat;
  foodCatCard({
    super.key, //required this.foodCat
  });

  @override
  State<foodCatCard> createState() => _foodCatCardState();
}

class _foodCatCardState extends State<foodCatCard> {
  String mainText = "A ne surtout pas rater.";
  TextStyle style = const TextStyle(
    fontFamily: 'Aller',
    color: Colors.white,
    fontWeight: FontWeight.w200,
  );
  TextStyle style2 = const TextStyle(fontFamily: "Aller", fontSize: 16.0);

  Widget buildWidgetButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Container(
        height: 50.0,
        margin: const EdgeInsets.all(2),
        // ignore: deprecated_member_use
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80.0),
            ),
          ),
          onPressed: () {},
          child: Ink(
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.white, Color.fromRGBO(255, 255, 255, 0.667)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(30.0)),
            child: Container(
                constraints:
                    const BoxConstraints(maxWidth: 160.0, minHeight: 40.0),
                alignment: Alignment.center,
                child: const AutoSizeText(
                  'Ouvrir',
                  presetFontSizes: [14, 12],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shadowColor: Colors.grey.shade300,
        color: Colors.transparent,
        elevation: 4.0,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 2,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
        ),
        child: SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              /*FadeInImage(
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://fiftybackend.empireebusiness.com/${widget.foodCat.image_url!}"),
                placeholder: AssetImage("assets/images/placeholdImage.png"),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/images/warning.png',
                      fit: BoxFit.cover);
                },
              ),*/
              FadeInImage(
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                image: AssetImage("assets/images/food1.jpg"),
                placeholder: AssetImage("assets/images/placeholdImage.png"),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/images/warning.png',
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: AutoSizeText(
                        "Food Name",
                        presetFontSizes: const [20, 18, 17, 16, 15, 14, 13, 12],
                        maxLines: 2,
                        textAlign: TextAlign.justify,
                        textDirection: TextDirection.ltr,
                        style: style.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    AutoSizeText(
                      "Description of food",
                      presetFontSizes: [15, 14, 13, 12, 11],
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: "Aller",
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
