import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {






  @override
  Widget build(BuildContext context) {
    var a = ['a','b','c'];
    var b = ['a','b','c'];

    var c = [{'name' : 'Ragu', 'age' : 21},{'name' : 'Jeya', 'age' : {'d':  {'v': 6}}}];
    var d = [{'name' : 'Ragu', 'age' : 21},{'name' : 'Jeya', 'age' : {'d':  {'v': 6}}}];
    // var d = [{'name' : 'Ranjith', 'age' : 23},{'name' : 'Ashwin', 'age' : 22}];

     /// For Checking Equality of List
    final val =  const ListEquality().equals(a, b);
    // var f = (a == b);
    /// For Deep Equality for Minor Changes
    final val2 = const DeepCollectionEquality().equals(c, d);


    return Scaffold(
      body: Center(
        child: Text('${val2}'),
      ),

    );
  }
}
