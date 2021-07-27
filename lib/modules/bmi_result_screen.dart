import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {


  bool isFemale;
  int result;//تم تحويل القيمة الى عدد صحيح بالشاشة السابقة
  int age;

  BmiResultScreen({
    required this.age,
    required this.isFemale,
    required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI RESULT"),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.black,
        leading:
        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pop(context);

          },),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Gender :  ${isFemale? "Female":"Male"}",
              style:
                TextStyle(fontSize: 25,
                color: Colors.white,
                ),),

              SizedBox(height: 15,),

              Text("Age : $age Year",
                style:
                TextStyle(fontSize: 25,
                  color: Colors.white,
                ),),

              SizedBox(height: 15,),

              Text("Result : $result ",
                style:
                TextStyle(fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),),

          ],),
        ),
      ),
    );
  }
}
