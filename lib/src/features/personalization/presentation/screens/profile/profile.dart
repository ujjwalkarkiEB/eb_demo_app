import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/utils/constants/images.dart';
import 'package:eb_demo_app/src/features/personalization/presentation/bloc/personalization_bloc.dart';
import 'package:eb_demo_app/src/features/personalization/presentation/screens/profile/widget/update_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../data/model/profile.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Profile? userProfile;

    return BlocBuilder<PersonalizationBloc, PersonalizationState>(
      builder: (context, state) {
        if (state is ProfileUpdateLoading) {
          EasyLoading.show(status: 'Uploading...');
        }
        if (state is ProfileUpdateSuccessful) {
          EasyLoading.showSuccess('Profile is updated Successfully!');
          context
              .read<PersonalizationBloc>()
              .add(ProfileDataFetchRequestEvent(profileId: userProfile!.id));
        }

        if (state is ProfileFetched) {
          print('avaatar: ${state.currentUser.avatar}');
          userProfile = state.currentUser;
        }

        if (state is ProfileUpdateFailure) {
          EasyLoading.showError('Retry!');
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Profile'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: userProfile!.avatar == null
                            ? const AssetImage(AppImages.userImage)
                            : FileImage(File(userProfile!.avatar)),
                        radius: 30,
                      ),
                      Text(userProfile?.bio ?? '')
                    ],
                  ),
                  const Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Profile Information'),
                      ListTile(
                        minLeadingWidth: 0,
                        leading: Text(
                          'Profile-ID',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        title: Text(userProfile!.id),
                        trailing: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.copy)),
                      ),
                    ],
                  ),
                  const Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Personal Information'),
                      ListTile(
                        minLeadingWidth: 0,
                        leading: Text(
                          'Username',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        title: Text(userProfile!.user.userName),
                        trailing: const Icon(Icons.arrow_right),
                      ),
                      ListTile(
                        minLeadingWidth: 0,
                        leading: const Text('Email'),
                        title: Text(userProfile!.user.email),
                        trailing: const Icon(Icons.arrow_right),
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return const UpdateProfileModal();
                          },
                        );
                      },
                      child: const Text('Update Account'))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
