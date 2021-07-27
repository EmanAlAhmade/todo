

import 'package:flutter/material.dart';

class MessengerScreen extends StatefulWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  _MessengerScreenState createState() => _MessengerScreenState();
}

class _MessengerScreenState extends State<MessengerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing:20 ,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  'https://i.ytimg.com/vi/7WaZimv-0AE/mqdefault.jpg'),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Chat',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.black,
              child: Icon(
                Icons.camera_alt,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 2,),
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.black,
              child: Icon(
                Icons.edit,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        //SingleChildScrollView شريط تمرير للشاشة كاملة
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(7),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(width: 2,),
                      Text('Search..'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8,),

              Container(
                height: 115,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return Stories();
                    },
                    separatorBuilder: (context,index)=>SizedBox(width: 10,),
                    itemCount: 10),
              ),


                Expanded(
                  child: ListView.separated(itemBuilder: (context,index){
                    return Row(children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage("https://pbs.twimg.com/media/DdB2PfYXUAUGwd-?format=jpg&name=large"),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
                            child: CircleAvatar(
                              radius: 7,
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Eman Ahmad",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines:1,
                              overflow: TextOverflow.ellipsis,
                            ),

                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "hello ..my name is Reem...How are you??",
                                    maxLines:2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Text('11.00 pm'),
                              ],
                            ),
                          ],
                        ),
                      ),

                    ],);
                    },
                    separatorBuilder:(context,index){return SizedBox(height: 15,);} ,
                    itemCount: 20,
                    //لايقاف Scroll الخاص بListView
                    physics:NeverScrollableScrollPhysics(),
                    //تحميل جميع عناصر ListView
                    shrinkWrap: true,
                  ),
                ),

                    ],
                  ),
        ),
              ),

    );
  }
Widget chats()=>Row(children: [
  Stack(
    alignment: AlignmentDirectional.bottomEnd,
    children: [
      CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage("https://pbs.twimg.com/media/DdB2PfYXUAUGwd-?format=jpg&name=large"),
      ),
      Padding(
        padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
        child: CircleAvatar(
          radius: 7,
          backgroundColor: Colors.red,
        ),
      ),
    ],
  ),
  SizedBox(width: 10,),
  Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Eman Ahmad",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          maxLines:1,
          overflow: TextOverflow.ellipsis,
        ),

        Row(
          children: [
            Expanded(
              child: Text(
                "hello ..my name is Reem...How are you??",
                maxLines:2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                height: 7,
                width: 7,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Text('11.00 pm'),
          ],
        ),
      ],
    ),
  ),

],);

Widget Stories()=> Container(
  width: 70,
  child: Column(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage:
            NetworkImage('https://pbs.twimg.com/media/DdB2PfVWkAAJ7-q?format=jpg&name=large'),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom:3 ,end:3),
            child: CircleAvatar(
              radius: 7,
              backgroundColor: Colors.red,
            ),
          ),
        ],),
      SizedBox(height: 10,),
      Text(
        "Emy Alahmad jlklk;klk;lk  ;k;   kjkj",
        textAlign: TextAlign.center,
        style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold) ,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),

    ],
  ),
);

}

// 1. build item
// 2. build list
// 3. add item to list
