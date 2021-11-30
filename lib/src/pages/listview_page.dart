import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final ScrollController _scrollController = ScrollController();

  final List<int> _numbersList = [];
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addTen();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) _fetchData();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lists'),
      ),
      body: Stack(
        children: [
          _createList(),
          _createLoading(),
        ],
      ),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _getPageOne,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _numbersList.length,
        itemBuilder: (context, index) {
          final int image = _numbersList[index];

          return FadeInImage(
            placeholder: const AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
              'https://picsum.photos/500/300/?image=$image',
            ),
            height: 300,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  Future<void> _getPageOne() async {
    const Duration _duration = Duration(seconds: 2);
    Timer(_duration, () {
      _numbersList.clear();
      _lastItem++;
      _addTen();
    });

    return Future.delayed(_duration);
  }

  void _addTen() {
    for (var i = 1; i < 10; i++) {
      _lastItem++;
      _numbersList.add(_lastItem);
    }

    setState(() {});
  }

  Future _fetchData() async {
    const Duration _duration = Duration(seconds: 2);
    setState(() {
      _isLoading = true;
    });

    return Timer(
      _duration,
      _fakeHTTPResponse,
    );
  }

  void _fakeHTTPResponse() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 250),
    );
    _addTen();
  }

  Widget _createLoading() {
    return _isLoading
        ? Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                ],
              ),
              const SizedBox(
                height: 15.0,
              )
            ],
          )
        : Container();
  }
}
