import 'package:afrofood_explore/screens/restoView/pages/booking/booking_screen.dart';
import 'package:afrofood_explore/theme/colors/appColors.dart';
import 'package:afrofood_explore/widgets/inputs/input.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class BookingForm extends StatelessWidget {
  const BookingForm({
    super.key,
    required TextEditingController fullNameController,
    required TextEditingController emailAdresseController,
    required TextEditingController telController,
    required this.widget,
    required TextEditingController ObjetDemandeController,
  })  : _fullNameController = fullNameController,
        _emailAdresseController = emailAdresseController,
        _telController = telController,
        _ObjetDemandeController = ObjetDemandeController;

  final TextEditingController _fullNameController;
  final TextEditingController _emailAdresseController;
  final TextEditingController _telController;
  final BookingScreen widget;
  final TextEditingController _ObjetDemandeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          //Le name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: AutoSizeText(
              'Full Name',
              maxLines: 1,
              presetFontSizes: [12, 11, 10],
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Color.fromARGB(255, 0, 5, 51),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),

          InputTextField(
            type: "nom",
            text: "Your fulname",
            controller: _fullNameController,
            prefixIcon: false,
            requis: true,
          ),
        ]),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: AutoSizeText(
                        'Personnes',
                        maxLines: 1,
                        presetFontSizes: [12, 11, 10],
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Color.fromARGB(255, 0, 5, 51),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    InputTextField(
                      type: "nom",
                      text: "0",
                      controller: _fullNameController,
                      prefixIcon: false,
                      requis: true,
                    ),
                  ]),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Le tel
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      child: AutoSizeText(
                        'Phone',
                        maxLines: 1,
                        presetFontSizes: [12, 11, 10],
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Color.fromARGB(255, 0, 5, 51),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),

                    InputTextField(
                      type: "phone",
                      text: "your phone",
                      controller: _telController,
                      prefixIcon: false,
                      requis: true,
                    ),
                  ]),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      child: AutoSizeText(
                        'Date & hours',
                        maxLines: 1,
                        presetFontSizes: [12, 11, 10],
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Color.fromARGB(255, 0, 5, 51),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    InputTextField(
                      type: "",
                      text: "25/10/2023 - 10h:00 PM",
                      controller: _emailAdresseController,
                      prefixIcon: false,
                      requis: false,
                    ),
                  ]),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      child: AutoSizeText(
                        '',
                        maxLines: 1,
                        presetFontSizes: [12, 11, 10],
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Color.fromARGB(255, 0, 5, 51),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        LineAwesomeIcons.calendar_1,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Date",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: AppColors.secondColor,
                      ),
                    ),
                  ],
                )),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          //Le lien
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: AutoSizeText(
              'Additional Informations',
              maxLines: 1,
              presetFontSizes: [12, 11, 10],
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Color.fromARGB(255, 0, 5, 51),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(2.0),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              maxLines: 10,
              minLines: 7,
              maxLength: 500,
              key: widget.key,
              controller: _ObjetDemandeController,
              style: TextStyle(
                fontSize: 13,
                fontFamily: "Poppins",
                color: Colors.grey.shade800.withOpacity(0.9),
              ),
              decoration: InputDecoration(
                hintText: "enter ...",
                labelStyle: const TextStyle(
                    fontFamily: "Poppins", fontSize: 12, color: Colors.black),
                hintStyle: TextStyle(
                    color: Colors.grey.shade800.withOpacity(0.6), fontSize: 12),
                filled: true,
                fillColor: Color(0xfff4f8fa),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Color(0xffd0e2ea),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Color(0xffd0e2ea),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Color(0xffd0e2ea),
                  ),
                ),
              ),
              validator: (text) {
                if (text!.isEmpty) {
                  return 'Objet requis!';
                } else {
                  return null;
                }
              },
            ),
          ),
        ]),
      ],
    );
  }
}
