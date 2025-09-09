import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ResultPage extends StatelessWidget {
  final String url;
  const ResultPage({super.key, required this.url});

  bool isImageUrl(String url) {
    final lower = url.toLowerCase();
    return (lower.endsWith(".jpg") ||
        lower.endsWith(".jpeg") ||
        lower.endsWith(".png") ||
        lower.endsWith(".gif") ||
        lower.endsWith(".bmp") ||
        lower.endsWith(".webp"));
  }

  @override
  Widget build(BuildContext context) {
    String finalUrl = url.trim();
    if (!finalUrl.startsWith('http://') && !finalUrl.startsWith('https://')) {
      finalUrl = 'https://$finalUrl';
    }
    bool isValidUrl = Uri.tryParse(finalUrl)?.isAbsolute == true;

    final bool imageLink = isValidUrl && isImageUrl(finalUrl);

    return Scaffold(
      appBar: AppBar(title: const Text('Scan Result')),
      body: Center(
        child: imageLink
            ? Image.network(
                finalUrl,
                errorBuilder: (context, error, stackTrace) {
                  return const Text("Image not found");
                },
              )
            : isValidUrl
            ? WebViewWidget(
                controller: WebViewController()
                  ..setJavaScriptMode(JavaScriptMode.unrestricted)
                  ..loadRequest(Uri.parse(finalUrl)),
              )
            : Text(url, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
