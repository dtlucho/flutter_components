import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _value = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _createSlider(),
            Expanded(
              child: _createImage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Image size',
      value: _value,
      min: 10.0,
      max: 400.0,
      onChanged: (value) {
        setState(() {
          _value = value;
        });
      },
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage(
        'https://w7.pngwing.com/pngs/270/91/png-transparent-yoda-star-wars-logo-star-wars-logo-text-logo-war.png',
      ),
      width: _value,
      fit: BoxFit.contain,
    );
  }
}
