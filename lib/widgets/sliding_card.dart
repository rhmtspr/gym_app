import 'dart:async';
import 'package:flutter/material.dart';

class SlidingChallengeCard extends StatefulWidget {
  const SlidingChallengeCard({super.key});

  @override
  _SlidingChallengeCardState createState() => _SlidingChallengeCardState();
}

class _SlidingChallengeCardState extends State<SlidingChallengeCard> {
  // Using a large starting page for infinite feel
  static const int _initialPage = 1000;
  late PageController _pageController;
  int _activePage = 0;
  Timer? _timer;

  final List<String> _images = [
    // 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
    // 'https://picsum.photos/id/237/400/200',
    'https://images.unsplash.com/photo-1593079831268-3381b0db4a77?q=80&w=869&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1623874514711-0f321325f318?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _initialPage);
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel(); // Clear any existing timer
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _stopTimer();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      // margin: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // 1. The Interactive PageView
            GestureDetector(
              onPanDown: (_) => _stopTimer(), // User touched the screen
              onPanCancel: () => _startTimer(), // User swiped away/let go
              onPanEnd: (_) => _startTimer(), // User finished swiping
              child: PageView.builder(
                controller: _pageController,
                itemCount: 10000,
                onPageChanged: (int index) {
                  setState(() {
                    _activePage = index % _images.length;
                  });
                },
                itemBuilder: (context, index) {
                  final imageIndex = index % _images.length;
                  return _buildSlide(_images[imageIndex]);
                },
              ),
            ),

            // 2. The Dot Indicators
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _images.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: _activePage == index ? 24 : 8, // Expansion effect
                    decoration: BoxDecoration(
                      color: _activePage == index
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlide(String url) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
      ),
      child: Container(
        color: Colors.black.withValues(
          alpha: 0.2,
        ), // Darken image for text readability
        padding: const EdgeInsets.all(24.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Daily\nChallenge',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.1,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Do your plan before 09:00 AM',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
