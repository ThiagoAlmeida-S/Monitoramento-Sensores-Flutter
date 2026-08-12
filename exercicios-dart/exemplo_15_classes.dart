enum StatusVegetacao { normal, atencao, urgente }

class Medicao {
 int id;
 int areaId;
 double alturaVegetacao;
 double densidade;
 double temperatura;
 double umidade;
 String? sensorId;
 String? observacoes;

 Medicao({
 required this.id,
 required this.areaId,
 required this.alturaVegetacao,
 required this.densidade,
 required this.temperatura,
 required this.umidade,
 this.sensorId,
 this.observacoes,
 });

 String resumo() {
 final sensor = sensorId ?? 'sem sensor';
 return 'Medição #$id | área $areaId | dens=${densidade.toStringAsFixed(2)} '
 '| temp=${temperatura.toStringAsFixed(1)}°C | $sensor';
 }
}

class AreaMonitoramento {
 int id;
 String codigo;
 String rodovia;
 StatusVegetacao status;
 double? densidade;
 List<Medicao> medicoes;

 AreaMonitoramento({
 required this.id,
 required this.codigo,
 required this.rodovia,
 required this.status,
 this.densidade,
 List<Medicao>? medicoes,
 }) : medicoes = medicoes ?? [];

 void adicionarMedicao(Medicao medicao) {
 medicoes.add(medicao);
 densidade = medicao.densidade;
 if (medicao.densidade >= 0.90) {
 status = StatusVegetacao.urgente;
 } else if (medicao.densidade >= 0.70) {
 status = StatusVegetacao.atencao;
 } else {
 status = StatusVegetacao.normal;
 }
 }

 String resumo() {
 return 'Área $codigo ($rodovia) | ${status.name} | '
 'medições=${medicoes.length} | '
 'densidade=${densidade?.toStringAsFixed(2) ?? 'sem dados'}';
 }
}

void main() {
 final area = AreaMonitoramento(
 id: 2,
 codigo: 'BR116-KM045',
 rodovia: 'BR-116',
 status: StatusVegetacao.normal,
 );

 final medicao = Medicao(
 id: 1,
 areaId: area.id,
 alturaVegetacao: 1.85,
 densidade: 0.71,
 temperatura: 28.4,
 umidade: 62.0,
 sensorId: 'SENSOR-07',
 observacoes: 'Crescimento na faixa de domínio',
 );

 print(area.resumo());
 area.adicionarMedicao(medicao);
 print(medicao.resumo());
 print(area.resumo());
}
