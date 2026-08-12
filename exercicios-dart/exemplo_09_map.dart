void main() {
 Map<String, dynamic> area = {
 'id': 1,
 'codigo': 'SP280-KM120',
 'rodovia': 'SP-280',
 'densidade': 0.42,
 'status': 'NORMAL',
 'sensorId': null,
 };

 print(area['codigo']);
 print(area['rodovia']);

 area['status'] = 'ATENCAO';
 area['sensorId'] = 'SENSOR-01';

 print(area);

 area.forEach((chave, valor) {
 print('$chave => $valor');
 });
}
