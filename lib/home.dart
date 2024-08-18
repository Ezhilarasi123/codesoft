
import 'package:flutter/material.dart';
import 'package:quote_app/quote_service.dart';
import 'package:quote_app/quote_tile.dart';
import 'package:quote_app/favorites_page.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String quote = '';
  List<String> favoriteQuotes = [];

  @override
  void initState() {
    super.initState();
    _getNewQuote();
  }

  void _getNewQuote() {
    setState(() {
      quote = QuoteService.getRandomQuote();
    });
  }

  void _newQuote(){
    quote= QuoteService.getRandomQuote();
  }

  void _shareQuote() {
    Share.share(quote);
  }

  void _addToFavorites() {
    setState(() {
      favoriteQuotes.add(quote);
    });
  }

  void _goToFavorites() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FavoritesPage(favoriteQuotes: favoriteQuotes),
      ),
    );
  }

  void _addYourQuote() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController quoteController = TextEditingController();

        return AlertDialog(
          title: const Text('Share Your Thought'),
          backgroundColor: Colors.amber[50],
          content: TextField(
            controller: quoteController,
            decoration: const InputDecoration(
              hintText: 'Enter your quote',
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Share'),
              onPressed: () {
                if (quoteController.text.isNotEmpty) {
                  //Share.share(quoteController.text);
                  setState(() {
                    quote = quoteController.text;
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Quote of the Day',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            onPressed: _goToFavorites,
            tooltip: 'Favorites',
          ),
        ],
      ),
      body: Center(
        child: QuoteTile(
          quote: quote,
          onRefresh: _getNewQuote,
          onShare: _shareQuote,
          onFavorite: _addToFavorites,
          onAddQuote: _addYourQuote,
        ),
      ),
    );
  }
}


