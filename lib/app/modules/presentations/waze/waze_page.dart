import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WazePage extends StatelessWidget {
  const WazePage({super.key});

  // Function to launch Waze with a specific address
  void launchWazeWithAddress(String address) async {
    // Construct the Waze URL with the address
    final Uri wazeUrl = Uri.parse('https://www.waze.com/ul?q=$address');

    // Check if the URL can be launched
    if (await launchUrl(wazeUrl)) {
      // Launch the URL
      await launchUrl(wazeUrl);
    } else {
      // Handle the error if the URL can't be launched
      print('Could not launch Waze. Make sure the Waze app is installed.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Waze'),
      ),
      body: Center(
          child: ElevatedButton(
            onPressed: () {
              launchWazeWithAddress('Rua Moises Abaid, 181, Jundiaí/SP');
            },
            child: Text('Navi'),
          ),
        ),
    );
  }
}
