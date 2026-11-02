import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/work_view_model.dart';

import '../../../data/model/work.dart';
import 'work_card.dart';
import 'work_edit_screen.dart';



class WorkManagementScreen extends ConsumerWidget{
 const WorkManagementScreen({super.key});

 @override
  Widget build(BuildContext context,WidgetRef ref){
   final workState = ref.watch(workViewModelProvider);

   return Scaffold(
     appBar: AppBar(
       title: Text('Quản lý công việc'),
       actions: [
         IconButton(
           onPressed: null,
           icon: Icon(Icons.search),
         ),
         IconButton(
           onPressed: () {
             // Mở chức năng chỉnh màu
           },
           icon: const Icon(Icons.palette),
         ),
       ],
     ),
     body: workState.when(
       loading: () => const Center(
         child: CircularProgressIndicator(),
       ),

       error: (error, stack) => Center(
         child: Text('Error: $error'),
       ),

       data: (works) => ListView.builder(
         padding: const EdgeInsets.all(12),
         itemCount: works.length,

         itemBuilder: (context, index) {
           final work = works[index];

           return Padding(
             padding: const EdgeInsets.only(bottom: 12),
             child: WorkCard(
               work: work,
               onEdit: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) => WorkEditScreen(
                       work: work,
                     ),
                   ),
                 );
               },
             ),
           );
         },
       ),
     ),
   );
 }
}