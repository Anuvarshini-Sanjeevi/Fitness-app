



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
class Medical extends StatefulWidget {
  const Medical({super.key});

  @override
  State<Medical> createState() => _MedicalState();
}

class _MedicalState extends State<Medical> {
  final TextEditingController Username = TextEditingController();
  final TextEditingController Password = TextEditingController();
  bool visiblePassword = false;
  final key = GlobalKey<ScaffoldState>();

  Map test = {};
  dynamic id;

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 191, 160, 244),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 390,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 191, 160, 244),
              //     image: DecorationImage(
              //   image: AssetImage("assets/check.png",),
              //   fit: BoxFit.fitWidth,
              // ),
                ),
                
              
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: ListTile(
                    title: Text(
                      'Exercise\nPlans',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: 50,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '3-10 min course',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 25,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Text(
                          'It is easy to get confused\nwhen it comes to health and nutition',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
             
              ),
              Row(
                
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 70),
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          Username.text = value;
                        });
                      },
                      controller: Username,
                      decoration: const InputDecoration(
                        hintText: 'search',
                        hintStyle: TextStyle(fontStyle: FontStyle.italic),
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ],
              ),
           
            Wrap(
           spacing: 20,
           runSpacing: 20,
        children: [
         
          SessionCard(Name: 1,isDone: true,),
           SessionCard(Name: 2,isDone: false,),
          
            SessionCard(Name: 3,isDone: false,),
           
             SessionCard(Name: 4,isDone: false,),
             SessionCard(Name: 5,isDone: false,),
             SessionCard(Name: 6,isDone: false,),
             
        ],
            ),
            SizedBox(height: 20,),
            Text('Meditation',style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 20,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold)),),
            Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(10),
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [BoxShadow(
            offset: Offset(0, 17),
            blurRadius:23,
            spreadRadius: -13,
            color: Color.fromARGB(255, 191, 160, 244)
          )]
        ),
        child: Row(
          children: [Image.asset('assets/exercise.png'),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ListTile(
                 title:Text('Basic 2',style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 20,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold)),),
                 subtitle: Text('Start your deepen practice'),
              )
              
            ],
          )
          ),
          Padding(padding: EdgeInsets.all(10),
          child: Icon(Icons.lock),)
          ],
        ),
            )
          ],
        )
        )
          
          ),
      );
        
        
        
  }
}

class SessionCard extends StatefulWidget {
  final int Name;
  final bool isDone;
  const SessionCard({
    required this.Name,
    required this.isDone,
    super.key,
  });

  @override
  State<SessionCard> createState() => _SessionCardState();
}

class _SessionCardState extends State<SessionCard> {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri(scheme: "https", host: url);
    if(!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      
      builder: (context, Constraint) {
        return Container(
          width:Constraint.maxWidth/2-10,
          
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(offset: Offset(0, 17),
              blurRadius: 23,
              spreadRadius: -13,
              color: Color.fromARGB(255, 191, 160, 244)
              )
            ]
          ),
         child: Material(
          color: Colors.transparent,
           child: InkWell(
            onTap: () {
              _launchURL("www.lipsum.com");
            },
             child: Row(children: [
              Container(
                height: 42,
                width: 43,
                decoration: BoxDecoration(
                  color:widget.isDone? Color.fromARGB(255, 191, 160, 244):Colors.white,
                  shape: BoxShape.circle,border:Border.all(color:Color.fromARGB(255, 191, 160, 244),)
                ),
                child: Icon(Icons.play_arrow,color:widget.isDone? Colors.white:Color.fromARGB(255, 191, 160, 244),),
              ),
              SizedBox(width: 20,),
              Text('Season ${widget.Name}',style: GoogleFonts.lato(textStyle:TextStyle(fontStyle: FontStyle.italic,fontSize: 20,fontWeight: FontWeight.w500)),),
              
             ],
             
             ),
           ),
         ), 
         
        );
      }
    );
   
  }
}