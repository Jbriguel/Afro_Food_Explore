import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../widgets/alerts/askToAnnulerCart.dart';
import 'etape1.dart';
import 'lastEtape.dart';

class ShowProcessModal1 extends StatefulWidget {
  //CartItem cartItem;
  Function? btnAction;
  ShowProcessModal1(
      {Key? key,
      //required this.cartItem,
      required this.btnAction})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => ShowProcessModal1State();
}

class ShowProcessModal1State extends State<ShowProcessModal1>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  int etape = 1;
  void toNext() {
    setState(() {
      etape += 1;
    });
  }

  /*void AddToCart(ApplicationState appState, CartItem item, BuildContext ctx) {
    setState(() {
      appState.monPanier.addCartItem(item);
    });
    Navigator.of(ctx).pop();
  }*/

  void toBack() {
    setState(() {
      etape -= 1;
    });
  }

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
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: ScaleTransition(
            scale: scaleAnimation,
            child: OrientationBuilder(builder: (context, orientation) {
              return SingleChildScrollView(
                child: Stack(clipBehavior: Clip.none, children: [
                  if (etape == 1) ...[
                    Container(
                        width: orientation == Orientation.portrait
                            ? MediaQuery.of(context).size.width * 0.8
                            : MediaQuery.of(context).size.width * 0.6,
                        margin: const EdgeInsets.all(5.0),
                        //padding: const EdgeInsets.all(20.0),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          shadows: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Etape1(
                            //cartItem: widget.cartItem,
                            toNext: toNext)),
                  ],

                  if (etape == 3) ...[
                    Container(
                      width: orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.width * 0.8
                          : MediaQuery.of(context).size.width * 0.6,
                      margin: const EdgeInsets.all(5.0),
                      //padding: const EdgeInsets.all(20.0),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        shadows: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Etape3(
                        //  cartItem: widget.cartItem,
                        toBack: toBack,
                        //AddToCart: AddToCart
                      ),
                    ),
                  ],
                  //----------------------------//
                  Positioned(
                    top: -2,
                    right: 0,
                    child: GestureDetector(
                      onTap: (() => showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (_) => ConfirmAnnulerCartItemAlert(
                              buttonHandler: (() =>
                                  Navigator.of(context).pop()),
                            ),
                          )),
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.red.shade400,
                          shape: BoxShape.circle,
                          border: Border.all(width: 1.5, color: Colors.white),
                        ),
                        child: const Center(
                          child: Icon(LineAwesomeIcons.times_circle,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ]),
              );
            })),
      ),
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
                  image:  AssetImage("assets/images/placeholdImage.png"),
                 // NetworkImage( "https://fiftybackend.empireebusiness.com/${widget.cartItem.produit!.image_url!}"),
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
 
}
