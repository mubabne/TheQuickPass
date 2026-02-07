import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _controller = PageController(viewportFraction: 0.92);
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _TopBar(onBell: () {}, onMenu: () {}),
          const SizedBox(height: 18),

          Row(
            children: [
              const Expanded(
                child: Text(
                  "My Student Documents",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white70,
                  size: 18,
                ),
                label: const Text(
                  "Refresh",
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          SizedBox(
            height: 220,
            child: PageView(
              controller: _controller,
              onPageChanged: (i) => setState(() => _pageIndex = i),
              children: const [
                _StudentIdCard(),
                _StudentIdCard(variantTitle: "Library Pass"),
                _StudentIdCard(variantTitle: "Dorm Access"),
              ],
            ),
          ),

          const SizedBox(height: 10),
          _Dots(count: 3, activeIndex: _pageIndex),

          const SizedBox(height: 18),

          const Text(
            "Saved info",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 12),

          _PillAction(
            icon: Icons.help_outline,
            title: "Help / FAQ",
            onTap: () {},
          ),
          _PillAction(
            icon: Icons.chair_alt,
            title: "Library seat bookings",
            onTap: () {},
          ),
          _PillAction(icon: Icons.event, title: "My schedule", onTap: () {}),
          _PillAction(icon: Icons.grade, title: "Grades", onTap: () {}),
          _PillAction(
            icon: Icons.payment,
            title: "Tuition / payments",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  final VoidCallback onBell;
  final VoidCallback onMenu;

  const _TopBar({required this.onBell, required this.onMenu});

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
        IconButton(
          onPressed: onBell,
          icon: const Icon(Icons.notifications_none, color: Colors.white70),
        ),
        IconButton(
          onPressed: onMenu,
          icon: const Icon(Icons.menu, color: Colors.white70),
        ),
      ],
    );
  }
}

class _StudentIdCard extends StatelessWidget {
  final String variantTitle;
  const _StudentIdCard({this.variantTitle = "E-Student ID Card"});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(
            colors: [
              const Color(0xFF0D4CFF).withOpacity(0.35),
              Colors.white.withOpacity(0.06),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: Colors.white.withOpacity(0.12)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.badge, color: Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    variantTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.92),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 92,
                        margin: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 48,
                          color: Colors.black54,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "ID: 2024XXXX",
                                style: TextStyle(fontWeight: FontWeight.w900),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "Last name: —",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "First name: —",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "University: —",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "Program: —",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 62,
                        margin: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.qr_code,
                          size: 34,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int count;
  final int activeIndex;
  const _Dots({required this.count, required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final active = i == activeIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 8,
          width: active ? 22 : 8,
          decoration: BoxDecoration(
            color: active ? Colors.white : Colors.white.withOpacity(0.25),
            borderRadius: BorderRadius.circular(99),
          ),
        );
      }),
    );
  }
}

class _PillAction extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _PillAction({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(28),
        child: Container(
          height: 62,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: Colors.white.withOpacity(0.06),
            border: Border.all(color: Colors.white.withOpacity(0.12)),
          ),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: Colors.white),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.white54),
            ],
          ),
        ),
      ),
    );
  }
}
