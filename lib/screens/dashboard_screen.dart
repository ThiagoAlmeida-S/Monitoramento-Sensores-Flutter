import 'package:flutter/material.dart';

import '../models/area_monitoramento.dart';
import '../services/api.dart';
import '../widgets/area_card.dart';

class DashboardScreen extends StatefulWidget {
 const DashboardScreen({super.key});

 @override
 State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
 List<AreaMonitoramento> areas = [];
 bool loading = true;
 bool refreshing = false;
 StatusVegetacao? filtroStatus; // null = TODOS

 @override
 void initState() {
 super.initState();
 carregarAreas();
 }

 Future<void> carregarAreas() async {
 try {
 if (!refreshing) {
 setState(() => loading = true);
 }

 final dados = await ApiService.listarAreas();

 if (!mounted) return;
 setState(() {
 areas = dados;
 loading = false;
 refreshing = false;
 });
 } catch (e) {
 if (!mounted) return;
 setState(() {
 loading = false;
 refreshing = false;
 });
 ScaffoldMessenger.of(context).showSnackBar(
 SnackBar(
 content: Text('Erro ao carregar áreas: $e'),
 backgroundColor: Colors.red.shade700,
 ),
 );
 }
 }

 Future<void> onRefresh() async {
 setState(() => refreshing = true);
 await carregarAreas();
 }

 Future<void> simularColeta() async {
 try {
 setState(() => loading = true);
 final medicoes = await ApiService.simularTodasAreas();
 await carregarAreas();

 if (!mounted) return;
 ScaffoldMessenger.of(context).showSnackBar(
 SnackBar(
 content: Text(
 'Coleta simulada: ${medicoes.length} medição(ões) gerada(s)',
 ),
 ),
 );
 } catch (e) {
 if (!mounted) return;
 setState(() => loading = false);
 ScaffoldMessenger.of(context).showSnackBar(
 SnackBar(
 content: Text('Erro ao simular coleta: $e'),
 backgroundColor: Colors.red.shade700,
 ),
 );
 }
 }

 List<AreaMonitoramento> get areasFiltradas {
 if (filtroStatus == null) return areas;
 return areas.where((a) => a.status == filtroStatus).toList();
 }

 int contarPorStatus(StatusVegetacao status) {
 return areas.where((a) => a.status == status).length;
 }

 void handleAreaTap(AreaMonitoramento area) {
 // Próxima aula: navegar para tela de detalhes
 ScaffoldMessenger.of(context).showSnackBar(
 SnackBar(
 content: Text(
 'Área: ${area.codigo}\nDetalhes serão implementados na próxima etapa',
 ),
 ),
 );
 }

 @override
 Widget build(BuildContext context) {
 if (loading && !refreshing) {
 return const Scaffold(
 body: Center(
 child: Column(
 mainAxisAlignment: MainAxisAlignment.center,
 children: [
 CircularProgressIndicator(),
 SizedBox(height: 12),
 Text('Carregando dados...'),
 ],
 ),
 ),
 );
 }

 return Scaffold(
 body: Column(
 children: [
 Container(
 width: double.infinity,
 padding: const EdgeInsets.fromLTRB(20, 48, 20, 28),
 color: const Color(0xFF2E7D32),
 child: const Column(
 crossAxisAlignment: CrossAxisAlignment.start,
 children: [
 Text(
 'VerdeSmart',
 style: TextStyle(
 fontSize: 28,
 fontWeight: FontWeight.bold,
 color: Colors.white,
 ),
 ),
 SizedBox(height: 4),
 Text(
 'Monitoramento de Vegetação',
 style: TextStyle(fontSize: 16, color: Color(0xFFE0E0E0)),
 ),
 ],
 ),
 ),
 Container(
 color: Colors.white,
 padding: const EdgeInsets.all(16),
 child: Row(
 children: [
 _statusChip(
 label: 'Urgente',
 count: contarPorStatus(StatusVegetacao.urgente),
 color: const Color(0xFFF44336),
 status: StatusVegetacao.urgente,
 ),
 const SizedBox(width: 8),
 _statusChip(
 label: 'Atenção',
 count: contarPorStatus(StatusVegetacao.atencao),
 color: const Color(0xFFFF9800),
 status: StatusVegetacao.atencao,
 ),
 const SizedBox(width: 8),
 _statusChip(
 label: 'Normal',
 count: contarPorStatus(StatusVegetacao.normal),
 color: const Color(0xFF4CAF50),
 status: StatusVegetacao.normal,
 ),
 ],
 ),
 ),
 if (filtroStatus != null)
 Padding(
 padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
 child: SizedBox(
 width: double.infinity,
 child: ElevatedButton(
 onPressed: () => setState(() => filtroStatus = null),
 child: const Text('Limpar Filtro'),
 ),
 ),
 ),
 Expanded(
 child: RefreshIndicator(
 onRefresh: onRefresh,
 child: areasFiltradas.isEmpty
 ? ListView(
 children: const [
 SizedBox(height: 80),
 Center(child: Text('Nenhuma área encontrada')),
 ],
 )
 : ListView.builder(
 padding: const EdgeInsets.all(16),
 itemCount: areasFiltradas.length,
 itemBuilder: (context, index) {
 final area = areasFiltradas[index];
 return AreaCard(
 area: area,
 onTap: () => handleAreaTap(area),
 );
 },
 ),
 ),
 ),
 ],
 ),
 floatingActionButton: FloatingActionButton.extended(
 onPressed: simularColeta,
 icon: const Icon(Icons.sensors),
 label: const Text('Simular coleta'),
 ),
 );
 }

 Widget _statusChip({
 required String label,
 required int count,
 required Color color,
 required StatusVegetacao status,
 }) {
 final ativo = filtroStatus == status;
 return Expanded(
 child: InkWell(
 onTap: () => setState(() => filtroStatus = status),
 borderRadius: BorderRadius.circular(12),
 child: Container(
 padding: const EdgeInsets.symmetric(vertical: 16),
 decoration: BoxDecoration(
 color: color.withValues(alpha: ativo ? 1 : 0.9),
 borderRadius: BorderRadius.circular(12),
 border: ativo ? Border.all(color: Colors.black87, width: 3) : null,
 ),
 child: Column(
 children: [
 Text(
 '$count',
 style: const TextStyle(
 fontSize: 28,
 fontWeight: FontWeight.bold,
 color: Colors.white,
 ),
 ),
 Text(
 label,
 style: const TextStyle(
 fontSize: 12,
 fontWeight: FontWeight.w600,
 color: Colors.white,
 ),
 ),
 ],
 ),
 ),
 ),
 );
 }
}
