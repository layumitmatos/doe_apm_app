import 'package:flutter/material.dart';
import 'home_page.dart';
import 'history_page.dart';
import 'profile_page.dart';

class DonationItem {
  final String status;
  final double value;
  final DateTime date;
  final bool isConfirmed;

  DonationItem({
    required this.status,
    required this.value,
    required this.date,
    required this.isConfirmed,
  });

  String get formattedDate {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}

class DonationsPage extends StatelessWidget {
  DonationsPage({super.key});

  final double totalDonated = 555.50;
  final int totalDonations = 4;

  final List<DonationItem> donations = [
    DonationItem(
      status: 'Confirmada',
      value: 150.00,
      date: DateTime(2024, 1, 14),
      isConfirmed: true,
    ),
    DonationItem(
      status: 'Contornada',
      value: 85.50,
      date: DateTime(2024, 1, 14),
      isConfirmed: false,
    ),
    DonationItem(
      status: 'Confirmada',
      value: 200.00,
      date: DateTime(2024, 1, 1),
      isConfirmed: true,
    ),
    DonationItem(
      status: 'Confirmada',
      value: 120.00,
      date: DateTime(2023, 12, 19),
      isConfirmed: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Doações'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(),
            const SizedBox(height: 30),
            _buildStatsSection(),
            const SizedBox(height: 30),
            _buildDonationsList(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context, 2),
    );
  }

  Widget _buildHeaderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Minhas Doações',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Acompanhe suas contribuições para a APM',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildStatsSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.green[500]!, Colors.green[700]!],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          const Text(
            'Total doado',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'R\$ ${totalDonated.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '$totalDonations doações realizadas',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDonationsList() {
    // Agrupar doações por data
    final Map<String, List<DonationItem>> groupedDonations = {};
    
    for (var donation in donations) {
      final String dateKey = donation.formattedDate;
      if (!groupedDonations.containsKey(dateKey)) {
        groupedDonations[dateKey] = [];
      }
      groupedDonations[dateKey]!.add(donation);
    }

    // Ordenar datas da mais recente para a mais antiga
    final sortedDates = groupedDonations.keys.toList()
      ..sort((a, b) => b.compareTo(a));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Histórico de Doações',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 15),
        ...sortedDates.map((date) => _buildDateGroup(date, groupedDonations[date]!)),
      ],
    );
  }

  Widget _buildDateGroup(String date, List<DonationItem> donationsForDate) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Doação realizada $date',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ),
        ...donationsForDate.map((donation) => _buildDonationCard(donation)),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildDonationCard(DonationItem donation) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: donation.isConfirmed ? Colors.green[100] : Colors.orange[100],
                shape: BoxShape.circle,
              ),
              child: Icon(
                donation.isConfirmed ? Icons.check_circle : Icons.error_outline,
                color: donation.isConfirmed ? Colors.green : Colors.orange,
                size: 24,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    donation.status,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: donation.isConfirmed ? Colors.green : Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'R\$ ${donation.value.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey[400],
            ),
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
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false,
        );
      } else if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HistoryPage()),
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