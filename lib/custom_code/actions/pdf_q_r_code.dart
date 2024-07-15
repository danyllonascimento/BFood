// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future pdfQRCode(
    BuildContext context,
    String photoEstabelecimento,
    String qrString,
    String nomeEstabelecimento,
    String mensagem,
    String numeroMesa) async {
  final pdf = pw.Document();

  // add network image
  final netImage = await networkImage(photoEstabelecimento);
  final imageBack = await networkImage(
      "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/cardapio-app-q5dewi/assets/mv6rfa4lbbqt/botao-voltar.png");
  final imageQuadrado = await networkImage(
      "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/cardapio-app-q5dewi/assets/tklu62roy8ir/quadrado.png");
  final imageCirculo = await networkImage(
      "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/cardapio-app-q5dewi/assets/32swewltucll/circulo.png");

  pdf.addPage(pw.Page(
      margin:
          const pw.EdgeInsets.only(top: 8, bottom: 8, left: 100, right: 100),
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Container(
          width: double.infinity,
          height: double.infinity,
          decoration: pw.BoxDecoration(
            color: PdfColor.fromHex("#F83B46"),
            borderRadius: pw.BorderRadius.circular(30),
          ),
          child: pw.Column(
            mainAxisSize: pw.MainAxisSize.max,
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Container(
                child: pw.Column(children: [
                  pw.Container(
                      width: 150,
                      height: 45.0,
                      decoration: const pw.BoxDecoration(
                          borderRadius: pw.BorderRadius.vertical(
                              bottom: pw.Radius.circular(20)),
                          color: PdfColors.white),
                      child: pw.Padding(
                          padding:
                              const pw.EdgeInsets.only(left: 10, right: 10),
                          child: pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceEvenly,
                              children: [
                                pw.Text("O",
                                    style: pw.TextStyle(
                                        color: PdfColor.fromHex("#DEDEDE"),
                                        fontSize: 25)),
                                pw.Padding(
                                  padding: const pw.EdgeInsets.only(top: 10),
                                  child: pw.Container(
                                    width: 50,
                                    height: 10.0,
                                    decoration: pw.BoxDecoration(
                                        borderRadius: const pw.BorderRadius.all(
                                            pw.Radius.circular(5)),
                                        color: PdfColor.fromHex("#DEDEDE")),
                                  ),
                                ),
                                pw.Text("O",
                                    style: pw.TextStyle(
                                        color: PdfColor.fromHex("#DEDEDE"),
                                        fontSize: 25)),
                              ]))),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(
                      top: 50,
                      right: 50,
                      left: 50,
                    ),
                    child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        children: [
                          pw.Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: pw.BoxDecoration(
                              borderRadius: pw.BorderRadius.circular(30),
                              image: pw.DecorationImage(
                                fit: pw.BoxFit.cover,
                                image: netImage,
                              ),
                            ),
                          ),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                left: 20,
                              ),
                              child: pw.Text(nomeEstabelecimento,
                                  textAlign: pw.TextAlign.center,
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      color: PdfColors.white,
                                      fontSize: 30)))
                        ]),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 50),
                    child: pw.Text("CARDÁPIO\nONLINE",
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.white,
                            fontSize: 28)),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 50),
                    child: pw.Container(
                        decoration: pw.BoxDecoration(
                            color: PdfColors.white,
                            borderRadius: pw.BorderRadius.circular(30)),
                        child: pw.Padding(
                            padding: const pw.EdgeInsets.all(20),
                            child: pw.BarcodeWidget(
                                width: 200,
                                height: 200,
                                color: PdfColors.black,
                                backgroundColor: PdfColors.white,
                                data: qrString,
                                barcode: pw.Barcode.qrCode()))),
                  ),
                  pw.Padding(
                    padding:
                        const pw.EdgeInsets.only(top: 50, right: 50, left: 50),
                    child: pw.Text("",
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(
                            fontStyle: pw.FontStyle.italic,
                            fontWeight: pw.FontWeight.normal,
                            color: PdfColors.white,
                            fontSize: 20)),
                  ),
                ]),
              ),
              pw.Padding(
                  padding: const pw.EdgeInsets.only(top: 20),
                  child: pw.Text(numeroMesa,
                      style: pw.TextStyle(
                          color: PdfColors.white,
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 20))),
              pw.Padding(
                  padding: const pw.EdgeInsets.only(
                      top: 10, right: 50, left: 50, bottom: 30),
                  child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                      children: [
                        pw.Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: pw.BoxDecoration(
                            image: pw.DecorationImage(
                              fit: pw.BoxFit.cover,
                              image: imageBack,
                            ),
                          ),
                        ),
                        pw.Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: pw.BoxDecoration(
                            image: pw.DecorationImage(
                              fit: pw.BoxFit.cover,
                              image: imageCirculo,
                            ),
                          ),
                        ),
                        pw.Container(
                          width: 37.0,
                          height: 37.0,
                          decoration: pw.BoxDecoration(
                            image: pw.DecorationImage(
                              fit: pw.BoxFit.cover,
                              image: imageQuadrado,
                            ),
                          ),
                        ),
                      ])),
            ],
          ),
        );
      })); // Page

  final pdfSaved = await pdf.save();

  // PRINT IT
  await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdfSaved);
}
