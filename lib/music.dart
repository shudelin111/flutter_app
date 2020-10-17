import 'package:flutter/material.dart';

class Music extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Music'),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed
      // ),
      body: Text('Music'),
    );
  }
}