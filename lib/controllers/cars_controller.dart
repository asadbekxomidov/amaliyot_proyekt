import 'dart:io';

import 'package:amaliyot_proyekt/service/cars_firebase_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CarsController with ChangeNotifier {
  final _carsFirebaseService = CarsFirebaseService();

  Stream<QuerySnapshot> get list async* {
    yield* _carsFirebaseService.getCars();
  }

  Future<void> addCar(String name, File imageFile) async {
    await _carsFirebaseService.addCar(name, imageFile);
  }
}
