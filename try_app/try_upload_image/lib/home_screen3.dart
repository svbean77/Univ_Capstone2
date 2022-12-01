/*
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen3 extends StatefulWidget {
  const HomeScreen3({Key? key}) : super(key: key);

  @override
  State<HomeScreen3> createState() => _HomeScreen3State();
}

class _HomeScreen3State extends State<HomeScreen3> {
  var uploadimage; //variable for choosed file

  Future<void> chooseImage() async {
    var choosedimage = await ImagePicker().pickImage(source: ImageSource.gallery);

    //set source: ImageSource.camera to get image from camera
    setState(() {
      uploadimage = File(choosedimage!.path);
    });
  }

  Future<void> uploadImage() async {
    //show your own loading or progressing code here

    String uploadurl = "http://192.168.35.115/test_php/image_upload.php";
    //dont use http://localhost , because emulator don't get that address
    //insted use your local IP address or use live URL
    //hit "ipconfig" in windows or "ip a" in linux to get you local IP

    try {
      List<int> imageBytes = uploadimage!.readAsBytesSync();
      final baseimage = base64Encode(imageBytes);
      //convert file image to Base64 encoding
      var response = await http.post(Uri.parse(uploadurl), body: {
        'image': baseimage,
      });
      if (response.statusCode == 200) {
        var jsondata = json.decode(response.body); //decode json data
        if (jsondata["error"]) {
          //check error sent from server
          print(jsondata["msg"]);
          //if error return from server, show message from server
        } else {
          print("Upload successful");
        }
      } else {
        print("Error during connection to server");
        //there is error during connecting to server,
        //status code might be 404 = url not found
      }
    } catch (e) {
      print("Error during converting to Base64");
      //there is error during converting file image to base64 encoding.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Image to Server"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        height: 300,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center, //content alignment to center
          children: <Widget>[
            Container(
              //show image here after choosing image
                child: uploadimage == null
                    ? Container()
                    : //if uploadimage is null then show empty container
                Container(
                  //elese show image here
                    child: SizedBox(
                        height: 150,
                        child:
                        Image.file(uploadimage!) //load image from file
                    ))),
            Container(
              //show upload button after choosing image
                child: uploadimage == null
                    ? Container()
                    : //if uploadimage is null then show empty container
                Container(
                  //elese show uplaod button
                    child: ElevatedButton.icon(
                      onPressed: () {
                        uploadImage();
                        //start uploading image
                      },
                      icon: Icon(Icons.file_upload),
                      label: Text("UPLOAD IMAGE"),
                      //set brghtness to dark, because deepOrangeAccent is darker coler
                      //so that its text color is light
                    ))),
            Container(
              child: ElevatedButton.icon(
                onPressed: () {
                  chooseImage(); // call choose image function
                },
                icon: Icon(Icons.folder_open),
                label: Text("CHOOSE IMAGE"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

 */