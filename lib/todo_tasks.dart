import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/provider/service_provider.dart';

class ToDoTask extends ConsumerWidget {
  const ToDoTask({super.key, required this.getIndex});

  final int getIndex;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final todoData=ref.watch(fetchStreamProvider);
    return todoData.when(
        data: (todoData){
          Color categoryColor=Colors.white;

          final getCategory=todoData[getIndex].category;
          switch(getCategory){
            case 'Learning':
              categoryColor=Colors.green;
            break;
            case 'Working':
              categoryColor=Colors.blue;
              break;
            case 'General':
              categoryColor=Colors.red;
              break;
          }


      return Container(
        margin: EdgeInsets.symmetric(vertical: 12),
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              width: 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                color: categoryColor,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding:EdgeInsets.zero,
                        leading: IconButton(onPressed:()=> ref.read(serviceProvider).deleteTask(
                          todoData[getIndex].docID

                        ),
                            icon: Icon(CupertinoIcons.delete)),
                        title: Text(todoData[getIndex].titleTask,
                          style: TextStyle(
                            decoration: todoData[getIndex].isDone?
                                TextDecoration.lineThrough:null
                          ),
                        ),
                        subtitle: Text(todoData[getIndex].description,
                          style: TextStyle(
                              decoration: todoData[getIndex].isDone?
                              TextDecoration.lineThrough:null
                          ),
                        ),

                        trailing:Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                              activeColor: Colors.green,
                              shape: CircleBorder(
                                side: BorderSide(
                                  color: categoryColor,
                                  width: 3,
                                ),
                              ),
                              value:todoData[getIndex].isDone,
                              onChanged: (value)=>ref.read(serviceProvider).updateTask(todoData[getIndex].docID, value)
                          ),
                        ),

                      ),
                      Divider(thickness: 1.5,
                        color: categoryColor,),
                      Row(
                        children: [
                          Text(' Today',style: TextStyle(color: Colors.green),),
                          SizedBox(width: 10,),
                          Text(todoData[getIndex].timeTask)
                        ],
                      )
                    ],
                  ),

                ),
              ),
            ),

          ],
        ),


      );
    },
        error: (error,stackTrace)=>Center(
      child: Text(stackTrace.toString()),
    ),
        loading: ()=>const Center(
      child: CircularProgressIndicator(),
    ));
  }
}
