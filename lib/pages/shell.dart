import 'package:flutter/material.dart';
import 'home.dart';
import 'service.dart';
import 'chat.dart';
import 'Profile.dart';

class Shell extends StatefulWidget {
  const Shell({super.key});

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  int _index = 0;

  void _go(int i) => setState(() => _index = i);

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      const HomePage(),
      const ServicesPage(),
      const _ScanStub(),
      const ChatPage(),
      const ProfilePage(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF070B16),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(0.55, -0.2),
                    radius: 1.25,
                    colors: [
                      Color(0xFF0D2B57),
                      Color(0xFF08122A),
                      Color(0xFF050814),
                    ],
                  ),
                ),
              ),
            ),
            IndexedStack(index: _index, children: pages),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: _BottomNav(index: _index, onTap: _go),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  final int index;
  final ValueChanged<int> onTap;

  const _BottomNav({required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 18),
      decoration: BoxDecoration(
        color: const Color(0xFF070B16).withOpacity(0.96),
        border: Border(top: BorderSide(color: Colors.white.withOpacity(0.10))),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _NavIcon(
                icon: Icons.home_outlined,
                label: "Нүүр",
                active: index == 0,
                onPressed: () => onTap(0),
              ),
              _NavIcon(
                icon: Icons.grid_view_rounded,
                label: "Үйлчилгээ",
                active: index == 1,
                onPressed: () => onTap(1),
              ),
              const SizedBox(width: 64),
              _NavIcon(
                icon: Icons.chat_bubble_outline,
                label: "Чат",
                active: index == 3,
                onPressed: () => onTap(3),
              ),
              _NavIcon(
                icon: Icons.person_outline,
                label: "Профайл",
                active: index == 4,
                onPressed: () => onTap(4),
              ),
            ],
          ),
          Positioned(
            top: -18,
            child: InkWell(
              borderRadius: BorderRadius.circular(999),
              onTap: () => onTap(2),
              child: Container(
                height: 62,
                width: 62,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF0D4CFF),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0D4CFF).withOpacity(0.35),
                      blurRadius: 18,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.qr_code_scanner,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onPressed;

  const _NavIcon({
    required this.icon,
    required this.label,
    required this.active,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final cIcon = active ? Colors.white : Colors.white70;
    final cText = active ? Colors.white : Colors.white54;

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(icon, color: cIcon),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                color: cText,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScanStub extends StatelessWidget {
  const _ScanStub();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "SCAN (later: student QR)",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
