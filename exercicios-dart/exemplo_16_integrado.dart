enum StatusVegetacao { normal, atencao, urgente }

void main() {
 String sistema = 'VerdeSmart';
 int idArea = 3;
 double densidade = 0.91;
 bool sensorOnline = true;
 DateTime dataColeta = DateTime(2026, 8, 6, 15, 0);
 StatusVegetacao status = StatusVegetacao.urgente;
 String? observacoes = 'Vegetação invadindo acostamento';

 List<double> ultimasDensidades = [0.72, 0.81, 0.91];
 Set<String> rodovias = {'SP-280', 'BR-116', 'SP-330'};
 Map<String, dynamic> medicao = {
 'temperatura': 30.1,
 'umidade': 58.0,
 'sensorId': 'SENSOR-03',
 };

 print('======= VERDESMART (CONSOLE) =======');
 print('Sistema: $sistema');
 print('Área #$idArea');
 print('Coleta: ${dataColeta.day}/${dataColeta.month}/${dataColeta.year} '
 '${dataColeta.hour}:00');
 print('Densidade: ${densidade.toStringAsFixed(2)}');
 print('Sensor online: $sensorOnline');
 print('Status: ${status.name}');
 print('Observações: ${observacoes ?? 'Sem observações'}');
 print('Histórico densidades: $ultimasDensidades');
 print('Rodovias: $rodovias');
 print('Temp: ${medicao['temperatura']} | Umid: ${medicao['umidade']}');

 if (status == StatusVegetacao.urgente && sensorOnline) {
 print('Alerta: despachar equipe de intervenção.');
 }
}
