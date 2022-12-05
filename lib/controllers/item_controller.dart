import 'dart:convert';

import 'package:coffee_shop_app/models/item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


String baseUrl = 'http://10.0.2.2:15001';

Future<List<Item>> fetchItems(http.Client client) async {
  final response = await http.get(Uri.parse('$baseUrl/item'));

  if (response.statusCode == 200) {
    return compute(parseItems, utf8.decode(response.bodyBytes));
  } else {
    throw Exception('Failed to load items');
  }
}

List<Item> parseItems(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Item>((json) => Item.fromJson(json)).toList();
}

Future<Item> editItem(Item item) async {
  final response = await http.put(
    Uri.parse('$baseUrl/item/${item.itemId}'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(item.toJson()),
  );

  if (response.statusCode == 200) {
    return Item.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to edit item');
  }
}