import 'package:flutter/material.dart';
import 'package:notepads/db/db_user.dart';
import 'package:notepads/models/user_data.dart';
import 'package:notepads/screens/addButton.dart';
import 'package:notepads/screens/containerText.dart';
import 'package:notepads/screens/editText.dart';

class CrudbScreen extends StatefulWidget {
  const CrudbScreen({Key? key}) : super(key: key);

  @override
  State<CrudbScreen> createState() => _CrudbScreenState();
}

class _CrudbScreenState extends State<CrudbScreen> {
  List<User> users = [];

  TextEditingController userTitleController = new TextEditingController();
  TextEditingController userTextController = new TextEditingController();

  bool userTitleValidate = false;
  bool userTextValidate = false;

  @override
  void initState() {
    super.initState();
    reloadData();
  }

  void reloadData() {
    DatabaseHelperUser.instance.getAllUsers().then((value) {
      setState(() {
        users.clear();

        users.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
      ),
      body: ListView.separated(
          padding: EdgeInsets.all(20),
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(users[index].id.toString()),
              onDismissed: (direction) {
                if (direction == DismissDirection.startToEnd) {
                  DatabaseHelperUser.instance
                      .deleteUser(users[index].id ?? 0)
                      .then((_) {
                    reloadData();
                  });
                }
              },
              child: Material(
                elevation: 5,
                shadowColor: Colors.grey,
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                child: InkWell(
                  splashColor: Color.fromARGB(255, 90, 85, 195),
                  borderRadius: BorderRadius.circular(20),
                  child: ContainerText().build(context, users[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            EditText(userEdit: users[index]),
                      ),
                    ).then(
                      (shouldReload) {
                        if (shouldReload ??= false) {
                          reloadData();
                        }
                      },
                    );
                  },
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
          itemCount: users.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddButton()),
          ).then((shouldReload) {
            if (shouldReload ??= false) {
              reloadData();
            }
          });
          ;
        },
        backgroundColor: Color(0xFF303F9F),
        child: const Icon(Icons.library_books_outlined),
      ),
    );
  }
}
