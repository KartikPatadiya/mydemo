import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mydemo/Screens/api/kartikmodel_2.dart';

//3:47 21%
class Myapicalling2 extends StatefulWidget {
  const Myapicalling2({super.key});

  @override
  State<Myapicalling2> createState() => _Myapicalling2State();
}

class _Myapicalling2State extends State<Myapicalling2> {
  List<Kartikmodel2> userList = [];
  Future<List<Kartikmodel2>> userApi2() async {
    final response2 =
        await get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data2 = jsonDecode(response2.body.toString());
    if (response2.statusCode == 200) {
      for (Map<String, dynamic> i in data2) {
        userList.add(Kartikmodel2.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: userApi2(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Mysizebox(),
                                const Center(
                                    child: Text(
                                  'Information',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                                const Mysizebox(),
                                ReuseRow(
                                    data: "Name: ",
                                    field:
                                        snapshot.data![index].name.toString()),
                                const Mysizebox(),
                                ReuseRow(
                                    data: "Username: ",
                                    field: snapshot.data![index].username
                                        .toString()),
                                const Mysizebox(),
                                ReuseRow(
                                    data: "Email: ",
                                    field:
                                        snapshot.data![index].email.toString()),
                                const Mysizebox(),
                                const Divider(
                                  endIndent: 50,
                                  thickness: 2,
                                  indent: 50,
                                ),
                                const Center(
                                    child: Text(
                                  'Address',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),

                                const Mysizebox(),
                                ReuseRow(
                                    data: "AddressStreet: ",
                                    field: snapshot.data![index].address!.street
                                        .toString()),
                                const Mysizebox(),
                                ReuseRow(
                                    data: "AddressSuite: ",
                                    field: snapshot.data![index].address!.suite
                                        .toString()),
                                const Mysizebox(),
                                ReuseRow(
                                    data: "AddressCity: ",
                                    field: snapshot.data![index].address!.city
                                        .toString()),
                                const Mysizebox(),
                                ReuseRow(
                                    data: "AddressZipCode: ",
                                    field: snapshot
                                        .data![index].address!.zipcode
                                        .toString()),
                                const Mysizebox(),
                                ReuseRow(
                                    data: "AddressGeoLat: ",
                                    field: snapshot
                                        .data![index].address!.geo!.lat
                                        .toString()),
                                const Mysizebox(),
                                ReuseRow(
                                    data: "AddressGeoLng: ",
                                    field: snapshot
                                        .data![index].address!.geo!.lng
                                        .toString()),
                                const Mysizebox(),
                                ReuseRow(
                                    data: "Phone: ",
                                    field:
                                        snapshot.data![index].phone.toString()),
                                const Mysizebox(),
                                ReuseRow(
                                    data: "Website: ",
                                    field: snapshot.data![index].website
                                        .toString()),
                                const Mysizebox(),
                                const Divider(
                                  endIndent: 50,
                                  thickness: 2,
                                  indent: 50,
                                ),
                                const Center(
                                    child: Text(
                                  'Company Details',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),

                                const Mysizebox(),
                                ReuseRow(
                                    data: "CompanyName: ",
                                    field: snapshot.data![index].company!.name
                                        .toString()),
                                const Mysizebox(),
                                // ReuseRow(
                                //     data: "CompanyCatchPhrase: ",
                                //     field: snapshot
                                //         .data![index].company!.catchPhrase
                                //         .toString()),
                                // ReuseRow(
                                //     data: "CompanyBs: ",
                                //     field: snapshot.data![index].company!.bs
                                //         .toString()),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Mysizebox extends StatelessWidget {
  const Mysizebox({
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
            fontSize: 15,
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
