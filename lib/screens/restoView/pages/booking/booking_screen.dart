import 'package:afrofood_explore/components/buttons/default_button.dart';
import 'package:afrofood_explore/screens/restoView/pages/booking/booking_form.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../theme/colors/appColors.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailAdresseController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _ObjetDemandeController = TextEditingController();

  //############################################################################///
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/back1.jpg"), fit: BoxFit.cover),
        ),
      ),
      Opacity(
        opacity: 0.6,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.white.withOpacity(0.1),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                LineAwesomeIcons.arrow_left,
                color: Colors.black,
              ),
            ),
          ),
          centerTitle: true,
          title: const Text(
            "Booking - Restaurant A",
            style: TextStyle(
                fontFamily: "Poppins",
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          actions: [],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: AutoSizeText(
                    'Formulaire de demande de renseignement',
                    maxLines: 1,
                    presetFontSizes: [13, 12, 11, 10],
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color.fromARGB(255, 0, 5, 51),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                BookingForm(
                    fullNameController: _fullNameController,
                    emailAdresseController: _emailAdresseController,
                    telController: _telController,
                    widget: widget,
                    ObjetDemandeController: _ObjetDemandeController),
                SizedBox(
                  width: MediaQuery.of(context).size.width < 400
                      ? MediaQuery.of(context).size.width * 0.9
                      : 300,
                  child: DefaultButton(
                    text: "Booking",
                    backColor: AppColors.secondColor.withOpacity(0.9),
                    textColor: AppColors.witeColor,
                    press: () {},
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    ]);
  }
}

class FilesSelectedBtns extends StatefulWidget {
  FilesSelectedBtns({
    Key? key,
    required this.showBottomSheet,
  }) : super(key: key);

  final Function? showBottomSheet;
  @override
  _FilesSelectedBtnsState createState() => _FilesSelectedBtnsState();
}

class _FilesSelectedBtnsState extends State<FilesSelectedBtns> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Center(
        //Create Elevated Button
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: ElevatedButton(
              //Handle button press event
              onPressed: () {},
              //Contents of the button
              style: ElevatedButton.styleFrom(
                //Change font size
                elevation: 1.0,
                shadowColor: Colors.lightBlueAccent.shade100,
                foregroundColor: Colors.white,
                backgroundColor: Colors.white,

                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              ),
              child: Row(
                children: [
                  Icon(
                    LineAwesomeIcons.user,
                    color: Colors.red.shade400,
                  ),
                  const Expanded(
                    child: AutoSizeText(
                      "Fichier PDF",
                      presetFontSizes: [15, 14, 13, 12, 11],
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: Colors.black, fontFamily: 'Poppins'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: ElevatedButton(
              //Handle button press event
              onPressed: widget.showBottomSheet as void Function()?,
              //Contents of the button
              style: ElevatedButton.styleFrom(
                //Change font size
                elevation: 1.0,
                shadowColor: Colors.lightBlueAccent.shade100,
                foregroundColor: Colors.white,
                backgroundColor: Colors.white,

                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              ),
              child: Row(
                children: [
                  Icon(
                    LineAwesomeIcons.user,
                    color: Colors.blue.shade400,
                  ),
                  const Expanded(
                    child: AutoSizeText(
                      "Fichier Image",
                      presetFontSizes: [15, 14, 13, 12, 11],
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: Colors.black, fontFamily: 'Poppins'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
      //--------------------------------------------//
    );
  }
}
