import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

//list_2 is for the event students
class List_2 extends StatefulWidget {
  const List_2({super.key});

  @override
  State<List_2> createState() => _ListState();
}

class _ListState extends State<List_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //stream builder if for updating the data
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("attend").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('error'),
              );
            }
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            //this container containes the list received from the firebase
            return Container(
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  if (snapshot.data!.docs[index]['attend'] == 1 &&
                      snapshot.data!.docs[index]['Event'] == 'vevent') {
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title:
                            Text(snapshot.data!.docs[index]['name'].toString()),
                      ),
                    );
                  }
                  // ignore: prefer_const_constructors
                  return Card();
                },
              ),
            );
          }),
    );
  }
}
