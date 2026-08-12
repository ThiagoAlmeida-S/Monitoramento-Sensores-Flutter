String formatarDensidade(double densidade) {
 return densidade.toStringAsFixed(2);
}

bool precisaIntervencao(String status) {
 return status == 'URGENTE';
}

String descreverArea({
 required String codigo,
 required String rodovia,
 required double densidade,
 String status = 'NORMAL',
}) {
 return 'Área $codigo ($rodovia) | $status | dens=${formatarDensidade(densidade)}';
}

double media(double a, double b) => (a + b) / 2;

void main() {
 print(formatarDensidade(0.7123));
 print(precisaIntervencao('URGENTE'));
 print(
 descreverArea(
 codigo: 'SP280-KM120',
 rodovia: 'SP-280',
 densidade: 0.71,
 status: 'ATENCAO',
 ),
 );
 print(media(0.42, 0.91));
}
