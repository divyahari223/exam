import 'dart:convert';

import'package:flutter/material.dart';
import 'package:rest_cafeapi/crafts/widgets/craftfile.dart';
import 'package:rest_cafeapi/crafts/widgets/craftwidgets.dart';
import 'package:rest_cafeapi/signup/login.dart';
import'package:http/http.dart'as http;
class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
   final _formKey = GlobalKey<FormState>();
  Future<void>registerHomemadeCraft(

String email,String password) async {
  const url ="http://campus.sicsglobal.co.in/Project/homemade_crafts/API/login.php";

  Map<String, String> body = {
  
    'email': email,
    
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
          content: const Text('Login Successful!',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          duration: const Duration(seconds: 4),
        ),
      );
      Navigator.push(context,MaterialPageRoute(builder:(context)=> ProductsScreen()));
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
          content: const Text('Invalid username and password !',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
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
        height:double.infinity,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/eggs.jpg'),fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
          child: Form(
             key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 200,),
                  Center(child: Text("WELCOME!",style: TextStyle(fontSize:25,fontWeight: FontWeight.bold,color: Colors.white ),)),
                  Center(child: Text("time to purchase.Let's sign in",style: TextStyle(color: Colors.white),)),
                 
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                     controller: emailcontroller,
                    decoration: InputDecoration(border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange,),borderRadius: BorderRadius.circular(20)),
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
                     controller:passwordcontroller ,
                    decoration: InputDecoration(border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 167, 107, 16),width: 4),
                    borderRadius:BorderRadius.circular(20) ),
                  hintText: "Password",
                  fillColor: Colors.black,
                  filled: true,
                hintStyle: TextStyle(color: Colors.white)
                  ),
                   validator: (value) {
                if(value!.isEmpty){
                  return 'Please enter your password';
                }else{
                  return null;
                }
              },
                  ),
                  SizedBox(height: 20,),
                  Center(child: TextButton(onPressed: (){}, child: Text("Forgot password?",style: TextStyle(color:Color.fromARGB(255, 222, 137, 10)),))),
                  Center(
                    child: SizedBox(
                      height: 50,
                      width:500 ,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 222, 137, 10),),
                        onPressed: (){
                           if (_formKey.currentState!.validate()) {
                              registerHomemadeCraft(
                               
                                emailcontroller.text.toString(),
                              
                                passwordcontroller.text.toString()
                      
                                
                              );
                            }
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                        }, child: Text("Sign In",style: TextStyle(color: Colors.white),)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("it's your first time here?",style: TextStyle(color: Colors.white),),
                      TextButton(onPressed: (){}, child: Text("Sign up",style: TextStyle(color: Color.fromARGB(255, 222, 137, 10)),))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}