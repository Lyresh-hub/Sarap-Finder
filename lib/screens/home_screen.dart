import 'package:flutter/material.dart';
import 'browse_screen.dart';
import 'orders_screen.dart';
import 'stall_menu_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  String get _greeting {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning!';
    if (hour < 17) return 'Good Afternoon!';
    return 'Good Evening!';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),
      bottomNavigationBar: _BottomNav(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppBar(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 14),
                    _buildGreeting(),
                    const SizedBox(height: 16),
                    _buildSearchBar(),
                    const SizedBox(height: 22),
                    _buildSectionHeader('Perfect for Right Now', onSeeAll: () {}),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
              _buildFoodCards(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    _buildNearbyHeader(),
                    const SizedBox(height: 14),
                    _buildStallCard(context,
                      name: "Lola's Eatery",
                      tags: 'Filipino • Desserts • Fast Food',
                      rating: '4.5',
                      distance: '1.2 km away',
                      time: '15-20 mins',
                      timeColor: const Color(0xFFFF8C42),
                    ),
                    const SizedBox(height: 12),
                    _buildStallCard(context,
                      name: 'Kanto Refreshments',
                      tags: 'Snacks • Drinks',
                      rating: '4.2',
                      distance: '2.5 km away',
                      time: '25-35 mins',
                      timeColor: const Color(0xFFE05C5C),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 14, 18, 0),
      child: Row(
        children: [
          // Logo + name
          Image.asset(
            'assets/images/saraplogo.png',
            height: 28,
            errorBuilder: (_, _, _) => const Icon(
              Icons.location_on,
              color: Color(0xFF6B2D8B),
              size: 26,
            ),
          ),
          const SizedBox(width: 6),
          const Text(
            'SarapFinder',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6B2D8B),
            ),
          ),
          const Spacer(),
          // Avatar
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF6B2D8B), width: 1.5),
              color: const Color(0xFFEDE9FF),
            ),
            child: const Icon(Icons.person_outline,
                color: Color(0xFF6B2D8B), size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildGreeting() {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1A1A2E),
          height: 1.3,
        ),
        children: [
          TextSpan(text: '$_greeting\n'),
          TextSpan(text: 'Beat the heat with\n'),
          TextSpan(
            text: 'these cold treats',
            style: TextStyle(color: Color(0xFF6B2D8B)),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 14),
          const Icon(Icons.search, color: Colors.black38, size: 20),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              'Search for food or stalls...',
              style: TextStyle(color: Colors.black38, fontSize: 14),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F2F7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.tune, color: Colors.black54, size: 18),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, {VoidCallback? onSeeAll}) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1A2E),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onSeeAll,
          child: const Text(
            'See all',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF6B2D8B),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFoodCards() {
    final items = [
      _FoodItem(
        name: 'Mang Inasal Halo-Halo',
        desc: 'Classic crushed ice with ube & leche',
        price: '₱120',
        rating: '4.8',
        color: const Color(0xFFD4A96A),
        emoji: '🍧',
      ),
      _FoodItem(
        name: "Tita's Mais Con Hielo",
        desc: 'Sweet corn with shaved ice',
        price: '₱85',
        rating: '4.6',
        color: const Color(0xFF7EC8A4),
        emoji: '🌽',
      ),
      _FoodItem(
        name: 'Buko Pandan Shake',
        desc: 'Creamy coconut pandan blend',
        price: '₱70',
        rating: '4.7',
        color: const Color(0xFF8BC48A),
        emoji: '🥤',
      ),
    ];

    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 18, right: 8),
        itemCount: items.length,
        itemBuilder: (context, index) => _buildFoodCard(items[index]),
      ),
    );
  }

  Widget _buildFoodCard(_FoodItem item) {
    return Container(
      width: 170,
      margin: const EdgeInsets.only(right: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image placeholder
          Stack(
            children: [
              Container(
                height: 110,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: item.color.withValues(alpha: 0.3),
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Center(
                  child: Text(item.emoji,
                      style: const TextStyle(fontSize: 52)),
                ),
              ),
              // Rating badge
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star_rounded,
                          size: 12, color: Color(0xFFFFB800)),
                      const SizedBox(width: 2),
                      Text(item.rating,
                          style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A1A2E))),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A2E),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item.desc,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 11, color: Colors.black45),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      item.price,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 28,
                      height: 28,
                      decoration: const BoxDecoration(
                        color: Color(0xFF00C9A7),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add,
                          color: Colors.white, size: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNearbyHeader() {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1A1A2E),
        ),
        children: [
          TextSpan(text: 'Nearby Stalls in '),
          TextSpan(
            text: 'Olongapo City',
            style: TextStyle(color: Color(0xFF6B2D8B)),
          ),
        ],
      ),
    );
  }

  Widget _buildStallCard(BuildContext context, {
    required String name,
    required String tags,
    required String rating,
    required String distance,
    required String time,
    required Color timeColor,
  }) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const StallMenuScreen()),
      ),
      child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Image placeholder
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: const Color(0xFFEDE9FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.storefront_outlined,
                color: Color(0xFF6B2D8B), size: 34),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A2E),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: timeColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.access_time_rounded,
                              size: 11, color: timeColor),
                          const SizedBox(width: 3),
                          Text(
                            time,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: timeColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  tags,
                  style: const TextStyle(
                      fontSize: 12, color: Colors.black45),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.star_rounded,
                        size: 13, color: Color(0xFFFFB800)),
                    const SizedBox(width: 3),
                    Text(
                      rating,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A2E)),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.circle, size: 4, color: Colors.black26),
                    const SizedBox(width: 8),
                    Text(
                      distance,
                      style: const TextStyle(
                          fontSize: 12, color: Colors.black45),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }
}

class _FoodItem {
  final String name, desc, price, rating, emoji;
  final Color color;
  const _FoodItem({
    required this.name,
    required this.desc,
    required this.price,
    required this.rating,
    required this.color,
    required this.emoji,
  });
}

class _BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(context, Icons.home_rounded, 'Home', active: true),
            _navItem(context, Icons.search_rounded, 'Browse', onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const BrowseScreen()));
            }),
            _navItem(context, Icons.receipt_long_outlined, 'Orders', onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const OrdersScreen()));
            }),
            _navItem(context, Icons.person_outline_rounded, 'Profile', onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()));
            }),
          ],
        ),
      ),
    );
  }

  Widget _navItem(BuildContext context, IconData icon, String label,
      {bool active = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon,
            size: 24,
            color: active
                ? const Color(0xFF6B2D8B)
                : Colors.black38),
        const SizedBox(height: 3),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: active ? FontWeight.w600 : FontWeight.normal,
            color: active ? const Color(0xFF6B2D8B) : Colors.black38,
          ),
        ),
      ],
      ),
    );
  }
}
