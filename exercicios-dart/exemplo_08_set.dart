void main() {
 Set<String> rodovias = {
 'SP-280',
 'BR-116',
 'SP-330',
 };

 print(rodovias);

 rodovias.add('SP-280'); // não duplica
 rodovias.add('BR-101');

 print('Após inserções: $rodovias');
 print('Contém BR-116? ${rodovias.contains('BR-116')}');
}
