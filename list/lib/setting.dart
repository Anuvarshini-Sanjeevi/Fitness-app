
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list/intro.dart';
import 'package:list/main.dart';
import 'package:list/mainpage.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
      
        centerTitle: true,
        title:  Text('Settings',style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 25),fontStyle:FontStyle.italic,fontWeight:FontWeight.bold),),
        backgroundColor: const Color.fromARGB(255, 158, 210, 253),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            title:  Text('Notifications',style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 20),fontStyle:FontStyle.italic),),
            value: _notificationsEnabled,
            onChanged: (value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),
          const Divider(
            height: 1,
            color: Color.fromARGB(255, 159, 159, 159),
          ),
          SwitchListTile(
            title:  Text('Dark Mode',style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 20),fontStyle:FontStyle.italic),),
            value: _darkModeEnabled,
            onChanged: (value) {
              setState(() {
                _darkModeEnabled = value;
              });
            },
          ),
          const Divider(
            height: 1,
            color: Color.fromARGB(255, 159, 159, 159),
          ),
          
          ListTile(
            title: Text('Logout',style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 20),fontStyle:FontStyle.italic,),),
            onTap: () {
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  homepage(),
                    ),
                  );
            },
          ),
        ],
      ),
    );
  }
}