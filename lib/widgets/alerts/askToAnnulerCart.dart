import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmAnnulerCartItemAlert extends StatefulWidget {
  final Function buttonHandler;
  ConfirmAnnulerCartItemAlert({Key? key, required this.buttonHandler})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => ConfirmAnnulerCartItemAlertState();
}

class ConfirmAnnulerCartItemAlertState
    extends State<ConfirmAnnulerCartItemAlert>
    with SingleTickerProviderStateMixin {
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
                  : MediaQuery.of(context).size.width * 0.6,
              margin: const EdgeInsets.all(20.0),
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
                    child: Text(
                      "Vous êtes sûr d'annuler?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 20),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                print('yes selected');
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "No",
                                style: TextStyle(color: Colors.black),
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  backgroundColor: Colors.white),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                              child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                widget.buttonHandler();
                              });
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Oui, J'en suis sûr!",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              backgroundColor: Colors.red,
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
