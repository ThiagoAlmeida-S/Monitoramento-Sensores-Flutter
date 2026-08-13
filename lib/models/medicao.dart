class Medicao {
 final int id;
 final int areaId;
 final String areaCodigo;
 final double alturaVegetacao;
 final double densidade;
 final double temperatura;
 final double umidade;
 final String? tipoVegetacao;
 final double? inclinacaoTerreno;
 final DateTime dataColeta;
 final String? sensorId;
 final String? observacoes;

 const Medicao({
 required this.id,
 required this.areaId,
 required this.areaCodigo,
 required this.alturaVegetacao,
 required this.densidade,
 required this.temperatura,
 required this.umidade,
 required this.dataColeta,
 this.tipoVegetacao,
 this.inclinacaoTerreno,
 this.sensorId,
 this.observacoes,
 });

 factory Medicao.fromJson(Map<String, dynamic> json) {
 return Medicao(
 id: (json['id'] as num).toInt(),
 areaId: (json['areaId'] as num).toInt(),
 areaCodigo: json['areaCodigo'] as String? ?? '',
 alturaVegetacao: (json['alturaVegetacao'] as num).toDouble(),
 densidade: (json['densidade'] as num).toDouble(),
 temperatura: (json['temperatura'] as num).toDouble(),
 umidade: (json['umidade'] as num).toDouble(),
 tipoVegetacao: json['tipoVegetacao'] as String?,
 inclinacaoTerreno: (json['inclinacaoTerreno'] as num?)?.toDouble(),
 dataColeta: DateTime.tryParse(json['dataColeta'] as String? ?? '') ??
 DateTime.now(),
 sensorId: json['sensorId'] as String?,
 observacoes: json['observacoes'] as String?,
 );
 }
}
