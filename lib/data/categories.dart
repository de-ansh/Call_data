import 'package:flutter/material.dart';

import 'package:arquella_hub/model/category.dart';

const categories = {
  Categories.clear: Category(
    'Clear',
    Color.fromARGB(255, 0, 255, 128),
  ),
  Categories.danger: Category(
    'Danger',
    Color.fromARGB(255, 255, 0, 0),
  ),
  Categories.warning: Category(
    'Warning',
    Color.fromARGB(255, 255, 149, 0),
  ),
};
