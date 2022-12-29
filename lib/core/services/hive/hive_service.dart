import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'hive_service.g.dart';

//Controllers

class LocalStorageWithHive {
  Future hiveInit() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ChatMessageHiveModelAdapter());
    Hive.registerAdapter(ProfileDataHiveModelAdapter());
    Box box = await Hive.openBox<ChatMessageHiveModel>("test");
    //await box.putAt(0, ChatMessageHiveModel(contant: "Adeeeeem"));
    //await box.putAt(1, ChatMessageHiveModel(contant: "ercaaaan"));
    await box.put(
        "dd", ChatMessageHiveModel(contant: "Merhaba Lan Naber Hiveciler"));

    //box.put('name', 'Adem');
    //box.put('surname', 'ERCAN');
    ChatMessageHiveModel a = box.get("dd");

    print("isim: " + a.contant.toString());
  }
}

//MODELS

@HiveType(typeId: 0)
class ChatMessageHiveModel extends HiveObject {
  @HiveField(0)
  String? contant;
  @HiveField(1)
  String? clock;

  ChatMessageHiveModel({this.contant, this.clock});
}

@HiveType(typeId: 1)
class ProfileDataHiveModel extends HiveObject {
  @HiveField(0)
  String? userName;
  @HiveField(1)
  String? email;
  
  ProfileDataHiveModel({this.userName, this.email});
}
