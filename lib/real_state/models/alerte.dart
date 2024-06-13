// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:immobilier_apk/scr/data/models/utilisateur.dart';
// import 'package:immobilier_apk/scr/config/app/strings.dart';

// class Alerte {
//   String id;
//   String uid;
//   String region;
//   String categorie;
//   List<String> villes;
//   bool? vente;
//   int? budgetMax;
//   int? budgetMin;
//   Alerte({
//     required this.id,
//     required this.uid,
//     required this.region,
//     required this.categorie,
//     required this.villes,
//     this.vente,
//     this.budgetMax,
//     this.budgetMin,
//   });

//   Alerte copyWith({
//     String? id,
//     String? uid,
//     String? region,
//     String? categorie,
//     List<String>? villes,
//     bool? vente,
//     int? budgetMax,
//     int? budgetMin,
//   }) {
//     return Alerte(
//       id: id ?? this.id,
//       uid: uid ?? this.uid,
//       region: region ?? this.region,
//       categorie: categorie ?? this.categorie,
//       villes: villes ?? this.villes,
//       vente: vente ?? this.vente,
//       budgetMax: budgetMax ?? this.budgetMax,
//       budgetMin: budgetMin ?? this.budgetMin,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'uid': uid,
//       'region': region,
//       'categorie': categorie,
//       'villes': villes,
//       'vente': vente,
//       'budgetMax': budgetMax,
//       'budgetMin': budgetMin,
//     };
//   }

//   factory Alerte.fromMap(Map<String, dynamic> map) {
//     return Alerte(
//       id: map['id'] as String,
//       uid: map['uid'] as String,
//       region: map['region'] as String,
//       categorie: map['categorie'] as String,
//       villes: List<String>.from((map['villes'])),
//       vente: map['vente'] != null ? map['vente'] as bool : null,
//       budgetMax: map['budgetMax'] != null ? map['budgetMax'] as int : null,
//       budgetMin: map['budgetMin'] != null ? map['budgetMin'] as int : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Alerte.fromJson(String source) =>
//       Alerte.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'Alerte(id: $id, uid: $uid, region: $region, categorie: $categorie, villes: $villes, vente: $vente, budgetMax: $budgetMax, budgetMin: $budgetMin)';
//   }

//   @override
//   bool operator ==(covariant Alerte other) {
//     if (identical(this, other)) return true;

//     return other.id == id &&
//         other.uid == uid &&
//         other.region == region &&
//         other.categorie == categorie &&
//         listEquals(other.villes, villes) &&
//         other.vente == vente &&
//         other.budgetMax == budgetMax &&
//         other.budgetMin == budgetMin;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//         uid.hashCode ^
//         region.hashCode ^
//         categorie.hashCode ^
//         villes.hashCode ^
//         vente.hashCode ^
//         budgetMax.hashCode ^
//         budgetMin.hashCode;
//   }

//   static Alerte get empty {
//     return Alerte(
//         id: DateTime.now().toString(),
//         uid: Utilisateur.currentUser.value!.telephone,
//         region: Utilisateur.currentUser.value!.region,
//         categorie: nullString,
//         villes: []);
//   }
// }
