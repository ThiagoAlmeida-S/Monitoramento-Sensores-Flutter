enum StatusVegetacao {
 normal,
 atencao,
 urgente;

 static StatusVegetacao fromApi(String value) {
 switch (value.toUpperCase()) {
 case 'ATENCAO':
 return StatusVegetacao.atencao;
 case 'URGENTE':
 return StatusVegetacao.urgente;
 case 'NORMAL':
 default:
 return StatusVegetacao.normal;
 }
 }

 String get apiValue {
 switch (this) {
 case StatusVegetacao.normal:
 return 'NORMAL';
 case StatusVegetacao.atencao:
 return 'ATENCAO';
 case StatusVegetacao.urgente:
 return 'URGENTE';
 }
 }

 String get label {
 switch (this) {
 case StatusVegetacao.normal:
 return 'Normal';
 case StatusVegetacao.atencao:
 return 'Atenção';
 case StatusVegetacao.urgente:
 return 'Urgente';
 }
 }
}

class AreaMonitoramento {
 final int id;
 final String codigo;
 final String rodovia;
 final double kmInicial;
 final double kmFinal;
 final String localizacao;
 final StatusVegetacao status;
 final String? statusDescricao;
 final String tipoTerreno;
 final double? densidade;
 final double? alturaMedia;
 final double? complexidade;
 final DateTime? ultimaMedicao;
 final DateTime? proximaIntervencao;
 final int totalMedicoes;

 const AreaMonitoramento({
 required this.id,
 required this.codigo,
 required this.rodovia,
 required this.kmInicial,
 required this.kmFinal,
 required this.localizacao,
 required this.status,
 required this.tipoTerreno,
 this.statusDescricao,
 this.densidade,
 this.alturaMedia,
 this.complexidade,
 this.ultimaMedicao,
 this.proximaIntervencao,
 this.totalMedicoes = 0,
 });

 factory AreaMonitoramento.fromJson(Map<String, dynamic> json) {
 return AreaMonitoramento(
 id: (json['id'] as num).toInt(),
 codigo: json['codigo'] as String,
 rodovia: json['rodovia'] as String,
 kmInicial: (json['kmInicial'] as num).toDouble(),
 kmFinal: (json['kmFinal'] as num).toDouble(),
 localizacao: json['localizacao'] as String,
 status: StatusVegetacao.fromApi(json['status'] as String),
 statusDescricao: json['statusDescricao'] as String?,
 tipoTerreno: json['tipoTerreno'] as String? ?? 'Não informado',
 densidade: (json['densidade'] as num?)?.toDouble(),
 alturaMedia: (json['alturaMedia'] as num?)?.toDouble(),
 complexidade: (json['complexidade'] as num?)?.toDouble(),
 ultimaMedicao: json['ultimaMedicao'] != null
 ? DateTime.tryParse(json['ultimaMedicao'] as String)
 : null,
 proximaIntervencao: json['proximaIntervencao'] != null
 ? DateTime.tryParse(json['proximaIntervencao'] as String)
 : null,
 totalMedicoes: (json['totalMedicoes'] as num?)?.toInt() ?? 0,
 );
 }

 String get statusLabel => status.label;
}
