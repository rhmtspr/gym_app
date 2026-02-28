import 'dart:async';
import 'package:flutter/material.dart';

class SlidingChallengeCard extends StatefulWidget {
  const SlidingChallengeCard({super.key});

  @override
  _SlidingChallengeCardState createState() => _SlidingChallengeCardState();
}

class _SlidingChallengeCardState extends State<SlidingChallengeCard> {
  final PageController _pageController = PageController(initialPage: 1000);
  late Timer _timer;

  // Your list of background images or content
  final List<String> _images = [
    'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
    'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
    'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
  ];

  @override
  void initState() {
    super.initState();
    // Setup the timer to slide every 2 seconds
    _timer = Timer.periodic(Duration(seconds: 4), (Timer timer) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Very important to prevent memory leaks!
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      // margin: EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: PageView.builder(
          controller: _pageController,
          itemCount: 10000,
          itemBuilder: (context, index) {
            final imageIndex = index % _images.length;

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(_images[imageIndex]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Daily\nChallenge',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height: 1.1,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Do your plan before 09:00 AM',
                      style: TextStyle(color: Colors.black87),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
