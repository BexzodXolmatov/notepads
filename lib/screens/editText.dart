import 'package:flutter/material.dart';
import 'package:notepads/db/db_user.dart';
import 'package:notepads/models/user_data.dart';

class EditText extends StatelessWidget {
  final User userEdit;
  const EditText({Key? key, required this.userEdit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController TitleController =
        TextEditingController(text: userEdit.title);
    TextEditingController TextController =
        TextEditingController(text: userEdit.text);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF303F9F),
        centerTitle: true,
        title: const Text(
          'Write it down new text',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Labal",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 57, 9, 148),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: TitleController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withAlpha(235),
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFF303F9F), width: 2.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Text",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 57, 9, 148),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: TextController,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: "Enter your text",
                    filled: true,
                    fillColor: Colors.white.withAlpha(235),
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFF303F9F), width: 2.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF303F9F),
                    padding:
                        EdgeInsets.symmetric(horizontal: 145, vertical: 20),
                  ),
                  onPressed: () {
                    var insertUser = DatabaseHelperUser.instance.updataUser(
                        User(
                            id: userEdit.id,
                            title: TitleController.text,
                            text: TextController.text,
                            time: DateTime.now()));
                    insertUser.then((value) {
                      Navigator.of(context).pop(true);
                    });
                  },
                  child: const Text("Edit"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
