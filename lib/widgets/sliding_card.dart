import 'dart:async';
import 'package:flutter/material.dart';

class SlidingChallengeCard extends StatefulWidget {
  const SlidingChallengeCard({super.key});

  @override
  _SlidingChallengeCardState createState() => _SlidingChallengeCardState();
}

class _SlidingChallengeCardState extends State<SlidingChallengeCard> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  // Your list of background images or content
  final List<String> _images = [
    'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
  ];

  @override
  void initState() {
    super.initState();
    // Setup the timer to slide every 2 seconds
    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_currentPage < _images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0; // Loop back to start
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
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
      margin: EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: PageView.builder(
          controller: _pageController,
          itemCount: _images.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(_images[index]),
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
