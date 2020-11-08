import 'package:UIdemo/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ));

UserModel _userModel;

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  Future<UserModel> createUser(String name, String job) async {
    final String url = "https://reqres.in/api/users";
    final res = await http.post(
      url,
      body: {"name": name, "job": job},
    );

    if (res.statusCode == 201) {
      final String responseString = res.body;

      return userModelFromJson(responseString);
    } else {
      SnackBar(
        content: Text("Error "),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Demo"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: "Name herer"),
            controller: nameController,
          ),
          TextField(
            decoration: InputDecoration(hintText: " Job Name herer"),
            controller: jobController,
          ),
          SizedBox(
            height: 50,
          ),
          _userModel == null
              ? Container()
              : Text(
                  "UserName: ${_userModel.name}/n jobTitle:${_userModel.job} /n Time : ${_userModel.createdAt.toIso8601String()}  "), 
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String name = nameController.text;
          final String job = jobController.text;
          final user = await createUser(name, job);

          setState(() {
            _userModel = user;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
