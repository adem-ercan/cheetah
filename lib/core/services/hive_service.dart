import 'package:hive/hive.dart';
part 'hive_service.g.dart';

class LocalStorageWithHive {
  var box = Hive.box('myBox');
}

@HiveType(typeId: 0)
class ChatMessageHiveModel extends HiveObject {
  @HiveField(0)
  String? contant;
  String? clock;

  ChatMessageHiveModel({this.contant});
}
