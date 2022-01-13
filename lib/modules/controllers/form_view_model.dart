import 'package:cheetah/modules/controllers/locator.dart';
import 'package:cheetah/modules/controllers/user_view_model.dart';
import 'package:cheetah/modules/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';



class FormViewModel with ChangeNotifier {

  late String _name, _email, _password, _confirmPassword;
  String? _emailLogin, _passwordLogin;
  final List<int> fieldNumberIdList = [1,2,3,4];

  final UserModelView _userModelView = locator<UserModelView>();

formNameValidate(String? value){
    if (value == null || value.isEmpty) {
      return 'Enter your first name';
    }
    return null;
  }

  onChange(String? value, GlobalKey<FormState> formKey){

    if(value != null){
      debugPrint("onChange çalıştı");
      formKey.currentState!.validate();
      return null;
    }
  }

  onSave(String value, int fieldId){
    if(fieldId==1){
      _name = value;
    }else if(fieldId==2){
      _email = value;
    }else if(fieldId==3){
      _password = value;
    }else if(fieldId==4){
      _confirmPassword = value;
    }
  }

  void formSave(GlobalKey<FormState> formKey) async {
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      UserCheetah _userCheetah = await _userModelView.createUserWithEmailAndPassword(_email,_password);
      debugPrint(_userCheetah.email);
    }
  }
}