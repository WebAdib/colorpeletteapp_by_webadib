import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color _selectedColor = Colors.blue;
  Future<void> chooseColor() async {
    Color? color = await showColorPickerDialog(context, _selectedColor,
        title: Text('Choose Color'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: _selectedColor,
        title: Text('Home Page'),
      ),
      body: Column(),
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
