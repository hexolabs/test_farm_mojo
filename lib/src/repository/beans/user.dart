import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:jaguar_query/jaguar_query.dart';

part 'user.jorm.dart';

class User {
  User();

  User.make(
      {this.id,
      this.name,
      this.contactName,
      this.email,
      this.mobile,
      this.role});

  static User fromJson(dynamic json) => User.make(
      id: json["id"],
      name: json["name"],
      contactName: json["contact_name"],
      email: json["email"],
      mobile: json['mobile'],
      role: json['role']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        "id": this.id,
        "name": this.name,
        "contact_name": this.contactName,
        "email": this.email,
        "mobile": this.mobile,
        "role": this.role,
      };

  @PrimaryKey(name: "id")
  String id;

  @Column(isNullable: false)
  String name;

  @Column(isNullable: false)
  String contactName;

  @Column(isNullable: true)
  String email;

  @Column(isNullable: false)
  String mobile;
  @Column(isNullable: false)
  String role;

  static const String tableName = 'user';

  @override
  String toString() {
    return "User($id, $name, $contactName, $email, $mobile, $role)";
  }
}

@GenBean()
class UserBean extends Bean<User> with _UserBean {
  UserBean(Adapter adapter) : super(adapter);

  final String tableName = "user";
}
