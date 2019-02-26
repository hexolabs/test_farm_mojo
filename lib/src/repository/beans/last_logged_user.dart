import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:jaguar_query/jaguar_query.dart';

part 'last_logged_user.jorm.dart';

class LastLoggedUser {
  LastLoggedUser();

  LastLoggedUser.make(this.userName);

  static LastLoggedUser fromJson(dynamic json) =>
      LastLoggedUser.make(json["userName"] as String);

  Map<String, dynamic> toJson() => <String, dynamic>{
        "userName": this.userName,
      };

  @PrimaryKey()
  String userName;

  @override
  String toString() {
    return "LastLoginUser($userName)";
  }
}

@GenBean()
class LastLoggedUserBean extends Bean<LastLoggedUser> with _LastLoggedUserBean {
  LastLoggedUserBean(Adapter adapter) : super(adapter);

  final String tableName = "last_logged_user";
}
