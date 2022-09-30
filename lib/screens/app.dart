// ignore_for_file: prefer_const_constructors, avoid_print, non_constant_identifier_names, use_key_in_widget_constructors, unnecessary_string_escapes
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:spotify/models/music.dart';
import 'package:spotify/screens/home.dart';
import 'package:spotify/screens/search.dart';
import 'package:spotify/screens/yourlibrary.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioPlayer _audioPlayer = new AudioPlayer();
  var Tabs = [];
  int currentTabIndex = 0;
  Music? music;
// created
  Widget miniPlayer(Music? music) {
    this.music = music;
    setState(() {});
    if (music == null) {
      return SizedBox();
    }
    Size deviceSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(microseconds: 500),
      color: Colors.blueGrey,
      width: deviceSize.width,
      height: 50,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Image.network(
          music.image,
          fit: BoxFit.cover,
        ),
        Text(
          music.name,
          style: TextStyle(color: Colors.white),
        ),
        IconButton(
            onPressed: () async{
             await _audioPlayer.play('assets\Shayad (From _Love Aaj Kal_).mp3');
            },
            icon: Icon(
              Icons.play_arrow,
              color: Colors.white,
            ))
      ]),
    );
  }

  @override
  void initState() {
    super.initState();
    Tabs = [Home(miniPlayer), Search(), YourLibrary()];
  }
  // till here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Tabs[currentTabIndex],
        backgroundColor: Colors.black,
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min, //
          children: [
            //
            miniPlayer(music), //
            BottomNavigationBar(
              currentIndex: currentTabIndex,
              onTap: (currentIndex) {
                print("Current Index is $currentIndex");
                currentTabIndex = currentIndex;
                setState(() {});
              },
              selectedLabelStyle: TextStyle(color: Colors.white),
              backgroundColor: Colors.black45,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.library_books,
                      color: Colors.white,
                    ),
                    label: 'library'),
              ],
            ),
          ],
        ));
  }
}
