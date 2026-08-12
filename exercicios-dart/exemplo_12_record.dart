void main() {
 (String, double) resumoArea = ('SP280-KM120', 0.71);

 print('Área: ${resumoArea.$1}');
 print('Densidade: ${resumoArea.$2}');

 ({String codigo, String rodovia, double temperatura}) leitura = (
 codigo: 'BR116-KM045',
 rodovia: 'BR-116',
 temperatura: 29.2,
 );

 print(leitura.codigo);
 print(leitura.rodovia);
 print(leitura.temperatura);
}
