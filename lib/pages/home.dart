import 'package:flutter/material.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  int _lastNonCenterIndex = 0;

  void _go(int i) {
    setState(() {
      if (i != 2) _lastNonCenterIndex = i;
      _index = i;
    });
  }

  void _toggleCenter() {
    setState(() {
      if (_index == 2) {
        _index = _lastNonCenterIndex;
      } else {
        _lastNonCenterIndex = _index;
        _index = 2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      const _StudentHomeScreen(),
      const _ServicesScreen(),
      const _ScanScreen(),
      const _ChatScreen(),
      const ProfilePage(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF070B16),
      body: SafeArea(
        child: Stack(
          children: [
            // background
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF0B1026),
                      Color(0xFF061023),
                      Color(0xFF050814),
                    ],
                  ),
                ),
              ),
            ),

            // pages (keeps state)
            IndexedStack(index: _index, children: pages),

            // bottom nav
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

/* ==========================
   CURVED BOTTOM NAV + NOTCH
   ========================== */

class _BottomNav extends StatelessWidget {
  final int index;
  final ValueChanged<int> onTap;

  const _BottomNav({required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return SizedBox(
      height: 96 + bottomInset,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          // BAR with OUTWARD bump
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipPath(
              clipper: CenterBumpClipper(),
              child: Container(
                height: 86 + bottomInset,
                padding: EdgeInsets.fromLTRB(18, 14, 18, 12 + bottomInset),
                decoration: BoxDecoration(
                  color: const Color(0xFF070B16),
                  border: Border(
                    top: BorderSide(color: Colors.white.withOpacity(0.10)),
                  ),
                ),
                child: Row(
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

                    // space for center button
                    const SizedBox(width: 74),

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
              ),
            ),
          ),

          // CENTER BUTTON
          Positioned(
            bottom: 34 + bottomInset,
            child: InkWell(
              borderRadius: BorderRadius.circular(999),
              onTap: () => onTap(2),
              child: Container(
                height: 66,
                width: 66,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF0D4CFF),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0D4CFF).withOpacity(0.40),
                      blurRadius: 22,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.qr_code_rounded,
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

class CenterNotchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // tweak these 2 to match your screenshot
    const double notchRadius = 38;
    const double notchDepth = 28;

    final Path path = Path();

    // start top-left
    path.moveTo(0, 0);

    // go near center-left
    path.lineTo(size.width / 2 - notchRadius * 1.7, 0);

    // curve down into notch
    path.quadraticBezierTo(
      size.width / 2 - notchRadius,
      0,
      size.width / 2 - notchRadius,
      notchDepth,
    );

    // rounded bottom notch arc
    path.arcToPoint(
      Offset(size.width / 2 + notchRadius, notchDepth),
      radius: const Radius.circular(notchRadius),
      clockwise: false,
    );

    // curve back up
    path.quadraticBezierTo(
      size.width / 2 + notchRadius,
      0,
      size.width / 2 + notchRadius * 1.7,
      0,
    );

    // finish top-right
    path.lineTo(size.width, 0);

    // down and close
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
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
    final c = active ? Colors.white : Colors.white54;

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(icon, color: c),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                color: active ? Colors.white : Colors.white54,
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

/* ==========================
   PAGES
   ========================== */

class _StudentHomeScreen extends StatelessWidget {
  const _StudentHomeScreen();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 140),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _TopBar(),
          const SizedBox(height: 18),
          _PrimaryButtons(
            leftText: "Register",
            rightText: "Login",
            onLeft: () {},
            onRight: () {},
          ),
          const SizedBox(height: 18),
          _GlassCard(
            child: Column(
              children: [
                const Text(
                  "What do you need today?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 16),
                _SearchBar(
                  hint: "Search: schedule, library, grades…",
                  onChanged: (_) {},
                  onMic: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const _InfoStrip(
            leftTitle: "Today",
            leftValue: "2 classes",
            rightTitle: "Next",
            rightValue: "Algorithms",
          ),
          const SizedBox(height: 18),
          const Text(
            "Quick services",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.15,
            children: const [
              _ServiceTile(icon: Icons.event, title: "Schedule"),
              _ServiceTile(icon: Icons.chair_alt, title: "Library Seats"),
              _ServiceTile(icon: Icons.credit_card, title: "Student Card"),
              _ServiceTile(icon: Icons.campaign, title: "Announcements"),
              _ServiceTile(icon: Icons.grade, title: "Grades"),
              _ServiceTile(icon: Icons.map, title: "Campus Map"),
            ],
          ),
        ],
      ),
    );
  }
}

class _ServicesScreen extends StatelessWidget {
  const _ServicesScreen();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Services page (wire later)",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class _ScanScreen extends StatelessWidget {
  const _ScanScreen();

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

class _ChatScreen extends StatelessWidget {
  const _ChatScreen();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Chat page (wire later)",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

/* ==========================
   UI COMPONENTS
   ========================== */

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(0.12)),
          ),
          child: const Icon(Icons.school, color: Colors.white),
        ),
        const SizedBox(width: 10),
        const Text(
          "UniPortal",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w900,
          ),
        ),
        const Spacer(),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.public, color: Colors.white70, size: 18),
          label: const Text(
            "Guest →",
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class _PrimaryButtons extends StatelessWidget {
  final String leftText;
  final String rightText;
  final VoidCallback onLeft;
  final VoidCallback onRight;

  const _PrimaryButtons({
    required this.leftText,
    required this.rightText,
    required this.onLeft,
    required this.onRight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _PillButton(text: leftText, filled: false, onTap: onLeft),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _PillButton(text: rightText, filled: true, onTap: onRight),
        ),
      ],
    );
  }
}

class _PillButton extends StatelessWidget {
  final String text;
  final bool filled;
  final VoidCallback onTap;

  const _PillButton({
    required this.text,
    required this.filled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bg = filled ? const Color(0xFF0D4CFF) : Colors.transparent;
    final border = filled ? Colors.transparent : Colors.white.withOpacity(0.35);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(28),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: border, width: 1.4),
          boxShadow: filled
              ? [
                  BoxShadow(
                    color: const Color(0xFF0D4CFF).withOpacity(0.25),
                    blurRadius: 18,
                    offset: const Offset(0, 10),
                  ),
                ]
              : null,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}

class _GlassCard extends StatelessWidget {
  final Widget child;
  const _GlassCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.white.withOpacity(0.08),
        border: Border.all(color: Colors.white.withOpacity(0.12)),
      ),
      child: child,
    );
  }
}

class _SearchBar extends StatelessWidget {
  final String hint;
  final ValueChanged<String> onChanged;
  final VoidCallback onMic;

  const _SearchBar({
    required this.hint,
    required this.onChanged,
    required this.onMic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.10),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.white.withOpacity(0.14)),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.white54),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(color: Colors.white54),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: onMic,
            borderRadius: BorderRadius.circular(24),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF0D4CFF).withOpacity(0.9),
              ),
              child: const Icon(Icons.mic, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoStrip extends StatelessWidget {
  final String leftTitle, leftValue, rightTitle, rightValue;

  const _InfoStrip({
    required this.leftTitle,
    required this.leftValue,
    required this.rightTitle,
    required this.rightValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.12),
            Colors.white.withOpacity(0.06),
          ],
        ),
        border: Border.all(color: Colors.white.withOpacity(0.10)),
      ),
      child: Row(
        children: [
          _InfoCell(title: leftTitle, value: leftValue),
          VerticalDivider(color: Colors.white.withOpacity(0.15), thickness: 1),
          _InfoCell(title: rightTitle, value: rightValue),
        ],
      ),
    );
  }
}

class _InfoCell extends StatelessWidget {
  final String title;
  final String value;

  const _InfoCell({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.10),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withOpacity(0.12)),
            ),
            child: const Icon(
              Icons.info_outline,
              color: Colors.white70,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ServiceTile extends StatelessWidget {
  final IconData icon;
  final String title;
  const _ServiceTile({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white.withOpacity(0.06),
        border: Border.all(color: Colors.white.withOpacity(0.10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.10),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.white.withOpacity(0.12)),
            ),
            child: Icon(icon, color: Colors.white),
          ),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "Open →",
            style: TextStyle(
              color: Colors.white.withOpacity(0.55),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class CenterBumpClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final w = size.width;

    const double bumpWidth = 140;
    const double bumpHeight = 34;
    const double curve = 24;

    final center = w / 2;
    final left = center - bumpWidth / 2;
    final right = center + bumpWidth / 2;

    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(left, 0);

    // convex bump up
    path.cubicTo(
      left + curve,
      0,
      center - curve,
      -bumpHeight,
      center,
      -bumpHeight,
    );
    path.cubicTo(center + curve, -bumpHeight, right - curve, 0, right, 0);

    path.lineTo(w, 0);
    path.lineTo(w, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
