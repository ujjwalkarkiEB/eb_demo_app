import 'package:eb_demo_app/core/utils/constants/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: Divider(
                color: Colors.grey,
                indent: 50,
                endIndent: 10,
              ),
            ),
            Text('or signin with'),
            Flexible(
              child: Divider(
                color: Colors.grey,
                indent: 10,
                endIndent: 50,
              ),
            ),
          ],
        ),
        Gap(10),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              shape: BoxShape.circle,
              image: const DecorationImage(
                  image: AssetImage(AppImages.googleLogo), fit: BoxFit.cover)),
        ),
      ],
    );
  }
}
