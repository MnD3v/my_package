import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:my_widgets/others/general_functions.dart';

abstract class DB {
  static CollectionReference<Map<String, dynamic>> firestore(collection) =>
      FirebaseFirestore.instance.collection(collection);

  static bool waiting(snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return true;
    }
    return false;
  }

  static bool hasError(snapshot) {
    if (snapshot.hasError) {
      return true;
    }
    return false;
  }
}

abstract class FStorage {
  static Future<String> putFile(File file) async {
    final id = GFunctions.timeId;
    await FirebaseStorage.instance
        .ref('images')
        .child(id + '.jpg')
        .putFile(file);
    return await FirebaseStorage.instance
        .ref('images')
        .child(id + '.jpg')
        .getDownloadURL();
  }

 static String extractFileName(String url) {
    final uri = Uri.parse(url);
    final pathSegments = uri.pathSegments;
    final fileName = pathSegments.last.split('%2F').last;
    return fileName;
  }

 static Future<void> deleteImage(imageUrl) async {
    try {
      final filePath = extractFileName(imageUrl);
    
      final storageRef = FirebaseStorage.instance.ref().child(filePath);
      await storageRef.delete();

      print('Image supprimée avec succès');
    } catch (e) {
      print('Erreur lors de la suppression de l\'image : $e');
    }
  }
}
