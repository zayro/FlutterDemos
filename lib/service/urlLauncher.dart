import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  Future open(url) async {
    print("TRY LUNCH $url");
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
