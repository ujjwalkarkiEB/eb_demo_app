import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../../../core/utils/constants/sizes.dart';

class PromoSlider extends StatefulWidget {
  const PromoSlider({
    super.key,
    required this.promoBanners,
  });

  final List<String> promoBanners;

  @override
  State<PromoSlider> createState() => _PromoSliderState();
}

class _PromoSliderState extends State<PromoSlider> {
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.promoBanners
              .map((e) => Card(
                    clipBehavior: Clip.hardEdge,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    elevation: 0,
                    child: Image.asset(
                      e,
                      width: 350,
                      // Adjusted width
                      fit: BoxFit.cover, // Ensure the image is not stretched
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
            viewportFraction: 2,
            onPageChanged: (index, _) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          carouselController: carouselController, // Set the controller here
        ),
        const SizedBox(height: AppSizes.spaceBetweenSections),
        SmoothPageIndicator(
          controller: PageController(
              initialPage: currentIndex), // Temporary PageController
          count: widget.promoBanners.length,
          effect:
              WormEffect(activeDotColor: Colors.green), // Your preferred effect
          onDotClicked: (index) {
            carouselController.animateToPage(index);
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ],
    );
  }
}
