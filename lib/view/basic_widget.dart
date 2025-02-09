import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app_with_get_sqfile/main.dart';
import 'package:note_app_with_get_sqfile/model/sqflite_database_sample.dart';
import 'package:note_app_with_get_sqfile/view/edit_notes.dart';
import 'package:note_app_with_get_sqfile/view/home.dart';
import 'package:share_plus/share_plus.dart';
class BasicWidget extends StatefulWidget {
  const BasicWidget({super.key});
  @override
  State<BasicWidget> createState() => _BasicWidgetState();
}

class _BasicWidgetState extends State<BasicWidget> {
  SqlDB db = SqlDB();
  Future<List<Map>> getData() async {
    List<Map> response = await db.readData("select * from 'notes'");
    return response;
  }
  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      getData();
    });
  }


  List<Color> lightColors = [Colors.pink,Colors.orangeAccent,Colors.green,Colors.red,Colors.blue,Colors.deepPurple];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder(
          future: getData(),
          builder: (BuildContext context,AsyncSnapshot<List<Map>> snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Get.to(()=> EditNotes(note:snapshot. data?[index]['note'], title:snapshot. data?[index]['title'], id:snapshot. data?[index]['id']));
                    },
                    child: Card(
                      color: lightColors[index % 4],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
                                child: Text("${snapshot.data?[index]['title']}",
                                  style: const TextStyle(color: Color(0xffdcdcdc),fontSize: 18,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: DropOptionMenu(id:snapshot. data?[index]['id'], title:snapshot. data?[index]['title'], note:snapshot. data?[index]['note']))
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                            child: Text("${snapshot.data?[index]['note']}",
                              style: const TextStyle(color: Colors.white,fontSize: 13,overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          const SizedBox(height: 6,),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator(),);
          },
        )
      ),
    );
  }
}
class DropOptionMenu extends StatefulWidget {
  DropOptionMenu({super.key,required this.id,required this.title,required this.note});
  int id;
  String title;
  String note;
  @override
  State<DropOptionMenu> createState() => _DropOptionMenuState();
}

class _DropOptionMenuState extends State<DropOptionMenu> {

  SqlDB db = SqlDB();
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
        offset: Offset(20, 33),
        icon: Icon(Icons.more_vert,color: Colors.white,),
        itemBuilder: (BuildContext context){
          return [
            PopupMenuItem(
              child: ListTile(
                title: Text("delete".tr,style: const TextStyle(color: Colors.red),),
                trailing: const Icon(Icons.delete,color: Colors.red,size: 20,),
              ),
              onTap: ()async{
                int response = await db.deleteData("delete from 'notes' where id = ${widget.id}");
                Get.offUntil(MaterialPageRoute(builder: (context)=> const Home()), (context)=> false);
                print("response");
                setState(() {

                });
              },
            ),
            PopupMenuItem(
              child: ListTile(
                title: Text("share_note".tr,style: const TextStyle(color: Colors.blue),),
                trailing: const Icon(Icons.share,color: Colors.blue,size: 20,),
              ),
              onTap: () {
                Share.share('''
                Title : ${widget.title}
                
                Note :
                  ${widget.note} .
                ''');
              },
            )
          ];
        }
    );
  }
}
