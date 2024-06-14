import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class InternetConnectionChecker {
  final Connectivity connectivity;

  const InternetConnectionChecker(this.connectivity);

  Future<bool> hasInternet() async {
    if (kIsWeb) return true;
    if (Platform.isAndroid) {
      final connectivityResult = await connectivity.checkConnectivity();
      return connectivityResult != ConnectivityResult.none;
    } else {
      return true;
    }
  }
}
