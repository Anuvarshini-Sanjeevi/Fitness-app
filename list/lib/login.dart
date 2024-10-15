import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list/mainpage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController Username = TextEditingController();
  final TextEditingController Password = TextEditingController();
  bool visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('LOGIN' ,style:GoogleFonts.lato(textStyle:TextStyle(fontSize: 25,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color: Colors.white)) ,),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color.fromARGB(255, 120, 183, 235),
      ),
      body: Center(
        child: Container(
          height: 400,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.grey),
              gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 189, 232, 235),
                Colors.blue
              ]),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username:',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all()),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            Username.text=value;
                          });
                        },
                        controller: Username,
                        decoration: const InputDecoration(
                            hintText: 'Enter your Name',
                            hintStyle: TextStyle(fontStyle: FontStyle.italic),
                            prefixIcon: Icon(Icons.near_me)),
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password:',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all()),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            Password.text=value;
                          });
                        },
                        controller: Password,
                        obscureText: visiblePassword?false:true,
                        decoration:  InputDecoration(
                            suffixIcon:
                                InkWell(
                                  onTap: () {
                                    if(visiblePassword==false){
                                      setState(() {
                                        visiblePassword=true;
                                      });
                                    }
                                    else{
                                      setState(() {
                                        visiblePassword=false;
                                      });
                                    }
                                    print(visiblePassword);
                                  },
                                  child:  Icon(visiblePassword? Icons.remove_red_eye: Icons.visibility_off)),
                            prefixIcon: const Icon(Icons.password)),
                      )),
                ],
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              ElevatedButton(onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyApp(),
                    ));
              }, child: Text('Submit')),
              SizedBox(
                       height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(color:Colors.white),
                child: Text('${Username.text ?? ''} \n ${Password.text ?? ' '}'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
