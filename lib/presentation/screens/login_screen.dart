import 'package:flutter/material.dart';

import '../../core/color_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen ({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool secureText=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsManagers.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 70),
            
                  Center(
                    child: Text("Hi, Welcome Back! ",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(255, 255, 255, 1),
            
                      ),
                    ),
                  ),
            
                  SizedBox(height: 40),
            
                  Text("Email",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 255, 255, 1),
            
                    ),
                  ),
            
                  SizedBox(height: 8),
            
                  TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorsManagers.textFormColor,
                        hintText: "example@gmail.com",
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,)
                    ),
                  ),
            
                  SizedBox(height: 24),
            
                  Text("Password",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(255, 255, 255, 1),)),
            
                  SizedBox(height: 8),
            
                  TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
            
            
                    decoration: InputDecoration(
                      suffixIcon:IconButton(onPressed: (){
                        setState(() {
                          secureText=!secureText;
                        });
                      }, icon: Icon(secureText==true ? Icons.visibility_off_outlined:Icons.visibility),color: Colors.white,),
                      filled:true,
                      fillColor: ColorsManagers.textFormColor,
                      hintText: "Enter Your Password",
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,),
                    ),
                    obscureText: secureText==true?true:false,
                  ),
            
                  SizedBox(height: 130),
            
                  InkWell(
                    onTap: (){},
                    child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text("Login",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(18, 3, 17, 0.9),
                              ),
            
                            ))),
                  ),
            
                  SizedBox(height: 50),
            
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account ? ,",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        ),
                        TextButton(onPressed: (){},
                            child: Text("Sign Up",style:
                          TextStyle(
                            fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(255, 255, 255, 1),))
                        )
                      ]
                    ),
                  )
            
            
            
            
            
            
            
            
            
                ]
            
            ),
          ),
        ));
  }
}
