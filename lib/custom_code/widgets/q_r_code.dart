// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:qr_flutter/qr_flutter.dart';

class QRCode extends StatefulWidget {
  const QRCode({
    Key? key,
    this.width,
    this.height,
    this.qrSize,
    this.qrData,
    this.gapLess,
    this.qrVersion,
    this.qrPadding,
    this.qrBorderRadius,
    this.semanticsLabel,
    this.qrBackgroundColor,
    this.qrForegroundColor,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double? qrSize;
  final String? qrData;
  final bool? gapLess;
  final int? qrVersion;
  final double? qrPadding;
  final double? qrBorderRadius;
  final String? semanticsLabel;
  final Color? qrBackgroundColor;
  final Color? qrForegroundColor;

  @override
  _QRCodeState createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  //custom qrCode
  @override
  Widget build(BuildContext context) {
    return QrImageView(
      size: widget.qrSize,
      data: widget.qrData.toString(),
      gapless: widget.gapLess ?? true,
      version: widget.qrVersion ?? QrVersions.auto,
      padding: EdgeInsets.all(widget.qrPadding ?? 10),
      semanticsLabel: widget.semanticsLabel ?? '',
      backgroundColor: widget.qrBackgroundColor ?? Colors.transparent,
      foregroundColor: widget.qrForegroundColor ?? Colors.black,
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
    );
  }
}
