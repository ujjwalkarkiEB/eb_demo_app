import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../core/common/widgets/custom_shapes/container/circular_container.dart';
import '../../../../../../../core/utils/constants/colors.dart';

class AddCartBar extends StatelessWidget {
  const AddCartBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
          color: AppColors.whiteSmoke,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircularContainer(
                    backgroundColor: Colors.green,
                    child: Center(
                        child: Icon(
                      Iconsax.minus,
                      color: Colors.white,
                    )),
                  ),
                  Text('4'),
                  CircularContainer(
                    backgroundColor: Colors.green,
                    child: Center(
                        child: Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
                  )
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Add to cart',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
