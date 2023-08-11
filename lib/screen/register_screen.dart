import 'package:flutter/material.dart';
import 'package:socialmedia/Components/input_comp.dart';
import 'package:socialmedia/screen/login_screen.dart';
import 'package:socialmedia/service/auth_sevice.dart';

class RegisterScren extends StatefulWidget {
  const RegisterScren({super.key});

  @override
  State<RegisterScren> createState() => _RegisterScrenState();
}

class _RegisterScrenState extends State<RegisterScren> {
String registerMessage = "";
String username = "";
String email = "";
String password = "";
  @override
  Widget build(BuildContext context) {
    void navigateLogin(){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context)=>const  LoginPage())
      );
    }
    return  Scaffold(
      backgroundColor: Colors.black12,
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          
          child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment:CrossAxisAlignment.center,
              children:<Widget> [
                Container(
                  child:const  Text("Selamat Datang Di Shotgan Media",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ),
                const SizedBox(height: 20,),
                Container(
                  child: InputComponent("Masukan Email", "example@gmail.com",TextInputType.text,onChanged : (value){
                    setState(() {
                      email = value;
                    });
                  })
                ),
                Container(
                  child: InputComponent("Masukan Username", "example",TextInputType.text,onChanged : (value){
                    setState(() {
                      username = value;
                    });
                  })
                ),
                  Container(
                  child: InputComponent("Masukan Username", "example",TextInputType.text,onChanged : (value){
                    setState(() {
                      password = value;
                    });
                  })
                ),
                Container(
                  child: ElevatedButton(onPressed: () async  {
                   String message = await  registerservice(username, password, email, navigateLogin);
                   setState(() {
                    registerMessage = message;
                     
                   });
                  }, child: Text("Hello"),),
                ),
                Container(child: Text(registerMessage,style: TextStyle(color: Colors.white),))
              
              ],
             )
      
        
        ),
      ),
      
    );
  }
}