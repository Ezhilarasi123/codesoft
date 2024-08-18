import 'dart:math';
import 'package:flutter/material.dart';

class QuoteTile extends StatelessWidget {
  final String quote;
  final VoidCallback onRefresh;
  final VoidCallback onShare;
  final VoidCallback onFavorite;
  final VoidCallback onAddQuote;

  final List<String> backgroundImages = [
    'assets/img_carousel/quote_8.jpg',
    'assets/img_carousel/quote_2.jpg',
    'assets/img_carousel/quote_3.jpg',
    'assets/img_carousel/quote_4.jpg',
    'assets/img_carousel/quote_6.jpg',
  ];

  QuoteTile({
    required this.quote,
    required this.onRefresh,
    required this.onShare,
    required this.onFavorite,
    required this.onAddQuote,
  });

  @override
  Widget build(BuildContext context) {
    final randomImage = backgroundImages[Random().nextInt(backgroundImages.length)];

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            randomImage,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Card(
                  color: Colors.amber[50],
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      quote,
                      style: const TextStyle(
                        fontSize: 27,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'BrushScriptMT',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // New Container with background color around the icons
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.symmetric(vertical: 8.0), // Vertical padding for spacing inside the box
                decoration: BoxDecoration(
                  color: Colors.white, // Background color for the container
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12, // Shadow color
                      blurRadius: 5.0, // Blur radius of the shadow
                      offset: Offset(0, 2), // Shadow position
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.black),
                      onPressed: onAddQuote,
                      tooltip: 'Add Your Quote',
                    ),
                    IconButton(
                      icon: const Icon(Icons.refresh, color: Colors.black),
                      onPressed: onRefresh,
                      tooltip: 'New Quote',
                    ),
                    IconButton(
                      icon: const Icon(Icons.share, color: Colors.black),
                      onPressed: onShare,
                      tooltip: 'Share',
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite, color: Colors.red),
                      onPressed: onFavorite,
                      tooltip: 'Add to favorites',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
