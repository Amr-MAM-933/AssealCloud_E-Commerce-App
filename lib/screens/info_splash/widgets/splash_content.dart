import 'package:flutter/material.dart';
import 'package:am_state/am_state.dart';

import '/screen_size.dart';

List<Map<String, String>> splashData = [
  {
    "text": "Welcome to Asseal Cloud, Let’s shop!",
    "image": "assets/images/splash_10.png"
  },
  {
    "text": "We help people connect with store \naround the world",
    "image": "assets/images/splash_2.png"
  },
  {
    "text": "We show the easy way to shop. \nJust stay at home with us",
    "image": "assets/images/splash_3.png"
  },
];

PageView splashContent({required AmDataProvider<int> dotBarProvider}) {
  return PageView.builder(
    itemCount: splashData.length,
    onPageChanged: (index) => dotBarProvider.data = index,
    itemBuilder: (ctx, i) {
      return Column(
        children: [
          Spacer(flex: 2),
          Text(splashData[i]['text']!),
          Spacer(flex: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Image.asset(
              splashData[i]['image']!,
              height: ScreenSize.cleanHeight() * 0.4,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Spacer(flex: 2),
        ],
      );
    },
  );
}
