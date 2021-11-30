import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final List<int> _numersList = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lists'),
      ),
      body: _createList(),
    );
  }

  Widget _createList() {
    return ListView.builder(
      itemCount: _numersList.length,
      itemBuilder: (context, index) {
        final int image = _numersList[index];

        return FadeInImage(
          placeholder: const AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(
            'https://picsum.photos/500/300/?image=$image',
          ),
          height: 300,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
