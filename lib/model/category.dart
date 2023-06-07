import 'package:flutter/material.dart';

enum Categories { clear, danger, warning }

class Category {
  const Category(this.title, this.color);

  final String title;
  final Color color;
}
