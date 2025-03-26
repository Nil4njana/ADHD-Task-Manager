import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter/services.dart'; // Import this for HapticFeedback

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  final emojiParser = EmojiParser();
  late AnimationController _animationController;
  
  // ADHD-friendly color palette
  final Color _primaryColor = const Color(0xFF4361EE); // Vibrant blue
  //final Color _secondaryColor = const Color(0xFF3A0CA3); // Deep purple
  //final Color _accentColor = const Color(0xFF7209B7); // Bright purple
  final Color _backgroundColor = const Color(0xFFF8F9FA); // Light background
  final Color _cardColor = Colors.white;
  //final Color _textPrimaryColor = const Color(0xFF2B2D42); // Dark blue-gray
  final Color _textSecondaryColor = const Color(0xFF6C757D); // Medium gray

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _animationController.reset();
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: _primaryColor,
        title: const Text(
          "👋 Welcome, You!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.account_circle, size: 28, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, size: 26, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [_primaryColor.withOpacity(0.05), _backgroundColor],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 4, bottom: 16, top: 8),
                child: Text(
                  "What would you like to focus on today?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2B2D42),
                  ),
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildCategoryCard("🌱", "Habits", "Small steps, big wins!", Colors.green.shade100, Colors.green.shade700),
                    _buildCategoryCard("🎯", "Goals", "Dream big, achieve bigger!", Colors.blue.shade100, Colors.blue.shade700),
                    _buildCategoryCard("✅", "Tasks", "One task at a time!", Colors.purple.shade100, Colors.purple.shade700),
                    _buildCategoryCard("🏆", "Achievements", "Celebrate your progress!", Colors.amber.shade100, Colors.amber.shade800),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _navItem("🏡", "Home"),
          _navItem("📈", "Progress"),
          _navItem("⭐", "Points"),
          _navItem("🔥", "Streak"),
          _navItem("💡", "Tips"),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: _cardColor,
        selectedItemColor: _primaryColor,
        unselectedItemColor: _textSecondaryColor,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildCategoryCard(String emoji, String title, String tagline, Color bgColor, Color textColor) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact(); // Fixed import issue
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.2),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [bgColor, bgColor.withOpacity(0.7)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(emoji, style: const TextStyle(fontSize: 30)),
                const SizedBox(height: 12),
                Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor)),
                const SizedBox(height: 6),
                Text(tagline, textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: textColor.withOpacity(0.8))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _navItem(String emoji, String label) {
    return BottomNavigationBarItem(
      icon: Text(emoji, style: const TextStyle(fontSize: 24)),
      label: label,
    );
  }
}
