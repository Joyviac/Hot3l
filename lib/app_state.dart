import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _selected = false;
  bool get selected => _selected;
  set selected(bool _value) {
    _selected = _value;
  }

  String _Ville = 'Paris';
  String get Ville => _Ville;
  set Ville(String _value) {
    _Ville = _value;
  }

  String _checkoutdate = '2024-05-20';
  String get checkoutdate => _checkoutdate;
  set checkoutdate(String _value) {
    _checkoutdate = _value;
  }

  String _checkindate = '2024-05-19';
  String get checkindate => _checkindate;
  set checkindate(String _value) {
    _checkindate = _value;
  }
}
