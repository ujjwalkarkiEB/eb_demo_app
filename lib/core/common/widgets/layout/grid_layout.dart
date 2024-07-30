import 'package:flutter/material.dart';

class GridLayout extends StatelessWidget {
  const GridLayout({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.mainAxisExtent = 280,
  });
  final Widget? Function(BuildContext, int) itemBuilder;
  final int itemCount;
  final double? mainAxisExtent;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            mainAxisExtent: mainAxisExtent),
        itemBuilder: itemBuilder);
  }
}
