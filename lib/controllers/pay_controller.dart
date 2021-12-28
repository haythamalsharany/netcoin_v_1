import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:netcoin_v_1/data/models/bouquet_model.dart';
import 'package:netcoin_v_1/data/settings/app_settengs.dart';

class PayController extends GetxController {
  List<BouquetModel> _bouquets = [];

  List<BouquetModel> get bouquets {
    return [..._bouquets];
  }

  BouquetModel findBouquetId(int bouquet_id) {
    return _bouquets.firstWhere((bouquet) => bouquet.id == bouquet_id);
  }

  Future<void> fetchBouquets(String targetCompany) async {
    final url = '$endPoint/fetchBouquets';
    var bouquetEnvelope = '''
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <GetBouquet xmlns="http://foo.com/barr/320/Default">
      <String$targetCompany>$targetCompany</String$targetCompany> 
    </GetBouquet>
  </soap:Body>
</soap:Envelope>
''';
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'text/xml; '
                'charset=utf-8',
            'SOAPAction': 'AuthenticateCredential',
            "Host": endPoint
          },
          body: bouquetEnvelope);
      _bouquets = response.body.split('/:') as List<BouquetModel>;

      update();
    } catch (e) {
      throw e;
    }
  }
}
