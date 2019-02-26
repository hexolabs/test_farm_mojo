// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_logged_user.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _LastLoggedUserBean implements Bean<LastLoggedUser> {
  final userName = StrField('user_name');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        userName.name: userName,
      };
  LastLoggedUser fromMap(Map map) {
    LastLoggedUser model = LastLoggedUser();
    model.userName = adapter.parseValue(map['user_name']);

    return model;
  }

  List<SetColumn> toSetColumns(LastLoggedUser model,
      {bool update = false, Set<String> only}) {
    List<SetColumn> ret = [];

    if (only == null) {
      ret.add(userName.set(model.userName));
    } else {
      if (only.contains(userName.name)) ret.add(userName.set(model.userName));
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists: false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addStr(userName.name, primary: true, isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(LastLoggedUser model) async {
    final Insert insert = inserter.setMany(toSetColumns(model));
    return adapter.insert(insert);
  }

  Future<void> insertMany(List<LastLoggedUser> models) async {
    final List<List<SetColumn>> data =
        models.map((model) => toSetColumns(model)).toList();
    final InsertMany insert = inserters.addAll(data);
    await adapter.insertMany(insert);
    return;
  }

  Future<dynamic> upsert(LastLoggedUser model) async {
    final Upsert upsert = upserter.setMany(toSetColumns(model));
    return adapter.upsert(upsert);
  }

  Future<void> upsertMany(List<LastLoggedUser> models) async {
    final List<List<SetColumn>> data = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(toSetColumns(model).toList());
    }
    final UpsertMany upsert = upserters.addAll(data);
    await adapter.upsertMany(upsert);
    return;
  }

  Future<int> update(LastLoggedUser model, {Set<String> only}) async {
    final Update update = updater
        .where(this.userName.eq(model.userName))
        .setMany(toSetColumns(model, only: only));
    return adapter.update(update);
  }

  Future<void> updateMany(List<LastLoggedUser> models) async {
    final List<List<SetColumn>> data = [];
    final List<Expression> where = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(toSetColumns(model).toList());
      where.add(this.userName.eq(model.userName));
    }
    final UpdateMany update = updaters.addAll(data, where);
    await adapter.updateMany(update);
    return;
  }

  Future<LastLoggedUser> find(String userName,
      {bool preload: false, bool cascade: false}) async {
    final Find find = finder.where(this.userName.eq(userName));
    return await findOne(find);
  }

  Future<int> remove(String userName) async {
    final Remove remove = remover.where(this.userName.eq(userName));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<LastLoggedUser> models) async {
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.userName.eq(model.userName));
    }
    return adapter.remove(remove);
  }
}
