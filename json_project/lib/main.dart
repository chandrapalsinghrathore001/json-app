import 'dart:convert';


import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'json app',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomepage()
      
    );
  }
}

class MyHomepage extends StatefulWidget {
  final List data;

  const MyHomepage({Key key, this.data}) : super(key: key);

  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('json app')
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString('load_json/person.json'),
            builder: (context, snapshot) {
              var mydata = json.decode(snapshot.data.toString());
              return ListView.builder(itemBuilder: (BuildContext context, int index){
                return Card(child: 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text('Name:' +mydata[index]['name']),
                    Text('Age:' +mydata[index]['age']),
                    Text('Height:' +mydata[index]['height']),
                    Text('Haircolor:' +mydata[index]['hair_color']),
                    Text('Gender:' +mydata[index]['gender']),
                  ],

                ),
                );
              },
              itemCount: mydata == null ? 0 : mydata.length,
              );
            },

          ),
        ),
      ),
      
    );
  }
}