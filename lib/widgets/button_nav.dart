import 'package:flutter/material.dart';

class ButtonNavigate extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const ButtonNavigate({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea( // Ensures it sits above system bars on all devices
      child: Padding(
        padding: const EdgeInsets.only(left: 14, right: 14, bottom: 10),
        child: Container(
          width: double.infinity,
          height: 68,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 14,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: currentIndex,
            onTap: (index) {
              // Optional: Add a little haptic feedback (requires Flutter >2.0)
              // HapticFeedback.selectionClick();
              onTap(index);
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xFFEE6019),
            unselectedItemColor: const Color(0xFF2F2F2F),
            selectedFontSize: 13,
            unselectedFontSize: 12,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: _navIcon(Icons.search, 0),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: _navIcon(Icons.book, 1),
                label: 'My Courses',
              ),
              BottomNavigationBarItem(
                icon: _navIcon(Icons.play_circle, 2),
                label: 'Online',
              ),
              BottomNavigationBarItem(
                icon: _navIcon(Icons.layers, 3),
                label: 'Category',
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Custom icon with animated background if selected
  Widget _navIcon(IconData icon, int idx) {
    bool selected = idx == currentIndex;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
      padding: selected ? const EdgeInsets.all(7) : const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: selected ? const Color(0x22EE6019) : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: selected ? 30 : 25,
        color: selected ? const Color(0xFFEE6019) : const Color(0xFF2F2F2F),
      ),
    );
  }
}
