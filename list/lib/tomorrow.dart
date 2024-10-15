import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list/diet.dart';
import 'package:list/medical.dart';
import 'package:http/http.dart' as http;
import 'package:list/tips.dart';
import 'package:list/yoga.dart';
import 'package:lottie/lottie.dart';


void main() {
  runApp(const Tomorrow());
}

class Tomorrow extends StatefulWidget {
  const Tomorrow({super.key});

  @override
  State<Tomorrow> createState() => _TomorrowState();
}

class _TomorrowState extends State<Tomorrow> {
  final TextEditingController Username = TextEditingController();
  
 final key = GlobalKey<ScaffoldState>();
 void initState() {
    fetchUrl();
    super.initState();
  }

  Map test = {};
  dynamic id;

  Future<void> fetchUrl() async {
    var response = await http.get(Uri.parse("https://reqres.in/api/users/2"));
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      setState(() {
        print(data);
        test = data['data'];
        // id = test[0]['id'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
     backgroundColor: Color.fromARGB(255, 249, 216, 254),
     
  actions: [
    IconButton(
      onPressed: () {
        key.currentState!.openEndDrawer();
      },
      icon: const Icon(Icons.menu,color: Colors.black,),
    ),
  ],
),
          key:key,
         
          body: Stack(
            children: [
              Container(
                height: 390,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 249, 216, 254),
                  
                ),
              ),
              SafeArea(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                   
      
                    Text(
                      'Select Tomorrow\nEvents',
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 50,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold)),
                    ),
                     Container(
                      
                      margin: const EdgeInsets.only(top: 10),
                      width: 500,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all()),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            Username.text=value;
                          });
                        },
                        controller: Username,
                        decoration: const InputDecoration(
                            hintText: 'search',
                            hintStyle: TextStyle(fontStyle: FontStyle.italic),
                            prefixIcon: Icon(Icons.search)),
                      )
                      ),
                      SizedBox(height: 40,),
                     Expanded(
                       child: GridView.count(
                         crossAxisCount: 2,
                         crossAxisSpacing: 25,
                         mainAxisSpacing: 25,
                         children: [
                          customList('assets/diet.png', 'Diet', () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Diet(),
                    ));
              }),
              customList('assets/exercise.png', 'Exercie', () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Medical(),
                    ));
              }),
              customList('assets/medical.png', 'Tips', () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Tips()));
              }),
              customList('assets/yoga.png', 'Yoga', () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Yoga()));
              }),
               customList('assets/exercise.png', 'Exercie', () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Medical(),
                    ));
              }),
                customList('assets/diet.png', 'Diet', () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Diet(),
                    ));
              }),
                customList('assets/medical.png', 'Tips', () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Tips()));
              }),
               customList('assets/yoga.png', 'Yoga', () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Medical()));
              }),
              customList('assets/exercise.png', 'Exercie', () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Medical(),
                    ));
              }),
               customList('assets/diet.png', 'Diet', () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Diet(),
                    ));
              }),
                         ]
                     )
                     )  
                       ],
                     ),
                  
                  ),
              )
                  ]
                ),
                 endDrawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue.shade100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 60,
                        child: Lottie.network(
                'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
                      ),
                       Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(test['first_name'].toString(),style:TextStyle(color:Color.fromARGB(255, 97, 33, 161),fontSize: 35),),
                         
                          Text(test['email'].toString(),style:TextStyle(color:Color.fromARGB(255, 97, 33, 161),fontSize: 15),),
                        ],
                      )
                    ],
                  )),
            ]
                  ) 
                 )
        )
              );
           
  }
}

 customList(String image, String title, dynamic ontap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
              BoxShadow(offset: Offset(0, 17),
              blurRadius: 23,
              spreadRadius: -13,
              color: Color.fromARGB(255, 249, 216, 254),
              )
        ]
      ),
     child: Material(
      color: Colors.transparent,
       child: InkWell(
        onTap: ontap,
         child: Padding(
           padding: const EdgeInsets.all(20.0),
           child: Column(
              children: [
               Spacer(),
                Container(
                  height: 50, 
            width: double.infinity, 
                  child: Image(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
                Spacer(),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                    ),
                  ),
                )
              ]
           ),
         ),
       ),
     )
      )
    );
  }