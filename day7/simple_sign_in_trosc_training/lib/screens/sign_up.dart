import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui/screens/login.dart';
import 'package:login_ui/widget/my_sized_box.dart';
String emailpattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
RegExp regExp1 = RegExp(emailpattern);

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() =>_SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool obscureText = true;
  GlobalKey <FormState> formstate = GlobalKey();
  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(
          image: AssetImage("assets/back_ui.png"),
          width: double.infinity,
          height: double.infinity,
        ),

        Center(
          child: Container(
            width: 338,
            height: 538,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 217, 223, 204),
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color:  Color.fromARGB(195, 0, 0, 0),
                    spreadRadius: 33,
                    blurRadius: 33,
                  ),
                ]),

            //Scaffold Start
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.transparent,
                body: Column(
                  children: [

                    //image and sign in
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/logo_ui.png"),
                        Text(
                          "Sign up",
                          style: GoogleFonts.jomolhari(fontSize: 28),
                        ),

                        mySizesBox(width: 40)//third element to make sign in in center of row
                      ],
                    ),


                    mySizesBox(height: 64),

                    //user name and password

                    
                  Form(
                    key: formstate,

                      child: Column(
                        children: [

                          TextFormField(
                            
                            keyboardType: TextInputType.name,

                            validator: (value) {
                              if(value!.isEmpty){
                                return 'Please enter your email';
                              }
                              

                               else {
                                return null;
                               }
                              
                            },
                            
                            decoration:  InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: "Username",
                                hintText: "yourname",
                                constraints: BoxConstraints.tight(const Size(400,50)),
                                
                                ),
                          ),
                          mySizesBox(height: 20),
                          TextFormField(
                            
                            keyboardType: TextInputType.emailAddress,

                            validator: (value) {
                              if(value!.isEmpty){
                                return 'Please enter your name';
                              }
                               else if (!regExp1.hasMatch(value)){
                                return 'Please enter a valid name';
                               }

                               else {
                                return null;
                               }
                              
                            },
                            
                            decoration:  InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: "email",
                                hintText: "youremailname@example.com",
                                constraints: BoxConstraints.tight(const Size(400,50)),
                                ),
                          ),

                          mySizesBox(height: 20),


                    TextFormField(
                     validator: (value) {
                        if(value!.length>10){
                         return 'Password should be less than 10 characters';
                       }
                       
                        else{
                          return null;
                        }
                      },
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        
                        constraints: BoxConstraints.tight(const Size(400, 50)),
                        border: const OutlineInputBorder(),
                        labelText: "password",
                      
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            icon: Icon(obscureText
                                ? Icons.visibility
                                : Icons.visibility_off)),
                      ),
                    ),

                    
                    
                    mySizesBox(height: 24),


                    ElevatedButton(
                      onPressed: (){
                        if (formstate.currentState!.validate()){
                          print("valid");
                        }

                        else{
                          print("invalid");
                        }
                      }, 

                       style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
                        fixedSize: const Size(164,56)
                      ),
                      
                      child:const  Text(
                        "Sing in",
                        style: TextStyle(
                          fontSize: 20, 
                          color: Colors.white
                          ),
                        ),
                        
                       
                    ),
                 ],
               ),

             ),
                    
                  
                    mySizesBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "already have account ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),

                        GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,MaterialPageRoute(builder: (context){
                              return const Login();
                            }));
                        },
                        
                        child:const Text(
                          "sign in",
                          style: TextStyle(
                            color:  Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            ),

                        ),
                      ),

                      ]
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}