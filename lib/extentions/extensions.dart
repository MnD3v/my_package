import 'package:flutter/material.dart';

extension SizedBoxHeight on num {
  SizedBox get h => SizedBox(
        height: toDouble(),
      );
}

extension SizedBoxWidth on num {
  SizedBox get w => SizedBox(
        width: toDouble(),
      );
}

extension IsNull on Object? {
  bool get isNul => this == null ? true : false;
}

extension IsNotNull on Object? {
  bool get isNotNul => this == null ? false : true;
}


bool IsNullString(value) {
  if (value == 'null' || value == '' || value == null) {
    return true;
  }
  return false;
}