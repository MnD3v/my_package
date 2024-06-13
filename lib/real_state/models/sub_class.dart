// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

class Localisation {
  double longitude;
  double latitude;
  Localisation({
    required this.longitude,
    required this.latitude,
  });

  Localisation copyWith({
    double? longitude,
    double? latitude,
  }) {
    return Localisation(
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'longitude': longitude,
      'latitude': latitude,
    };
  }

  factory Localisation.fromMap(Map<String, dynamic> map) {
    return Localisation(
      longitude: map['longitude'] as double,
      latitude: map['latitude'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Localisation.fromJson(String source) =>
      Localisation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Localisation(longitude: $longitude, latitude: $latitude)';

  @override
  bool operator ==(covariant Localisation other) {
    if (identical(this, other)) return true;

    return other.longitude == longitude && other.latitude == latitude;
  }

  @override
  int get hashCode => longitude.hashCode ^ latitude.hashCode;
}

class LogementDetails {
  int? nombrePieces;
  bool? meuble;
  LogementDetails({
    this.nombrePieces,
    this.meuble,
  });

  LogementDetails copyWith({
    int? nombrePieces,
    bool? meuble,
  }) {
    return LogementDetails(
      nombrePieces: nombrePieces ?? this.nombrePieces,
      meuble: meuble ?? this.meuble,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nombrePieces': nombrePieces,
      'meuble': meuble,
    };
  }

  factory LogementDetails.fromMap(Map<String, dynamic> map) {
    return LogementDetails(
      nombrePieces:
          map['nombrePieces'] != null ? map['nombrePieces'] as int : null,
      meuble: map['meuble'] != null ? map['meuble'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LogementDetails.fromJson(String source) =>
      LogementDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LogementDetails(nombrePieces: $nombrePieces, meuble: $meuble)';

  @override
  bool operator ==(covariant LogementDetails other) {
    if (identical(this, other)) return true;

    return other.nombrePieces == nombrePieces && other.meuble == meuble;
  }

  @override
  int get hashCode => nombrePieces.hashCode ^ meuble.hashCode;
}

class Telephone {
  String numero;
  String indicatif;
  Telephone({
    required this.numero,
    required this.indicatif,
  });

  Telephone copyWith({
    String? numero,
    String? indicatif,
  }) {
    return Telephone(
      numero: numero ?? this.numero,
      indicatif: indicatif ?? this.indicatif,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'numero': numero,
      'indicatif': indicatif,
    };
  }

  factory Telephone.fromMap(Map<String, dynamic> map) {
    return Telephone(
      numero: map['numero'] as String,
      indicatif: map['indicatif'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Telephone.fromJson(String source) =>
      Telephone.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Telephone(numero: $numero, indicatif: $indicatif)';

  @override
  bool operator ==(covariant Telephone other) {
    if (identical(this, other)) return true;

    return other.numero == numero && other.indicatif == indicatif;
  }

  @override
  int get hashCode => numero.hashCode ^ indicatif.hashCode;
}

class ReseauxSociaux {
  String? facebook;
  String? twitter;
  String? linkedIn;
  String? instagram;
  ReseauxSociaux({
    this.facebook,
    this.twitter,
    this.linkedIn,
    this.instagram,
  });

  ReseauxSociaux copyWith({
    String? facebook,
    String? twitter,
    String? linkedIn,
    String? instagram,
  }) {
    return ReseauxSociaux(
      facebook: facebook ?? this.facebook,
      twitter: twitter ?? this.twitter,
      linkedIn: linkedIn ?? this.linkedIn,
      instagram: instagram ?? this.instagram,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'facebook': facebook,
      'twitter': twitter,
      'linkedIn': linkedIn,
      'instagram': instagram,
    };
  }

  factory ReseauxSociaux.fromMap(Map<String, dynamic> map) {
    return ReseauxSociaux(
      facebook: map['facebook'] != null ? map['facebook'] as String : null,
      twitter: map['twitter'] != null ? map['twitter'] as String : null,
      linkedIn: map['linkedIn'] != null ? map['linkedIn'] as String : null,
      instagram: map['instagram'] != null ? map['instagram'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReseauxSociaux.fromJson(String source) =>
      ReseauxSociaux.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReseauxSociaux(facebook: $facebook, twitter: $twitter, linkedIn: $linkedIn, instagram: $instagram)';
  }

  @override
  bool operator ==(covariant ReseauxSociaux other) {
    if (identical(this, other)) return true;

    return other.facebook == facebook &&
        other.twitter == twitter &&
        other.linkedIn == linkedIn &&
        other.instagram == instagram;
  }

  @override
  int get hashCode {
    return facebook.hashCode ^
        twitter.hashCode ^
        linkedIn.hashCode ^
        instagram.hashCode;
  }
}

class Legalite {
  String nom;
  List<String> images;
  Legalite({
    required this.nom,
    required this.images,
  });

  Legalite copyWith({
    String? nom,
    List<String>? images,
  }) {
    return Legalite(
      nom: nom ?? this.nom,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nom': nom,
      'images': images,
    };
  }

  factory Legalite.fromMap(Map<String, dynamic> map) {
    return Legalite(
      nom: map['nom'] as String,
      images: List<String>.from((map['images'])),
    );
  }

  String toJson() => json.encode(toMap());

  factory Legalite.fromJson(String source) => Legalite.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Legalite(nom: $nom, images: $images)';

  @override
  bool operator ==(covariant Legalite other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return 
      other.nom == nom &&
      listEquals(other.images, images);
  }

  @override
  int get hashCode => nom.hashCode ^ images.hashCode;
}

class LegaliteVerified {
  String nom;
  bool verfied;
  LegaliteVerified({
    required this.nom,
    required this.verfied,
  });

  LegaliteVerified copyWith({
    String? nom,
    bool? verfied,
  }) {
    return LegaliteVerified(
      nom: nom ?? this.nom,
      verfied: verfied ?? this.verfied,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nom': nom,
      'verfied': verfied,
    };
  }

  factory LegaliteVerified.fromMap(Map<String, dynamic> map) {
    return LegaliteVerified(
      nom: map['nom'] as String,
      verfied: map['verfied'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory LegaliteVerified.fromJson(String source) => LegaliteVerified.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LegaliteVerified(nom: $nom, verfied: $verfied)';

  @override
  bool operator ==(covariant LegaliteVerified other) {
    if (identical(this, other)) return true;
  
    return 
      other.nom == nom &&
      other.verfied == verfied;
  }

  @override
  int get hashCode => nom.hashCode ^ verfied.hashCode;
}


class Status {
  static String refuse = "refuse";
  static String actif = "actif";
  static String inactif = "inactif";
}

