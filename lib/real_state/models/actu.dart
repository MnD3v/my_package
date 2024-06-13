// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Actu {
  String categorie;
  String sujet;
  String title;
  String image;
  String date;
  String link;
  Actu({
    required this.categorie,
    required this.sujet,
    required this.title,
    required this.image,
    required this.date,
    required this.link,
  });

  Actu copyWith({
    String? categorie,
    String? sujet,
    String? title,
    String? image,
    String? date,
    String? link,
  }) {
    return Actu(
      categorie: categorie ?? this.categorie,
      sujet: sujet ?? this.sujet,
      title: title ?? this.title,
      image: image ?? this.image,
      date: date ?? this.date,
      link: link ?? this.link,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categorie': categorie,
      'sujet': sujet,
      'title': title,
      'image': image,
      'date': date,
      'link': link,
    };
  }

  factory Actu.fromMap(Map<String, dynamic> map) {
    return Actu(
      categorie: map['categorie'] as String,
      sujet: map['sujet'] as String,
      title: map['title'] as String,
      image: map['image'] as String,
      date: map['date'] as String,
      link: map['link'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Actu.fromJson(String source) =>
      Actu.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Actu(categorie: $categorie, sujet: $sujet, title: $title, image: $image, date: $date, link: $link)';
  }

  @override
  bool operator ==(covariant Actu other) {
    if (identical(this, other)) return true;

    return other.categorie == categorie &&
        other.sujet == sujet &&
        other.title == title &&
        other.image == image &&
        other.date == date &&
        other.link == link;
  }

  @override
  int get hashCode {
    return categorie.hashCode ^
        sujet.hashCode ^
        title.hashCode ^
        image.hashCode ^
        date.hashCode ^
        link.hashCode;
  }

  static Actu get empty {
    return Actu(
        categorie: "",
        sujet: "",
        title: "",
        image: "",
        date: DateTime.now().toString(),
        link: "");
  }
}
