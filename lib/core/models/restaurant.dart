import 'package:cloud_firestore/cloud_firestore.dart';

class Restaurant {
  String? _uid;
  String? _name;
  String? _phone;
  String? _apropos;
  String? _logoUrl;
  String? _email;
  String? _address;
  String? _imageUrl;
  String? _categorieName;
  String? _lat;
  String? _long;
  List<DocumentReference<Map<String, dynamic>>> _menu = [];

  Restaurant(
      {String? uid,
      required String? name,
      required String? phone,
      required String? apropos,
      required String? logoUrl,
      required String? email,
      required String? address,
      required String? imageUrl,
      required String? lat,
      required String? long,
      required List<DocumentReference<Map<String, dynamic>>> menu,
      required String? categorieName}) {
    _uid = uid;
    _name = name;
    _phone = phone;
    _apropos = apropos;
    _logoUrl = logoUrl;
    _email = email;
    _address = address;
    _lat = lat;
    _long = long;
    _imageUrl = imageUrl;
    _menu = menu;
    _categorieName = categorieName;
  }

  String? get uid => _uid;
  String? get name => _name;
  String? get phone => _phone;
  String? get apropos => _apropos;
  String? get logoUrl => _logoUrl;
  String? get email => _email;
  String? get address => _address;
  String? get imageUrl => _imageUrl;
  String? get lat => _lat;
  String? get long => _long;
  String? get categorieName => _categorieName;

  set uid(String? uid) => _uid = uid;
  set name(String? name) => _name = name;
  set phone(String? phone) => _phone = phone;
  set apropos(String? apropos) => _apropos = apropos;
  set logoUrl(String? logoUrl) => _logoUrl = logoUrl;
  set email(String? email) => _email = email;
  set address(String? address) => _address = address;
  set imageUrl(String? imageUrl) => _imageUrl = imageUrl;
  set lat(String? lat) => _lat = lat;
  set long(String? long) => _long = long;
  set categorieName(String? categorieName) => _categorieName = categorieName;

  List<DocumentReference<Map<String, dynamic>>> get menu => _menu;
  set menu(List<DocumentReference<Map<String, dynamic>>> menu) => _menu = menu;

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'phone': phone,
      'logoUrl': logoUrl,
      'email': email,
      'apropos': apropos,
      'address': address,
      'imageUrl': imageUrl,
      'lat': lat,
      'long': long,
      'menu': menu,
      'categorieName': categorieName,
    };
  }

  Restaurant.fromMap(Map<String, dynamic> res)
      : _uid = res['uid'],
        _name = res['name'],
        _phone = res['phone'],
        _logoUrl = res['logoUrl'],
        _apropos = res['apropos'],
        _email = res['email'],
        _address = res['address'],
        _imageUrl = res['imageUrl'],
        _lat = res['lat'],
        _long = res['long'],
        _menu = res['menu'],
        _categorieName = res['categorieName'];

  Restaurant.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : _uid = doc.id,
        _name = doc.data()!["name"],
        _phone = doc.data()!["phone"],
        _apropos = doc.data()!["apropos"],
        _logoUrl = doc.data()!["logoUrl"],
        _email = doc.data()!["email"],
        _address = doc.data()!["address"],
        _imageUrl = doc.data()!["imageUrl"],
        _lat = doc.data()!["lat"],
        _long = doc.data()!["long"],
        _categorieName = doc.data()!["categorieName"],
        _menu = List<DocumentReference<Map<String, dynamic>>>.from(
            doc.data()!['menu']);
}
