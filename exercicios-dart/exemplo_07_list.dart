void main() {
 List<String> status = ['NORMAL', 'ATENCAO', 'URGENTE'];
 List<double> densidades = [0.42, 0.71, 0.91, 0.55];
 List<int> idsAreas = [1, 2, 3];

 print('Primeiro status: ${status[0]}');
 print('Quantidade de status: ${status.length}');

 densidades.add(0.63);
 print('Densidades após add: $densidades');

 for (final item in status) {
 print('Status atual: $item');
 }

 List<double> altas = densidades.where((d) => d >= 0.70).toList();
 List<String> textos = idsAreas.map((id) => 'Área #$id').toList();

 print('Densidades altas: $altas');
 print('Textos: $textos');
}
