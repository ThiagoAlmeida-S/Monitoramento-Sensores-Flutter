import 'package:flutter/material.dart';

import '../models/area_monitoramento.dart';

class AreaCard extends StatelessWidget {
 final AreaMonitoramento area;
 final VoidCallback? onTap;

 const AreaCard({
 super.key,
 required this.area,
 this.onTap,
 });

 Color get _statusColor {
 switch (area.status) {
 case StatusVegetacao.normal:
 return const Color(0xFF4CAF50);
 case StatusVegetacao.atencao:
 return const Color(0xFFFF9800);
 case StatusVegetacao.urgente:
 return const Color(0xFFF44336);
 }
 }

 String _formatarData(DateTime? data) {
 if (data == null) return 'Sem dados';
 final d = data.toLocal();
 String dois(int n) => n.toString().padLeft(2, '0');
 return '${dois(d.day)}/${dois(d.month)}/${d.year} '
 '${dois(d.hour)}:${dois(d.minute)}';
 }

 @override
 Widget build(BuildContext context) {
 return Card(
 margin: const EdgeInsets.only(bottom: 16),
 elevation: 3,
 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
 child: InkWell(
 onTap: onTap,
 borderRadius: BorderRadius.circular(12),
 child: Padding(
 padding: const EdgeInsets.all(16),
 child: Column(
 crossAxisAlignment: CrossAxisAlignment.start,
 children: [
 Row(
 crossAxisAlignment: CrossAxisAlignment.start,
 children: [
 Expanded(
 child: Column(
 crossAxisAlignment: CrossAxisAlignment.start,
 children: [
 Text(
 area.codigo,
 style: const TextStyle(
 fontSize: 18,
 fontWeight: FontWeight.bold,
 ),
 ),
 const SizedBox(height: 4),
 Text(
 area.rodovia,
 style: const TextStyle(color: Color(0xFF666666)),
 ),
 ],
 ),
 ),
 Container(
 padding: const EdgeInsets.symmetric(
 horizontal: 12,
 vertical: 6,
 ),
 decoration: BoxDecoration(
 color: _statusColor,
 borderRadius: BorderRadius.circular(16),
 ),
 child: Text(
 area.statusLabel,
 style: const TextStyle(
 color: Colors.white,
 fontSize: 12,
 fontWeight: FontWeight.bold,
 ),
 ),
 ),
 ],
 ),
 const Divider(height: 24),
 _infoRow('Localização', area.localizacao),
 _infoRow(
 'Km',
 '${area.kmInicial.toStringAsFixed(1)} - ${area.kmFinal.toStringAsFixed(1)}',
 ),
 _infoRow('Terreno', area.tipoTerreno),
 const Divider(height: 24),
 Row(
 children: [
 _metricBox(
 'Altura Média',
 area.alturaMedia != null
 ? '${area.alturaMedia!.toStringAsFixed(2)}m'
 : '-',
 ),
 _metricBox(
 'Densidade',
 area.densidade != null
 ? '${area.densidade!.toStringAsFixed(1)}%'
 : '-',
 ),
 _metricBox('Medições', '${area.totalMedicoes}'),
 ],
 ),
 const Divider(height: 24),
 Center(
 child: Text(
 'Última medição: ${_formatarData(area.ultimaMedicao)}',
 style: const TextStyle(
 fontSize: 12,
 color: Color(0xFF999999),
 ),
 ),
 ),
 ],
 ),
 ),
 ),
 );
 }

 Widget _infoRow(String label, String value) {
 return Padding(
 padding: const EdgeInsets.only(bottom: 6),
 child: Row(
 mainAxisAlignment: MainAxisAlignment.spaceBetween,
 children: [
 Text(label, style: const TextStyle(color: Color(0xFF666666))),
 Flexible(
 child: Text(
 value,
 textAlign: TextAlign.end,
 style: const TextStyle(fontWeight: FontWeight.w500),
 ),
 ),
 ],
 ),
 );
 }

 Widget _metricBox(String label, String value) {
 return Expanded(
 child: Column(
 children: [
 Text(
 label,
 style: const TextStyle(fontSize: 11, color: Color(0xFF999999)),
 ),
 const SizedBox(height: 4),
 Text(
 value,
 style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
 ),
 ],
 ),
 );
 }
}
