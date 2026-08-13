import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/area_monitoramento.dart';
import '../models/medicao.dart';

class ApiService {
 /// Mesma ideia do API_BASE_URL do React Native.
 /// Chrome/Web: localhost. Emulador Android: use 10.0.2.2.
 static const String baseUrl = 'http://localhost:8080/api';

 static Future<List<AreaMonitoramento>> listarAreas() async {
 final response = await http.get(Uri.parse('$baseUrl/areas'));

 if (response.statusCode != 200) {
 throw Exception('Erro ao buscar áreas (${response.statusCode})');
 }

 final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;
 return data
 .map((item) => AreaMonitoramento.fromJson(item as Map<String, dynamic>))
 .toList();
 }

 static Future<AreaMonitoramento> buscarAreaPorId(int id) async {
 final response = await http.get(Uri.parse('$baseUrl/areas/$id'));

 if (response.statusCode != 200) {
 throw Exception('Erro ao buscar área $id');
 }

 return AreaMonitoramento.fromJson(
 jsonDecode(response.body) as Map<String, dynamic>,
 );
 }

 static Future<List<AreaMonitoramento>> listarAreasPorStatus(
 StatusVegetacao status,
 ) async {
 final response = await http.get(
 Uri.parse('$baseUrl/areas/status/${status.apiValue}'),
 );

 if (response.statusCode != 200) {
 throw Exception('Erro ao buscar áreas por status');
 }

 final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;
 return data
 .map((item) => AreaMonitoramento.fromJson(item as Map<String, dynamic>))
 .toList();
 }

 static Future<List<Medicao>> listarMedicoesPorArea(int areaId) async {
 final response = await http.get(
 Uri.parse('$baseUrl/medicoes/area/$areaId'),
 );

 if (response.statusCode != 200) {
 throw Exception('Erro ao buscar medições da área');
 }

 final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;
 return data
 .map((item) => Medicao.fromJson(item as Map<String, dynamic>))
 .toList();
 }

 static Future<Medicao> simularColeta(int areaId) async {
 final response = await http.post(
 Uri.parse('$baseUrl/medicoes/simular/$areaId'),
 );

 if (response.statusCode != 200 && response.statusCode != 201) {
 throw Exception('Erro ao simular coleta da área $areaId');
 }

 return Medicao.fromJson(
 jsonDecode(response.body) as Map<String, dynamic>,
 );
 }

 /// Equivalente ao api.medicoes.simularTodasAreas() do React Native.
 static Future<List<Medicao>> simularTodasAreas() async {
 final response = await http.post(
 Uri.parse('$baseUrl/medicoes/simular-todas'),
 );

 if (response.statusCode != 200 && response.statusCode != 201) {
 throw Exception('Erro ao simular coleta de todas as áreas');
 }

 final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;
 return data
 .map((item) => Medicao.fromJson(item as Map<String, dynamic>))
 .toList();
 }
}
