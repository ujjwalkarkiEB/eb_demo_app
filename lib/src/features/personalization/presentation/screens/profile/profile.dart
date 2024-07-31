import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/utils/constants/images.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(AppImages.userImage),
                  radius: 30,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text('Update Profile picture'))
              ],
            ),
            const Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Profile Informaion'),
                ListTile(
                  minLeadingWidth: 0,
                  leading: Text(
                    'Username',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  title: Text('Ujjwal Karki'),
                  trailing: Icon(Icons.arrow_right),
                ),
              ],
            ),
            const Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Personal Informaion'),
                ListTile(
                  leading: Text(
                    'User-ID',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  title: const Text('12345645'),
                  trailing: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.copy)),
                ),
                const ListTile(
                  leading: Text('Email'),
                  title: Text('ujwal.bdev@gmail.com'),
                  trailing: Icon(Icons.arrow_right),
                ),
              ],
            ),
            TextButton(onPressed: () {}, child: const Text('Update Account'))
          ],
        ),
      ),
    );
  }
}
