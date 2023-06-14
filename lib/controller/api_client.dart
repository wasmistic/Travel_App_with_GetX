import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:travel_app/modal/app_modal.dart';

class ApiClient extends GetxService{
  String baseUrl = 'http://mark.bslmeiyu.com/api';

  Future<List<MountainModal>> getData() async {
    var apiUrl = '/getplaces';
    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = jsonDecode(res.body);

        return list.map((e) => MountainModal.fromJson(e)).toList();
      }
      return <MountainModal>[];
    } catch (e) {
      print('Api call error  $e');
      return <MountainModal>[];
    }
  }
}