enum StatusVegetacao {
 normal,
 atencao,
 urgente,
}

class AreaMonitoramento {
 final int id;
 final String codigo;
 final String rodovia;
 final double kmInicial;
 final double kmFinal;
 final String localizacao;
 final StatusVegetacao status;
 final String tipoTerreno;
 final double? densidade;
 final double? alturaMedia;
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
 this.densidade,
 this.alturaMedia,
 this.totalMedicoes = 0,
 });

 String get statusLabel {
 switch (status) {
 case StatusVegetacao.normal:
 return 'Normal';
 case StatusVegetacao.atencao:
 return 'Atenção';
 case StatusVegetacao.urgente:
 return 'Urgente';
 }
 }
}
