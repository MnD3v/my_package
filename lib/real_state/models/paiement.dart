// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Paiement {
  String status;
  String txReference;
  String date;
  String phoneNumber;
  String categorie;
  //save this date if paiement success
  String dateLimite;
  Paiement({
    required this.status,
    required this.txReference,
    required this.date,
    required this.phoneNumber,
    required this.categorie,
    required this.dateLimite,
  });

  Paiement copyWith({
    String? status,
    String? txReference,
    String? date,
    String? phoneNumber,
    String? categorie,
    String? dateLimite,
  }) {
    return Paiement(
      status: status ?? this.status,
      txReference: txReference ?? this.txReference,
      date: date ?? this.date,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      categorie: categorie ?? this.categorie,
      dateLimite: dateLimite ?? this.dateLimite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'txReference': txReference,
      'date': date,
      'phoneNumber': phoneNumber,
      'categorie': categorie,
      'dateLimite': dateLimite,
    };
  }

  factory Paiement.fromMap(Map<String, dynamic> map) {
    return Paiement(
      status: map['status'] as String,
      txReference: map['txReference'] as String,
      date: map['date'] as String,
      phoneNumber: map['phoneNumber'] as String,
      categorie: map['categorie'] as String,
      dateLimite: map['dateLimite'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Paiement.fromJson(String source) =>
      Paiement.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Paiement(status: $status, txReference: $txReference, date: $date, phoneNumber: $phoneNumber, categorie: $categorie, dateLimite: $dateLimite)';
  }

  @override
  bool operator ==(covariant Paiement other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.txReference == txReference &&
      other.date == date &&
      other.phoneNumber == phoneNumber &&
      other.categorie == categorie &&
      other.dateLimite == dateLimite;
  }

  @override
  int get hashCode {
    return status.hashCode ^
      txReference.hashCode ^
      date.hashCode ^
      phoneNumber.hashCode ^
      categorie.hashCode ^
      dateLimite.hashCode;
  }

  static String waiting = 'waiting';
  static String failed = 'failed';
  static String done = 'done';
}
