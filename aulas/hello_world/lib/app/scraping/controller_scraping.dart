import 'dart:convert';

import 'package:chaleno/chaleno.dart';

class DoScraping {
  Future<String> scraping() async {
    const String url = 'https://mangayabu.top/manga/wind-breaker/';
    //const String id = '#manga-info'; // main
    const String id = 'script'; //pages
    try {
      var parser =
          await Chaleno().load(url).timeout(const Duration(seconds: 8));

      var result = parser?.querySelector(id).html;

      var res = result;
      print(res);

      return res.toString();
    } catch (e) {
      print(e);
      return '--failed to Scraping!';
    }
  }

  Map<String, dynamic> convert(String html) {
    var corte1 = html.split('type="application/json">');
    var corte2 = corte1[1].split('</script>');
    Map<String, dynamic> resultado;
    try {
      //var encode =  jsonEncode(corte2[0]);
      var decode = json.decode(corte2[0]);
      //print(decode);
      resultado = decode;
    } catch (e) {
      print(e);
      resultado = {};
    }

    return resultado;
  }

  Map<String, dynamic> getPages(String html) {
    return {};
  }

  Future<void> scrapingTeste() async {

    // const String url = 'https://mangahost4.com/manga/eleceed-mh17010/43#1';

    // const String id = 'script'; //pages
    // try {
    //   var parser =
    //       await Chaleno().load(url).timeout(const Duration(seconds: 8));

    //   var result = parser?.querySelector(id).html;

    //   var res = result;
    //   print(res);

    //   return res.toString();
    // } catch (e) {
    //   print(e);
    //   return '--failed to Scraping!';
    // }
  }
}
