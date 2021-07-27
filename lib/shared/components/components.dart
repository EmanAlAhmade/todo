import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:udemy/shared/cubit/cubit.dart';
//اي شي اختياري ما عندة قيمة ابتدائية نكتب له علامة استفهام
Widget defButton({
  required String title,
  required Function function,
}) => Container(
  height: 40,
  width: double.infinity,
  color: Colors.deepPurple,
  child:MaterialButton(
        onPressed:(){
          function();
          },
        child: Text(title.toUpperCase(),
          style:TextStyle(color: Colors.white),),
      ),
);

Widget defTextFormField({
   required TextEditingController controller ,
    TextInputType? input,
   required String labelText,
   required IconData preicon,
   Function()? onClik,//دالة اختيارية
   IconData? suficon ,
   bool obscureText=false,
   Color color=Colors.deepPurple,
   required  Function validator,
   Function()? textOnTap,
   bool isOnTap=false,
})=>
TextFormField(
controller: controller,
keyboardType:input!,
  showCursor: isOnTap,
  readOnly: isOnTap,
obscureText:obscureText,
style: TextStyle(color: Colors.amber,),
onTap: (){
   textOnTap!();
},
decoration: InputDecoration(
prefixIcon:Icon(preicon,color: Colors.deepPurple,),
suffixIcon: suficon != null? IconButton(
   onPressed:(){
     onClik!();//علامة التعجب لانة دالة اختيارية
   } ,
     icon:Icon(suficon,color: color,)):null,
labelText: labelText,

labelStyle: TextStyle(fontSize: 20,color:color,),
enabledBorder: OutlineInputBorder(
borderSide: BorderSide(color:color),),
focusedBorder: UnderlineInputBorder(
borderSide: BorderSide(color:color),
),
),
validator:(value){
return validator(value);
},
);


//ادخل لشاشة التي ستعرض داخلها المهام ماب اسمها موديل
Widget buildTaskItem(Map model,context)=> Dismissible(
  key:Key(model['id'].toString()),
  child:   Padding(

    padding: const EdgeInsetsDirectional.only(start: 16,end: 16,top: 16,bottom: 5),

    child: Container(

      height: 95,

      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(10),

        color: Colors.blue.withOpacity(0.25),



      ),

      child: Padding(

        padding: const EdgeInsetsDirectional.only(start: 5,top: 5,bottom: 5,),

        child: Row(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            CircleAvatar(

              radius: 41,

              backgroundColor: Colors.blue,

              child: Text('${model['time']}',

                style: TextStyle(fontWeight: FontWeight.w600,color:Colors.white60),),

            ),



            Expanded(

              child: Padding(

                padding: const EdgeInsetsDirectional.only(top: 10,start: 15,),

                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Text('${model['title']}',

                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Colors.blue),

                    ),

                    SizedBox(height: 5,),

                    Text('${model['date']}',

                      style: TextStyle(fontSize: 20,color: Colors.black38,fontWeight: FontWeight.w700),),

                  ],

                ),

              ),

            ),



            SizedBox(width: 5,),



            Center(

             child: Row(

               children: [

                 IconButton(onPressed: (){

                   AppCubit.get(context).updateData(status:'done', id:model['id']);

                 },

                   icon: Icon(Icons.done_all_outlined,color: Colors.green,),),



                 IconButton(onPressed: (){

                   AppCubit.get(context).updateData(status: 'archived', id:model['id']);

                 },

                   icon:Icon(Icons.archive_outlined,color:Colors.red,),),

               ],

             ),

           ),
            
          ],

        ),

      ),

    ),

  ),
  onDismissed: (direction){
    AppCubit.get(context).deleteData(id: model['id'],);
  }
);


Widget tasksBuilder({required context,required List<Map> tasks,required IconData icon,required String text})=>Conditional.single(
  context: context,
  conditionBuilder: (BuildContext context) => tasks.length>0,
  widgetBuilder: (BuildContext context) =>SafeArea(
    child: ListView.builder(
        itemBuilder: (context, index) =>
            buildTaskItem(tasks[index],context),
        itemCount: tasks.length),
  ),
  fallbackBuilder: (BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,size: 50,color: Colors.grey,),
        SizedBox(height: 5,),
        Text('$text'
          ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey,),
        ),
      ],
    ),
  ),
);