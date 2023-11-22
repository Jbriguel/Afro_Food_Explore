//String uid, String? title, String? content, String? image, String date

import 'package:afrofood_explore/core/models/produit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  String? _uid;
  String? _name;
  String? _description;
  String? _imageUrl;
  List<Produit> _produits = [];

  Category(
      {required String? name,
      required String? description,
      required String? imageUrl,
      required List<Produit> produits,
      required String? uid}) {
    _uid = uid;
    _name = name;
    _imageUrl = imageUrl;
    _description = description;
    _produits = produits;
  }

  String? get uid => _uid;
  set uid(String? uid) => _uid = uid;

  String? get name => _name;
  set name(String? name) => _name = name;

  String? get description => _description;
  set description(String? description) => _description = description;

  String? get imageUrl => _imageUrl;
  set imageUrl(String? imageUrl) => _imageUrl = imageUrl;

  List<Produit> get produits => _produits;
  set produits(List<Produit> produits) => _produits = produits;

  @override
  String toString() {
    return '''$runtimeType(\n\t uid: $uid ''';
  }

  Category.fromMap(Map<String, dynamic> res)
      : _uid = res['uid'],
        _name = res['name'],
        _description = res['description'],
        _imageUrl = res['imageUrl'],
        _produits = res['produits'];

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'produits': produits
    };
  }

  factory Category.fromFirestore(Map<dynamic, dynamic> json) {
    return Category(
        uid: json['uid'],
        name: json['name'],
        description: json['description'],
        imageUrl: json['imageUrl'],
        produits: json['produits']);
  }

  Map<String, dynamic> toJson() =>
      {'uid': uid, 'name': name, 'imageUrl': imageUrl, 'produits': produits};

  Category.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : _uid = snapshot.data()!['uid'],
        _name = snapshot.data()!['name'],
        _description = snapshot.data()!['description'],
        _imageUrl = snapshot.data()!['imageUrl'],
        _produits = ((snapshot.data()!['produits'] as List<dynamic>)
            .map((val) => Produit.fromMap(val))
            .toList());
}
