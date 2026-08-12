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
 return Colors.green;
 case StatusVegetacao.atencao:
 return Colors.orange;
 case StatusVegetacao.urgente:
 return Colors.red;
 }
 }

 @override
 Widget build(BuildContext context) {
 return Card(
 margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
 elevation: 2,
 child: InkWell(
 onTap: onTap,
 borderRadius: BorderRadius.circular(12),
 child: Padding(
 padding: const EdgeInsets.all(16),
 child: Column(
 crossAxisAlignment: CrossAxisAlignment.start,
 children: [
 Row(
 children: [
 Expanded(
 child: Text(
 area.codigo,
 style: const TextStyle(
 fontSize: 18,
 fontWeight: FontWeight.bold,
 ),
 ),
 ),
 Container(
 padding: const EdgeInsets.symmetric(
 horizontal: 10,
 vertical: 4,
 ),
 decoration: BoxDecoration(
 color: _statusColor.withValues(alpha: 0.15),
 borderRadius: BorderRadius.circular(20),
 border: Border.all(color: _statusColor),
 ),
 child: Text(
 area.statusLabel,
 style: TextStyle(
 color: _statusColor,
 fontWeight: FontWeight.w700,
 ),
 ),
 ),
 ],
 ),
 const SizedBox(height: 8),
 Text('${area.rodovia} • ${area.localizacao}'),
 Text('KM ${area.kmInicial} → ${area.kmFinal}'),
 Text('Terreno: ${area.tipoTerreno}'),
 const SizedBox(height: 8),
 Text(
 'Densidade: ${area.densidade?.toStringAsFixed(2) ?? 'sem dados'}'
 ' | Altura média: ${area.alturaMedia?.toStringAsFixed(2) ?? 'sem dados'}',
 ),
 Text('Medições: ${area.totalMedicoes}'),
 ],
 ),
 ),
 ),
 );
 }
}
