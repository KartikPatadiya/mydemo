import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mydemo/Screens/api/kartikmodel.dart';

class Myapicalling extends StatefulWidget {
  const Myapicalling({super.key});

  @override
  State<Myapicalling> createState() => _MyapicallingState();
}

class _MyapicallingState extends State<Myapicalling> {
  List<Kartikmodel> userList = [];
  Future<List<Kartikmodel>> getUserApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        userList.add(Kartikmodel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0.00,
      //   title: const Text('API Calling'),
      //   backgroundColor: Colors.white,
      // ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: FutureBuilder(
                    future: getUserApi(),
                    builder:
                        (context, AsyncSnapshot<List<Kartikmodel>> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView.builder(
                            itemCount: userList.length,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 10,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const MySizebox(),
                                      const Center(
                                          child: Text(
                                        'User Data',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
                                      const MySizebox(),
                                      ReuseRow(
                                        data: 'ID: ',
                                        field:
                                            snapshot.data![index].id.toString(),
                                      ),
                                      const MySizebox(),
                                      ReuseRow(
                                        data: 'Title: ',
                                        field: snapshot.data![index].title
                                            .toString(),
                                      ),
                                      const MySizebox(),
                                      ReuseRow(
                                        data: 'Body: ',
                                        field: snapshot.data![index].body
                                            .toString(),
                                      ),
                                      const MySizebox(),
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                    }))
          ],
        ),
      ),
    );
  }
}

class MySizebox extends StatelessWidget {
  const MySizebox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 3,
    );
  }
}

// ignore: must_be_immutable
class ReuseRow extends StatelessWidget {
  String data, field;
  ReuseRow({super.key, required this.data, required this.field});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          data,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        Flexible(
          child: Text(
            field,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 13, color: Colors.blue),
          ),
        )
      ],
    );
  }
}
