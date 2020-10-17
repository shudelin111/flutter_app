import 'package:flutter/material.dart';
import 'package:flutter_app/book.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/movie.dart';
import 'package:flutter_app/music.dart';


class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomesState();
  }
}

class _HomesState extends State<Index> {
  int _currentIndex = 0;
  final List<Widget> _children = [Home(), Book(), Music(), Movie()];

  final List<BottomNavigationBarItem> _list = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Home'),
      //backgroundColor: Colors.orange
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.book),
      title: Text('Book'),
      //backgroundColor: Colors.orange
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.music_video),
      title: Text('Music'),
      //backgroundColor: Colors.orange
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.movie),
      title: Text('Movie'),
      //backgroundColor: Colors.orange
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Bottom Navigation'),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: _list,
      ),
      body: _children[_currentIndex],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}