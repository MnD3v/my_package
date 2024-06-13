// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:my_widgets/real_state/other/collections.dart';

class Recherche {
  String id;
  String? name;
  String? uid;
  String? categorie;
  bool? sell;
  int? budgetMax;
  int? budgetMin;
  String? region;
  List<String>? quartiers;
  String? ville;
  LogementDetails logementDetails;
  Recherche({
    required this.id,
    this.name,
    this.uid,
    this.categorie,
    this.sell,
    this.budgetMax,
    this.budgetMin,
    this.region,
    this.quartiers,
    this.ville,
    required this.logementDetails,
  });
 


  static Future setAlerte(Recherche recherche)async {
    await DB
        .firestore(Collections.alertes)
        .doc(recherche.categorie)
        .collection(Collections.alertes)
        .doc(recherche.id)
        .set(recherche.toMap());
  }

  static Recherche get empty {
    return Recherche(id: DateTime.now().millisecondsSinceEpoch.toString(), logementDetails: LogementDetails());
  }

  Recherche copyWith({
    String? id,
    String? name,
    String? uid,
    String? categorie,
    bool? sell,
    int? budgetMax,
    int? budgetMin,
    String? region,
    List<String>? quartiers,
    String? ville,
    LogementDetails? logementDetails,
  }) {
    return Recherche(
      id: id ?? this.id,
      name: name ?? this.name,
      uid: uid ?? this.uid,
      categorie: categorie ?? this.categorie,
      sell: sell ?? this.sell,
      budgetMax: budgetMax ?? this.budgetMax,
      budgetMin: budgetMin ?? this.budgetMin,
      region: region ?? this.region,
      quartiers: quartiers ?? this.quartiers,
      ville: ville ?? this.ville,
      logementDetails: logementDetails ?? this.logementDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'uid': uid,
      'categorie': categorie,
      'sell': sell,
      'budgetMax': budgetMax,
      'budgetMin': budgetMin,
      'region': region,
      'quartiers': quartiers,
      'ville': ville,
      'logementDetails': logementDetails.toMap(),
    };
  }

  factory Recherche.fromMap(Map<String, dynamic> map) {
    return Recherche(
      id: map['id'] as String,
      name: map['name'] != null ? map['name'] as String : null,
      uid: map['uid'] != null ? map['uid'] as String : null,
      categorie: map['categorie'] != null ? map['categorie'] as String : null,
      sell: map['sell'] != null ? map['sell'] as bool : null,
      budgetMax: map['budgetMax'] != null ? map['budgetMax'] as int : null,
      budgetMin: map['budgetMin'] != null ? map['budgetMin'] as int : null,
      region: map['region'] != null ? map['region'] as String : null,
      quartiers: map['quartiers'] != null ? List<String>.from((map['quartiers'] )) : null,
      ville: map['ville'] != null ? map['ville'] as String : null,
      logementDetails: LogementDetails.fromMap(map['logementDetails'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Recherche.fromJson(String source) => Recherche.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Recherche(id: $id, name: $name, uid: $uid, categorie: $categorie, sell: $sell, budgetMax: $budgetMax, budgetMin: $budgetMin, region: $region, quartiers: $quartiers, ville: $ville, logementDetails: $logementDetails)';
  }

  @override
  bool operator ==(covariant Recherche other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return 
      other.id == id &&
      other.name == name &&
      other.uid == uid &&
      other.categorie == categorie &&
      other.sell == sell &&
      other.budgetMax == budgetMax &&
      other.budgetMin == budgetMin &&
      other.region == region &&
      listEquals(other.quartiers, quartiers) &&
      other.ville == ville &&
      other.logementDetails == logementDetails;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      uid.hashCode ^
      categorie.hashCode ^
      sell.hashCode ^
      budgetMax.hashCode ^
      budgetMin.hashCode ^
      region.hashCode ^
      quartiers.hashCode ^
      ville.hashCode ^
      logementDetails.hashCode;
  }
}
