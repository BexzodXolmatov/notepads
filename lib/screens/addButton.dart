import 'package:flutter/material.dart';
import 'package:notepads/db/db_user.dart';
import 'package:notepads/models/user_data.dart';

class AddButton extends StatefulWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    TextEditingController userTitleController = new TextEditingController();
    TextEditingController userTextController = new TextEditingController();

    bool userTitleValidate = false;
    bool userTextValidate = false;

    Color _backgroundColor = Color(0xFFFFFFFF);
    void _setBackgroundColor(Color newColor) {
      print("ok");
      if (newColor != _backgroundColor) {
        print("ok2");
        setState(() {
          print("ok3");
          _backgroundColor = newColor;
        });
      }
    }

    bool colorbar = false;
    void _openColorBar() {
      setState(() {
        if (colorbar == false) {
          colorbar = true;
        } else {
          colorbar = false;
        }
      });
    }

    ;

    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF303F9F),
        centerTitle: true,
        title: const Text(
          'Write it down',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: _openColorBar, icon: Icon(Icons.color_lens_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        _setBackgroundColor(Color(0xFFFFE2E0));
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 245, 65, 52),
                          border: Border.all(
                              color: Color.fromARGB(255, 57, 9, 148), width: 2),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _setBackgroundColor(Color(0xFFFDFFE0));
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.yellow,
                          border: Border.all(
                              color: Color.fromARGB(255, 57, 9, 148), width: 2),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _setBackgroundColor(Color(0xFFE0FFE1));
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                          border: Border.all(
                              color: Color.fromARGB(255, 57, 9, 148), width: 2),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _setBackgroundColor(Color(0xFFE0F9FF));
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                          border: Border.all(
                              color: Color.fromARGB(255, 57, 9, 148), width: 2),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _setBackgroundColor(Color(0xFFFFE0FB));
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.pink,
                          border: Border.all(
                              color: Color.fromARGB(255, 57, 9, 148), width: 2),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _setBackgroundColor(Color(0xFFEBE0FF));
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.purple,
                          border: Border.all(
                              color: Color.fromARGB(255, 57, 9, 148), width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
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
                  textCapitalization: TextCapitalization.sentences,
                  controller: userTitleController..text = "",
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
                  textCapitalization: TextCapitalization.sentences,
                  controller: userTextController..text = "",
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
                      if (userTitleController.text.isEmpty) {
                        setState(() {
                          userTitleValidate = false;
                        });
                      } else if (userTextController.text.isEmpty) {
                        setState(() {
                          userTitleValidate = true;
                          userTextValidate = false;
                        });
                      } else {
                        var insertUser =
                            DatabaseHelperUser.instance.insertUser(User(
                          title: userTitleController.text,
                          text: userTextController.text,
                          time: DateTime.now(),
                        ));
                        insertUser.then((value) {
                          Navigator.of(context).pop(true);
                        });
                      }
                    },
                    child: Text("Add")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
