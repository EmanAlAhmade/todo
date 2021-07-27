import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/shared/components/components.dart';
import 'package:udemy/shared/cubit/cubit.dart';
import 'package:udemy/shared/cubit/states.dart';

class Done extends StatelessWidget {
  const Done({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates states) {},
      builder: (BuildContext context, AppStates states) {
        var tasks=AppCubit.get(context).doneTasks;
        return tasksBuilder(
            context: context,
            tasks: tasks,
            icon: Icons.check_circle_outlined,
            text: 'Not added yet..');
      },
    );
  }
}
