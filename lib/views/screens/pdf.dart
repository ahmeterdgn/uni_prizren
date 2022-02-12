import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:uni/core/global/constants.dart';

class PdfScreen extends StatefulWidget {
  final title;
  final link;
  const PdfScreen({Key? key, this.title, this.link}) : super(key: key);

  @override
  _PdfScreenState createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.title,
        backgroundColor: mainColor,
      ),
      body: SfPdfViewer.network(
        widget.link,
      ),
    );
  }
}
