class FormValidator {
  static RegExp _email = new RegExp(
      r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");

  // RegExp _alpha = new RegExp(r'^[a-zA-Z]+$');
  // RegExp _alphanumeric = new RegExp(r'^[a-zA-Z0-9]+$');
  static RegExp _numeric = new RegExp(r'^-?[0-9]+$');

  static RegExp _decimal = RegExp('[0-9]+(\.[0-9]{1,2})?\$');

  static RegExp _number = RegExp('^\\d*\$');

  static String validateString(String value) {
    if (value.isEmpty) {
      return "Name is required.";
    }
    return null;
  }

  static String validateName(String value) {
    if (value.isEmpty) {
      return "Name is required.";
    }
    if (value.isNotEmpty && value.length < 6) {
      return "Name minimum 6 characters length.";
    }
    return null;
  }

  static String validateEmail(String value) {
    if (value.isEmpty) {
      return "Email is required.";
    } else {
      if (_email.hasMatch(value.toLowerCase())) {
        return null;
      } else {
        return "Invalid email.";
      }
    }
  }

  static String validateDecimal(String value){
    if(value.isEmpty){
     return "Should not be empty";
    }else{
      if(_decimal.hasMatch(value)){
        return null;
      }else{
        return "Invalid Input";
      }
    }
  }

  static String validateNumber(String value){
    if(value.isEmpty){
      return "Should not be empty";
    }else{
      if(_number.hasMatch(value)){
        return null;
      }else{
        return "Invalid Input";
      }
    }
  }

  static String validateMobile(String value) {
    if (value.isEmpty) {
      return "Mobile is required.";
    } else {
      if (_numeric.hasMatch(value)) {
        if (value.length != 10) {
          return "Mobile number 10 digits length.";
        } else {
          return null;
        }
      } else {
        return "Only allowed numbers.";
      }
    }
  }

  static String validatePassword(String value) {
    if (value.isEmpty) {
      return "Password is required.";
    } else {
      if (value.length < 6) {
        return "Password is too short.";
      }
      return null;
    }
  }

  static String validateReTypePassword(String password, String retypePassword) {
    if (password != retypePassword) {
      return "Retype password mismatch.";
    }
    return null;
  }



}
