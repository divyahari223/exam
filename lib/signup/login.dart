import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_cafeapi/signup.dart';
import 'package:http/http.dart' as http;
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController firstnamecontroller=TextEditingController();
  TextEditingController lastnamecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  TextEditingController phonecontroller=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
Future<void>registerHomemadeCraft(

String firstname,String lastname,String email,String phone,String password) async {
  const url = 'http://campus.sicsglobal.co.in/Project/homemade_crafts/API/registration.php';

  Map<String, String> body = {
  
    'firstname':firstname,
    'lastname': lastname,
    'email': email,
    'phone': phone,
    'password': password,
  
  };

 try {
    final response = await http.post(
      Uri.parse(url),
      body: body,
      
    );
       var jsonData=json.decode(response.body);

      if (response.statusCode == 200) {
      if(jsonData['status']==true){
          ScaffoldMessenger.of(context).showSnackBar(

         SnackBar(
          backgroundColor:Colors.black,
          content: const Text('Register Successful!',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          duration: const Duration(seconds: 4),
        ),
      );
       Navigator.push(context,MaterialPageRoute(builder:(context)=>const signup()));
      print(body);
      print("Response body${response.body}");
    
      print('Registration successful');
      }
      else{
        jsonData['status']==false;
         // ignore: use_build_context_synchronously
         ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          backgroundColor:Colors.black ,
          content: const Text('User Already Exists !',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          duration: const Duration(seconds: 4),
        ),
      );
         print('Error: ${response.statusCode}');
      }
     
    } else {
       
     print('fffff');
    }

  } catch (error) {
    print('Error: $error');
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/eggs.jpg'),fit: BoxFit.cover)),
        child: Center(child: SingleChildScrollView
        (
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
            child: Form(
             key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              
                children: [
                   Text("Sign up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.white),),
                   SizedBox(height: 10,),
                   TextFormField(
                    style: TextStyle(color: Colors.white),
                   controller:firstnamecontroller,
                    decoration: InputDecoration(border: OutlineInputBorder(borderSide:
                     BorderSide(color:Colors.orange,),borderRadius:BorderRadius.circular(20) ),
                    hintText: "First Name",
                  hintStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.black,
                    filled: true,
                    ),
                     validator: (value) {
              if(value!.isEmpty){
                return 'Please enter your first name';
              }else{
                return null;
              }
            },
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller:lastnamecontroller,
                    decoration: InputDecoration(border: OutlineInputBorder(borderSide:
                    BorderSide(color:Colors.orange,),borderRadius:BorderRadius.circular(20) ),
                    hintText: "Last Name",
                    hintStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.black,
                    filled: true,
                    ),
                     validator: (value) {
              if(value!.isEmpty){
                return 'Please enter your last name';
              }else{
                return null;
              }
            },
                  ),
                  SizedBox(height: 10,),
                   TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: emailcontroller,
                    decoration: InputDecoration(border: OutlineInputBorder(borderSide:
                    BorderSide(color:Color.fromARGB(255, 246, 174, 67),),borderRadius:BorderRadius.circular(20)),
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.black,
                    filled: true,
                    ),
                     validator: (value) {
              if(value!.isEmpty){
                return 'Please enter your email';
              }else{
                return null;
              }
            },
                  ),
                   SizedBox(height: 10,),
                   TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller:phonecontroller ,
                    decoration: InputDecoration(border: OutlineInputBorder(borderSide: 
                    BorderSide(color:Color.fromARGB(255, 246, 174, 67),),borderRadius:BorderRadius.circular(20)),
                    hintText: "phone Number",
                   hintStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.black,
                    filled: true,
                    ),
                     validator: (value) {
              if(value!.isEmpty){
                return 'Please enter your phone number';
              }else{
                return null;
              }
            },
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller:passwordcontroller ,
                    decoration: InputDecoration(border: OutlineInputBorder(borderSide: 
                    BorderSide(color:Color.fromARGB(255, 246, 174, 67),),borderRadius:BorderRadius.circular(20)),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.black,
                    filled: true,
                    ),
                     validator: (value) {
              if(value!.isEmpty){
                return 'Please enter your password';
              }else{
                return null;
              }
            },
                  ),
                  SizedBox(height: 10,),
                  SizedBox(height: 50,
                  width: 305,
                    child: ElevatedButton(
                      
                      style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 246, 174, 67)),
                      onPressed: (){
                                  
                    if (_formKey.currentState!.validate()) {
                            registerHomemadeCraft(
                              firstnamecontroller.text.toString(),
                              lastnamecontroller.text.toString(),
                              emailcontroller.text.toString(),
                              phonecontroller.text.toString(),
                              passwordcontroller.text.toString()
                    
                              
                            );
                          }
                         
                        },
                      
                        child: Text("Register",style: TextStyle(color: Colors.white),)),
                  )
                ],
              ),
            ),
          ),
        )),
        
        
      ),
    );
  }
}