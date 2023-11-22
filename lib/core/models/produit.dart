import 'package:cloud_firestore/cloud_firestore.dart';

class Produit {
  String? _uid;
  String? _name;
  int? _price;
  String? _unity;
  String? _description;
  bool? _disponible;
  String? _imageUrl;

  Produit({
    String? uid,
    required String? name,
    required int? price,
    required String? description,
    required String? unity,
    required bool? disponible,
    required String? imageUrl,
  }) {
    _uid = uid;
    _name = name;
    _price = price;
    _unity = unity;
    _description = description;
    _disponible = disponible;
    _imageUrl = imageUrl;
  }

  String? get uid => _uid;
  String? get name => _name;
  int? get price => _price;
  String? get unity => _unity;
  String? get description => _description;
  bool? get disponible => _disponible;
  String? get imageUrl => _imageUrl;

  set uid(String? uid) => _uid = uid;
  set name(String? name) => _name = name;
  set price(int? price) => _price = price;
  set unity(String? unity) => _unity = unity;
  set description(String? description) => _description = description;
  set disponible(bool? disponible) => _disponible = disponible;
  set imageUrl(String? imageUrl) => _imageUrl = imageUrl;

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'price': price,
      'unity': unity,
      'disponible': disponible,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  Produit.fromMap(Map<String, dynamic> res)
      : _uid = res['uid'],
        _name = res['name'],
        _price = res['price'],
        _unity = res['unity'],
        _disponible = res['disponible'],
        _description = res['description'],
        _imageUrl = res['imageUrl'];

  Produit.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : _uid = doc.id,
        _name = doc.data()!["name"],
        _price = doc.data()!["price"],
        _unity = doc.data()!["unity"],
        _description = doc.data()!["description"],
        _disponible = doc.data()!["disponible"],
        _imageUrl = doc.data()!["imageUrl"];
}
