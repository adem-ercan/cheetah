class UserCheetah {
  Map? chatContent;
  List<String>? friends;
  bool? isEmailVerify;
  String? userID;
  String? email;
  String? userName;
  String? phoneNumber;
  String? aboutMe;
  String? fullName;
  String? profilePhotoURL;
  String? documentURL;

  UserCheetah({
    required this.userID,
    required this.email,
    this.userName,
    this.profilePhotoURL,
    this.aboutMe,
    this.documentURL,
    this.fullName,
    this.phoneNumber,
  });

  UserCheetah.fromMap(Map<String, dynamic> map) {
    try {
      userID = map['userID'];
      email = map['email'];
      userName = map['userName'];
      profilePhotoURL = map['profilePhotoURL'] ??
          "https://pixabay.com/tr/vectors/bo%c5%9f-profil-resmi-gizemli-adam-avatar-973460/";
      chatContent = map['chatContent'];
      friends = map['friends'];
      isEmailVerify = map['isEmailVerify'];
    } catch (e) {
      print("hata lan hata: " + e.toString());
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'email': email,
      'userName': userName,
      'profilePhotoURL': profilePhotoURL ??
          "https://pixabay.com/tr/vectors/bo%c5%9f-profil-resmi-gizemli-adam-avatar-973460/",
    };
  }
}
