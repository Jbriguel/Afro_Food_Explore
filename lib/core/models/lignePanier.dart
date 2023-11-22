import 'package:cloud_firestore/cloud_firestore.dart';

import 'produit.dart';

class LignePanier {
  int? _id;
  int _qte = 0;
  String? _total;
  String? _unity;
  Produit? _produit;

  LignePanier({
    int? id,
    required int qte,
    required String? total,
    required String? unity,
    required Produit produit,
  }) {
    _id = id;
    _qte = qte;
    _total = total;
    _produit = produit;
    _unity = unity;
  }

  int? get id => _id;
  int get qte => _qte;
  String? get total => _total;
  String? get unity => _unity;

  set id(int? id) => _id = id;
  set qte(int qte) => _qte = qte;
  set total(String? total) => _total = total;
  set unity(String? unity) => _unity = unity;

  Produit? get produit => _produit;
  set produit(Produit? produit) => _produit = produit;

  @override
  void addProduit(Produit prdt) {
    produit = prdt;
  }

  @override
  double getCartTotal() {
    double somme = 0;
    somme += (produit!.price ?? 0) * (qte );

    return somme;
  }

  @override
  void incQte() {
    qte = (qte ) + 1;
  }

  @override
  void decQte() {
    if (qte > 1) {
      qte = (qte) - 1;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'qte': qte,
      'total': total,
      'unity': unity,
      'produit': produit,
    };
  }

  LignePanier.fromMap(Map<String, dynamic> res)
      : _id = res['id'],
        _qte = res['qte'],
        _total = res['total'],
        _unity = res['unity'],
        _produit = (res['produit']
            .map((Map<String, dynamic> val) => Produit.fromMap(val))
            .toList());

  LignePanier.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : _id = doc.data()!["id"],
        _qte = doc.data()!["qte"],
        _total = doc.data()!["total"],
        _unity = doc.data()!["unity"],
        _produit = ((doc.data()!['produit']));
}
