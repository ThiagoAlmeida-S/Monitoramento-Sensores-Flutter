void main (){
    int idArea = 1;
    int idMedicao = 3 ;
    int totalMedicao = 16;
    int sensoresAtivos = 4;
    int alertasAbertos = 2; 

int somaid = idArea + idMedicao;
int proximaMedicao = idMedicao + 1;

if alertasAbertos > 3 {
    print(' operação critica')
} else {
    print('operação estavel')
}

 print('ID da área: $idArea');
 print('ID da medição: $idMedicao');
 print('Total de medições: $totalMedicao');
 print('Sensores ativos: $sensoresAtivos');
 print('Soma dos IDs: $somaIds');
 print('Próxima medição: $proximaMedicao');
}