
class UserCheetah {
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

  UserCheetah.fromMap(Map<String, dynamic> map){
   userID = map['userID'];
   email = map['email'];
   userName = map['userName'];
   profilePhotoURL = map['profilePhotoURL'];
  }

   Map<String, dynamic> toMap(){
     return {
       'userID' : userID,
       'email' : email,
       'userName' : userName,
       'profilePhotoURL' : profilePhotoURL,
     };
   }
}