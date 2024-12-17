

import 'dart:math';

import 'package:flutter/material.dart';


class AnimatedListSample extends StatefulWidget {
  const AnimatedListSample({super.key});

  @override
  State<AnimatedListSample> createState() => _AnimatedListSampleState();
}

class _AnimatedListSampleState extends State<AnimatedListSample> {

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
    List<int> _list=[1,2,3];


  @override
  void initState() {
    super.initState();
  }

  void _insert() {
    final int newItem = Random().nextInt(100);
    _list.add(newItem);
    _listKey.currentState?.insertItem(_list.length-1,);
  }

  void _remove() {
     var removedItem= _list[_list.length-1];
        _list.removeAt(_list.length-1);
        _listKey.currentState?.removeItem(_list.length, (BuildContext context, Animation<double> animation) {
          return CardItem(
            animation: animation,
            item: removedItem,
          );
        },);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedList'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_circle),
            onPressed: _insert,
            tooltip: 'insert a new item',
          ),
          IconButton(
            icon: const Icon(Icons.remove_circle),
            onPressed: _remove,
            tooltip: 'remove the selected item',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AnimatedList(
          key: _listKey,
          initialItemCount: _list.length,
          itemBuilder: (_,index,animation){
            return CardItem(
              animation: animation,
              item: _list[index],
            );
        },
        ),
      ),
    );
  }
}



class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.animation,
    required this.item,
  }) : assert(item >= 0);

  final Animation<double> animation;
  final int item;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headlineMedium!;
     final Animation<Offset> _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animation,
      curve: Curves.linear,
    ));
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SlideTransition(
        position: _offsetAnimation,
        child: SizedBox(
          height: 80.0,
          child: Card(
            color: Colors.primaries[item % Colors.primaries.length],
            child: Center(
              child: Text('Item $item', style: textStyle),
            ),
          ),
        ),
      ),
    );
  }
}
