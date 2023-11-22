
import 'package:afrofood_explore/theme/colors/appColors.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../widgets/alerts/logout.dart';
import 'components/actionCard.dart';
import 'components/infoCard.dart';
import 'components/profile_pic.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen>
    with TickerProviderStateMixin {
 
   
  //-----------------------------------------------------------------//
 
  //##############################################################//

  Future<void> showDisconnectPopup(context,) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SeDeconnecterAlert(
         // buttonHandler: (() => Disconnected(appState)),
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final scale = mediaQueryData.textScaleFactor;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(height: 10.0),
              ProfilePic(),

              // SizedBox(height: 10),
              AccountInfosCard(),
              ActionCard(
                  title: 'Mise à jour',
                  text: 'Mettre à jour vos données',
                  icon: LineAwesomeIcons.edit,
                  backColors: const [
                    Colors.white,
                    Colors.white,
                  ],
                  press: () {
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const EditProfilScreen(),
                      ),
                    );*/
                  },
                  textColor: Colors.black,
                  titleColor: AppColors.primaryColor),

              ActionCard(
                  title: "Contribuer",
                  text: "Nous proposer des quizs pour apporter plus d'aide",
                  icon: LineAwesomeIcons.helping_hands,
                  backColors: const [
                    Colors.white,
                    Colors.white,
                  ],
                  press: () {
                   /* Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ContribuerScreen(),
                      ),
                    );*/
                  },
                  textColor: Colors.black,
                  titleColor: AppColors.primaryColor),
              ActionCard(
                  title: "Problème",
                  text:
                      "Nous signaler un problème pour nous aider à améliorer l'application",
                  icon: LineAwesomeIcons.comment_dots,
                  backColors: const [
                    Colors.white,
                    Colors.white,
                  ],
                  press: () {
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SignalerProblemeScreen(),
                      ),
                    );*/
                  },
                  textColor: Colors.black,
                  titleColor: AppColors.primaryColor),

              ActionCard(
                    title: "Se Deconnecter",
                    text: "Retourner à la page de connecion",
                    icon: LineAwesomeIcons.door_closed,
                    backColors: const [
                      Color(0xFFfdaf63),
                      Colors.deepOrangeAccent
                    ],
                    press: () {
                      //showDisconnectPopup(context, appState);
                    },
                    textColor: Colors.white,
                    titleColor: AppColors.witeColor),
             
              SizedBox(height: 10),
            ]),
          ),
        ),
      ),
    );
  }
}
