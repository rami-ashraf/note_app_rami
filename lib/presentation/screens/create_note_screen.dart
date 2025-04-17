import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_rami/data/note_model.dart';
import 'package:note_app_rami/logic/create_note/createnote_cubit.dart';
import 'package:note_app_rami/logic/create_note/createnote_state.dart';

import '../../core/color_manager.dart';
import 'home_screen.dart';

class CreateNoteScreen extends StatefulWidget {
   CreateNoteScreen({super.key});
   TextEditingController Headlinecontroller = TextEditingController();

   TextEditingController Discriptioncontroller = TextEditingController();


  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => CreateNoteCubit(FirebaseFirestore.instance),
  child: BlocConsumer<CreateNoteCubit, CreateNoteStates>(
  listener: (context, state) {
      if (state is CreateNoteSucessState){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar (content: Text("CreateNote is Successfully")));
        Navigator.push(context,MaterialPageRoute(builder: (context)=> HomeScreen()));
      }else if (state is CreateNoteErrorState){
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
                    child: Text("Create New Note",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(255, 255, 255, 1),
    
                      ),
                    ),
                  ),
    
                  SizedBox(height: 40),
    
                  Text("Head Line",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 255, 255, 1),
    
                    ),
                  ),
    
                  SizedBox(height: 8),
    
                  TextFormField(
                    controller: widget.Headlinecontroller,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorsManagers.textFormColor,
                        hintText: "Enter Note Address",
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,)
                    ),
                  ),
    
                  SizedBox(height: 24),
    
                  Text("Description",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(255, 255, 255, 1),)),
    
                  SizedBox(height: 8),
    
                  Container(
                    width: double.infinity,
                    height: 150, // Adjusted to a more typical description field height
                    decoration: BoxDecoration(
                      color: ColorsManagers.textFormColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12), // Inner padding for the TextFormField
                      child: TextFormField(
                        controller: widget.Discriptioncontroller,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        maxLines: null, // Allows unlimited lines
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent, // Makes field transparent to show Container color
                          hintText: "Enter Your Description",
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 0.5),
                          ),
                          border: InputBorder.none, // Removes default border
                          contentPadding: EdgeInsets.zero, // Removes extra padding
                        ),
                      ),
                    ),
                  ),
    
                  SizedBox(height: 50),
    
                  InkWell(
                    onTap: () {
    
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text("Select Media",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(18, 3, 17, 0.9),
                              ),
    
                            ))),
                  ),
    
                  SizedBox(height: 20),
    
                  InkWell(
                    onTap: () {
                      context.read<CreateNoteCubit>().CreateNoteData(NoteModel(headline: widget.Headlinecontroller.text,
                          description: widget.Discriptioncontroller.text,
                          createdAt: DateTime.now()));

    
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text("Create",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(18, 3, 17, 0.9),
                              ),
    
                            ))),
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
