import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/store/store_bloc.dart';

class FilterSection extends StatefulWidget {
  final double initialMinPrice;
  final double initialMaxPrice;
  final double categoryID;

  const FilterSection({
    super.key,
    required this.initialMinPrice,
    required this.initialMaxPrice,
    required this.categoryID,
  });

  @override
  FilterSectionState createState() => FilterSectionState();
}

class FilterSectionState extends State<FilterSection> {
  late double _minPrice;
  late double _maxPrice;

  @override
  void initState() {
    super.initState();
    _minPrice = widget.initialMinPrice;
    _maxPrice = widget.initialMaxPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Price Range', style: Theme.of(context).textTheme.titleSmall),
          RangeSlider(
            values: RangeValues(_minPrice, _maxPrice),
            min: 0,
            max: 1000,
            divisions: 100,
            labels: RangeLabels(
              '\$${_minPrice.toStringAsFixed(0)}',
              '\$${_maxPrice.toStringAsFixed(0)}',
            ),
            onChanged: (values) {
              setState(() {
                _minPrice = values.start;
                _maxPrice = values.end;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              context.read<StoreBloc>().add(ApplyPriceFilterEvent(
                    categoryId: widget.categoryID,
                    minPrice: _minPrice,
                    maxPrice: _maxPrice,
                  ));
            },
            child: Text('Apply Filters'),
          ),
        ],
      ),
    );
  }
}
