import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future checkNetworkStatus(BuildContext context) async {

  bool status = false;

  try {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      status = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      status = true;
    }
  } catch (e) {
    print(e);
  }

  return status;
}