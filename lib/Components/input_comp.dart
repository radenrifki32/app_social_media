import 'package:flutter/material.dart';

class InputComponent extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextInputType inputType;
  final Function (String)onChanged;
  const InputComponent(this.labelText, this.hintText, this.inputType, {required this.onChanged});

  @override
  State<InputComponent> createState() => _InputComponentState();
}

class _InputComponentState extends State<InputComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8, 
      child: TextField(
        onChanged: widget.onChanged,
        keyboardType: widget.inputType,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[300], // Grayish background color
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide.none, // No border
          ),
          labelText: widget.labelText,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey), // Grayish hint text color
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
