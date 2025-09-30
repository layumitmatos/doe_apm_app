import 'package:flutter/material.dart';
import 'history_page.dart';
import 'donation_page.dart';
import 'profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildWelcomeSection(),
            _buildAboutSection(),
            _buildDonationsSection(context),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context, 0),
    );
  }

  Widget _buildWelcomeSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [const Color.fromRGBO(155, 205, 255, 1), const Color.fromARGB(255, 166, 215, 255)],
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/imagens/logo.png',
            height: 150,
          ),
          const SizedBox(height: 20),
          const Text(
            'Bem-vindo à nossa APM',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 1, 28, 90),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          const Text(
            'Associação de Pais e Mestres - Transformando a educação juntos',
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 1, 28, 90),
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    return Container(
      padding: const EdgeInsets.all(30),
      color: Colors.grey[50],
      child: Column(
        children: [
          const Column(
            children: [
              Text(
                'Conheça nossa APM',
                style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 1, 28, 90),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Entenda como trabalhamos para melhorar a educação',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 106, 105, 105),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(height: 25),
          // Caixa 1 - O que é a APM
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'O que é a APM?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 1, 28, 90),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'A Associação de Pais e Mestres é uma organização que une famílias e educadores para melhorar a qualidade da educação através de projetos colaborativos, arrecadação de recursos e atividades que beneficiam toda a comunidade escolar.',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.6,
                    color: Color.fromARGB(255, 106, 105, 105)
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDonationsSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      color: Colors.grey[50],
      child: Column(
        children: [
          // Caixa 2 - Como suas doações ajudam
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Como suas doações ajudam',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 1, 28, 90),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Suas contribuições são fundamentais para melhorias na infraestrutura, aquisição de materiais didáticos, equipamentos tecnológicos e realização de atividades extracurriculares que enriquecem a experiência educacional.',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.6,
                    color: Color.fromARGB(255, 106, 105, 105),
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),

          // Caixa 3 - O que você encontra no app
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'O que você encontra no app:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 1, 28, 90),
                  ),
                ),
                const SizedBox(height: 15),
                _buildDonationFeature('Acompanhe suas doações pessoais'),
                _buildDonationFeature('Visualize o histórico completo de arrecadações'),
                _buildDonationFeature('Veja como os recursos são utilizados'),
                _buildDonationFeature('Mantenha-se informado sobre nossas atividades'),
              ],
            ),
          ),

          // Botão de doação
          Container(
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
                  'Faça a diferença!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Sua doação transforma a educação',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _showContactDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.green[700],
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Doar Agora',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Fale Conosco',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 1, 28, 90),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, size: 24),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _buildContactInfo(
                Icons.email,
                'E-mail:',
                'apm.escola@educacao.com.br',
              ),
              const SizedBox(height: 15),
              _buildContactInfo(
                Icons.phone,
                'Telefone:',
                '(11) 98765-4321',
              ),
              const SizedBox(height: 20),
              const Text(
                'Entre em contato conosco para mais informações sobre como fazer sua doação.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContactInfo(IconData icon, String title, String info) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.blue),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 1, 28, 90),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                info,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDonationFeature(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, size: 20, color: Colors.green[700]),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(BuildContext context, int currentIndex) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HistoryPage()),
          );
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
  }
}