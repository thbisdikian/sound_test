import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

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
  Soundpool _soundpool = Soundpool();
  int _soundId;
  int _streamId;

  _playSoundpool() async {
    _streamId = await _soundpool.play(_soundId);
  }

  _loadSoundpool() async {
    // _soundId = await _soundpool.loadUri('assets/brown.mp3');
    _soundId = await rootBundle.load("assets/brown.mp3").then((ByteData soundData) {
      return _soundpool.load(soundData);
    });
  }

  _pauseSoundpool() {

  }

  @override
  Widget build(BuildContext context) {
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);

    _loadSoundpool();
  
    return Scaffold(
      appBar: AppBar(
  
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          children: <Widget>[

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('audioplayers/audiocache'),
                Container(
                  height: 50,
                  width: 150,
                  color: Colors.teal[300],
                  child: FlatButton(
                    child: Text('play'),
                    onPressed: () => audioCache.play('brown.mp3'),
                  ),
                ),
                Container(
                  height: 50,
                  width: 150,
                  color: Colors.teal[600],
                  child: FlatButton(
                    child: Text('pause\n(doesn\'t work)'),
                    onPressed: () => audioCache.clearCache(),
                  ),
                ),
              ]
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('soundpool'),
                Container(
                  height: 50,
                  width: 150,
                  color: Colors.teal[300],
                  child: FlatButton(
                    child: Text('play'),
                    onPressed: () => _playSoundpool(),
                  ),
                ),
                Container(
                  height: 50,
                  width: 150,
                  color: Colors.teal[600],
                  child: FlatButton(
                    child: Text('pause'),
                    onPressed: () => _soundpool.pause(_streamId),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
