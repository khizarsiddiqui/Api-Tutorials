import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:apitutorials/models/PostsModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<PostsModel> postList = []; // (if array don't have any name), else this step can be skipped.

  Future<List<PostsModel>> getPostApi()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map i in data){
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    }else{
      return postList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Api Course',
          style: TextStyle(
          fontWeight: FontWeight.bold,),
        ),
      ),
      body: Column(
        children: [
          Expanded(
           child:FutureBuilder(
            future: getPostApi(),
              builder: (context, snapshot){
              if(!snapshot.hasData){
                return const Text('Loading');
              }else {
                return ListView.builder(
                  itemCount: postList.length,
                  itemBuilder: (context, index){
                  //return Text(index.toString()); // to print index
                    //return Text(postList[index].title.toString()); //to print title
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text('Title', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                             Text(postList[index].title.toString()),
                             SizedBox(height: 5,),
                             Text('Description', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                             Text(postList[index].body.toString()),
                             SizedBox(height: 5,),
                          ],
                        ),
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
