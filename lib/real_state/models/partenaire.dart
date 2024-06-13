// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:my_widgets/others/db.dart';
import 'package:my_widgets/real_state/models/sub_class.dart';
import 'package:my_widgets/real_state/other/collections.dart';

class Partenaire {
  static var currentPartenaire = Rx<Partenaire?>(null);
  Telephone telephone;
  String? role;
  String nomCommercial;
  String? region;
  String? ville;
  String? quartier;
  String? email;
  String? localisationDescription;
  Localisation? localisation;
  String password;
  String nomPdg;
  String prenomPdg;
  String? description;
  String? profil;
  String? couverture;
  String? siteInternet;
  String? horaires;
  ReseauxSociaux? reseauxSociaux;
  String? token;
  List<Collaborateur>? collaborateurs;
  Map<String, dynamic> abonnements;
  bool? authorized;
  Legalite? legalite;
  LegaliteVerified legaliteVerified;

  Partenaire({
    required this.telephone,
    this.role,
    required this.nomCommercial,
    this.region,
    this.ville,
    this.quartier,
    this.email,
    this.localisationDescription,
    this.localisation,
    required this.password,
    required this.nomPdg,
    required this.prenomPdg,
    this.description,
    this.profil,
    this.couverture,
    this.siteInternet,
    this.horaires,
    this.reseauxSociaux,
    this.token,
    this.collaborateurs,
    required this.abonnements,
    required this.authorized,
    this.legalite,
    required this.legaliteVerified,
  });

  static Future<void> setPartenaire() async {
    currentPartenaire.value == null
        ? null
        : await DB
            .firestore(Collections.partenaires)
            .doc(currentPartenaire.value!.telephone.numero)
            .set(currentPartenaire.value!.toMap());
  }

  static refreshToken() async {
    var token = await FirebaseMessaging.instance.getToken();
    currentPartenaire.value?.token = token;
    setPartenaire();
  }

  static getPartenaire(email) async {
    var numero = email.split('@')[0];
    var q = await DB.firestore(Collections.partenaires).doc(numero).get();
    Partenaire.currentPartenaire.value = Partenaire.fromMap(q.data()!);
    var token = await FirebaseMessaging.instance.getToken();
    currentPartenaire.value?.token = token;
    setPartenaire();
  }

  static Partenaire get empty {
    return Partenaire(
      legaliteVerified: LegaliteVerified(nom: "", verfied: false),
      authorized: false,
      abonnements: {
        "3": DateTime.now().toString(),
        "2": DateTime.now().toString(),
        "1": DateTime.now().toString(),
      },
      telephone: Telephone(numero: nullString, indicatif: "+228"),
      nomCommercial: nullString,
      password: nullString,
      nomPdg: nullString,
      prenomPdg: nullString,
    );
  }

  Partenaire copyWith({
    Telephone? telephone,
    String? role,
    String? nomCommercial,
    String? region,
    String? ville,
    String? quartier,
    String? email,
    String? localisationDescription,
    Localisation? localisation,
    String? password,
    String? nomPdg,
    String? prenomPdg,
    String? description,
    String? profil,
    String? couverture,
    String? siteInternet,
    String? horaires,
    ReseauxSociaux? reseauxSociaux,
    String? token,
    List<Collaborateur>? collaborateurs,
    Map<String, dynamic>? abonnements,
    bool? authorized,
    Legalite? legalite,
    LegaliteVerified? legaliteVerified,
  }) {
    return Partenaire(
      telephone: telephone ?? this.telephone,
      role: role ?? this.role,
      nomCommercial: nomCommercial ?? this.nomCommercial,
      region: region ?? this.region,
      ville: ville ?? this.ville,
      quartier: quartier ?? this.quartier,
      email: email ?? this.email,
      localisationDescription:
          localisationDescription ?? this.localisationDescription,
      localisation: localisation ?? this.localisation,
      password: password ?? this.password,
      nomPdg: nomPdg ?? this.nomPdg,
      prenomPdg: prenomPdg ?? this.prenomPdg,
      description: description ?? this.description,
      profil: profil ?? this.profil,
      couverture: couverture ?? this.couverture,
      siteInternet: siteInternet ?? this.siteInternet,
      horaires: horaires ?? this.horaires,
      reseauxSociaux: reseauxSociaux ?? this.reseauxSociaux,
      token: token ?? this.token,
      collaborateurs: collaborateurs ?? this.collaborateurs,
      abonnements: abonnements ?? this.abonnements,
      authorized: authorized ?? this.authorized,
      legalite: legalite ?? this.legalite,
      legaliteVerified: legaliteVerified ?? this.legaliteVerified,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'telephone': telephone.toMap(),
      'role': role,
      'nomCommercial': nomCommercial,
      'region': region,
      'ville': ville,
      'quartier': quartier,
      'email': email,
      'localisationDescription': localisationDescription,
      'localisation': localisation?.toMap(),
      'password': password,
      'nomPdg': nomPdg,
      'prenomPdg': prenomPdg,
      'description': description,
      'profil': profil,
      'couverture': couverture,
      'siteInternet': siteInternet,
      'horaires': horaires,
      'reseauxSociaux': reseauxSociaux?.toMap(),
      'token': token,
      'collaborateurs': collaborateurs?.map((element) => element.toMap()),
      'abonnements': abonnements,
      'authorized': authorized,
      'legalite': legalite?.toMap(),
      'legaliteVerified': legaliteVerified.toMap(),
    };
  }

  factory Partenaire.fromMap(Map<String, dynamic> map) {
    return Partenaire(
      telephone: Telephone.fromMap(map['telephone'] as Map<String, dynamic>),
      role: map['role'] != null ? map['role'] as String : null,
      nomCommercial: map['nomCommercial'] as String,
      region: map['region'] != null ? map['region'] as String : null,
      ville: map['ville'] != null ? map['ville'] as String : null,
      quartier: map['quartier'] != null ? map['quartier'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      localisationDescription: map['localisationDescription'] != null
          ? map['localisationDescription'] as String
          : null,
      localisation: map['localisation'] != null
          ? Localisation.fromMap(map['localisation'] as Map<String, dynamic>)
          : null,
      password: map['password'] as String,
      nomPdg: map['nomPdg'] as String,
      prenomPdg: map['prenomPdg'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      profil: map['profil'] != null ? map['profil'] as String : null,
      couverture:
          map['couverture'] != null ? map['couverture'] as String : null,
      siteInternet:
          map['siteInternet'] != null ? map['siteInternet'] as String : null,
      horaires: map['horaires'] != null ? map['horaires'] as String : null,
      reseauxSociaux: map['reseauxSociaux'] != null
          ? ReseauxSociaux.fromMap(
              map['reseauxSociaux'] as Map<String, dynamic>)
          : null,
      token: map['token'] != null ? map['token'] as String : null,
      collaborateurs: map['collaborateurs'] != null
          ? (map['collaborateurs'] as List)
              .map((element) => Collaborateur.fromMap(element))
              .toList()
          : null,
      abonnements: Map<String, dynamic>.from((map['abonnements'])),
      authorized: map['authorized'] != null ? map['authorized'] as bool : null,
      legalite: map['legalite'] != null
          ? Legalite.fromMap(map['legalite'] as Map<String, dynamic>)
          : null,
      legaliteVerified: LegaliteVerified.fromMap(
          map['legaliteVerified'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Partenaire.fromJson(String source) =>
      Partenaire.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Partenaire(telephone: $telephone, role: $role, nomCommercial: $nomCommercial, region: $region, ville: $ville, quartier: $quartier, email: $email, localisationDescription: $localisationDescription, localisation: $localisation, password: $password, nomPdg: $nomPdg, prenomPdg: $prenomPdg, description: $description, profil: $profil, couverture: $couverture, siteInternet: $siteInternet, horaires: $horaires, reseauxSociaux: $reseauxSociaux, token: $token, collaborateurs: $collaborateurs, abonnements: $abonnements, authorized: $authorized, legalite: $legalite, legaliteVerified: $legaliteVerified)';
  }

  @override
  bool operator ==(covariant Partenaire other) {
    if (identical(this, other)) return true;
    final collectionEquals = const DeepCollectionEquality().equals;

    return other.telephone == telephone &&
        other.role == role &&
        other.nomCommercial == nomCommercial &&
        other.region == region &&
        other.ville == ville &&
        other.quartier == quartier &&
        other.email == email &&
        other.localisationDescription == localisationDescription &&
        other.localisation == localisation &&
        other.password == password &&
        other.nomPdg == nomPdg &&
        other.prenomPdg == prenomPdg &&
        other.description == description &&
        other.profil == profil &&
        other.couverture == couverture &&
        other.siteInternet == siteInternet &&
        other.horaires == horaires &&
        other.reseauxSociaux == reseauxSociaux &&
        other.token == token &&
        collectionEquals(other.collaborateurs, collaborateurs) &&
        collectionEquals(other.abonnements, abonnements) &&
        other.authorized == authorized &&
        other.legalite == legalite &&
        other.legaliteVerified == legaliteVerified;
  }

  @override
  int get hashCode {
    return telephone.hashCode ^
        role.hashCode ^
        nomCommercial.hashCode ^
        region.hashCode ^
        ville.hashCode ^
        quartier.hashCode ^
        email.hashCode ^
        localisationDescription.hashCode ^
        localisation.hashCode ^
        password.hashCode ^
        nomPdg.hashCode ^
        prenomPdg.hashCode ^
        description.hashCode ^
        profil.hashCode ^
        couverture.hashCode ^
        siteInternet.hashCode ^
        horaires.hashCode ^
        reseauxSociaux.hashCode ^
        token.hashCode ^
        collaborateurs.hashCode ^
        abonnements.hashCode ^
        authorized.hashCode ^
        legalite.hashCode ^
        legaliteVerified.hashCode;
  }
}

class Collaborateur {
  String nom;
  String role;
  String profile;
  Collaborateur({
    required this.nom,
    required this.role,
    required this.profile,
  });

  Collaborateur copyWith({
    String? nom,
    String? role,
    String? profile,
  }) {
    return Collaborateur(
      nom: nom ?? this.nom,
      role: role ?? this.role,
      profile: profile ?? this.profile,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nom': nom,
      'role': role,
      'profile': profile,
    };
  }

  factory Collaborateur.fromMap(Map<String, dynamic> map) {
    return Collaborateur(
      nom: map['nom'] as String,
      role: map['role'] as String,
      profile: map['profile'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Collaborateur.fromJson(String source) =>
      Collaborateur.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Collaborateur(nom: $nom, role: $role, profile: $profile)';

  @override
  bool operator ==(covariant Collaborateur other) {
    if (identical(this, other)) return true;

    return other.nom == nom && other.role == role && other.profile == profile;
  }

  @override
  int get hashCode => nom.hashCode ^ role.hashCode ^ profile.hashCode;
}
