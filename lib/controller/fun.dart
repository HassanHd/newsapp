import 'package:clipboard/clipboard.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Fun{
 static void openLink(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
 static void ShareLink(String url) async {
   Share.share('$url');

 }
 static    copyLink(String url) async {
   FlutterClipboard.copy('$url');
 }
}