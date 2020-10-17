import 'package:flutter/material.dart';

class Book extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Book'),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed
      // ),
      body: Text('Book'),
    );
  }
}