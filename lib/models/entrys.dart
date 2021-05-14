import 'package:apuestas_app/models/entry.dart';

final List<Entry> data = <Entry>[
  Entry(
    title: 'Chapter A',
    children: [
      Entry(
        title: 'Section A0',
        children: [
          Entry(title: 'Item A0.1'),
          Entry(title: 'Item A0.2'),
          Entry(title: 'Item A0.3'),
        ],
      ),
      Entry(title: 'Section A1'),
      Entry(title: 'Section A2'),
    ],
  ),
  // Second Row
  Entry(title: 'Chapter B', children: [
    Entry(title: 'Section B0'),
    Entry(title: 'Section B1'),
  ]),
  Entry(
    title: 'Chapter C',
    children: [
      Entry(title: 'Section C0'),
      Entry(title: 'Section C1'),
      Entry(
        title: 'Section C2',
        children: [
          Entry(title: 'Item C2.0'),
          Entry(title: 'Item C2.1'),
          Entry(title: 'Item C2.2'),
          Entry(title: 'Item C2.3'),
        ],
      )
    ],
  ),
];
