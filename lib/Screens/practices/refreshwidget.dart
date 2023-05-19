import 'package:flutter/material.dart';

class Myrefreshwidget extends StatefulWidget {
  const Myrefreshwidget({super.key});

  @override
  State<Myrefreshwidget> createState() => _MyrefreshwidgetState();
}

Future<void> _refresh() {
  return Future.delayed(const Duration(seconds: 4));
}

class _MyrefreshwidgetState extends State<Myrefreshwidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Refresh Indicator'),
      ),
      body: RefreshIndicator(
        // backgroundColor: Colors.green,
        onRefresh: _refresh,
        child: ListView.separated(
            shrinkWrap: false,
            itemBuilder: ((context, index) => Center(
                    child: Text(
                  "$index",
                  style: const TextStyle(fontSize: 20),
                ))),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: 21),
      ),
    );
  }
}
