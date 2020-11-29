import 'package:get/state_manager.dart';
import 'package:otail/models/statewise.dart';
import 'package:otail/service/statewise_service.dart';

enum ApiAction{
  getData
}

class SateWiseDataController extends GetxController{
  var isLoading = true.obs;
  var dataFromServer = List<StateWise>().obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void apiOperation(ApiAction action) async{
    if(action == ApiAction.getData){
      getData();
    }
  }

  void getData() async {
    try {
      isLoading(true);
      var response = await StateWiseServices().fetchStateWiseData();
      if (response != null) {
        print("####################### 1: $response");
        dataFromServer.value = response;
      }
    } catch(e){
      print("####################### error: $e");
    }
    finally {
      isLoading(false);
    }
  }

}