import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SponsorPage extends StatefulWidget {

  final String initialUrl;

  const SponsorPage({Key key, this.initialUrl}) : super(key: key);
  @override
  _SponsorPageState createState() => _SponsorPageState();
}

class _SponsorPageState extends State<SponsorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sponsor'),
      ),
      body: WebView(
        initialUrl: widget.initialUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
