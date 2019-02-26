import 'dart:async';

import 'package:FarmMojo/src/repository/beans/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';

class DbStorage {
  SqfliteAdapter _adapter;
  UserBean _userBean;
  bool _tableInitialized = false;

  DbStorage();


  Future<void> _initializeTables() async {
    var databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'farm_mojo.db');
    _adapter = SqfliteAdapter(dbPath, version: 1);

    await Sqflite.setDebugModeOn(true);
    await _adapter.connect();

    _userBean = UserBean(_adapter);

/*    _userBean.removeAll();
    _userBean.drop();*/

    _userBean.createTable(ifNotExists: true);
  }

  Future<User> getUser() async {
    if (!_tableInitialized) {
      await _initializeTables();
      _tableInitialized = true;
    }

    final List<User> user = await _userBean.getAll();
    return user.length > 0 ? user.first : null;
  }

  Future<void> saveUser(User user) async {
    await _userBean.insert(user);
  }

  Future<void> removeUser() async {
    await _userBean.removeAll();
  }

  Future<void> close() async {
    if (_adapter != null) await _adapter.close();
  }
}
