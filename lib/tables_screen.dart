import 'package:flutter/material.dart';

// 1. Constructor const en el modelo de datos
class TableData {
  final int number;
  final String status; // 'Libre', 'Ocupada', 'Cerrando'
  final Color color;

  // Hacemos el constructor constante para que los objetos puedan ser usados en listas const
  const TableData({required this.number, required this.status, required this.color}); 
}

class TablesScreen extends StatelessWidget {
  const TablesScreen({super.key});

  // 2. La lista ahora es CONSTANTE porque el constructor de TableData lo es y los valores de Color también
  final List<TableData> _tables = const [ 
    TableData(number: 1, status: 'Ocupada', color: Color(0xFFFF5300)), // Naranja
    TableData(number: 2, status: 'Libre', color: Colors.green),
    TableData(number: 3, status: 'Ocupada', color: Color(0xFFFF5300)),
    TableData(number: 4, status: 'Libre', color: Colors.green),
    TableData(number: 5, status: 'Cerrando', color: Colors.blue), // Azul para pedir la cuenta
    TableData(number: 6, status: 'Libre', color: Colors.green),
    TableData(number: 7, status: 'Ocupada', color: Color(0xFFFF5300)),
    TableData(number: 8, status: 'Libre', color: Colors.green),
  ];

  Widget _buildTableCard(TableData table) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        // Al presionar la mesa, podrías navegar a la pantalla de pedidos
        onTap: () {
          // TODO: Implementar navegación a la pantalla de Pedidos para esta mesa
          // Usaremos 'debugPrint' en lugar de 'print' para evitar la advertencia de 'avoid_print'
          debugPrint('Mesa ${table.number} presionada. Estado: ${table.status}');
        },
        child: Container(
          decoration: BoxDecoration(
            // Nota: Se reemplaza .withOpacity por una solución equivalente o más moderna
            // Aunque .withOpacity no causa error de compilación, es mejor usarlo con cuidado.
            color: table.color.withAlpha((255 * 0.1).round()), // Usando withAlpha para evitar el warning 'deprecated_member_use'
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: table.color, width: 2), // Borde con color de estado
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'MESA',
                style: TextStyle(fontSize: 14, color: table.color),
              ),
              Text(
                '${table.number}',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: table.color,
                ),
              ),
              const SizedBox(height: 5),
              // Indicador de estado
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: table.color,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  table.status,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Mesas'),
        backgroundColor: const Color(0xFFFF5300),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              debugPrint('Refrescando estado de las mesas...'); // Usamos debugPrint
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            childAspectRatio: 1.0,
          ),
          itemCount: _tables.length,
          itemBuilder: (context, index) {
            return _buildTableCard(_tables[index]);
          },
        ),
      ),
    );
  }
}