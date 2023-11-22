import 'package:afrofood_explore/core/models/lignePanier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'produit.dart';

class Panier {
  String? _total;
  String? _restoUid;
  List<LignePanier> _LignesPanier = [];

  Panier({
    required String? total,
    required String restoUid,
    required List<LignePanier> LignesPanier,
  }) {
    _total = total;
    _restoUid = restoUid;
    _LignesPanier = LignesPanier;
  }

  String? get total => _total;
  String? get restoUid => _restoUid;

  set total(String? total) => _total = total;
  set restoUid(String? restoUid) => _restoUid = restoUid;

  List<LignePanier> get LignesPanier => _LignesPanier;
  set LignesPanier(List<LignePanier> LignesPanier) =>
      _LignesPanier = LignesPanier;

  @override
  addCartItem(LignePanier elt) {
    LignesPanier.add(elt);
  }

  @override
  void removeItem(int index) {
    if (index >= 0) {
      LignesPanier.removeAt(index);
    }
  }

  @override
  double getTotal() {
    double somme = 0.0;
    LignesPanier.forEach((LignePanier cartItem) {
      somme += cartItem.getCartTotal();
    });

    return somme;
  }

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'restoUid': restoUid,
      'LignesPanier': LignesPanier,
    };
  }

  Panier.fromMap(Map<String, dynamic> res)
      : _total = res['total'],
        _restoUid = res['restoUid'],
        _LignesPanier = (res['LignesPanier']
            .map((Map<String, dynamic> val) => LignePanier.fromMap(val))
            .toList());

  Panier.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : _total = doc.data()!["total"],
        _restoUid = doc.data()!["restoUid"],
        _LignesPanier = ((doc.data()!['LignesPanier'])
            .map((Map<String, dynamic> val) => LignePanier.fromMap(val))
            .toList());
}
