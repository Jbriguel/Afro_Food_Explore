/*import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fft/controllers/appState.dart';
import 'package:fft/utiles/constants.dart';
import 'package:fft/widgets/loadings/loginLoading.dart';

class googleLoginInButton extends StatefulWidget {
  const googleLoginInButton({super.key});

  @override
  State<googleLoginInButton> createState() => _googleLoginInButtonState();
}

class _googleLoginInButtonState extends State<googleLoginInButton> {
  void _isok(User value) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool("connecter", true);
      prefs.setStringList('user', <String>[
        value.displayName ?? "",
        value.uid,
        value.email ?? "",
      ]);
    });
    Navigator.of(context).pushReplacementNamed('/home');
  }

  //-------------------------------------------------------------//
  String message = '';

  bool reload = false;

  Future ConnectMe(ApplicationState appState, BuildContext context) async {
    bool showPop = false;

    LoginLoadingDialog.show(context);
    await Future.delayed(const Duration(seconds: 5));

    appState.loginInWithGoogle(context: context, setMessage).then((value) {
      if (value != null) {
        LoginLoadingDialog.hide(context);
        _isok(value);
      } else {
        LoginLoadingDialog.hide(context);
        setState(() {
          showPop = true;
        });
      }
    }).catchError((error) {
      print("error $error");
      LoginLoadingDialog.hide(context);
      setState(() {});
    }).whenComplete(() {
      if (showPop) {
        setState(() {
          showPop = false;
        });
        showDialog(
          barrierDismissible: true,
          context: context,
          builder: (_) => ShowLoginMessage(
            Message:
                message != "Erreur!" ? message : "Erreur! Veuillez réessayer.",
          ),
        );
      }
    });
  }

  void setMessage(String msg) {
    setState(() {
      message = msg;
    });
  }

  //-------------------------------------------------------------//

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(
      builder: (context, appState, child) => TextButton(
        onPressed: () async {
          ConnectMe(appState, context);
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Image(
                  image: AssetImage(kIconGoogleSignIn),
                  height: kSizeHeightIconGoogleSignIn),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: AutoSizeText(
                    'Connexion avec Google',
                    presetFontSizes: [15, 14, 12, 10],
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Aller',
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/