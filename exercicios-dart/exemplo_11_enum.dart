enum StatusVegetacao {
 normal,
 atencao,
 urgente,
}

void main() {
 StatusVegetacao status = StatusVegetacao.atencao;

 print('Status atual: ${status.name}');

 if (status == StatusVegetacao.atencao) {
 print('Monitoramento recomendado nesta área.');
 }

 status = StatusVegetacao.urgente;
 print('Novo status: ${status.name}');
}
