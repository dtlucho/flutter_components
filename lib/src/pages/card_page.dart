import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          _cardType1(),
          const SizedBox(height: 30.0),
          _cardType2(),
          const SizedBox(height: 30.0),
          _cardType1(),
          const SizedBox(height: 30.0),
          _cardType2(),
          const SizedBox(height: 30.0),
          _cardType1(),
          const SizedBox(height: 30.0),
          _cardType2(),
          const SizedBox(height: 30.0),
          _cardType1(),
          const SizedBox(height: 30.0),
          _cardType2(),
          const SizedBox(height: 30.0),
        ],
      ),
    );
  }

  Widget _cardType1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          const ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('Card Title'),
            subtitle: Text(
                'Description text description text description text descrip'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {},
              ),
              TextButton(
                child: const Text('Ok'),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardType2() {
    final card = Container(
      // clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          const FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
              'https://cdn.wallpapersafari.com/57/34/uJFrUS.jpg',
            ),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text('Texto'),
          ),
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0),
          )
        ],
      ),
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
