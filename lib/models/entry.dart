import 'package:flutter/material.dart';

class Entry {
  final String title;
  final List<Entry> children;

  const Entry({
    @required this.title,
    this.children = const [],
  });
}
