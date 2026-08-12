void main() {
 String codigoArea = 'SP280-KM120';
 String rodovia = 'SP-280';
 String localizacao = 'Sorocaba / SP';
 String sensorId = 'SENSOR-01';

 // Concatenação
 String frase1 = 'Área: ' + codigoArea;

 // Interpolação (forma preferida)
 String frase2 = 'Área: $codigoArea | Rodovia: $rodovia';
 String frase3 = 'Local: $localizacao | Sensor: $sensorId';

 print(frase1);
 print(frase2);
 print(frase3);

 print(codigoArea.toUpperCase());
 print(codigoArea.toLowerCase());
 print(codigoArea.length);
 print(codigoArea.contains('SP280'));
}
