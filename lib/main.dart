import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'In-App Browser Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Open Webpage from App Example')),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OpenInExternalBrowserButton(),
              SizedBox(
                height: 32,
              ),
              OpenUrlButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class OpenUrlButton extends StatelessWidget {
  const OpenUrlButton({super.key});

  Future<void> _launchInBrowser() async {
    final url = Uri.parse('https://yode0419.github.io/ShareLinkTest/');
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView, // 關鍵：用 in-app browser 開
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _launchInBrowser,
      child: const Text('Open Webpage in In-App Browser'),
    );
  }
}

class OpenInExternalBrowserButton extends StatelessWidget {
  const OpenInExternalBrowserButton({super.key});

  Future<void> _launchInExternalBrowser() async {
    final url = Uri.parse('https://yode0419.github.io/ShareLinkTest/');
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication, // 用外部瀏覽器開啟
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _launchInExternalBrowser,
      child: const Text('Open Webpage in Chrome/Browser'),
    );
  }
}
