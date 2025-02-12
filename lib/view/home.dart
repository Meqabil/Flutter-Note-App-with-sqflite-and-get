import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app_with_get_sqfile/model/sqflite_database_sample.dart';
import 'package:note_app_with_get_sqfile/view/basic_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SqlDB db = SqlDB();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("m_title".tr),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            offset: const Offset(-25, 40),
            tooltip: "Options",

            itemBuilder:(BuildContext context){
              return [
                PopupMenuItem(
                    onTap: (){
                      Get.toNamed("/settings");
                    },
                    child: Row(
                      children: [
                        Text('g_s'.tr)
                      ],
                    )
                ),
                PopupMenuItem(
                    onTap: (){
                      db.deleteDataBase();
                      Get.offUntil(MaterialPageRoute(builder: (context)=> const Home()), (context)=> false);
                    },
                    child:  Row(
                      children: [
                        Text('d_a'.tr)
                      ],
                    )
                ),
              ];
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          Get.toNamed("/add_notes");
        },
        backgroundColor: Colors.green,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(90))),
        child: const Icon(Icons.note_add,color: Colors.white,),
      ),
      body: const BasicWidget(),
    );
  }
}
