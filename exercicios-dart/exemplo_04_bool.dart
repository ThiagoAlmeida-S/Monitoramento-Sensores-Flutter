void main(){
    bool areaAtiva = true;
 bool coletaHabilitada = true;
 bool sensorOnline = false;
 bool intervencaoNecessaria = true;
 
 print('Área ativa? $areaAtiva');
 print('Coleta habilitada? $coletaHabilitada');
 print('Sensor online? $sensorOnline');
 print('Intervenção necessária? $intervencaoNecessaria');
 
 if (areaAtiva && coletaHabilitada) {
 print('Pode simular coleta de sensores.');
 } else {
 print('Coleta bloqueada para esta área.');
 }
 
 if (!sensorOnline) {
 print('Atenção: sensor offline - verificar IoT.');
 }
}