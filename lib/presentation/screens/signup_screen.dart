import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_rami/logic/signup_cubit/state.dart';
import 'package:note_app_rami/presentation/screens/home_screen.dart';
import 'package:note_app_rami/presentation/screens/login_screen.dart';

import '../../core/color_manager.dart';
import '../../logic/login_cubit/cubit.dart';
import '../../logic/signup_cubit/cubit.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool secureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {
          if (state is SignUpSucessState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar (content: Text("Sign Up is Successfully")));
            Navigator.push(context,MaterialPageRoute(builder: (context)=> HomeScreen()));
          }else if (state is SignUpErrorState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar (content: Text(state.error)));
          }
        },
        builder: (context, state) {
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
                          child: Text("Create New Account",
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

                        TextFormField(
                          controller: widget.emailcontroller,
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

                        TextFormField(
                          controller: widget.passwordcontroller,
                          style: TextStyle(
                            color: Colors.white,
                          ),


                          decoration: InputDecoration(
                            suffixIcon: IconButton(onPressed: () {
                              setState(() {
                                secureText = !secureText;
                              });
                            },
                              icon: Icon(secureText == true ? Icons
                                  .visibility_off_outlined : Icons
                                  .visibility),
                              color: Colors.white,),
                            filled: true,
                            fillColor: ColorsManagers.textFormColor,
                            hintText: "Enter Your Password",
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.5),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,),
                          ),
                          obscureText: secureText == true ? true : false,
                        ),

                        SizedBox(height: 130),

                        InkWell(
                          onTap: () {
                            context.read<SignUpCubit>().signUp(
                                widget.emailcontroller.text,
                                widget.passwordcontroller.text);
                          },
                          child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text("Sign Up",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(18, 3, 17, 0.9),
                                    ),

                                  ))),
                        ),

                        SizedBox(height: 20),
                        //login with google
                        InkWell(
                          onTap: () {
                            context.read<SignUpCubit>().contineWithGoogle();
                          },
                          child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Image.asset("assets/logos/Logo-google-icon-PNG.png",width: 30,height: 30,),SizedBox(width: 10,),
                                  Text("Continue with Google",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(18, 3, 17, 0.9),
                                    ),

                                  ),
                                ],
                              )),
                        ),


                      ]

                  ),
                ),
              ));
        },
      ),
    );
  }
}
