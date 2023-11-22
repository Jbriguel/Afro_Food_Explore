import 'dart:io';

import 'package:flutter/material.dart';

import '../../theme/colors/appColors.dart'; 

class SeDeconnecterAlert extends StatefulWidget {
  //final Function buttonHandler;
  SeDeconnecterAlert({Key? key, 
  
  //required this.buttonHandler
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => SeDeconnecterAlertState();
}

class SeDeconnecterAlertState extends State<SeDeconnecterAlert>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late final TextEditingController _activationCodeController;

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

    _activationCodeController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _activationCodeController.dispose();
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: OrientationBuilder(builder: (context, orientation) {
            return SingleChildScrollView(
                child: Container(
              width: orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.width * 0.7,
              margin: const EdgeInsets.all(20.0),
              //padding: const EdgeInsets.all(20.0),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                shadows: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(height: 5),
                  Center(
                    child: Container(
                      height: 45,
                      child: Image.asset(
                        "assets/images/7247324.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    child: Text(
                      "Vous êtes sûr de vouloir vous déconnecter ?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Aller',
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 5),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                print('yes selected');
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 1.0,
                                  backgroundColor: Colors.white),
                              child: const Text(
                                "Annuler",
                                style: TextStyle(
                                    fontFamily: "Aller",
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                              child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                             // widget.buttonHandler();
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0.0,
                              backgroundColor: AppColors.primaryColor,
                            ),
                            child: const Text(
                              "Oui, j'en suis sûr",
                              style: TextStyle(
                                  fontFamily: "Aller",
                                  fontSize: 12,
                                  color: Colors.white),
                            ),
                          ))
                        ],
                      )),
                ],
              ),
            ));
          }),
        ),
      ),
    );
  }
}
