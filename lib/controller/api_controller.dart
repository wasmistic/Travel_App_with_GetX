
import 'package:get/get.dart';
import 'package:travel_app/controller/api_client.dart';
import 'package:travel_app/modal/app_modal.dart';

class DataController extends GetxController{
  final service = ApiClient();
  List<MountainModal> _data = <MountainModal>[];
  List<MountainModal> get Apidata=> _data;
  
  Future<void> fetchMountain()  async {
    try{
      var info = await service.getData();
      _data=[];
     _data.addAll(info);
      print(Apidata);
      // print('controller api call end here');
    }catch(e){

    }
  update();

  }
}