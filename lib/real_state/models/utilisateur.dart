// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:my_widgets/real_state/other/collections.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class Utilisateur {
  String nom;
  String prenom;
  String region;
  String? country;
  String? token;
  String? dateLimiteAbonnement;
  String? monthPublications;
  String? notificationsSettings;
  String password;
  Telephone telephone;
  List<String>? favoris;
  Map<String, dynamic>? abonnements;
  Utilisateur({
    required this.nom,
    required this.prenom,
    required this.region,
    this.country,
    this.token,
    this.dateLimiteAbonnement,
    this.monthPublications,
    this.notificationsSettings,
    required this.password,
    required this.telephone,
    required this.favoris,
    this.abonnements,
  });

  Utilisateur copyWith({
    String? nom,
    String? prenom,
    String? region,
    String? country,
    String? token,
    String? dateLimiteAbonnement,
    String? monthPublications,
    String? notificationsSettings,
    String? password,
    Telephone? telephone,
    List<String>? favoris,
    Map<String, dynamic>? abonnements,
  }) {
    return Utilisateur(
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
      region: region ?? this.region,
      country: country ?? this.country,
      token: token ?? this.token,
      dateLimiteAbonnement: dateLimiteAbonnement ?? this.dateLimiteAbonnement,
      monthPublications: monthPublications ?? this.monthPublications,
      notificationsSettings:
          notificationsSettings ?? this.notificationsSettings,
      password: password ?? this.password,
      telephone: telephone ?? this.telephone,
      favoris: favoris ?? this.favoris,
      abonnements: abonnements ?? this.abonnements,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nom': nom,
      'prenom': prenom,
      'region': region,
      'country': country,
      'token': token,
      'dateLimiteAbonnement': dateLimiteAbonnement,
      'monthPublications': monthPublications,
      'notificationsSettings': notificationsSettings,
      'password': password,
      'telephone': telephone.toMap(),
      'favoris': favoris,
      'abonnements': abonnements,
    };
  }

  factory Utilisateur.fromMap(Map<String, dynamic> map) {
    return Utilisateur(
      nom: map['nom'] as String,
      prenom: map['prenom'] as String,
      region: map['region'] as String,
      country: map['country'] != null ? map['country'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
      dateLimiteAbonnement: map['dateLimiteAbonnement'] != null
          ? map['dateLimiteAbonnement'] as String
          : null,
      monthPublications: map['monthPublications'] != null
          ? map['monthPublications'] as String
          : null,
      notificationsSettings: map['notificationsSettings'] != null
          ? map['notificationsSettings'] as String
          : null,
      password: map['password'] as String,
      telephone: Telephone.fromMap(map['telephone'] as Map<String, dynamic>),
      favoris:
          map['favoris'] != null ? List<String>.from((map['favoris'])) : null,
      abonnements: map['abonnements'] != null
          ? Map<String, dynamic>.from(
              (map['abonnements'] as Map<String, dynamic>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Utilisateur.fromJson(String source) =>
      Utilisateur.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Utilisateur(nom: $nom, prenom: $prenom, region: $region, country: $country, token: $token, dateLimiteAbonnement: $dateLimiteAbonnement, monthPublications: $monthPublications, notificationsSettings: $notificationsSettings, password: $password, telephone: $telephone, favoris: $favoris, abonnements: $abonnements)';
  }

  @override
  bool operator ==(covariant Utilisateur other) {
    if (identical(this, other)) return true;
    final collectionEquals = const DeepCollectionEquality().equals;

    return other.nom == nom &&
        other.prenom == prenom &&
        other.region == region &&
        other.country == country &&
        other.token == token &&
        other.dateLimiteAbonnement == dateLimiteAbonnement &&
        other.monthPublications == monthPublications &&
        other.notificationsSettings == notificationsSettings &&
        other.password == password &&
        other.telephone == telephone &&
        collectionEquals(other.favoris, favoris) &&
        collectionEquals(other.abonnements, abonnements);
  }

  @override
  int get hashCode {
    return nom.hashCode ^
        prenom.hashCode ^
        region.hashCode ^
        country.hashCode ^
        token.hashCode ^
        dateLimiteAbonnement.hashCode ^
        monthPublications.hashCode ^
        notificationsSettings.hashCode ^
        password.hashCode ^
        telephone.hashCode ^
        favoris.hashCode ^
        abonnements.hashCode;
  }

  static Utilisateur get empty {
    const nullString = 'null';
    return Utilisateur(
        favoris: [],
        password: nullString,
        nom: nullString,
        prenom: nullString,
        region: nullString,
        telephone: Telephone(numero: nullString, indicatif: "+228"),
        abonnements: {});
  }

  static Future<void> setUser(Utilisateur user) async {
    Utilisateur.currentUser.value = user;
    await DB
        .firestore(Collections.utilistateurs)
        .doc(user.telephone.numero)
        .set(user.toMap());
  }

  static Future<void> getUser(String email) async {
    var numero = email.split('@')[0];
    var q = await DB.firestore(Collections.utilistateurs).doc(numero).get();
    Utilisateur.currentUser.value = Utilisateur.fromMap(q.data()!);
    var token = await FirebaseMessaging.instance.getToken();
    currentUser.value?.token = token;
    setUser(currentUser.value!);
  }

  static refreshToken() async {
    var token = await FirebaseMessaging.instance.getToken();
    currentUser.value?.token = token;
    currentUser.value == null ? null : setUser(currentUser.value!);
  }

  static setFavorite(String id) {
    currentUser.update((val) {
      if (currentUser.value!.favoris!.contains(id)) {
        val!.favoris?.remove(id);
      } else {
        val!.favoris?.add(id);
      }
    });
    setUser(currentUser.value!);
    print(id);
    print(currentUser.value!.favoris);
  }

  static var currentUser = Rx<Utilisateur?>(null);
}
