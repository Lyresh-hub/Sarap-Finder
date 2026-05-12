import 'package:flutter/material.dart';
import 'orders_screen.dart';
import 'stall_menu_screen.dart';
import 'profile_screen.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  int _selectedCraving = 0;

  final List<_Craving> _cravings = const [
    _Craving(emoji: '🍔', label: 'Burgers'),
    _Craving(emoji: '🌶️', label: 'Spicy'),
    _Craving(emoji: '🥤', label: 'Drinks'),
    _Craving(emoji: '🥗', label: 'Healthy'),
    _Craving(emoji: '🍜', label: 'Noodles'),
    _Craving(emoji: '🍰', label: 'Desserts'),
  ];

  final List<_StallCard> _stalls = const [
    _StallCard(
      name: 'Urban Bites & Burgers',
      distance: '1.2 km away',
      cuisine: 'American, Fast Food',
      rating: '4.8',
      time: '20-30 min',
      tag: 'FREE DELIVERY',
      tagColor: Color(0xFF00C9A7),
      placeholderEmoji: '🍔',
      placeholderColor: Color(0xFFD4A96A),
    ),
    _StallCard(
      name: 'Fire Grill BBQ',
      distance: '2.4 km away',
      cuisine: 'Filipino, Grill',
      rating: '4.5',
      time: '35-45 min',
      tag: 'PROMO AVAILABLE',
      tagColor: Color(0xFFFF8C42),
      placeholderEmoji: '🍖',
      placeholderColor: Color(0xFFB05E3A),
    ),
    _StallCard(
      name: 'Green Leaf Cafe',
      distance: '0.8 km away',
      cuisine: 'Healthy, Vegan',
      rating: '4.9',
      time: '15-25 min',
      tag: 'NEW',
      tagColor: Color(0xFF6B2D8B),
      placeholderEmoji: '🥗',
      placeholderColor: Color(0xFF7EC8A4),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),
      bottomNavigationBar: _buildBottomNav(),
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
                    const Text(
                      'Discover',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                    const SizedBox(height: 14),
                    _buildSearchBar(),
                    const SizedBox(height: 22),
                    const Text(
                      'Explore by Cravings',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
              _buildCravingChips(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 22),
                    Row(
                      children: [
                        const Text(
                          'Nearby in Olongapo City',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1A2E),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'See All',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF6B2D8B),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    ..._stalls.map(_buildStallCard),
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

  Widget _buildCravingChips() {
    return SizedBox(
      height: 42,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 18, right: 8),
        itemCount: _cravings.length,
        itemBuilder: (context, index) {
          final selected = _selectedCraving == index;
          return GestureDetector(
            onTap: () => setState(() => _selectedCraving = index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              margin: const EdgeInsets.only(right: 10),
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: selected
                    ? const Color(0xFF6B2D8B)
                    : Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Text(_cravings[index].emoji,
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 6),
                  Text(
                    _cravings[index].label,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: selected ? Colors.white : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStallCard(_StallCard stall) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const StallMenuScreen()),
      ),
      child: Container(
      margin: const EdgeInsets.only(bottom: 16),
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
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: stall.placeholderColor.withValues(alpha: 0.25),
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Center(
                  child: Text(stall.placeholderEmoji,
                      style: const TextStyle(fontSize: 72)),
                ),
              ),
              // Rating badge
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                          size: 13, color: Color(0xFFFFB800)),
                      const SizedBox(width: 3),
                      Text(
                        stall.rating,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A2E),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Info section
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stall.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A2E),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined,
                        size: 13, color: Colors.black38),
                    const SizedBox(width: 3),
                    Text(
                      '${stall.distance} • ${stall.cuisine}',
                      style: const TextStyle(
                          fontSize: 12, color: Colors.black45),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: stall.tagColor.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        stall.tag,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: stall.tagColor,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.access_time_rounded,
                        size: 13, color: Colors.black38),
                    const SizedBox(width: 4),
                    Text(
                      stall.time,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
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

  Widget _buildBottomNav() {
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
            _navItem(Icons.home_rounded, 'Home', active: false),
            _navItem(Icons.search_rounded, 'Browse', active: true),
            _navItem(Icons.receipt_long_outlined, 'Orders', onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const OrdersScreen()));
            }),
            _navItem(Icons.person_outline_rounded, 'Profile', onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()));
            }),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label,
      {bool active = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon,
            size: 24,
            color:
                active ? const Color(0xFF6B2D8B) : Colors.black38),
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

class _Craving {
  final String emoji, label;
  const _Craving({required this.emoji, required this.label});
}

class _StallCard {
  final String name, distance, cuisine, rating, time, tag, placeholderEmoji;
  final Color tagColor, placeholderColor;
  const _StallCard({
    required this.name,
    required this.distance,
    required this.cuisine,
    required this.rating,
    required this.time,
    required this.tag,
    required this.tagColor,
    required this.placeholderEmoji,
    required this.placeholderColor,
  });
}
