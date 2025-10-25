import 'package:e_commerce_app/app/app_colors.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, required this.colors, required this.onSelected});

  final List<String> colors;
  final Function(String) onSelected;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  String? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      margin: const EdgeInsets.only(top: 8),
      child: Wrap(
        spacing: 8, // horizontal space
        runSpacing: 8, // vertical space
        alignment: WrapAlignment.start,
        children: widget.colors.map((color) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedColor = color;
                widget.onSelected(color);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: _selectedColor == color ? AppColors.themeColor : null,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                color,
                style: TextStyle(
                  color: _selectedColor == color ? Colors.white : null,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
