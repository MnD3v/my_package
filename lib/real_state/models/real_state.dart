// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:my_widgets/real_state/other/collections.dart';

var vente = 'Vente';
var location = 'Location';

class RealState {
  static String louer = "Louer";
  static String acheter = "Acheter";
  int level;
  List<String> images;
  String? status;
  int visite;
  String region;
  String quartier;
  Localisation? localisation;
  String categorie;
  String date;
  String initialDate;
  int prix;
  String description;
  String exigence;
  String id;
  String uid;
  Telephone contacts;
  String? ville;
  bool autorisation;
  bool vente;
  SmallPartenaire? smallPartenaire;
  LogementDetails? logementDetails;
  RealState({
    required this.level,
    required this.images,
    this.status,
    required this.visite,
    required this.region,
    required this.quartier,
    this.localisation,
    required this.categorie,
    required this.date,
    required this.initialDate,
    required this.prix,
    required this.description,
    required this.exigence,
    required this.id,
    required this.uid,
    required this.contacts,
    this.ville,
    required this.autorisation,
    required this.vente,
    this.smallPartenaire,
    this.logementDetails,
  });

  RealState copyWith({
    int? level,
    List<String>? images,
    String? status,
    int? visite,
    String? region,
    String? quartier,
    Localisation? localisation,
    String? categorie,
    String? date,
    String? initialDate,
    int? prix,
    String? description,
    String? exigence,
    String? id,
    String? uid,
    Telephone? contacts,
    String? ville,
    bool? autorisation,
    bool? vente,
    SmallPartenaire? smallPartenaire,
    LogementDetails? logementDetails,
  }) {
    return RealState(
      level: level ?? this.level,
      images: images ?? this.images,
      status: status ?? this.status,
      visite: visite ?? this.visite,
      region: region ?? this.region,
      quartier: quartier ?? this.quartier,
      localisation: localisation ?? this.localisation,
      categorie: categorie ?? this.categorie,
      date: date ?? this.date,
      initialDate: initialDate ?? this.initialDate,
      prix: prix ?? this.prix,
      description: description ?? this.description,
      exigence: exigence ?? this.exigence,
      id: id ?? this.id,
      uid: uid ?? this.uid,
      contacts: contacts ?? this.contacts,
      ville: ville ?? this.ville,
      autorisation: autorisation ?? this.autorisation,
      vente: vente ?? this.vente,
      smallPartenaire: smallPartenaire ?? this.smallPartenaire,
      logementDetails: logementDetails ?? this.logementDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'level': level,
      'images': images,
      'status': status,
      'visite': visite,
      'region': region,
      'quartier': quartier,
      'localisation': localisation?.toMap(),
      'categorie': categorie,
      'date': date,
      'initialDate': initialDate,
      'prix': prix,
      'description': description,
      'exigence': exigence,
      'id': id,
      'uid': uid,
      'contacts': contacts.toMap(),
      'ville': ville,
      'autorisation': autorisation,
      'vente': vente,
      'smallPartenaire': smallPartenaire?.toMap(),
      'logementDetails': logementDetails?.toMap(),
    };
  }

  factory RealState.fromMap(Map<String, dynamic> map) {
    return RealState(
      level: map['level'] as int,
      images: List<String>.from((map['images'])),
      status: map['status'] != null ? map['status'] as String : null,
      visite: map['visite'] as int,
      region: map['region'] as String,
      quartier: map['quartier'] as String,
      localisation: map['localisation'] != null
          ? Localisation.fromMap(map['localisation'] as Map<String, dynamic>)
          : null,
      categorie: map['categorie'] as String,
      date: map['date'] as String,
      initialDate: map['initialDate'] as String,
      prix: map['prix'] as int,
      description: map['description'] as String,
      exigence: map['exigence'] as String,
      id: map['id'] as String,
      uid: map['uid'] as String,
      contacts: Telephone.fromMap(map['contacts'] as Map<String, dynamic>),
      ville: map['ville'] != null ? map['ville'] as String : null,
      autorisation: map['autorisation'] as bool,
      vente: map['vente'] as bool,
      smallPartenaire: map['smallPartenaire'] != null
          ? SmallPartenaire.fromMap(
              map['smallPartenaire'] as Map<String, dynamic>)
          : null,
      logementDetails: map['logementDetails'] != null
          ? LogementDetails.fromMap(
              map['logementDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RealState.fromJson(String source) =>
      RealState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RealState(level: $level, images: $images, status: $status, visite: $visite, region: $region, quartier: $quartier, localisation: $localisation, categorie: $categorie, date: $date, initialDate: $initialDate, prix: $prix, description: $description, exigence: $exigence, id: $id, uid: $uid, contacts: $contacts, ville: $ville, autorisation: $autorisation, vente: $vente, smallPartenaire: $smallPartenaire, logementDetails: $logementDetails)';
  }

  @override
  bool operator ==(covariant RealState other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.level == level &&
        listEquals(other.images, images) &&
        other.status == status &&
        other.visite == visite &&
        other.region == region &&
        other.quartier == quartier &&
        other.localisation == localisation &&
        other.categorie == categorie &&
        other.date == date &&
        other.initialDate == initialDate &&
        other.prix == prix &&
        other.description == description &&
        other.exigence == exigence &&
        other.id == id &&
        other.uid == uid &&
        other.contacts == contacts &&
        other.ville == ville &&
        other.autorisation == autorisation &&
        other.vente == vente &&
        other.smallPartenaire == smallPartenaire &&
        other.logementDetails == logementDetails;
  }

  @override
  int get hashCode {
    return level.hashCode ^
        images.hashCode ^
        status.hashCode ^
        visite.hashCode ^
        region.hashCode ^
        quartier.hashCode ^
        localisation.hashCode ^
        categorie.hashCode ^
        date.hashCode ^
        initialDate.hashCode ^
        prix.hashCode ^
        description.hashCode ^
        exigence.hashCode ^
        id.hashCode ^
        uid.hashCode ^
        contacts.hashCode ^
        ville.hashCode ^
        autorisation.hashCode ^
        vente.hashCode ^
        smallPartenaire.hashCode ^
        logementDetails.hashCode;
  }

  static RealState empty(Telephone telephone) {
    return RealState(
        initialDate: DateTime.now().toString(),
        level: 1,
        visite: 0,
        logementDetails: null,
        smallPartenaire: null,
        ville: nullString,
        images: [],
        region: nullString,
        quartier: nullString,
        categorie: nullString,
        date: DateTime.now().toString(),
        prix: 0,
        description: nullString,
        exigence: nullString,
        id: "-1",
        uid: telephone.numero,
        contacts: telephone,
        autorisation: false,
        vente: true);
  }

  static Future setRealState({required RealState realState}) async {
    if (realState.id == "-1") {
      realState.id = await getId;
    }
    await DB
        .firestore(Collections.biens)
        .doc(realState.id)
        .set(realState.toMap());
  }

  static Future<String> get getId async {
    var q = await DB.firestore(Collections.keys).doc('lastId').get();
    int id = q.data()!['id'];
    DB.firestore(Collections.keys).doc('lastId').set({'id': id + 1});
    return id.toString();
  }

  static Future deleteRealState({
    required RealState realState,
  }) async {
    await DB.firestore(Collections.biens).doc(realState.id).delete();
  }
}

String categorieToPresentationPlural(String categorie) {
  Map<String, String> map = {
    Categories.chambres: "Appartements",
    Categories.boutiques: "Locaux Commerciaux",
    Categories.maisons: "Maisons",
    Categories.terrains: "Terrains",
    Categories.bureau: "Espaces de travail"
  };
  return map[categorie]!;
}

String categorieToPresentationSingle(String categorie) {
  Map<String, String> map = {
    Categories.chambres: "Appartement",
    Categories.boutiques: "Local Commercial",
    Categories.maisons: "Maison",
    Categories.terrains: "Terrain",
    Categories.bureau: "Espace de travail"
  };
  return map[categorie]!;
}
