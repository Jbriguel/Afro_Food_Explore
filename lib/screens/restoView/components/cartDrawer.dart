import 'package:afrofood_explore/core/models/lignePanier.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/services/controllers/appState.dart';

class CartDrawer extends StatelessWidget {
  CartDrawer({Key? key});
  final divider = const Divider(
    color: Colors.black12,
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<ApplicationState>(
        builder: (BuildContext context, appSate, widget) {
          return Column(children: <Widget>[
            Container(
              height: 110,
              child: DrawerHeader(
                  padding: EdgeInsets.zero,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.shopping_cart),
                        Text(
                          'Panier',
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    ),
                    onTap: () {},
                  )),
            ),
            if (appSate.monPanier!.LignesPanier.isEmpty) ...[
              Expanded(
                child: const Center(
                  child: Text(
                    'panier est vide...',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                ),
              ),
            ] else ...[
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: appSate.monPanier!.LignesPanier.length,
                    itemBuilder: (context, index) {
                      LignePanier cartItem =
                          appSate.monPanier!.LignesPanier[index];
                      return Card(
                        color: Colors.grey.shade100,
                        surfaceTintColor: Colors.grey.shade100,
                        elevation: 1.0,
                        child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAlias,
                                    shadowColor: Colors.grey.shade200,
                                    color: Colors.transparent,
                                    elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          5.0), //<-- SEE HERE
                                    ),
                                    margin: const EdgeInsets.all(5),
                                    child: FadeInImage(
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "${cartItem.produit!.imageUrl!}"),
                                      placeholder: AssetImage(
                                          "assets/images/placeholdImage.png"),
                                      imageErrorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                            'assets/images/warning.png',
                                            fit: BoxFit.cover);
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        AutoSizeText(
                                          cartItem.produit!.name ?? '',
                                          presetFontSizes: const [
                                            13,
                                            12,
                                            11,
                                          ],
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
                                        FeedbackTile(
                                            titre: 'PU:',
                                            data:
                                                "${cartItem.produit!.price ?? ''}"),
                                        FeedbackTile(
                                          titre: 'Total :',
                                          data: '${cartItem.getCartTotal()} €',
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        appSate.monPanier!.removeItem(index);
                                      },
                                      icon: Icon(
                                        Icons.delete_sweep,
                                        color: Colors.deepOrange.shade400,
                                      )),
                                ],
                              ),
                              AddToCartMenu(cartItem)
                            ])),
                      );
                    }),
              )
            ],
            divider,
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const AutoSizeText(
                  """Les frais de livraison, sont pris en compte.""",
                  presetFontSizes: [12, 11, 10, 9],
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: appSate.monPanier!.getTotal() > 0
                  ? continueButton(appSate.monPanier!.getTotal(), context)
                  : closeButton(context),
            ),
          ]);
        },
      ),
    );
  }

  Widget continueButton(double total_price, BuildContext ctx) => Card(
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      clipBehavior: Clip.antiAlias,
      shadowColor: Colors.grey.shade500,
      elevation: 1.0,
      color: Colors.deepOrange.shade400,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: Colors.orange.shade200,
            width: 1.2,
            style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              color: Colors.white,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.grey, width: 1, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text("$total_price €",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  /*Navigator.push(
                    ctx,
                    MaterialPageRoute(builder: (_) => const CheckOutScreen()),
                  );*/
                },
                child: Container(
                  color: Colors.deepOrange.shade400,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: const Text("Continuer",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ));

  Widget closeButton(BuildContext ctx) => Card(
        margin: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
        clipBehavior: Clip.antiAlias,
        shadowColor: Colors.grey.shade500,
        elevation: 1.0,
        color: Colors.deepOrange.shade400,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Colors.orange.shade200,
              width: 1.2,
              style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Container(
          height: 50,
          child: GestureDetector(
            onTap: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              color: Colors.deepOrange.shade400,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: const Text("Continuer",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      );
}
//---------------------------------//

class FeedbackTile extends StatelessWidget {
  final String titre;
  final String data;
  FeedbackTile({
    required this.titre,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            titre,
            presetFontSizes: const [12, 11],
            maxLines: 1,
            textAlign: TextAlign.left,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: AutoSizeText(
              data,
              presetFontSizes: const [12, 11],
              maxLines: 1,
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Aller'),
            ),
          )
        ],
      ),
    );
  }
}

//-------------------------------------//
class AddToCartMenu extends StatelessWidget {
  LignePanier cartItem;

  AddToCartMenu(this.cartItem);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          onPressed: () {
            cartItem.decQte();
          },
          icon: Icon(Icons.remove),
          color: Colors.black,
          iconSize: 18,
        ),
        Expanded(
          child: InkWell(
            onTap: () => print('hello'),
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                color: Color(0xFFfd2c2c),
                border: Border.all(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Center(
                child: Text(
                  'Qte ajoutée ${cartItem.qte}',
                  style: new TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            cartItem.incQte();
          },
          icon: Icon(Icons.add),
          color: Color(0xFFfd2c2c),
          iconSize: 18,
        ),
      ],
    );
  }
}
