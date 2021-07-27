
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User{
  int id;
  String name;
  String phone;

  User({
    required this.id,
    required this.name,
    required this.phone});
}

class UserScreen extends StatelessWidget {


  List<User> users=[
    User(id: 1, name: "Emy Ahmad", phone: "0123456789",),
    User(id: 2, name:"Ahmad al Hassan" , phone: "0147852369"),
    User(id: 3, name: "Baseem Ahmad Al Hassan ", phone:"3214569870"),
    User(id: 4, name: "Emy Ahmad", phone: "0123456789",),
    User(id: 5, name:"Ahmad al Hassan" , phone: "0147852369"),
    User(id: 6, name: "Baseem Ahmad Al Hassan ", phone:"3214569870"),
    User(id: 7, name: "Emy Ahmad", phone: "0123456789",),
    User(id: 8, name:"Ahmad al Hassan" , phone: "0147852369"),
    User(id: 9, name: "Baseem Ahmad Al Hassan ", phone:"3214569870"),
    User(id: 10, name: "Emy Ahmad", phone: "0123456789",),
    User(id: 11, name:"Ahmad al Hassan" , phone: "0147852369"),
    User(id: 12, name: "Baseem Ahmad Al Hassan ", phone:"3214569870"),
    User(id: 13, name: "Emy Ahmad", phone: "0123456789",),
    User(id: 14, name:"Ahmad al Hassan" , phone: "0147852369"),
    User(id: 15, name: "Baseem Ahmad Al Hassan ", phone:"3214569870"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User"),
        titleSpacing: 20,
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.separated(
            itemBuilder: (context,index){
              return OneUser(users[index]);
            },
            separatorBuilder: (context,index)=>
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 30,end:30,bottom: 15,top: 15,),
                  child: Container(height: 1,
                  width: double.infinity,
                  color: Colors.grey[300],),
                ),
                itemCount: users.length)
      ),

    );
  }
  Widget OneUser(User rere)=>Row(
    children: [
      CircleAvatar(
        radius: 30,
        child: Text("${rere.id}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),
      SizedBox(width: 10,),
      Expanded(
        child: Column(
          mainAxisSize:MainAxisSize.min ,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${rere.name}" ,
              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5,),
            Text("${rere.phone}" ,style: TextStyle(fontSize: 15,color: Colors.grey),),
          ],
        ),
      ),
    ],);
}

// 1. build item
// 2. build list
// 3. add item to list
//1-ابني عنصر واحد
//2-ابني اللست
//3-اضيف الموديل و العناصر للستة
//لما بنيت العنصر اخذتة وعملت له منه دالة من نوع ويدجت
//بعدين جهزت الليست واخترت استخدم اللست فيو
//اجهز المودل و كمان اللست
//اخذ اسم المودل و ادخلها للدالة كمدخل باي اسم
//و استفيد من العناصر جوة الداله اعرضها في اماكنها
//ارجع لاسم الدالة جوة اللست فيو و استخدم اسم اللست مع الاندكس