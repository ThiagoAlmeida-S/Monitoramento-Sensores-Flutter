void main() {
 dynamic qualquer = 'SENSOR-01';
 print(qualquer);

 qualquer = 10; // permitido com dynamic
 print(qualquer);

 Object dado = 'Área monitorada';
 print(dado);

 if (dado is String) {
 print(dado.toUpperCase());
 }
}
