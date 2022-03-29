

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http ;

class ViewPdf extends StatefulWidget {
   String url;
   ViewPdf(this.url);
   //PDF
  @override
  State<ViewPdf> createState() => _ViewPdfState(url);
}

class _ViewPdfState extends State<ViewPdf> {
  String url;
  bool _loading = false;
  _ViewPdfState(this.url);
  
  
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFileFromUrl('///').then((f){
      setState(() {
        url = f.path;
        print(url);
      });
    });
  }
  Future<File> getFileFromUrl(String url) async{
    try{
      var data = await http.get(Uri.parse(url));
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File('${dir.path}/mypdfonline.pdf');
      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch(e){
      throw Exception('Error opening asset file');
    }
  }
   
  bool pdfReady = false;
  int _totalPage = 0;
  int _currentPage = 0;
 // ignore: unused_field
 late PDFViewController _pdfViewController;
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  PDFView(
        filePath: widget.url,
        autoSpacing: true,
        enableSwipe: true,
        swipeHorizontal: true,
        pageSnap: true,
        onError: (e){
          // ignore: avoid_print
          print(e);
        },
        onRender: ( _pages){
          setState(() {
            _totalPage = _pages!;
            pdfReady = true;
          });
        },
       onViewCreated: (PDFViewController vc){
         _pdfViewController = vc;
       },
       onPageChanged: ( page, total){
            setState(() {
              
            });
       },
       onPageError: (page,e){

       },
      ),
      
    );
  }
}