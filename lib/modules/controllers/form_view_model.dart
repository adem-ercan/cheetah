import 'package:cheetah/modules/controllers/user_view_model.dart';
import 'package:cheetah/modules/models/user_model.dart';
import 'package:cheetah/view/components/snackbar_cheetah.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormViewModel with ChangeNotifier {
  late String _email, _password, _confirmPassword, _name;
  late String _emailLogin, _passwordLogin;
  final List<int> idWillSentToForm = [1, 2, 3, 4, 5, 6];
  late UserModelView _userModelView;

  formValidate(String? value, int fieldId) {
    if (value == null || value.isEmpty) {
      if (fieldId == 1) {
        return 'Enter your full name';
      } else if (fieldId == 2) {
        return 'Enter your email address';
      } else if (fieldId == 3) {
        return 'Enter password';
      } else if (fieldId == 4) {
        return 'Confirm password';
      } else if (fieldId == 5) {
        return 'Enter your email address';
      } else if (fieldId == 6) {
        return 'Enter your password';
      }
    }
    return null;
  }

  onChange(String? value, GlobalKey<FormState> formKey) {
    if (value != null) {
      formKey.currentState!.validate();
      return null;
    }
  }

  onSave(String value, int fieldId) {
    if (fieldId == 1) {
      _name = value;
    } else if (fieldId == 2) {
      _email = value;
    } else if (fieldId == 3) {
      _password = value;
    } else if (fieldId == 4) {
      _confirmPassword = value;
    } else if (fieldId == 5) {
      _emailLogin = value;
    } else if (fieldId == 6) {
      _passwordLogin = value;
    }
  }

  void formSaveAndSignUp(
      GlobalKey<FormState> formKey, BuildContext context) async {
    _userModelView = Provider.of<UserModelView>(context, listen: false);
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      UserCheetah? _userCheetah = await _userModelView
          .createUserWithEmailAndPassword(_email, _password, _name);
      debugPrint(_userCheetah!.email);
    }
  }

  void signInWithEmailAndPassword(
      GlobalKey<FormState> formKey, BuildContext context) async {
    _userModelView = Provider.of<UserModelView>(context, listen: false);
    debugPrint("Hey gidi hey!");

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      _userModelView.getCurrentContext(context);
      UserCheetah? _userCheetah = await _userModelView
          .signInWithEmailAndPassword(_emailLogin, _passwordLogin);
      if (_userModelView.responseAuthentication ==
          ResponseAuthentication.userNotFound) {
       

        SnackBar snackBar = CheetahSnackBar.build("Deneme", "Undo", () {
          debugPrint("boklu gibi çalıştı");
        });

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      debugPrint("burası çalıştı: " + _userCheetah!.email.toString());
    }
  }
}
