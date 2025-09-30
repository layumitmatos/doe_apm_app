import 'package:flutter/material.dart';
import 'home_page.dart';
import 'donation_page.dart';
import 'profile_page.dart';

// Model definido no mesmo arquivo
class Donation {
  final String type; // 'doacao' ou 'aplicacao'
  final double value;
  final String description;
  final DateTime date;
  final String? donor;
  final String? responsible;

  Donation({
    required this.type,
    required this.value,
    required this.description,
    required this.date,
    this.donor,
    this.responsible,
  });

  String get formattedDate {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  String get formattedTime {
    return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final double currentBalance = 2847.50;
  final DateTime lastUpdate = DateTime(2024, 1, 15, 14, 30);

  final List<Donation> donations = [
    Donation(
      type: 'doacao',
      value: 150.00,
      description: 'Doação para reforma da biblioteca',
      date: DateTime(2024, 1, 14),
      donor: 'Maria Silva Santos',
    ),
    Donation(
      type: 'aplicacao',
      value: 500.00,
      description: 'Compra de materiais didáticos',
      date: DateTime(2024, 1, 13),
      responsible: 'João Carlos - Diretor',
    ),
    Donation(
      type: 'doacao',
      value: 85.50,
      description: 'Doação para atividades extracurriculares',
      date: DateTime(2024, 1, 12),
      donor: 'Pedro Oliveira',
    ),
    Donation(
      type: 'doacao',
      value: 200.00,
      description: 'Doação para equipamentos tecnológicos',
      date: DateTime(2024, 1, 12),
      donor: 'Ana Costa',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(),
            const SizedBox(height: 30),
            _buildBalanceSection(),
            const SizedBox(height: 30),
            _buildTransactionsList(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context, 1),
    );
  }

  Widget _buildHeaderSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Histórico de Arrecadações',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Veja nossas arrecadações e como elas serão usadas',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildBalanceSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue[100]!),
      ),
      child: Column(
        children: [
          const Text(
            'Saldo atual',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'R\$ ${currentBalance.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Última atualização em ${lastUpdate.day.toString().padLeft(2, '0')}/${lastUpdate.month.toString().padLeft(2, '0')}/${lastUpdate.year} às ${lastUpdate.hour.toString().padLeft(2, '0')}:${lastUpdate.minute.toString().padLeft(2, '0')}',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Movimentações',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 15),
        ...donations.map((donation) => _buildTransactionCard(donation)),
      ],
    );
  }

  Widget _buildTransactionCard(Donation donation) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  donation.type == 'doacao' ? 'Doação' : 'Aplicação',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  '${donation.type == 'doacao' ? '+' : '-'} R\$ ${donation.value.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: donation.type == 'doacao' ? Colors.green : Colors.orange,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              donation.description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              donation.formattedDate,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            if (donation.donor != null) ...[
              const SizedBox(height: 4),
              Text(
                'Doador: ${donation.donor}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
            if (donation.responsible != null) ...[
              const SizedBox(height: 4),
              Text(
                'Responsável: ${donation.responsible}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

BottomNavigationBar _buildBottomNavigationBar(BuildContext context, int currentIndex) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: currentIndex,
    onTap: (index) {
      if (index == 0) {
        Navigator.pop(context);
      } else if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DonationsPage()),
        );
      } else if (index == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
      }
    },
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Início',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.history),
        label: 'Histórico',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.attach_money),
        label: 'Doações',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Perfil',
      ),
    ],
  );
}}
