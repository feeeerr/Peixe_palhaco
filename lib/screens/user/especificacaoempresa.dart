import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ItemWidget extends StatelessWidget {
  final String name;
  final Color color;

  ItemWidget({required this.name, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          Icon(Icons.arrow_forward),
        ],
      ),
    );
  }
}

class EspecificacaoEmpresa extends StatefulWidget {
  @override
  _EspecificacaoEmpresaState createState() => _EspecificacaoEmpresaState();
}

class _EspecificacaoEmpresaState extends State<EspecificacaoEmpresa> {
  List<Widget> items = [
    ItemWidget(name: 'Item 1', color: Colors.red),
    ItemWidget(name: 'Item 2', color: Colors.green),
    ItemWidget(name: 'Item 3', color: Colors.blue),
    ItemWidget(name: 'Item 4', color: Colors.orange),
    ItemWidget(name: 'Item 5', color: Colors.purple),
  ];

  List<Widget> filteredItems = [];

  String selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    filteredItems = items;
  }

  void filterItems(String category) {
    setState(() {
      if (category == 'All') {
        filteredItems = items;
      } else {
        filteredItems = items.where((item) => (item as ItemWidget).name.contains(category)).toList();
      }
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilterButton('All'),
                SizedBox(width: 16),
                FilterButton('Item 1'),
                SizedBox(width: 16),
                FilterButton('Item 2'),
                SizedBox(width: 16),
                FilterButton('Item 3'),
                SizedBox(width: 16),
                FilterButton('Item 4'),
                SizedBox(width: 16),
                FilterButton('Item 5'),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return filteredItems[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String category;

  FilterButton(this.category);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final _filterApp = context.findAncestorStateOfType<_EspecificacaoEmpresaState>();
        _filterApp!.filterItems(category);
      },
      style: ElevatedButton.styleFrom(
        primary: category == 'All'
            ? Colors.blue
            : _filterColors[category] ?? Colors.grey,
      ),
      child: Text(category),
    );
  }
}

const Map<String, Color> _filterColors = {
  'Item 1': Colors.red,
  'Item 2': Colors.green,
  'Item 3': Colors.blue,
  'Item 4': Colors.orange,
  'Item 5': Colors.purple,
};