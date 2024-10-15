





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:list/intro.dart';
import 'package:list/mainpage.dart';
import 'package:list/setting.dart';
import 'package:list/tomorrow.dart';


void main() {
  runApp( homepage());
}
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
   int selectedinx = 0;
  final screens = [
  GetStarted(),
   MyApp(),
   Settings(),
  //  Tomorrow()
   
    
  ];
  void currentindex(int index) {
    setState(() {
      selectedinx = index;
      print(selectedinx);
    });
  }
  @override
  Widget build(BuildContext context) {
    return   
    MaterialApp(
      debugShowCheckedModeBanner: false,
   home: Scaffold(
        
        bottomNavigationBar: BottomNavigationBar(
          
            currentIndex: selectedinx,
            onTap: currentindex,
            items: const [
              
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.calendar_month), label: "settings"),
              BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Today"),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
            ]),
        body: screens[selectedinx],
    )
       );
      
      
    
  }
}