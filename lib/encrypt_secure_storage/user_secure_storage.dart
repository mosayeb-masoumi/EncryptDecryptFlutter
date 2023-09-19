import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static final _storage = FlutterSecureStorage();

  static const _keyUserName = "username";
  static const _keyList = "keylist";
  static const _keyDate = "keydate";


  /*            get set encrypted String            */
  // set String
  static Future setUserName(String userName) async =>
      await _storage.write(key: _keyUserName, value: userName);

  // get String
  static Future<String?> getUserName() async =>
      await _storage.read(key: _keyUserName);





  /*            get set encrypted list            */
  //set list
  static Future setList(List<String> list) async{
    final value = json.encode(list);
    await _storage.write(key: _keyList, value: value);
  }

  //get list
   static Future<List<String>?> getList() async {
      final value = await _storage.read(key: _keyList);
      return value == null ? null : List<String>.from(json.decode(value));
   }


  ////////////////////////  get set encrypted Date    ////////////////////////////////
  //set Date
  static Future setDate(DateTime birthDay) async {
    final birthday= birthDay.toIso8601String();
    await _storage.write(key: _keyDate, value: birthday);
  }

  //get Dte
  static Future<DateTime?> getDate() async {
    final date = await _storage.read(key: _keyDate);
    return date == null ? null : DateTime.tryParse(date);
  }
}
