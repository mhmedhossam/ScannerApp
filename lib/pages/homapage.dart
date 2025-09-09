import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scanner_app/pages/resultpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          side: BorderSide(
            color: const Color.fromARGB(255, 141, 140, 140),
            strokeAlign: 1,
            width: 0.5,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: Image.asset("assets/images/psc1.jpg"),
        title: const Text(
          'Pscchc Scanner',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        actions: [
          Icon(Icons.star, color: Colors.black),
          const SizedBox(width: 10),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(20),
              ),
              margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
              child: Image.asset("assets/images/psc2.jpg"),
            ),
            const Text(
              "Hello please enter to Scan ",
              style: TextStyle(fontSize: 24),
            ),
            const Text(
              "made by mohamed hossam",
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
                padding: EdgeInsets.all(20),
                textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return Dialog(
                      insetPadding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: SizedBox(
                        height: 400,
                        width: 300,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: MobileScanner(
                            onDetect: (capture) {
                              final code =
                                  capture.barcodes.first.rawValue ??
                                  "Not found";
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ResultPage(url: code),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Text("Start scanning"),
            ),
          ],
        ),
      ),
    );
  }
}
