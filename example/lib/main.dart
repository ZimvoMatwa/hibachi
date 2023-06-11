import 'package:flutter/material.dart';

void main() {
  runApp(const FazersPage());
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
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
            margin: EdgeInsets.all(8),
            child: Center(
              child: Text(
                'Widget ${_widgets.length + 1}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fade In Slide Up Demo'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ..._widgets,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementWidgetCount,
        child: Icon(Icons.add),
      ),
    );
  }
}
