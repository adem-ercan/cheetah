class ChatPageRenderDataModel {
  String userName, profilePhotoURL;
  ChatDialogCardModel? chatDialogCardModel;

  ChatPageRenderDataModel(
      {required this.userName,
      required this.profilePhotoURL,
      this.chatDialogCardModel});
}

class ChatDialogCardModel {
  Object chatContent;
  String time;
  String? userName;

  ChatDialogCardModel(
      {required this.chatContent, required this.time, this.userName});
}

class ChatConsoleData {
  Object content;
  ChatConsoleData({required this.content});
}
