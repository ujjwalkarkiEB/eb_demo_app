import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../core/utils/constants/images.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          side: BorderSide(
            color: Colors.green,
            width: 0.5,
          )),
      tileColor: AppColors.whiteSmoke,
      leading: Container(
        height: 100,
        width: 100,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage(AppImages.userImage))),
      ),
      title: Text(
        'Ujjwal Karki',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: const Text('ujwal.bdev@gmail.com'),
      trailing: IconButton(
          onPressed: () {
            context.router.push(const ProfileRoute());
          },
          icon: const Icon(
            Iconsax.edit,
            color: Colors.black,
          )),
    );
  }
}
