import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:otail/global/api_configuration.dart';
import 'package:otail/global/http_web_call.dart';
import 'package:otail/models/statewise.dart';

class StateWiseServices {
  HttpWebCall _webCall = HttpWebCall();

   Future<List<StateWise>> fetchStateWiseData() async {
    try {
      var response =
          await _webCall.get(APIConfiguration.jsonDataCovidStateWise);
      if (response != null) {
        var responseJson = json.decode(response);
        return stateWiseFromJson(responseJson['statewise']);
      } else {
        return null;
      }
    } catch (e) {
      return e;
    }
  }
}
