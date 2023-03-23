// ignore_for_file: file_names, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_constructors


import 'dart:convert';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/DeliverProject/CancelContract.dart';
import 'package:http/http.dart' as http;
import 'package:perhour_flutter/Screens/DeliverProject/SendFeedback.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../api.dart';

class GetDelivery extends StatefulWidget {
  GetDelivery({required this.id,super.key});
  int id;

  @override
  State<GetDelivery> createState() => _GetDeliveryState();
}

class _GetDeliveryState extends State<GetDelivery> {


  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('SuccessFul'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('If You wish to not continue with project, you can contact support and get your project delivered by us before deadline (NO EXTRA COST). '),
                // Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }


  final dio = Dio();
  final snackbar = const SnackBar(content: Text("File Downloaded. Please check your file System",style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,);
  final accept = const SnackBar(content: Text("Project Completed!",style: TextStyle(color: Colors.white),),backgroundColor: Colors.green,);
  static String deliverlink="";
  static String title="";
  static String jd="";
  static String? deadline="";
  // static String deliverlink="";


  Future<void> getproject() async {
    var res = await http.get(Uri.parse(api + 'projects/get/${widget.id}'),headers: headers);
    var result = jsonDecode(res.body);
    print(result);
    setState(() {
      _GetDeliveryState.jd=result["fulldescription"];
      _GetDeliveryState.deadline=result["lastdate"];
      _GetDeliveryState.title=result["title"];
      _GetDeliveryState.deliverlink=result["deliverylink"];

    });
  }
  @override void initState() {super.initState();getproject();}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Container(
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width,
            color: backgroundwhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 35, bottom: 15),
                  color: kblue,
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Delivery",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ),

                    Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 20, left: 20,right: 20),
                              child: const Text(
                                "Job Title",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 20, left: 20,right: 20),
                              child: Text(
                                "${_GetDeliveryState.title.toUpperCase()}",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                       _GetDeliveryState.deadline==null?Container(): Container(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 20),
                          child:  Text(
                            "${_GetDeliveryState.deadline}",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),


                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        "Job Description",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        "${_GetDeliveryState.jd}",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8.0,top: 20),
                          child: Text(
                            "Download Work",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            saveVideo().then((value) => ScaffoldMessenger.of(context).showSnackBar(snackbar));

                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text("Click Here"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child:
                          GestureDetector(
                            onTap: (){
                              requestreview(widget.id);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: kblue,
                                  borderRadius: BorderRadius.circular(10)),
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: const Center(
                                  child: Text(
                                "Request Review",
                                style:
                                    TextStyle(fontSize: 18, color: Colors.white),
                              )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: GestureDetector(
                            onTap: () {
                             acceptproject(widget.id);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: kblue,
                                  borderRadius: BorderRadius.circular(10)),
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: const Center(
                                  child: Text(
                                "Accpet Project",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CancelContract(),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: kblue,
                                  borderRadius: BorderRadius.circular(10)),
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: const Center(
                                  child: Text(
                                "Cancel Contract",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> saveVideo() async {
    Directory? directory;
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = await getExternalStorageDirectory();
          String newPath = "";
          print(directory);
          List<String> paths = directory!.path.split("/");
          for (int x = 1; x < paths.length; x++) {
            String folder = paths[x];
            if (folder != "Android") {
              newPath += "/" + folder;
            } else {
              break;
            }
          }
          newPath = newPath + "/PerHour";
          directory = Directory(newPath);
        } else {
          return false;
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }
      var name=_GetDeliveryState.deliverlink.split(".");
      print(name.length);

      File saveFile = File(directory.path + "/${_GetDeliveryState.jd}.${name[name.length]}");
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        await dio.download(_GetDeliveryState.deliverlink, saveFile.path,
            onReceiveProgress: (value1, value2) {

            });
        if (Platform.isIOS) {
          await ImageGallerySaver.saveFile(saveFile.path,
              isReturnPathOfIOS: true);
        }
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

   requestreview(int id) async{
      var res = await http.post(Uri.parse(api + 'projects/revview/${id}' ),headers: headers);
      var result = jsonDecode(res.body);
      print(result);

      _showMyDialog();

   }

  acceptproject(int id) async {
    var res = await http.post(Uri.parse(api + 'projects/complete/${id}' ),headers: headers);
    var result = jsonDecode(res.body);
    print(result);
    ScaffoldMessenger.of(context).showSnackBar(accept);
    Navigator.push(context,MaterialPageRoute(builder: (context) => SendFeedBack(id: id, desc: _GetDeliveryState.jd, title: _GetDeliveryState.title),),);
  }



  // Platform messages are asynchronous, so we initialize in an async method.

}
