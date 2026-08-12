void main() {
 double alturaVegetacao = 1.85;
 double densidade = 0.71;
 double temperatura = 28.4;
 double umidade = 62.0;

 print('Altura: ${alturaVegetacao.toStringAsFixed(2)} m');
 print('Densidade: ${densidade.toStringAsFixed(2)}');
 print('Temperatura: ${temperatura.toStringAsFixed(1)} °C');
 print('Umidade: ${umidade.toStringAsFixed(1)} %');

 // Média simples de densidade de 3 leituras
 double d1 = 0.42;
 double d2 = 0.71;
 double d3 = 0.91;
 double media = (d1 + d2 + d3) / 3;

 print('Média de densidade: ${media.toStringAsFixed(2)}');
}
