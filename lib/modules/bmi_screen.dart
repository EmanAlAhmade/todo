import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bmi_result_screen.dart';


class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {

  bool isFemale=true;
  double  height=150;
  int weight=60;
  int age=20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 0.0,
        ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isFemale=false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isFemale?Colors.white60.withOpacity(0.1):Colors.blue,
                            borderRadius: BorderRadius.circular(10.0,),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.male_sharp,color: Colors.white,size: 120,),
                              SizedBox(height: 5,),
                              Text('MALE',
                                style: TextStyle(color:  isFemale?Colors.white54:Colors.white,
                                    fontSize: 25,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isFemale=true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: !isFemale?Colors.white60.withOpacity(0.1):Colors.blue,
                            borderRadius: BorderRadius.circular(10.0,),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.female_outlined,color: Colors.white,size: 120,),
                              SizedBox(height: 5,),
                              Text('FEMALE',
                                style: TextStyle(color:!isFemale? Colors.white54:Colors.white,
                                    fontSize: 25,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,),
                child: Container(
                  decoration: BoxDecoration(
                  color: Colors.white60.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.0,),
                 ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('HEIGHT',
                        style: TextStyle(color: Colors.white54,fontSize: 25,fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text("${height.round()}",
                            style: TextStyle(fontSize: 40,color: Colors.white,fontWeight:FontWeight.w900),),
                          SizedBox(width: 5,),
                          Text("CM",
                            style: TextStyle(fontSize: 20,color: Colors.white,fontWeight:FontWeight.w900),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Colors.red,
                       activeTrackColor:Colors.white ,
                       inactiveTrackColor: Colors.grey,
                    ),
                    child:
                        Slider(value: height,
                        onChanged: (value){
                          setState(() {
                            height=value;
                          });

                        },
                        max: 250,
                        min: 80,

                      ),
                  ),


                    ],
                  ),
                ),
              ),
            ),

            Expanded(
              child:
              Padding(
                padding: const EdgeInsets.all( 20),
                child: Row(
                  children: [
                    Expanded(
                     child: Container(
                     decoration: BoxDecoration(
                       color: Colors.white60.withOpacity(0.1),
                       borderRadius: BorderRadius.circular(10.0,),
                     ),
                      child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text('WEIGHT',
                           style: TextStyle(color: Colors.white54,
                               fontSize: 25,fontWeight: FontWeight.bold),),
                         SizedBox(height: 3,),
                         Text("$weight",
                           style: TextStyle(fontSize: 40,
                               color: Colors.white,fontWeight:FontWeight.w900),),
                         SizedBox(height: 3,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             FloatingActionButton(onPressed: (){
                               setState(() {
                                 weight--;
                               });

                             },
                               child: Icon(Icons.remove,),
                               mini: true,
                               backgroundColor: Colors.grey[700],
                               heroTag:'weight-' ,
                             ),
                             SizedBox(width: 3,),
                             FloatingActionButton(onPressed: (){
                               setState(() {
                                 weight++;
                               });
                             },
                               child: Icon(Icons.add,),
                               mini: true,
                               backgroundColor: Colors.grey[700],
                               heroTag:'weight+' ,
                             ),
                           ],
                         ),
                       ],
                     ),
                   ),
                 ),

                    SizedBox(width: 20,),

                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white60.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10.0,),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('AGE',
                              style: TextStyle(color: Colors.white54,
                                  fontSize: 25,fontWeight: FontWeight.bold),),
                            SizedBox(height: 3,),
                            Text("$age",
                              style: TextStyle(fontSize: 40,
                                  color: Colors.white,fontWeight:FontWeight.w900),),
                            SizedBox(height: 3,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                                  child: Icon(Icons.remove,),
                                  mini: true,
                                  backgroundColor: Colors.grey[700],
                                  heroTag: 'age-',
                                ),
                                SizedBox(width: 3,),
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                  child: Icon(Icons.add,),
                                  mini: true,
                                  backgroundColor: Colors.grey[700],
                                  heroTag: 'age+',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),


                ],),
              ),
            ),


            Container(
              width: double.infinity,
              decoration: BoxDecoration(
              color: Colors.red,
              ),
              child: MaterialButton(onPressed: (){

                double result=weight/pow( height /100,2);


                Navigator.push
                  (context,
                    MaterialPageRoute(builder:(context)=>BmiResultScreen(
                      age: age,
                      isFemale: isFemale,
                      result: result.round(),
                    ) ));

              },
                child: Text
                  ('CALCULATE',
                  style:
                  TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                  ),),),
            )
          ],
        ),
      ),


    );
  }
}
