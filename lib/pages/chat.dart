import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 120),
      child: Column(
        children: [
          const _ChatTopBar(),
          const SizedBox(height: 26),

          // Illustration placeholder (swap to an asset later)
          Container(
            height: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              color: Colors.white.withOpacity(0.04),
              border: Border.all(color: Colors.white.withOpacity(0.10)),
            ),
            child: const Center(
              child: Icon(
                Icons.chat_bubble_outline,
                color: Colors.white24,
                size: 120,
              ),
            ),
          ),

          const SizedBox(height: 26),
          const Text(
            "UniPortal үндсэн чат",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Сургуулийн тусламж, лавлагаа, мэдээлэл\nба автомат туслагчийг эндээс ашиглана.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(0.70),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 22),
          Text(
            "Үйлчилгээний нөхцөл",
            style: TextStyle(
              color: Colors.white.withOpacity(0.75),
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 14),

          SizedBox(
            width: double.infinity,
            height: 58,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0D4CFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Эхлэх",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatTopBar extends StatelessWidget {
  const _ChatTopBar();

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
