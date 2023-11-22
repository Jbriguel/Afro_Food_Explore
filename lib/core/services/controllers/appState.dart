import 'dart:async'; // new
import 'dart:io';
import 'package:afrofood_explore/core/models/panier.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; 
import 'package:firebase_core/firebase_core.dart'; // new
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart'; 
import 'package:provider/provider.dart';

import '../../../firebase_options.dart'; 
import '../../models/user.dart'; 

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }
  DateTime _now = DateTime.now();
  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  
  Panier? monPanier;

  // Add from here... 

  User? currentUser; 
//
  int _attendees = 0;
  int get attendees => _attendees;

  Future<void> init() async { 
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    // FirebaseAuth.instance.userChanges().listen((user) async {
    
    notifyListeners();
    // });
  }

  Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true; // Connexion Internet disponible
      }
    } on SocketException catch (_) {
      return false; // Pas de connexion Internet
    }
    return false; // Pas de connexion Internet
  }

   

  Future<bool?> setNoteToApp(void Function(String value) setMessage,
      {required User usr, required int note}) async {
    bool? retour;
    bool isConnected = await checkInternetConnection();
    if (isConnected) {
      try {
        await FirebaseFirestore.instance
            .collection('NotesDeApplication')
            .doc(usr.uid)
            .set({"user": usr.name, "note": note}, SetOptions(merge: true));
        // Succès de la mise à jour des données
        print('La mise à jour des données a réussi !');

        retour = true;
      } catch (e) {
        retour = false;
        setMessage("2Erreur! Veuillez vérifier votre connexion et réessayer!");
        print("Erreur! Veuillez vérifier votre connexion et réessayer!");
      }
    } else {
      // Pas de connexion Internet, affichez un message à l'utilisateur
      retour = false;
      setMessage(
          'Problème de connexion Internet. Veuillez vérifier votre connexion.');
      print(
          'Problème de connexion Internet. Veuillez vérifier votre connexion.');
    }

    return retour;
  }
 
}
