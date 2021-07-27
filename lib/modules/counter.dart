
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int cont=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
        titleSpacing: 20,
      ),
      body:SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: (){
                cont--;
                setState(() {

                });
              },
                  child: Text("Minus",style:TextStyle(fontSize: 20,),)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,),
                child: Text('$cont',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
              ),
              TextButton(onPressed: (){
                cont++;
                setState(() {

                });
              },
                  child: Text("Plus",style:TextStyle(fontSize: 20,))),
            ],
          ),
        ),
      ) ,

    );
  }
}

// للتحويل من stateless الى stateful اضغط على alt+enter على كلمة stateless
