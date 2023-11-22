import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/models/user.dart';
import 'feedBackTitle.dart';

class AccountInfosCard extends StatefulWidget {
  @override
  State<AccountInfosCard> createState() => _AccountInfosCardState();
}

class _AccountInfosCardState extends State<AccountInfosCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String getValue(dynamic value) {
      if (value != null) {
        if (value != '') {
          return value;
        } else {
          return '---';
        }
      }
      return '---';
    }

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Colors.white]),
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              spreadRadius: 1,
              color: Colors.blueAccent.shade100.withOpacity(0.2),
              offset: Offset(0, 1),
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FeedbackTile(
                  titre: "Nom:",
                  data: "---",
                  nLigne: 1,
                  isPair: false,
                ),
                FeedbackTile(
                  titre: '@Email',
                  data: "---",
                  nLigne: 1,
                  isPair: false,
                ),
                FeedbackTile(
                  titre: 'Telephone:',
                  data: "---",
                  nLigne: 1,
                  isPair: false,
                ),
                FeedbackTile(
                  titre: 'Adresse:',
                  data: "---",
                  nLigne: 1,
                  isPair: false,
                ),
                FeedbackTile(
                  titre: 'Genre:',
                  data: "---",
                  nLigne: 1,
                  isPair: false,
                ),
                /* FeedbackTile(
                    titre: '',
                    data: getValue(appState.utilisateur!.created_at ?? '---'),
                    nLigne: 1,
                    isPair: false,
                  ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  //******************* */

  Widget editLargeBtn(BuildContext ctx) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        //Create Elevated Button
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.blue.shade600.withOpacity(0.9),
            backgroundColor: Colors.blue.shade600.withOpacity(0.9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            disabledForegroundColor: Colors.white.withOpacity(0.38),
            disabledBackgroundColor: Colors.white.withOpacity(0.12),
            elevation: 0.0,
            //Set the padding on all sides to 30px
            minimumSize: Size(MediaQuery.of(context).size.width, 40),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          ),
          //Button icon
          onPressed: () {},
          child: const AutoSizeText(
            "Completer profil",
            presetFontSizes: [15, 14, 13, 12, 11],
            maxLines: 1,
            textAlign: TextAlign.right,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: 'Aller'),
          ),
        ), //Button label
      );
}
