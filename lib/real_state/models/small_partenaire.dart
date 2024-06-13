// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SmallPartenaire {
  String id;
  String nom;
  String localisationDescription;
  String role;
  String? profil;
  SmallPartenaire({
    required this.id,
    required this.nom,
    required this.localisationDescription,
    required this.role,
    required this.profil,
  });
  

  SmallPartenaire copyWith({
    String? id,
    String? nom,
    String? localisationDescription,
    String? role,
    String? profil,
  }) {
    return SmallPartenaire(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      localisationDescription: localisationDescription ?? this.localisationDescription,
      role: role ?? this.role,
      profil: profil ?? this.profil,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nom': nom,
      'localisationDescription': localisationDescription,
      'role': role,
      'profil': profil,
    };
  }

  factory SmallPartenaire.fromMap(Map<String, dynamic> map) {
    return SmallPartenaire(
      id: map['id'] as String,
      nom: map['nom'] as String,
      localisationDescription: map['localisationDescription'] as String,
      role: map['role']??"Agence immobilière",
      profil: map['profil'] != null ? map['profil'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SmallPartenaire.fromJson(String source) => SmallPartenaire.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SmallPartenaire(id: $id, nom: $nom, localisationDescription: $localisationDescription, role: $role, profil: $profil)';
  }

  @override
  bool operator ==(covariant SmallPartenaire other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.nom == nom &&
      other.localisationDescription == localisationDescription &&
      other.role == role &&
      other.profil == profil;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      nom.hashCode ^
      localisationDescription.hashCode ^
      role.hashCode ^
      profil.hashCode;
  }
  }
