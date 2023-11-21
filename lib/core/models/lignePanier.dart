import 'package:cloud_firestore/cloud_firestore.dart';

import 'produit.dart';

class LignePanier {
  int? _id;
  int? _qte;
  String? _total;
  String? _unity;
  List<Produit> _produits = [];

  LignePanier({
    int? id,
    required int? qte,
    required String? total,
    required String? unity,
    required List<Produit> produits,
  }) {
    _id = id;
    _qte = qte;
    _total = total;
    _produits = produits;
    _unity = unity;
  }

  int? get id => _id;
  int? get qte => _qte;
  String? get total => _total;
  String? get unity => _unity;

  set id(int? id) => _id = id;
  set qte(int? qte) => _qte = qte;
  set total(String? total) => _total = total;
  set unity(String? unity) => _unity = unity;

  List<Produit> get produits => _produits;
  set produits(List<Produit> produits) => _produits = produits;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'qte': qte,
      'total': total,
      'unity': unity,
      'produits': produits,
    };
  }

  LignePanier.fromMap(Map<String, dynamic> res)
      : _id = res['id'],
        _qte = res['qte'],
        _total = res['total'],
        _unity = res['unity'],
        _produits = (res['produits']
            .map((Map<String, dynamic> val) => Produit.fromMap(val))
            .toList());

  LignePanier.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : _id = doc.data()!["id"],
        _qte = doc.data()!["qte"],
        _total = doc.data()!["total"],
        _unity = doc.data()!["unity"],
        _produits = ((doc.data()!['produits'])
            .map((Map<String, dynamic> val) => Produit.fromMap(val))
            .toList());
}
