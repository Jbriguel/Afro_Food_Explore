 
import 'package:flutter/material.dart'; 

class Etape1 extends StatefulWidget {
  //CartItem cartItem;
  void Function() toNext;
  Etape1({Key? key,
  // required this.cartItem,
    required this.toNext})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => Etape1State();
}

class Etape1State extends State<Etape1> with SingleTickerProviderStateMixin {
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
    return Column(
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
        produitSelectCard(),
        const Divider(),
        QteButtons(),
        const SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Expanded(child: bookinkButton()),
          ]),
        ),
      ],
    );
  }

//------------------------------------------------------------//
  Widget produitSelectCard() => SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: Padding(
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
            child: Stack(
              children: [
                FadeInImage(
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/placeholdImage.png"),
                  //NetworkImage(  "https://fiftybackend.empireebusiness.com/${widget.cartItem.produit!.image_url!}"),
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
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                ),
              ],
            ),
          ),
        ),
      );
  //-------------------------------------------------------------//

  Widget QteButtons() => Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      color: Colors.transparent,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shadowColor: Colors.grey.shade500,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Colors.orange.shade200,
              width: 1.2,
              style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: TextButton(
                onPressed: () => setState(() {
                 // widget.cartItem.decQte();
                }),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text("-",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 100,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.grey, width: 1, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text('"{widget.cartItem.qte}"',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () => setState(() {
                 // widget.cartItem.incQte();
                }),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text("+",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ));

//----------------------------------------------------------------------//
  Widget bookinkButton() => Card(
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
                  child: Text('"{widget.cartItem.getCartTotal()}€"',
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
                  widget.toNext();
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
}
