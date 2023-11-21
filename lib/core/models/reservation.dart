import 'package:cloud_firestore/cloud_firestore.dart';

class Reservation {
  String? _uid;
  String? _userUid;
  String? _restoUid;
  String? _dateRes;
  int? _npersonne;
  String? _heureRes;
  String? _infosSupplementaires;
  bool? _validate;
  Timestamp? _dateCreated;

  Reservation(
      {String? uid,
      required String? userUid,
      required String? restoUid,
      required String? dateRes,
      required String? heureRes,
      required int? npersonne,
      required String? infosSupplementaires,
      required bool? validate,
      required Timestamp? dateCreated}) {
    _uid = uid;
    _userUid = userUid;
    _restoUid = restoUid;
    _dateRes = dateRes;
    _npersonne = npersonne;
    _heureRes = heureRes;
    _infosSupplementaires = infosSupplementaires;
    _validate = validate;
    _dateCreated = dateCreated;
  }

  String? get uid => _uid;
  String? get restoUid => _restoUid;
  String? get userUid => _userUid;
  String? get dateRes => _dateRes;
  int? get npersonne => _npersonne;
  String? get heureRes => _heureRes;
  String? get infosSupplementaires => _infosSupplementaires;
  bool? get validate => _validate;
  Timestamp? get dateCreated => _dateCreated;

  set uid(String? uid) => _uid = uid;
  set userUid(String? userUid) => _userUid = userUid;
  set restoUid(String? restoUid) => _restoUid = restoUid;
  set dateRes(String? dateRes) => _dateRes = dateRes;
  set npersonne(int? npersonne) => _npersonne = npersonne;
  set heureRes(String? heureRes) => _heureRes = heureRes;
  set infosSupplementaires(String? infosSupplementaires) =>
      _infosSupplementaires = infosSupplementaires;
  set validate(bool? validate) => _validate = validate;
  set dateCreated(Timestamp? dateCreated) => _dateCreated = dateCreated;

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'userUid': userUid,
      'restoUid': restoUid,
      'dateRes': dateRes,
      'npersonne': npersonne,
      'heureRes': heureRes,
      'validate': validate,
      'infosSupplementaires': infosSupplementaires,
      'dateCreated': dateCreated,
    };
  }

  Reservation.fromMap(Map<String, dynamic> res)
      : _uid = res['uid'],
        _userUid = res['userUid'],
        _restoUid = res['restoUid'],
        _dateRes = res['dateRes'],
        _npersonne = res['npersonne'],
        _heureRes = res['heureRes'],
        _validate = res['validate'],
        _infosSupplementaires = res['infosSupplementaires'],
        _dateCreated = res['dateCreated'];

  Reservation.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : _uid = doc.id,
        _userUid = doc.data()!["userUid"],
        _restoUid = doc.data()!["restoUid"],
        _dateRes = doc.data()!["dateRes"],
        _npersonne = doc.data()!["npersonne"],
        _heureRes = doc.data()!["heureRes"],
        _infosSupplementaires = doc.data()!["infosSupplementaires"],
        _validate = doc.data()!["validate"],
        _dateCreated = doc.data()!["dateCreated"];
}
