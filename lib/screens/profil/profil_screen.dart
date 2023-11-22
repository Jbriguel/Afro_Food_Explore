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

  Future<void> showDisconnectPopup(
    context,
  ) async {
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
                  title: 'Update',
                  text: 'Update your information',
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
                  title: "My bookings",
                  text: "all your bookings",
                  icon: LineAwesomeIcons.book_open,
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
                title: "My favorite dishes",
                text: "a list of your favorite dishes",
                icon: LineAwesomeIcons.star_1,
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
                titleColor: AppColors.primaryColor,
              ),

              ActionCard(
                title: "Logout",
                text: "---",
                icon: LineAwesomeIcons.door_closed,
                backColors: const [Color(0xFFfdaf63), Colors.deepOrangeAccent],
                press: () {
                  showDisconnectPopup(context);
                },
                textColor: Colors.white,
                titleColor: AppColors.witeColor,
              ),
              const SizedBox(height: 10),
            ]),
          ),
        ),
      ),
    );
  }
}
