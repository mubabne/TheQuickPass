import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          _ServicesTopBar(),
          SizedBox(height: 16),
          _ServicesSearch(),
          SizedBox(height: 16),
          _ServicesHeader(),
          SizedBox(height: 12),
          _ServicePill(
            icon: Icons.description_outlined,
            title: "Татварын үйлчилгээ",
          ),
          _ServicePill(
            icon: Icons.favorite_border,
            title: "Эрүүл мэндийн үйлчилгээ",
          ),
          _ServicePill(icon: Icons.public, title: "Визэнд хэрэгтэй лавлагаа"),
          _ServicePill(
            icon: Icons.directions_car_filled_outlined,
            title: "Жолооч, тээврийн хэрэгсэл",
          ),
          _ServicePill(
            icon: Icons.article_outlined,
            title: "Бичиг баримт захиалга",
          ),
          _ServicePill(
            icon: Icons.badge_outlined,
            title: "Улсын бүртгэлийн үйлчилгээ",
          ),
          _ServicePill(
            icon: Icons.verified_user_outlined,
            title: "Нийгмийн даатгал, халамж",
          ),
          _ServicePill(
            icon: Icons.folder_open_outlined,
            title: "Лавлагаа, тодорхойлолт",
          ),
          _ServicePill(
            icon: Icons.map_outlined,
            title: "Газар, үл хөдлөх хөрөнгө",
          ),
        ],
      ),
    );
  }
}

class _ServicesTopBar extends StatelessWidget {
  const _ServicesTopBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 34,
          width: 34,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08),
            borderRadius: BorderRadius.circular(10),
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
          onPressed: () {},
          icon: const Icon(Icons.notifications_none, color: Colors.white70),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, color: Colors.white70),
        ),
      ],
    );
  }
}

class _ServicesSearch extends StatelessWidget {
  const _ServicesSearch();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.10),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.14)),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.white54),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              "Үйлчилгээ хайх",
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Container(
            height: 42,
            width: 42,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF0D4CFF),
            ),
            child: const Icon(Icons.mic, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _ServicesHeader extends StatelessWidget {
  const _ServicesHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: Text(
            "Үйлчилгээний чиглэл",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Text(
          "Бүгд >",
          style: TextStyle(color: Colors.white60, fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}

class _ServicePill extends StatelessWidget {
  final IconData icon;
  final String title;

  const _ServicePill({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Container(
        height: 64,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white.withOpacity(0.06),
          border: Border.all(color: Colors.white.withOpacity(0.16), width: 1.2),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white70),
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
          ],
        ),
      ),
    );
  }
}
