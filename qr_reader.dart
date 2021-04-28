import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerScreen extends StatefulWidget {
  final Widget child;
  QRScannerScreen({this.child});
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<QRScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final QRController qrController = Get.put(QRController());
    double r = UIConfig.ratio;
    return Scaffold(
      body: !qrController.isQRValid
          ? Stack(
              alignment: Alignment.center,
              children: <Widget>[
                QRView(
                  key: qrKey,
                  onQRViewCreated: (r) => _onQRViewCreated(r, context),
                  cameraFacing: CameraFacing.back,
                  overlay: QrScannerOverlayShape(
                    borderColor: CLR_IFLEET,
                    borderWidth: 8.0 * r,
                    borderRadius: 4.0 * r,
                    overlayColor: Colors.black87,
                    cutOutSize: 225 * r,
                  ),
                ),
                Positioned(
                  top: 98 * r,
                  child: Text(
                    tr('qr.title'),
                    style: TextStyle(
                      fontSize: 24 * r,
                      fontWeight: FontWeight.bold,
                      color: CLR_GREY_240,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 176 * r,
                  child: Text(
                    tr('qr.instruction'),
                    style: TextStyle(
                      fontSize: 16 * r,
                      fontWeight: FontWeight.w600,
                      color: CLR_GREY_240,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 74 * r,
                  left: 15 * r,
                  right: 15 * r,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 48 * r,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: CLR_GREY_233,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_back_sharp,
                            color: CLR_GREY_240,
                            size: 18 * r,
                          ),
                          SizedBox(
                            width: 8 * r,
                          ),
                          Text(
                            tr('qr.add_manually'),
                            style: TextStyle(
                              fontSize: 16 * r,
                              fontWeight: FontWeight.bold,
                              color: CLR_GREY_240,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 58 * r,
                  right: 21 * r,
                  child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.close,
                      size: 16 * r,
                      color: CLR_GREY_240,
                    ),
                  ),
                ),
              ],
            )
          : Center(
              child: Text(
                qrController.qrcode,
                style: TextStyle(fontSize: 60),
              ),
            ),
    );
  }

  void _onQRViewCreated(QRViewController controller, BuildContext context) {
    this.controller = controller;
    final qrController = Get.find<QRController>();
    controller.scannedDataStream.listen((scanData) {
      qrController.qrcode = scanData.code.toString();
      qrController.isQRValid = true;
      setState(() {});
      controller?.dispose();
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
