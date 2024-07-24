import 'package:eb_demo_app/core/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPreviewTile extends StatelessWidget {
  const QrPreviewTile({
    super.key,
  });

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
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      QrImageView(
                        data: 'This QR c',
                        embeddedImage: AssetImage(AppImages.productImg1),
                        version: 1,
                        size: 320,
                        gapless: false,
                        errorStateBuilder: (cxt, err) {
                          return Container(
                            child: Center(
                              child: Text(
                                'Uh oh! Something went wrong...',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 20),
                      Text('Scan to get all product details at once!')
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: SizedBox(
          height: 50,
          width: 50,
          child: QrImageView(
            data: 'This QR c',
            version: 1,
            size: 320,
            gapless: false,
            errorStateBuilder: (cxt, err) {
              return Container(
                child: Center(
                  child: Text(
                    'Uh oh! Something went wrong...',
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      title: Text('QR CODE'),
      subtitle: Text('Tap to preview the QR code.'),
    );
  }
}
