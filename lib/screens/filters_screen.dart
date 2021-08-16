import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.saveFilters, this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    this._glutenFree = widget.currentFilters['gluten'];
    this._lactoseFree = widget.currentFilters['lactose'];
    this._vegetarian = widget.currentFilters['vegetarian'];
    this._vegan = widget.currentFilters['vegan'];

    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String description, bool currentValue, Function onChange) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: onChange);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  'Gluten-free', 'Only include gluten free meals', _glutenFree,
                  (val) {
                setState(() {
                  _glutenFree = val;
                });
              }),
              _buildSwitchListTile(
                  'Vegetarian', 'Only include vegetarian meals', _vegetarian,
                  (val) {
                setState(() {
                  _vegetarian = val;
                });
              }),
              _buildSwitchListTile('Vegan', 'Only include vegan meals', _vegan,
                  (val) {
                setState(() {
                  _vegan = val;
                });
              }),
              _buildSwitchListTile('Lactose-free',
                  'Only include lactose free meals', _lactoseFree, (val) {
                setState(() {
                  _lactoseFree = val;
                });
              }),
            ],
          )),
        ],
      ),
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
    );
  }
}
