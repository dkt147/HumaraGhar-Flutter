
import 'package:HumaraGhar/view/main_screen/home_view/home_view.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginController extends GetxController{

final formKey = GlobalKey<FormState>();



validateEmail(String email){
  if(GetUtils.isEmail(email)){
    return 'Email is not valid';
  }
    else if(email != EmailValidator.validate(email)){ 
    return 'Email is badly formated';
  }
  else{
    return null;
  }
}

validatePassword(String password){
  if(GetUtils.isNullOrBlank(password) == null){
    return 'Password is required';
  }
  else{
    return null;
  }
}




Future onLogin()async{
    
    if(formKey.currentState!.validate()){
      Get.put(HomeView());
    }else{
      return null;
    }
    
}

}