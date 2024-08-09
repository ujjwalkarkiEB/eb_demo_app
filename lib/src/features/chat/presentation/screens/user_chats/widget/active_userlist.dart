import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/common/widgets/custom_shapes/container/circular_container.dart';
import '../../../../../../../core/utils/constants/images.dart';
import '../../../../data/model/user.dart';

class ActiveUsersList extends StatelessWidget {
  const ActiveUsersList({
    super.key,
    required this.activeUsers,
  });
  final List<User> activeUsers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const Gap(10),
        itemCount: activeUsers.length,
        itemBuilder: (context, index) {
          final activeUser = activeUsers[index];
          return Column(
            children: [
              // user image with active mark
              Stack(children: [
                CircleAvatar(
                  backgroundImage: AssetImage(AppImages.userImage),
                  radius: 30,
                ),
                Positioned(
                  right: 2,
                  bottom: 1,
                  child: CircularContainer(
                    backgroundColor: Colors.green,
                    height: 15,
                    width: 15,
                  ),
                )
              ]),
              Gap(5),
              // user name
              Text(activeUser.userName)
            ],
          );
        },
      ),
    );
  }
}
