import 'package:flutter/cupertino.dart';
import 'package:testbank/modal/userlogmodal.dart';

class TestBankProvider extends ChangeNotifier {
  List<UserLogModel> _userliste = [];
  List<UserLogModel>? get myGetUserLog => _userliste;
  setNotifier() {
    notifyListeners();
  }
}
