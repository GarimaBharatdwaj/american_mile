import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/utils/divider.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import '../../../core/components/my_app_bar.dart';

class ViewDocument extends StatefulWidget {
  const ViewDocument({super.key, required this.url});

  final String url;
  @override
  State<ViewDocument> createState() => _ViewDocumentState();
}

class _ViewDocumentState extends State<ViewDocument> {
  bool _isLoading = true;
  PDFDocument? document;

  loadDocument() async {
    document = await PDFDocument.fromURL(widget.url);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'View Document'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: _isLoading
            ? Center(child: showProgressIndicator())
            : SizedBox(
                width: context.width,
                height: context.height,
                child: PDFViewer(
                  document: document!,
                  lazyLoad: false,

                  ///zoomSteps: 1,
                ),
              ),
      ),
    );
  }
}
