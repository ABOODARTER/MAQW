import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:maqw/widget/searchwidget.dart';
class PhonesApi {
  static Future<List<Phone>> getPhones(String query) async {
    final url = Uri.parse('http://mobile.test:400/api/search_on_material_device');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List phones = json.decode(response.body);
      return phones.map((json) => Phone.fromJson(json)).where((phone) {
        final nameLower=phone.name.toLowerCase();
        final brandLower=phone.brand.toLowerCase();
        final searchLower=query.toLowerCase();
        return nameLower.contains(searchLower)||
        brandLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}