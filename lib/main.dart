import 'package:flutter/material.dart';
import 'models/area_monitoramento.dart';
import 'widgets/area_card.dart';

void main() {
 runApp(const VerdeSmartApp());
}

class VerdeSmartApp extends StatelessWidget {
 const VerdeSmartApp({super.key});

 @override
 Widget build(BuildContext context) {
 return MaterialApp(
 debugShowCheckedModeBanner: false,
 title: 'VerdeSmart',
 theme: ThemeData(
 colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2E7D32)),
 useMaterial3: true,
 ),
 home: const DashboardScreen(),
 );
 }
}

class DashboardScreen extends StatelessWidget {
 const DashboardScreen({super.key});

 // Dados locais de demonstração (mock) - mesma ideia do App.tsx inicial
 static final List<AreaMonitoramento> areas = [
 const AreaMonitoramento(
 id: 1,
 codigo: 'SP280-KM120',
 rodovia: 'SP-280',
 kmInicial: 120,
 kmFinal: 125,
 localizacao: 'Sorocaba / SP',
 status: StatusVegetacao.normal,
 tipoTerreno: 'Planície',
 densidade: 0.42,
 alturaMedia: 1.10,
 totalMedicoes: 8,
 ),
 const AreaMonitoramento(
 id: 2,
 codigo: 'BR116-KM045',
 rodovia: 'BR-116',
 kmInicial: 45,
 kmFinal: 50,
 localizacao: 'Registro / SP',
 status: StatusVegetacao.atencao,
 tipoTerreno: 'Encosta',
 densidade: 0.71,
 alturaMedia: 1.85,
 totalMedicoes: 12,
 ),
 const AreaMonitoramento(
 id: 3,
 codigo: 'SP330-KM210',
 rodovia: 'SP-330',
 kmInicial: 210,
 kmFinal: 214,
 localizacao: 'Campinas / SP',
 status: StatusVegetacao.urgente,
 tipoTerreno: 'Vale',
 densidade: 0.91,
 alturaMedia: 2.40,
 totalMedicoes: 20,
 ),
const AreaMonitoramento(
 id: 4,
 codigo: 'SP270-KM052',
 rodovia: 'SP-270',
 kmInicial: 210,
 kmFinal: 214,
 localizacao: 'Itapetininga',
 status: StatusVegetacao.atencao,
 tipoTerreno: 'Planice',
 densidade: 0.61,
 alturaMedia: 1.56,
 totalMedicoes: 16,
 ),
 ];

 @override
 Widget build(BuildContext context) {
 final total = areas.length;
 final urgentes = areas.where((a) => a.status == StatusVegetacao.urgente).length;

 return Scaffold(
 appBar: AppBar(
 title: const Text('VerdeSmart IoT'),
 centerTitle: true,
 ),
 body: Column(
 crossAxisAlignment: CrossAxisAlignment.stretch,
 children: [
 Container(
 padding: const EdgeInsets.all(16),
 color: const Color(0xFFE8F5E9),
 child: Text(
 'Monitoramento de vegetação em rodovias\n'
 '$total áreas | $urgentes urgente(s)',
 style: const TextStyle(fontSize: 16, height: 1.4),
 ),
 ),
 Expanded(
 child: ListView.builder(
 itemCount: areas.length,
 itemBuilder: (context, index) {
 final area = areas[index];
 return AreaCard(
 area: area,
 onTap: () {
 ScaffoldMessenger.of(context).showSnackBar(
 SnackBar(
 content: Text('Área selecionada: ${area.codigo}'),
 ),
 );
 },
 );
 },
 ),
 ),
 ],
 ),
 floatingActionButton: FloatingActionButton.extended(
 onPressed: () {
 ScaffoldMessenger.of(context).showSnackBar(
 const SnackBar(
 content: Text('Na próxima etapa: simular coleta via API Java'),
 ),
 );
 },
 icon: const Icon(Icons.sensors),
 label: const Text('Simular coleta'),
 ),
 );
 }
}
