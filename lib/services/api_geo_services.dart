import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiGeoLocation {
  static Future<Map<String, dynamic>> fetchLocationInfo(
      double lat, double long) async {
    final url =
        'https://nominatim.openstreetmap.org/reverse?lat=$lat&lon=$long&format=json';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        print('API Response: $data');

        if (data.containsKey('address')) {
          final Map<String, dynamic>? addressData =
              data['address'] as Map<String, dynamic>?;

          if (addressData != null) {
            final String road = addressData['road'] ?? "Rua não disponível";
            final String cityDistrict =
                addressData['city_district'] ?? "Bairro/Cidade não disponível";
            final String postcode =
                addressData['postcode'] ?? "CEP não disponível";

            print('Localização: ${data['display_name']}');
            print('Rua: $road');
            print('Bairro/Cidade: $cityDistrict');
            print('CEP: $postcode');

            return {
              'road': road,
              'city_district': cityDistrict,
              'postcode': postcode,
            };
          } else {
            throw Exception('Dados de endereço ausentes na resposta da API');
          }
        } else {
          throw Exception('Chave "address" ausente na resposta da API');
        }
      } else {
        throw Exception(
            'Falha ao carregar dados da localização. Código de status: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro na chamada de API: $error');
      throw error;
    }
  }
}
