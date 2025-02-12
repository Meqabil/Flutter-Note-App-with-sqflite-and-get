import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../model/sqflite_database_sample.dart';

class EditNotes extends StatefulWidget {
  EditNotes({super.key,required this.note,required this.title,required this.id});
  int id;
  String title;
  String note;
  @override
  State<EditNotes> createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> {
  SqlDB db = SqlDB();
  GlobalKey<FormState> st = GlobalKey();
  TextEditingController title = TextEditingController();
  TextEditingController note = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    title.text = widget.title;
    note.text = widget.note;
  }

  @override
  void dispose() {
    title.dispose();
    note.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("m_title".tr),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: () async{
        int response = await db.updateData('''
          update `notes` set `title` = "${title.text}", `note` = "${note.text}" where `id` = "${widget.id}";
        ''');
        print(response);
        if(response > 0)
          Get.offAllNamed("/");
      }, label: Text("save".tr,style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
        icon: const Icon(Icons.done,color: Colors.white,),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: title,
                style: const TextStyle(
                  fontSize: 29,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: "n_t".tr,
                  hintStyle: TextStyle(
                    color: Colors.grey.shade300,
                    fontSize: 29,
                  ),
                  border: InputBorder.none,
                ),
              ),
              TextFormField(
                controller: note,
                minLines: 5,
                maxLines: 129,
                cursorColor: Colors.green,
                style: TextStyle(
                    color: Colors.grey.shade600
                ),
                decoration: InputDecoration(
                  hintText: "note".tr,
                  hintStyle: TextStyle(
                    color: Colors.grey.shade300,
                    fontSize: 21,
                  ),
                  border: InputBorder.none,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
