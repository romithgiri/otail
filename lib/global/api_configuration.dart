import 'package:otail/values/AppConstant.dart';

class APIConfiguration{

  static String url = AppConstants.getWebUrl(WebUrls.TEST);
  static String urlAttachments = AppConstants.getWebUrlAttachments(WebUrls.TEST);

  static String jsonDataCovidStateWise = url + "data.json";

  static String loginUser = url + "login/loginUser";
  static String registerUser = url + "registerUser";

}
