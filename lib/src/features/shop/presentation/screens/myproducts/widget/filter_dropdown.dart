import 'package:eb_demo_app/src/features/shop/presentation/blocs/myproducts/myproducts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/category.dart';

class FilterDropdown extends StatefulWidget {
  const FilterDropdown({super.key});

  @override
  FilterDropdownState createState() => FilterDropdownState();
}

class FilterDropdownState extends State<FilterDropdown> {
  ProductCategory? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.filter_list, color: Colors.grey),
        const SizedBox(width: 10),
        Expanded(
          child: DropdownButtonFormField<ProductCategory>(
            menuMaxHeight: 200,
            isExpanded: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
            hint: const Text('Select an category'),
            value: selectedCategory,
            items: ProductCategory.values.map((category) {
              return DropdownMenuItem<ProductCategory>(
                value: category,
                child: Text(category.name),
              );
            }).toList(),
            onChanged: (newValue) {
              context
                  .read<MyproductsBloc>()
                  .add(ApplyCategoryFilterEvent(category: newValue!));
              setState(() {
                selectedCategory = newValue;
              });
            },
          ),
        ),
      ],
    );
  }
}
