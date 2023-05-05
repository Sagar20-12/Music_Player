import 'dart:ffi';
import 'dart:html';

import 'package:get/get.dart';

class PlayerController extends GetxController{
  final audioQuery = onAudioQuery();

  @override
  void onInit(){
    super.onInit();

    checkPermission();
  }
  checkPermission() async{

    
    var perm = await Permission.storage.request();
    if(perm.isGranted){
      
    } else{
      checkPermission();
    }
  }



}

class UriType {
  static var EXTERNAL;
}

class OrderType {
  static var ASC_OR_SMALLER;
}

class Permission {
  static var storage;
}

onAudioQuery() {
}
