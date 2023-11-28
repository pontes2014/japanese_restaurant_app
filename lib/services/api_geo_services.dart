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

        if (data.containsKey('address')) {
          final Map<String, dynamic>? addressData =
              data['address'] as Map<String, dynamic>?;

          if (addressData != null) {
            final String road = addressData['road'] ?? "Rua não disponível";
            String cityDistrict =
                addressData['city_district'] ?? "Bairro/Cidade não disponível";

            if (cityDistrict == "Bairro/Cidade não disponível") {
              cityDistrict = addressData['town'] ?? "Cidade não disponível";
            }

            if (cityDistrict == "Cidade não disponível") {
              cityDistrict = addressData['city'] ?? "Cidade não disponível";
            }

            final String postcode =
                addressData['postcode'] ?? "CEP não disponível";

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
      throw error;
    }
  }
}
