import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sound Test',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Sound Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  AudioPlayer audioPlayer = new AudioPlayer();
  AudioCache audioCache = new AudioCache();
  bool audioplayersPlaying = false;
  String path;
  String localFilePath;


  // void _playAudioplayers() async {
  //   int result = await audioPlayer.play('$path' + '/brown_noise.mp3',isLocal: true);
  // }

  // void _getAppDocDirectory() async {
  //   final dir = await getApplicationDocumentsDirectory();
  //   if (await dir.exists()) {
  //     setState(() {
  //       path = dir.path;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // _getAppDocDirectory();
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
  
    return Scaffold(
      appBar: AppBar(
  
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(path ?? 'path not found'),
            Container(
              height: 50,
              width: 150,
              color: Colors.teal[300],
              child: FlatButton(
                child: Text('audioplayers 0.13.2'),
                onPressed: () => audioCache.play('brown.mp3'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
