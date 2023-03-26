import 'package:cheetah/modules/models/error_catch_model.dart';
import 'package:cheetah/modules/controllers/locator.dart';
import 'package:cheetah/modules/controllers/user_view_model.dart';
import 'package:cheetah/modules/models/user_model.dart';
import 'package:cheetah/view/components/snackbar_cheetah.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormViewModel with ChangeNotifier {
  late String _email, _password, _confirmPassword, _name;
  late String _emailLogin, _passwordLogin;
  final List<int> idWillSentToForm = [1, 2, 3, 4, 5, 6];
  late UserModelView _userModelView;
  final CatchErrorService _catchErrorService = locator<CatchErrorService>();

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

      
    debugPrint("test register form ");
    _userModelView = Provider.of<UserModelView>(context, listen: false);
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      UserCheetah? _userCheetah = await _userModelView
          .createUserWithEmailAndPassword(_email, _password, _name);
      debugPrint(_userCheetah!.email);
      debugPrint("validate işlemi oldu");
    } else {
      debugPrint("validate işlemi olmadı");
    }
  }

  void signInWithEmailAndPassword(
      GlobalKey<FormState> formKey, BuildContext context) async {
    _userModelView = Provider.of<UserModelView>(context, listen: false);

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      _userModelView.getCurrentContext(context);
      UserCheetah? _userCheetah = await _userModelView
          .signInWithEmailAndPassword(_emailLogin, _passwordLogin);
      if (_userModelView.responseAuthentication ==
          ResponseAuthentication.userNotFound) {
        SnackBar snackBar = CheetahSnackBar.build(
            _catchErrorService.errorText ?? "Bir hata oluştu", "Undo", () {
          debugPrint("boklu gibi çalıştı");
        });
        SnackBar snackBarIsVerified = CheetahSnackBar.build(
            "Email is not verified!", "Now verify!", () {});

        if (_catchErrorService.errorCode != null)
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

        if (!_userModelView.isVerifiedEmail() &&
            _catchErrorService.errorCode == null) {
          ScaffoldMessenger.of(context).showSnackBar(snackBarIsVerified);
        }

        _catchErrorService.errorCode = null;
        _catchErrorService.errorText = null;
        /* showModalBottomSheet(
            context: context,
            builder: (BuildContext contxt) {
              return Container(
                height: 200,
                child: Text("BottomSheet Deneme"),
              );
            });*/
      }
      debugPrint("burası çalıştı: " + _userCheetah!.email.toString());
    }
  }

  Future<void> isAppFirstLaunch() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
  }
}
