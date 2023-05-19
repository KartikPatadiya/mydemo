import 'package:flutter/material.dart';
import 'package:giphy_picker/giphy_picker.dart';

class Giphy extends StatefulWidget {
  const Giphy({super.key});

  @override
  State<Giphy> createState() => _GiphyState();
}

class _GiphyState extends State<Giphy> {
  GiphyGif? _gif;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_gif?.title ?? 'Giphy Picker Demo'),
      ),
      body: SafeArea(
        child: Center(
          child: _gif == null
              ? const Text('Pick a gif..')
              : GiphyImage.original(gif: _gif!),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search),
        onPressed: () async {
          // request your Giphy API key at https://developers.giphy.com/ https://api.giphy.com/v1/gifs
          final gif = await GiphyPicker.pickGif(
            context: context,
            // YOUR GIPHY APIKEY HERE
            apiKey: 'qwKNWn0sRlXtteojDTHTqJgI8yB8Q6yx',
          );

          if (gif != null) {
            setState(() => _gif = gif);
          }
        },
      ),
    );
  }
}
