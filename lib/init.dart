import 'package:afrofood_explore/main.dart';
import 'package:afrofood_explore/theme/colors/appColors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitializationPage extends StatefulWidget {
  const InitializationPage({Key? key}) : super(key: key);

  @override
  State<InitializationPage> createState() => _InitializationPageState();
}

class _InitializationPageState extends State<InitializationPage> {
  Init Initialize = Init();
  //final Future _initFuture = Init.initialize2();
  bool open = false;
  bool checkValue = false;
  Future<void> awsDejaOpen() async {
    late SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();

    checkValue = sharedPreferences.getBool("awsDejaOpen")!;
    print("checkValue : $checkValue");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Initialize = Init();
    Initialize.initialize();
    awsDejaOpen();
    //open = Initialize.isOpen() as bool;
  }

  @override
  Widget build(BuildContext context) {
    awsDejaOpen();
    return MaterialApp(
      title: 'Afro Foods Explorer',
      theme: ThemeData(
        primaryColor: Colors.white,
        //primarySwatch: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Initialize.initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const MyApp();
          } else {
            return const SplashScreen();
          }
        },
      ),
    );
  }
}

class Init {
  Future initialize() async {
    await _registerServices();
    await _loadSettings();
    await isOpen();
  }

  static Future initialize2(BuildContext ctxt) async {
    await _registerServices();
    await _loadSettings();
  }

  Future<bool> isOpen() async {
    late SharedPreferences sharedPreferences;
    bool checkValue = false;
    sharedPreferences = await SharedPreferences.getInstance();

    checkValue = sharedPreferences.getBool("awsDejaOpen")!;
    print("checkValue : $checkValue");
    return checkValue;
  }

  static getCredential() async {
    late SharedPreferences sharedPreferences;
    bool checkValue = false;
    sharedPreferences = await SharedPreferences.getInstance();

    checkValue = sharedPreferences.getBool("check")!;
  }

  static _registerServices() async {
    print("debut chargement service");
    await Future.delayed(const Duration(seconds: 1));
    Init.getCredential();
    Init().isOpen();

    print("debut chargement");
    print("fin chargement service");
  }

  static _loadSettings() async {
    print("debut chargement setting");
    await Future.delayed(const Duration(seconds: 1));
    print("debut chargement");
    print("fin chargement setting");
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              padding: const EdgeInsets.all(2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  "assets/logo/afe_logo-nobg.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Center(
                child: Text(
                  "#Africa Foods",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Aller',
                      fontSize: 11,
                      color: Colors.black87,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: CircularProgressIndicator(
            color: AppColors.secondColor,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
