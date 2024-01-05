import 'package:untitled/core/util/secured_box_util/secured_box.dart';

enum ActiveUserConstant{
  accessToken ,
  id ,
  name ,
  email ,
  accountGroupId ,
  timeUpTopNumber ,
  limitImageUpload ,
  autoApprove ,
}

extension ValueExtension on ActiveUserConstant{
  String get value{
    switch(this) {
      case ActiveUserConstant.accessToken:
        return "ACCESS_TOKEN";
      case ActiveUserConstant.id:
        return "ID";
      case ActiveUserConstant.name:
        return "NAME";
      case ActiveUserConstant.email:
        return "EMAIL";
      case ActiveUserConstant.accountGroupId:
        return "ACCOUNT_GROUP_ID";
      case ActiveUserConstant.timeUpTopNumber:
        return "TIME_UP_TOP_NUMBER";
      case ActiveUserConstant.limitImageUpload:
        return "LIMIT_IMAGE_UPLOAD";
      case ActiveUserConstant.autoApprove:
        return "AUTO_APPROVE";
    }
  }
}

class ActiveUser{
  ActiveUser._();


  static Future<String> readKey(ActiveUserConstant key) async{
    final data = await SecuredBox.readSecured(key.value);
    return data;
  }

  static Future<bool> writeKey(ActiveUserConstant key, String value) async{
    final result = await SecuredBox.writeToSecured(key.value, value);
    return result;
  }

}