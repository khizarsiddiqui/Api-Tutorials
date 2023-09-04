import 'dart:convert';

import 'package:apitutorials/models/UsersModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// example four: showing API when model is not available
class ExampleFour extends StatefulWidget {
  const ExampleFour({Key? key}) : super(key: key);

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {
  var data;
  Future<void> getUserApi() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if(response.statusCode == 200){
      data = jsonDecode(response.body.toString());
    }else{

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: Text('Api Course'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getUserApi(),
                builder: (context, snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Loading');
                  }else {
                    // return Text(data[0]['name'].toString());
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index){
                          return Card(
                            child: Column(
                             children: [
                               ReusableRow(title: 'Name', value: data[index]['name'].toString()),
                               ReusableRow(title: 'Username', value: data[index]['username'].toString()),
                               ReusableRow(title: 'Address', value: data[index]['address']['street'].toString()),
                               ReusableRow(title: 'Lat', value: data[index]['address']['geo']['lat'].toString()),
                               ReusableRow(title: 'Lng', value: data[index]['address']['geo']['lng'].toString()),
                              ],
                           ),
                          );
                     });
                  }
                },
            ),
          )
        ],
      ),
    );
  }
}
class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
