import 'package:eb_demo_app/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnboardingScreenWidget extends StatelessWidget {
  const OnboardingScreenWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.image});
  final String title;
  final String subTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 400,
          width: 300,
          fit: BoxFit.fill,
        ),
        Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall!.apply(
                    color: Colors.white,
                  ),
            ),
            const Gap(AppSizes.spaceBetweenInputFields),
            SizedBox(
              width: 350,
              child: Text(
                subTitle,
                style: Theme.of(context).textTheme.titleMedium!.apply(
                      color: Colors.white,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
