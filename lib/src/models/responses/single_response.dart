import 'package:json_annotation/json_annotation.dart';
import 'package:quick_eats/src/models/create_account_user.dart';


@JsonSerializable()
 class SingleResponse {
   bool didError;
   String message;
   dynamic error;
   String accessToken;
   CreateAccountUser user;
   dynamic model;

   bool isDidError() {
    return didError;
  }

  /* void setDidError(bool didError) {
    this.didError = didError;
  }*/

   String getMessage() {
    return message;
  }

  String getError() {
    return error;
  }

  /* void setMessage(String message) {
    this.message = message;
  }*/
    getUser(){
      return user;
    }
   getModel() {
    return model;
  }

   /*void setModel(model) {
    this.model = model;
  }*/
   fromJson(Map<String, dynamic> json) {
     return SingleResponse()
       ..didError = json['didError'] as bool
       ..message = json['message'] as String
       ..accessToken = json['access_token'] as String
       ..error = json['error'] is bool ? json['error'] as bool : json['error'] as String
       ..model = json['model']
       ..user = json['user']!=null ? CreateAccountUser.fromJson(json['user']) : null;
   }
   
}