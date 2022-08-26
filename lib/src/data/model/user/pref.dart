import 'package:hive/hive.dart';

part 'pref.g.dart';

@HiveType(typeId: 0)
class UserPref extends HiveObject {

  @HiveField(0)
  String prefDesc;

  @HiveField(1)
  String createdAt;

  @HiveField(2)
  String updatedAt;

  @HiveField(3)
  bool status;

  UserPref({
    required this.prefDesc,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
  });
}
