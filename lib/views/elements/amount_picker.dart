import 'package:flutter/material.dart';

class AmountPicker extends StatefulWidget {
  final int initialValue;
  final ValueChanged onValueChanged;

  AmountPicker({
    Key? key,
    this.initialValue = 1,
    required this.onValueChanged,
  })   : assert(initialValue >= 1),
        super(key: key);

  _AmountPickerState createState() => _AmountPickerState();
}

class _AmountPickerState extends State<AmountPicker> {
  int value = 0;
  double _buttonWidth = 30.0;
  double _valueWidth = 50.0;
  double _totalWidth = 0;
  double _height = 0;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
    _totalWidth = 2 * _buttonWidth + _valueWidth;
    _height = _buttonWidth;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _totalWidth,
      height: _height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          InkWell(
            onTap: () {
              if (value > 1) {
                setState(() {
                  value--;
                });
                widget.onValueChanged(value);
              }
            },
            child: Container(
              width: _buttonWidth,
              height: _height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_buttonWidth / 2),
                color: Colors.amber[100],
              ),
              child: Center(
                child: Icon(
                  Icons.remove,
                  color: Colors.amber,
                  size: 25.0,
                ),
              ),
            ),
          ),
          Container(
            width: _valueWidth,
            child: Center(
              child: Text(
                value.toString(),
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                value++;
              });
              widget.onValueChanged(value);
            },
            child: Container(
              width: _buttonWidth,
              height: _height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_buttonWidth / 2),
                color: Colors.amber[100],
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Colors.amber,
                  size: 25.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
