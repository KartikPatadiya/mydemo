import 'package:flutter/material.dart';
import 'package:link_preview_generator/link_preview_generator.dart';

class Linkpreviewgenrator extends StatefulWidget {
  const Linkpreviewgenrator({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LinkpreviewgenratorState createState() => _LinkpreviewgenratorState();
}

class _LinkpreviewgenratorState extends State<Linkpreviewgenrator> {
  // List of links to preview.
  List<String> get urls => const [
        'https://github.com/ghpranav/link_preview_generator',
        'https://www.espn.in/football/soccer-transfers/story/4163866/transfer-talk-lionel-messi-tells-barcelona-hes-more-likely-to-leave-then-stay',
        'https://speakerdeck.com/themsaid/the-power-of-laravel-queues',
        'https://twitter.com/laravelphp/status/1222535498880692225',
        'https://www.youtube.com/watch?v=W1pNjxmNHNQ',
        'https://www.instagram.com/p/CQ3WCUOru1T/',
        'https://www.google.com/'
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.dark,
        title: const Text('Link Preview Generator'),
      ),
      body: ListView.builder(
        itemCount: urls.length,
        itemBuilder: (context, index) => Container(
          key: ValueKey(urls[index]),
          margin: const EdgeInsets.all(15),
          // Generate a preview for each link.
          // Alternate between a large and small type preview widget.
          child: LinkPreviewGenerator(
            link: urls[index],
            linkPreviewStyle: index % 2 == 0
                ? LinkPreviewStyle.large
                : LinkPreviewStyle.small,
          ),
        ),
      ),
    );
  }
}
