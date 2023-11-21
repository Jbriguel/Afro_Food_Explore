import 'package:afrofood_explore/components/cards/food_card.dart';
import 'package:auto_size_text/auto_size_text.dart'; 
import 'package:flutter/material.dart';

class MenuViewBody extends StatefulWidget {
  // Category? cat;
  MenuViewBody({
    Key? key,
    // required this.cat,
  }) : super(key: key);

  @override
  State<MenuViewBody> createState() => _MenuViewBodyState();
}

class _MenuViewBodyState extends State<MenuViewBody> {
  // Category? category;

  Widget AllFoods() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300, crossAxisSpacing: 10, mainAxisSpacing: 10),
     // itemCount: widget.cat!.list_produits!.length,
      itemCount:5,
      itemBuilder: (BuildContext ctx, index) {
       // final Produit produit = widget.cat!.list_produits![index];
        return GestureDetector(
          onTap: (() => /*((produit.status != 0) && (produit.quantity != 0))
              ?*/ 
              /*showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (_) => ShowProcessModal1(
                    btnAction: null,
                    cartItem: CartItem(
                        total_price: produit.price!,
                        qte: 1,
                        accompagnements: [],
                        produit: produit),
                  ),
                )*/
             // : (() {})
             {}
             ),
          child: FoodCard(
           // produit: produit,
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
            child: const AutoSizeText(
              "Catégorie Name",
              presetFontSizes: [16, 15, 14, 12, 11, 10],
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
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
            child: const AutoSizeText(
              "Catégorie Description",
              presetFontSizes: [14, 12, 11, 10],
              maxLines: 1,
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              style: TextStyle(
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
