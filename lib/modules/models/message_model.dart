class ChatMessageModel {
  late String content, timeInfo;
  
  ChatMessageModel({
    required this.content,
    required this.timeInfo
    }
  );

  //Burada veritabanından gelen veri dart nesnesine çevriliyor.
   ChatMessageModel.fromMap(Map<String, dynamic> map){
   content = map['content'];
   timeInfo = map['timeInfo']; 
  }

  //Burada veri tabanına göndereceğimiz nesneyi (js nesnesi esasen) çeviriyoruz
   Map<String, dynamic> toMap(){
     return {
       'content' : content,
       'timeInfo' : timeInfo,
     };
   }
}