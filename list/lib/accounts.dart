import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:list/fetch.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
 void initState() {
    fetchUrl();
    super.initState();
  }

  // Map test = {};
  // Map test1 = {};
  Map<String, dynamic> datajson = {};
  Map<String, dynamic> supportjson = {};
  // List test2 = [];
  List<Data> userdata = [];
  Support userSupport = Support();
  Future<void> fetchUrl() async {
    var response =
        await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      setState(() {
        List<dynamic> datajson=data['data'];
        supportjson = data['support'];
        userdata = datajson.map((userDatafiller) => Data.fromJson(userDatafiller)).toList();
        userSupport = Support.fromJson(supportjson);
        print(userdata[0].firstName);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF3ac3cb),Color.fromARGB(255, 241, 130, 165),Colors.white]
                ),
                 
              ),
              child:Scaffold(
                backgroundColor: Colors.transparent,
                 appBar: AppBar(
                  backgroundColor: Color.fromARGB(255, 248, 204, 218),
            leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
            centerTitle: true,
            title: Text('Accounts You Hold',style: GoogleFonts.lato(textStyle:TextStyle(fontStyle: FontStyle.italic,fontSize: 30,fontWeight: FontWeight.bold)),),
          ),
        
        
       
          
               
               body: ListView.builder(
              
              itemCount: userdata.length,
              itemBuilder: (BuildContext context,int index){
                return 
                Card(
                  
                 elevation: 90,
                  child: ListTile(
                    
                     leading:CircleAvatar(
                radius: 40.0,
                backgroundImage:
                    NetworkImage(userdata[index].avatar.toString()),
                backgroundColor: Colors.transparent,
              ),
                     title:Text(userdata[index].firstName.toString(),
                     style:const TextStyle(color: Colors.blue,fontWeight: FontWeight.w500 ) ,),
                     subtitle: Text(userdata[index].lastName.toString()),
                    trailing: Text(userdata[index].email.toString(),),
                  ),
                 
                );
              }),
         
        )
        )
        );
       

 }
}