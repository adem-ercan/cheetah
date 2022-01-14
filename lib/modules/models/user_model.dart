
class UserCheetah {
   String? userID;
   String? email;
   String? userName;
   String? profilePhotoURL;


  UserCheetah({
    required this.userID,
    required this.email,
    this.userName,
    this.profilePhotoURL,
  });




  UserCheetah.fromMap(Map<String, dynamic> map){
   userID = map['userID'];
   email = map['email'];
   userName = map['userName'];
   profilePhotoURL = map['profilePhotoURL'];
  }

   Map<String, dynamic> toMap(){
     return {
       'userID' : userName,
       'email' : email,
       'userName' : userName,
       'profilePhotoURL' : profilePhotoURL,
     };
   }
}