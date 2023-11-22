import 'package:afrofood_explore/components/cards/food_card.dart';
import 'package:afrofood_explore/components/selectFoodProcess/processModal.dart';
import 'package:afrofood_explore/core/models/category.dart';
import 'package:afrofood_explore/core/models/lignePanier.dart';
import 'package:afrofood_explore/core/models/produit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MenuViewBody extends StatefulWidget {
  Category? cat;
  MenuViewBody({
    Key? key,
    required this.cat,
  }) : super(key: key);

  @override
  State<MenuViewBody> createState() => _MenuViewBodyState();
}

class _MenuViewBodyState extends State<MenuViewBody> {
  // Category? category;

  Widget AllFoods() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemCount: widget.cat!.produits.length,
      itemBuilder: (BuildContext ctx, index) {
        final Produit produit = widget.cat!.produits![index];
        return GestureDetector(
          onTap: (() => ((produit.disponible == true))
              ? showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (_) => ShowProcessModal1(
                    btnAction: null,
                     cartItem: LignePanier(
                        total:"${ produit.price??0}",
                        qte: 1,
                        unity: produit.unity ,
                        
                        produit: produit), 
                  ),
                )
              : (() {})),
          child: FoodCard(
            produit: produit,
          ),
        );
      });

  @override
  void initState() {
    // TODO: implement initState
    initData();
    super.initState();
  }

  initData() {
    setState(() {
      //category = widget.cat;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: AutoSizeText(
              widget.cat != null ? widget.cat!.name ?? '' : "",
              presetFontSizes: [16, 15, 14, 12, 11, 10],
              maxLines: 1,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: "Aller",
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: AutoSizeText(
              widget.cat != null ? widget.cat!.description ?? '' : "",
              presetFontSizes: [14, 12, 11, 10],
              maxLines: 1,
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              style: const TextStyle(
                fontFamily: "Aller",
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Expanded(child: AllFoods())
      ],
    );
  }
}
