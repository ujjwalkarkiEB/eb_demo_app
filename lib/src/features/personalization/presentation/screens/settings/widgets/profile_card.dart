import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/core/utils/constants/colors.dart';
import 'package:eb_demo_app/src/features/personalization/presentation/bloc/personalization_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../core/utils/constants/images.dart';
import '../../../../data/model/profile.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Profile? userProfile;
    return BlocBuilder<PersonalizationBloc, PersonalizationState>(
      builder: (context, state) {
        if (state is ProfileFetched) {
          userProfile = state.currentUser;
        }
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
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: userProfile?.avatar == null
                      ? const AssetImage(AppImages.userImage)
                      : FileImage(File(userProfile!.avatar)),
                  fit: BoxFit.cover),
            ),
          ),
          title: Text(
            userProfile!.user.userName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(userProfile!.user.email),
          trailing: IconButton(
              onPressed: () {
                context.router.push(const ProfileRoute());
              },
              icon: const Icon(
                Iconsax.edit,
                color: Colors.black,
              )),
        );
      },
    );
  }
}
