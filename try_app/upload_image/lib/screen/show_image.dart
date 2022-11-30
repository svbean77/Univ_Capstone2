import 'dart:io';

import 'package:flutter/material.dart';

import 'home_screen.dart';

class ShowImage extends StatefulWidget {
  final data;
  const ShowImage({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        body: ListView(
          children: [
            Text('제목',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
            SizedBox(height: 8.0),
            Text(widget.data.freetitle),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('작성자', style: TextStyle(fontWeight: FontWeight.w600)),
                Text(widget.data.freewriter),
              ],
            ),
            SizedBox(height: 16.0),
            Text('내용',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
            SizedBox(height: 8.0),
            Text(widget.data.freecontent),
            SizedBox(height: 8.0),
            if (widget.data.freefilepath != null)
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Image.file(
                  File(widget.data.freefilename.toString()),
                ),
              ),
            /*
                  for (int i = 0; i < images.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Image.file(images[i]),
                    ),
                  for (int i = 0; i < files.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Image.file(File(files[i])),
                    ),
                  for (int i = 0; i < imagefiles.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Image.file(File(imagefiles[i])),
                    ),
                   */
            SizedBox(height: 8.0),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => HomeScreen(),
                    ),
                  );
                },
                child: Text('홈으로')),
          ],
        ),
      ),
    );
  }
}
