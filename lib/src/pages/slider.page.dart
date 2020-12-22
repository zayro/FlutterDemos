import 'package:flutter/material.dart';

class SlidersPage extends StatefulWidget {
  //const name({Key key}) : super(key: key);

  @override
  _SlidersPageState createState() => _SlidersPageState();
}

class _SlidersPageState extends State<SlidersPage> {
  double _currentSliderValue = 100;

  @override
  Widget build(BuildContext context) {
    var slider = Slider(
      value: _currentSliderValue,
      min: 100,
      max: MediaQuery.of(context).size.width,
      divisions: 5,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
          //print(value);
        });
      },
    );
    var image2 = Image(
      image: AssetImage('assets/images/shield.jpg'),
      width: _currentSliderValue,
      height: _currentSliderValue,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            slider,
            image2,
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "$_currentSliderValue x $_currentSliderValue",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
