import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // ✅ Import Riverpod
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/provider/Date_time_provider.dart';
import 'package:todo_app/provider/radio_provider.dart';
import 'package:todo_app/provider/service_provider.dart';
import 'package:todo_app/radiolist.dart';
import 'package:todo_app/textfield.dart';

import 'Date_time.dart';

class AddNewTask extends ConsumerStatefulWidget {
  AddNewTask({super.key});

  @override
  ConsumerState<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends ConsumerState<AddNewTask> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final DateProv = ref.watch(DateProvider);

    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Text(
            'New Task ToDo',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          const Divider(thickness: 0.5, color: Colors.grey),
          const Text('Task Title'),
          const SizedBox(height: 5),
          textField( // ✅ Ensure textField is a valid custom widget
            hintText: '  Add Task',
            maxLine: 1, txtController: titleController,
          ),
          const SizedBox(height: 5),
          const Text('Description'),
          const SizedBox(height: 5),
          textField(
            hintText: '  Description',
            maxLine: 3, txtController:descriptionController,
          ),
          const SizedBox(height: 5),
          const Text('Category'),
          Row(
            children: [
              Expanded(
                child: Radiolist(
                  titleRadio: 'LRN',
                  categColor: Colors.green,
                  valueInput: 1,
                  onChangeValue: () => ref.read(radioProvider.notifier).update((state)=>1),
                ),
              ),
              Expanded(
                child: Radiolist(
                  titleRadio: 'WRK',
                  categColor: Colors.blue,
                  valueInput: 2,
                  onChangeValue: () => ref.read(radioProvider.notifier).update((state)=>2),
                ),
              ),
              Expanded(
                child: Radiolist(
                  titleRadio: 'GEN',
                  categColor: Colors.red,
                  valueInput: 3,
                  onChangeValue: () => ref.read(radioProvider.notifier).update((state)=>3),
                ),
              ),
            ],
          ),

          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Date_time(
                titleText: 'Date',
                valueText: DateProv,
                iconsection: CupertinoIcons.calendar,
                onTap: ()async{
                  final getValue =await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2025),
                      lastDate: DateTime(2027)
                  );
                  if(getValue!=null){
                    final format =DateFormat.yMd();
                    ref.read(DateProvider.notifier).update((state)=>format.format(getValue));


                  }
                }

              ),
              Date_time(
                titleText: 'Time',
                valueText: ref.watch(TimeProvider),
                iconsection: CupertinoIcons.clock,
                onTap: ()async {
                  final getTime=await showTimePicker(context: context, initialTime: TimeOfDay.now());

                  if(getTime!=null){
                    ref.read(TimeProvider.notifier).update((state)=>getTime.format(context));


                  }
                }


              ),

            ],

          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () =>Navigator.pop(context),
                child: Text('Cancel'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  final getRadioValue=ref.read(radioProvider);
                  String category='';
                  switch(getRadioValue){
                    case 1:
                      category='Learning';
                      break;
                    case 2:
                      category='Working';
                      break;
                    case 3:
                      category='General';
                      break;
                  }

                  ref.read(serviceProvider).addnewtask(
                    ToDoModel(
                        titleTask:titleController.text,
                        description: descriptionController.text,
                        category: category,
                        dateTask: ref.read(DateProvider),
                        timeTask: ref.read(TimeProvider),
                      isDone: false
                    )
                  );
                  print("dataissaving");

                  titleController.clear();
                  descriptionController.clear();
                  ref.read(radioProvider.notifier).update((state)=>0);
                  Navigator.pop(context);
                },
                child: Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
