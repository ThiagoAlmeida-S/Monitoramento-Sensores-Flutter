void main() {
 DateTime dataColeta = DateTime(2026, 8, 6, 14, 30);
 DateTime agora = DateTime.now();

 print('Data da coleta: $dataColeta');
 print('Agora: $agora');

 print('Ano: ${dataColeta.year}');
 print('Mês: ${dataColeta.month}');
 print('Dia: ${dataColeta.day}');
 print('Hora: ${dataColeta.hour}:${dataColeta.minute}');

 DateTime proximaInspecao = dataColeta.add(const Duration(days: 7));
 print('Próxima inspeção sugerida: $proximaInspecao');
}

