void main(){
    String codigo = 'SP280-KM120';
    String rodovia = 'SP-280';
    String localizacao = 'Sorocaba / SP';
    String sensorId = 'sensorId-1';

String frase5 = 'Area: $codigo | Rodovia: $rodovia';

print(frase5);
print(codigo.toUpperCase());
print('Quantidade de caracteres: ${sensorId.length}')//lenght utilizado para saber a quantidade de caracteres, mesma coisa do len no python
print(codigo.contains('SP280'));
}