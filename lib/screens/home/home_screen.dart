import 'package:flutter/material.dart';
import 'package:gym_app/widgets/sliding_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.people_alt), onPressed: () {}),
        title: Text('Welcome User!'),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.doorbell), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(children: [SlidingChallengeCard()]),
        ),
      ),
    );
  }
}
