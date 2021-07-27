import 'package:flutter/material.dart';
import 'package:udemy/shared/components/components.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  final _formKey=GlobalKey<FormState>();

  bool onShow= true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child:Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),

                SizedBox(
                  height: 40,
                ),
                defTextFormField(
                  labelText: 'Email Address',
                  controller: emailController,
                  input: TextInputType.emailAddress,
                  color: Colors.deepPurple,
                  preicon: Icons.email,
                  validator: (String? value){
                    if (value == null || value.isEmpty){
                      return 'ENTER EMAIL';
                    }
                    return null;
                  },

                ),



                SizedBox(
                  height: 10,
                ),

                defTextFormField(
                  labelText: 'Password',
                  controller: passwordController,
                  input: TextInputType.visiblePassword,
                  color: Colors.deepPurple,
                  preicon: Icons.password_outlined,
                  suficon:onShow? Icons.visibility_off:Icons.visibility,
                  obscureText: onShow,
                  validator: (String value){
                    if (value == null || value.isEmpty){

                      return 'ENTER PASSWORD';
                    }
                    return null;
                  },

                 onClik: ( ){
                    setState(() {
                      onShow = !onShow;
                    });
                 },

                ),
                SizedBox(
                  height: 20,
                ),
                defButton(
                  title: 'login',
                  function: () {
                     if(_formKey.currentState!.validate()){
                       print(emailController.text);
                       print(passwordController.text);
                       // ScaffoldMessenger.of(context)
                       //     .showSnackBar(SnackBar(content: Text('Processing Data')));
                     }
                  },

                ),
                SizedBox(
                  height: 10,
                ),
                defButton(title: 'Register', function: (){}),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?',
                      style:
                      TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15,),),
                    SizedBox(width: 3,),
                    TextButton(onPressed: (){},
                        child: Text('Register Now',style: TextStyle(color: Colors.deepPurple),)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
