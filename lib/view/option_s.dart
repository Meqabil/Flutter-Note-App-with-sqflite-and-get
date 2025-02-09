import 'package:flutter/material.dart';



class DropDownMenuExample extends StatelessWidget {
  void _onMenuItemSelected(BuildContext context, String value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Selected: $value")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dropdown Menu on IconButton")),
      body: Center(
        child: PopupMenuButton<String>(
          icon: Icon(Icons.more_vert, size: 30, color: Colors.blue), // Icon button
          onSelected: (String value) => _onMenuItemSelected(context, value),
          itemBuilder: (BuildContext context) => [
            PopupMenuItem(
              value: "Edit",
              child: Row(
                children: [
                  Icon(Icons.edit, color: Colors.blue),
                  SizedBox(width: 10),
                  Text("Edit"),
                ],
              ),
            ),
            PopupMenuItem(
              value: "Delete",
              child: Row(
                children: [
                  Icon(Icons.delete, color: Colors.red),
                  SizedBox(width: 10),
                  Text("Delete"),
                ],
              ),
            ),
            PopupMenuItem(
              value: "Share",
              child: Row(
                children: [
                  Icon(Icons.share, color: Colors.green),
                  SizedBox(width: 10),
                  Text("Share"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
