
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? _uid;
  String? _name;
  String? _phone;
  String? _genre; 
  String? _email;
  String? _address;
  String? _profilImg;
  String? _created_at;

  User(
      {  String? uid,
      required String? name,
      required String? phone,
      required String? genre, 
      required String? email,
      required String? address,
      required String? profilImg,
      required String? created_at}) {
    _uid = uid;
    _name = name;
    _phone = phone;
    _genre = genre; 
    _email = email;
    _address = address;
    _profilImg = profilImg;
    _created_at = created_at;
  }

  String? get uid => _uid;
  String? get name => _name;
  String? get phone => _phone;
  String? get genre => _genre; 
  String? get email => _email;
  String? get address => _address;
  String? get profilImg => _profilImg;
  String? get created_at => _created_at;

  set uid(String? uid) => _uid = uid;
  set name(String? name) => _name = name;
  set phone(String? phone) => _phone = phone;
  set genre(String? genre) => _genre = genre; 
  set email(String? email) => _email = email;
  set address(String? address) => _address = address;
  set profilImg(String? profilImg) => _profilImg = profilImg;
  set created_at(String? created_at) => _created_at = created_at;

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'phone': phone, 
      'email': email,
      'genre': genre,
      'address': address,
      'profilImg': profilImg,
      'created_at': created_at,
    };
  }

  User.fromMap(Map<String, dynamic> res)
      : _uid = res['uid'],
        _name = res['name'],
        _phone = res['phone'], 
        _genre = res['genre'],
        _email = res['email'],
        _address = res['address'],
        _profilImg = res['profilImg'],
        _created_at = res['created_at'];

  User.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : _uid = doc.id,
        _name = doc.data()!["name"],
        _phone = doc.data()!["phone"],
        _genre = doc.data()!["genre"], 
        _email = doc.data()!["email"],
        _address = doc.data()!["address"],
        _profilImg = doc.data()!["profilImg"],
        _created_at = doc.data()!["created_at"];
}
