void main() {
 String? tipoVegetacao; // começa null
 String? observacoes = null;
 double? inclinacaoTerreno;

 print(tipoVegetacao);
 print(observacoes);
 print(inclinacaoTerreno);

 tipoVegetacao = 'Gramínea';
 observacoes = 'Crescimento acelerado na faixa marginal';
 inclinacaoTerreno = 12.5;

 String tipoExibicao = tipoVegetacao ?? 'Tipo não informado';
 String obsExibicao = observacoes ?? 'Sem observações';

 print(tipoExibicao);
 print(obsExibicao);

 if (inclinacaoTerreno != null) {
 print('Inclinação: ${inclinacaoTerreno.toStringAsFixed(1)}°');
 }
}
