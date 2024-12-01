import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color _selectedColor = Colors.blue;

  double _radius = 25.0;

  Future<void> chooseColor() async {
    Color? color = await showColorPickerDialog(
      context,
      _selectedColor,
      title: Text('Choose Color'),
      showColorCode: true,
      showColorName: true,
      showRecentColors: true,
      borderRadius: _radius,
      pickersEnabled: <ColorPickerType, bool>{
        ColorPickerType.wheel: true,
      },
      subheading: Text("Shades"),
    );
    if (color != null) {
      setState(() {
        _selectedColor = color;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: _selectedColor,
        title: Text('Home Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 15),
            child: Text(
              'Set Radious',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
          Slider(
            value: _radius,
            max: 25,
            activeColor: _selectedColor,
            thumbColor: _selectedColor,
            onChanged: (value) {
              setState(() {
                _radius = value;
              });
            },
          ),
          ColorPicker(
            showColorCode: true,
            showColorName: true,
            showMaterialName: true,
            colorNameTextStyle: TextStyle(fontWeight: FontWeight.bold),
            showRecentColors: true,
            enableOpacity: true,
            color: _selectedColor,
            borderRadius: _radius,
            pickersEnabled: <ColorPickerType, bool>{
              ColorPickerType.wheel: true,
            },
            subheading: Text("Shades"),
            onColorChanged: (value) {
              setState(
                () {
                  _selectedColor = value;
                },
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: _selectedColor,
          child: Icon(
            Icons.color_lens_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            chooseColor();
          }),
    );
  }
}
