import 'dart:convert';


class Update {
  String version;
  bool? optionel;
  Update({
    required this.version,
    this.optionel,
  });

  Update copyWith({
    String? version,
    bool? optionel,
  }) {
    return Update(
      version: version ?? this.version,
      optionel: optionel ?? this.optionel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'version': version,
      'optionel': optionel,
    };
  }

  factory Update.fromMap(Map<String, dynamic> map) {
    return Update(
      version: map['version'] as String,
      optionel: map['optionel'] != null ? map['optionel'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Update.fromJson(String source) =>
      Update.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Update(version: $version, optionel: $optionel)';

  @override
  bool operator ==(covariant Update other) {
    if (identical(this, other)) return true;

    return other.version == version && other.optionel == optionel;
  }

  @override
  int get hashCode => version.hashCode ^ optionel.hashCode;
}
