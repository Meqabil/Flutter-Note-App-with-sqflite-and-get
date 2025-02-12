import 'package:flutter/material.dart';
import 'package:note_app_with_get_sqfile/model/sqflite_database_sample.dart';
import 'package:get/get.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  SqlDB db = SqlDB();
  GlobalKey<FormState> st = GlobalKey();
  TextEditingController title = TextEditingController();
  TextEditingController note = TextEditingController();
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
        int response = await db.insertData("insert into notes (`title`,`note`) values (?,?)",
          [title.text,note.text]
        );
        Get.offAllNamed("/");
      }, label: Text("save".tr,style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
        icon: const Icon(Icons.done,color: Colors.white,),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Form(
            key: st,
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
      ),
    );
  }
}
