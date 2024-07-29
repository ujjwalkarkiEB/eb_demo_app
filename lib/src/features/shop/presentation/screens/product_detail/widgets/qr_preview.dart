import 'package:eb_demo_app/core/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPreviewTile extends StatelessWidget {
  const QrPreviewTile({
    super.key,
    required this.data,
  });
  final String data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 0,
      leading: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      QrImageView(
                        data: data,
                        version: 1,
                        size: 250,
                        gapless: false,
                        errorStateBuilder: (cxt, err) {
                          return const Center(
                            child: Text(
                              'Uh oh! Something went wrong...',
                              textAlign: TextAlign.center,
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      const Text('Scan to get all product details at once!')
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: SizedBox(
          height: 80,
          width: 80,
          child: QrImageView(
            data: data,
            version: 1,
            semanticsLabel: 'Product',
            size: 320,
            gapless: false,
            errorStateBuilder: (cxt, err) {
              return const Center(
                child: Text(
                  'Uh oh! Something went wrong...',
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
        ),
      ),
      title: const Text('QR CODE'),
      subtitle: const Text('Tap to preview the QR code.'),
    );
  }
}
