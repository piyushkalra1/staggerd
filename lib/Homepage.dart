import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:staggerd/Model/JsonModel.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:video_player/video_player.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getintialdata();
  }
  JsonModel? jsonModel;
  @override


  Widget build(BuildContext context) => jsonModel == null? Center(child: CircularProgressIndicator(),):Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blue,
      centerTitle: true,
      title: Text(jsonModel!.type!),
    ),
    body: Container(
          color: Colors.white,
          child: StaggeredGridView.countBuilder(
            staggeredTileBuilder: (index) => StaggeredTile.count(jsonModel!.spannableItemList![index].columnSpan??1, jsonModel!.spannableItemList![index].rowSpan?.toDouble()),

            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            crossAxisCount: jsonModel!.totalColumnSpan!,
            itemCount: jsonModel?.spannableItemList?.length??0,
            itemBuilder: (context, index) => buildImageCard(index),
          ),
        ),
  );

  void getintialdata()async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/Demo.json");
    final jsonResult = jsonDecode(data);

    setState(() {
      jsonModel = JsonModel.fromJson(jsonResult);
    });
  }
  Widget buildImageCard(int index) {
    String mediasource = jsonModel!.spannableItemList![index].mediaSource!;
    String? mediatype = jsonModel!.spannableItemList![index].mediaType;
    String? text = jsonModel!.spannableItemList![index].title;
    late VideoPlayerController _controller;
    if(mediatype=="video"){
      _controller =VideoPlayerController.network(
          mediasource);_controller.value.isPlaying;
    }
    return Card(
      color: Colors.white,
      // margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child:
      Stack(
        children: [
          Positioned( top: 0,right: 0,left: 0,bottom: 0, child: Container(
            child:ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: mediatype == "image"? Image.network(
                  mediasource,
                  fit: BoxFit.cover,
                ): VideoPlayer(_controller)),
          )),
          Positioned(
              bottom: 10,left: 10,
              child: Text(text!,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white),))
        ],
      ),


    );
  }
}


