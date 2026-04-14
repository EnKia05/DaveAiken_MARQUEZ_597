// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../model/users_model.dart';

// class UserScreen extends StatefulWidget {
//   const UserScreen({super.key});

//   @override
//   State<UserScreen> createState() => _UserScreenState();
// }

// class _UserScreenState extends State<UserScreen> {
//   List<User> users = [];
//   bool isLoading = false;

//   Future<void> fetchUsers() async {
//     setState(() {
//       isLoading = true;
//     });

//     final response = await http
//         .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

//         //404
//         //505
//         //200
//          if (response.statusCode == 200) {
//             List<dynamic> jsonData = json.decode(response.body);
//             setState(() {
//               users = jsonData.map((json) => User.fromJson(json)).toList();
//               isLoading = false;
//             });
//     }
//   }

//   @override
//   void initState() {
//     fetchUsers();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: 
//           isLoading ? Center(child: CircularProgressIndicator(),)
//         :
//         ListView.builder(
//           itemCount: users.length,
//           itemBuilder: (context, index) {
//             User user = users[index];
        
//             return ListTile(
//               title: Text(user.name),
//               subtitle: Text(user.email),
//             );
//           },
//         ),

//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:modelhandler/controller/users_controller.dart';
import 'package:modelhandler/model/users_model.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final controller = UserController();
  List<User> users = [];
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  //fetch the user from the Supabase
  void leaduser()async{
    final userdata = await controller.getUsers();
    setState(() {
      users = userdata;
    });
  }

  //add user to the Supabase
  void addUser()async{
    if(nameController.text.isEmpty || emailController.text.isEmpty){
      return;
    }
    else{
      final user = User(name: nameController.text, email: emailController.text);
      await controller.addUser(user);
      nameController.clear();
      emailController.clear();
      leaduser();
    }
  }

  //delete user from the Supabase
  void deleteUser(int id)async{
    await controller.deleteUser(id);
    leaduser();
  }

  //init state
  @override
  void initState() {
    super.initState();
    leaduser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //form
          TextField(
            controller: nameController,
            decoration: InputDecoration(label: Text("Enter your name")),),
          TextField(
            controller: emailController,
            decoration: InputDecoration(label: Text("Enter your email")),),
          ElevatedButton(onPressed: (){
            addUser();
          }, child: Text("Add User")),
          //list of users
          Expanded(child: 
          ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index){
              final user = users[index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
                trailing: IconButton(onPressed: (){
                  deleteUser(user.id!);
                },
                icon: Icon(Icons.delete)),
              );
            })

          )



        ],
      ),

    );
  }
}