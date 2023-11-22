import 'package:auto_size_text/auto_size_text.dart'; 
import 'package:flutter/material.dart'; 
import 'package:provider/provider.dart';

class Etape3 extends StatefulWidget {
  //CartItem cartItem;
 // void Function(ApplicationState appState, CartItem item, BuildContext ctx)
   //   AddToCart;
  void Function() toBack;
  Etape3(
      {Key? key,
     // required this.cartItem,
      required this.toBack,
      
      //required this.AddToCart
      })
      : super(key: key);
  @override
  State<StatefulWidget> createState() => Etape3State();
}

class Etape3State extends State<Etape3> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 450), vsync: this);
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    return  Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
            child: Center(
              child: Text('widget.cartItem.produit!.name ?? ""',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Aller',
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
            child: Center(
              child: Text("Valider le plat",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Aller',
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
          ),
          FeedbackTile(
            titre:
               ' "{widget.cartItem.produit!.name ?? ""}(x {widget.cartItem.qte})"',
            data: '"{widget.cartItem.getCartTotal()} €"',
          ),
           
          const Divider(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    widget.toBack();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange.shade400),
                  child: const Text("retour",
                      style:
                          TextStyle(fontFamily: 'Aller', color: Colors.white)),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                  //  widget.AddToCart(appState, widget.cartItem, context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange.shade400),
                  child: Text("Ajouter au panier",
                      style: const TextStyle(
                          fontFamily: 'Aller', color: Colors.white)),
                ),
              ),
            ]),
          ),
        ],
    
    );
  }

//------------------------------------------------------------//

  //-------------------------------------------------------------//

}

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
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AutoSizeText(
            titre,
            presetFontSizes: const [12, 11],
            maxLines: 1,
            textAlign: TextAlign.left,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          AutoSizeText(
            data,
            presetFontSizes: const [12, 11],
            maxLines: 1,
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400, fontFamily: 'Aller'),
          ),
        ],
      ),
    );
  }
}
