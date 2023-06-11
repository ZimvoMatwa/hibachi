import 'package:flutter/material.dart';
import 'package:hibachi/hibachi.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(home: FazersPage()));
}

class FazersPage extends StatefulWidget {
  const FazersPage({super.key});

  @override
  State<FazersPage> createState() => _FazersPageState();
}

class _FazersPageState extends State<FazersPage> {
  final List<Widget> _widgets = [];

  void _incrementWidgetCount() {
    setState(() {
      _widgets.add(
        FadeInSlideUpWidget(
          duration: const Duration(milliseconds: 800),
          child: Center(
            child: Text(
              '${_widgets.length + 1}',
              style: const TextStyle(
                fontSize: 105,
              ),
            ),
          ),
        ),
      );
    });
  }

  void _decrementWidgetCount() {
    setState(() {
      if (_widgets.isNotEmpty) {
        _widgets.removeLast();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('dont blow ur hibachi'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FittedBox(
            fit: BoxFit.fitWidth,
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 1, minHeight: 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ..._widgets,
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .5,
            color: Colors.blueGrey,
            width: double.infinity,
          )
        ],
      ),
      floatingActionButton: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: _decrementWidgetCount,
                icon: const Icon(Icons.delete)),
            Container(
              height: 1,
              width: 20,
              color: Colors.grey,
            ),
            IconButton(
              onPressed: _incrementWidgetCount,
              icon: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
