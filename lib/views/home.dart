import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:player/consts/text_style.dart';
class Home extends StatelessWidget{
  var Get;
  
  var InitialData;

   Home({super.key});

  @override
  Widget build(BuildContext context){

    var controller = Get.put(PlayerController());





    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search, color: Colors.white )),
        ],
        leading: Icon(Icons.sort_rounded, color: Colors.white),
        title: Text("KeyPro",
         style: ourStyle(
          fontFamily: bold,
          size:  18
          ),
         ),
      ),
      body:FutureBuilder<List<SongModel>>(
        future: controller.audioQuery.querySongs(
          ignoreCase: true,
          orderType: OrderType.ASC_OR_SMALLER,
          sortType: null,
          uriType: UriType.EXTERNAL 
        ),
        initialData: InitialData,
        builder:(BuildContext context, snapshot){
          print(snapshot.data);
          if(snapshot.data == null){
            return Center(
              child: CircularProgressIndicator()
              );

          }
          else if(snapshot.data!.isEmpty){
            return Center(
              child: Text("No song found",
              style: ourStyle(),
              ) ,
              );
          }else{
            
            return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 50,
        itemBuilder: (BuildContext context, int index){
          return Container(
            margin: const EdgeInsets.only(bottom:4),
            child:  ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              tileColor: Colors.black,
              title: Text(snapshot.data![index].displayNameWOExt, style: ourStyle(
                fontFamily: bold, size: 15)
                ),
                subtitle: Text("${snapshot.data![index].artist}", style: ourStyle(
                fontFamily: regular, size: 12)
                ),
                leading: Icon(Icons.music_note,
                color: Colors.white,
                size: 32,),
                trailing: Icon(Icons.play_arrow, color: Colors.white, size: 26)
            ));
        },
      ),
      );

          }
          
        },
        ),
    );


  }
}

class UriType {
  static var EXTERNAL;
}

class OrderType {
  static var ASC_OR_SMALLER;
}

class SongModel {
  var displayNameWOExt;
  
  var artist;
}

PlayerController() {
}