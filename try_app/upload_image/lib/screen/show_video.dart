import 'package:flutter/material.dart';

import '../const/video_player.dart';
import 'home_screen.dart';

class ShowVideo extends StatefulWidget {
  final data;
  const ShowVideo({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  State<ShowVideo> createState() => _ShowVideoState();
}

class _ShowVideoState extends State<ShowVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(widget.data.freetitle, style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 16.0),
            Text(widget.data.freecontent),
            SizedBox(height: 8.0),
            myVideo(file: widget.data.freefilename.toString()),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => HomeScreen(),
                    ),
                  );
                },
                child: Text('홈으로'))
          ],
        ),
      ),
    );
  }
}
