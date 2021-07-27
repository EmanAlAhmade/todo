import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:intl/intl.dart';
import 'package:udemy/shared/components/components.dart';
import 'package:udemy/shared/cubit/cubit.dart';
import 'package:udemy/shared/cubit/states.dart';


// 1. create database
// 2. create tables
// 3. open database//3خطوات الاولي بدالة وحدة و استدعيها بالانت ستيت
// 4. insert to database
// 5. get from database
// 6. update in database
// 7. delete from database



class HomeLayout extends StatelessWidget {

  var scaffoldKey=GlobalKey<ScaffoldState>();
  var formSheetKey=GlobalKey<FormState>();
  var titleController=TextEditingController();
  var dataController=TextEditingController();
  var timeController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (BuildContext context)=>AppCubit(AppInitialState())..createDataBase(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context,AppStates states){
          if(states is AppInsertDatabaseStates){
            Navigator.pop(context);
            titleController.text='';
            timeController.text='';
            dataController.text='';
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(
                 content: Text('Saved Successfully'),
                 backgroundColor: Colors.lightBlueAccent,
                 duration: const Duration(seconds: 1,),),);}
          if(states is AppDeleteDatabaseStates){
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(
                  content: Text('Deleted Successfully'),
              backgroundColor: Colors.lightBlueAccent,
              duration: const Duration(seconds: 1,),),);
          }
        },

        builder: (BuildContext context,AppStates states){
          AppCubit cubit=AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(cubit.titles[cubit.bottmindex]),
            ),
            body:
            //لو طول الماب اللى اخزن فيها المهام مساوي للصفر يعني لم يكتمل تحميلها اظهر علامة التحميل و الا اظهر الشاشة اوف  الاندكس
            //tasks.length==0 ?Center(child: CircularProgressIndicator()) : screens[index] ,
            Conditional.single(
              context: context,
              conditionBuilder: (BuildContext context) => states is! AppGetDatabaseLoadingStates,
              widgetBuilder: (BuildContext context) => cubit.screens[cubit.bottmindex],
              fallbackBuilder: (BuildContext context) => Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                if(cubit.isOpen==true)
                {
                  if(formSheetKey.currentState!.validate()) {

                    cubit.insertDataBase(
                        title: titleController.text,
                        time: timeController.text,
                        data: dataController.text);

                  }
                }
                else
                {
                  scaffoldKey.currentState!.showBottomSheet((context) {
                    return SingleChildScrollView(
                      child: Container(
                        color: Colors.lightBlueAccent.withOpacity(0.20),
                        padding: const EdgeInsets.all(20),
                        child: Form(
                          key: formSheetKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,

                            children: [
                              Container(
                                width: double.infinity,
                                child: Text('Add new task:',textAlign: TextAlign.start,
                                  style: TextStyle
                                    (color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                              ),
                              SizedBox(height: 20,),
                              defTextFormField(
                                  controller: titleController,
                                  input:TextInputType.text,
                                  labelText:'Task Title',
                                  preicon: Icons.title,
                                  validator:(String value){
                                    if(value.isEmpty)
                                    {return 'Please Enter Title';}
                                    else
                                    { return null;}
                                  }
                              ),

                              SizedBox(height: 20,),

                              defTextFormField(
                                  controller: dataController,
                                  input:TextInputType.datetime,
                                  labelText:'Date',
                                  isOnTap: true,
                                  textOnTap: (){
                                    showDatePicker(context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2050),).then((value){
                                      dataController.text=DateFormat.yMMMd().format(value!);

                                    }
                                    );
                                  },
                                  preicon: Icons.calendar_today_rounded,
                                  validator:(String value){
                                    if(value.isEmpty)
                                    {return 'Please choose the data';}
                                    else
                                    { return null;}
                                  }

                              ),

                              SizedBox(height: 20,),

                              defTextFormField(
                                  controller: timeController,
                                  input:TextInputType.datetime,
                                  labelText:'Task Time',
                                  preicon: Icons.watch_later_outlined,
                                  isOnTap: true,
                                  textOnTap: (){
                                    showTimePicker(context: context,
                                        initialTime: TimeOfDay.now()).then((value)
                                    {
                                      timeController.text=value!.format(context).toString();
                                    });
                                  },
                                  validator:(String value){
                                    if(value.isEmpty)
                                    {return 'Please choose the data';}
                                    else
                                    { return null;}
                                  }
                              ),

                              SizedBox(height: 20,),

                            ],
                          ),
                        ),
                      ),
                    );

                  }).closed.then((value) {

                    cubit.changeBottomSheetStates(icon:Icons.edit ,isShow:false );


                  } );
                  cubit.changeBottomSheetStates( icon: Icons.add,isShow:true );


                }
              },
              elevation: 20,

              child: Icon(cubit.iconSheet),
            ),


            bottomNavigationBar:BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.black,


              items:
              [
                BottomNavigationBarItem(
                    icon:Icon(Icons.menu_rounded,color: Colors.black38,),
                    label: 'Tasks',
                   activeIcon: Icon(Icons.menu_rounded,color: Colors.blue,),
                ),
                BottomNavigationBarItem(
                    icon:Icon(Icons.check_circle_outlined,color: Colors.green,),
                    label: 'Done',
                  activeIcon: Icon(Icons.check_circle_outlined,color: Colors.blue,),
                ),
                BottomNavigationBarItem(
                    icon:Icon(Icons.archive_outlined,color: Colors.pink,),
                    label: 'Archived',
                  activeIcon: Icon(Icons.archive_outlined,color: Colors.blue,),
                ),
              ],
              onTap: (value){

               cubit.changeIndex(value);


              },
              currentIndex: cubit.bottmindex,

            ) ,
          );
        },

      ),
    );
  }


}





