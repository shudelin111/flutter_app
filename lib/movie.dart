import 'package:flutter/material.dart';

class Movie extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie'),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed
      // ),
      body: Text('Movie'),
    );
  }
}