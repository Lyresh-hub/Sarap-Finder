import 'package:flutter/material.dart';
import 'checkout_screen.dart';

class StallMenuScreen extends StatefulWidget {
  const StallMenuScreen({super.key});

  @override
  State<StallMenuScreen> createState() => _StallMenuScreenState();
}

class _StallMenuScreenState extends State<StallMenuScreen> {
  final Map<String, int> _cart = {};
  int get _totalItems => _cart.values.fold(0, (a, b) => a + b);
  int get _totalPrice {
    int total = 0;
    for (final entry in _cart.entries) {
      final item = _menuItems.firstWhere((i) => i.name == entry.key);
      total += item.rawPrice * entry.value;
    }
    return total;
  }

  static const List<_MenuItem> _menuItems = [
    _MenuItem(
      name: 'Sizzling Pork Sisig',
      description: 'Crispy chopped pork mask and liver,...',
      price: '₱280',
      rawPrice: 280,
      emoji: '🍳',
      placeholderColor: Color(0xFFD4A96A),
    ),
    _MenuItem(
      name: 'Chicken Inasal Pecho',
      description: 'Grilled chicken breast marinated in...',
      price: '₱220',
      rawPrice: 220,
      emoji: '🍗',
      placeholderColor: Color(0xFFE8C56A),
    ),
    _MenuItem(
      name: 'Inihaw na Liempo',
      description: 'Sweet and savory grilled pork belly served...',
      price: '₱250',
      rawPrice: 250,
      emoji: '🥩',
      placeholderColor: Color(0xFFB05E3A),
    ),
    _MenuItem(
      name: 'Pork BBQ Skewers',
      description: 'Classic Filipino-style marinated pork on a stick',
      price: '₱60',
      rawPrice: 60,
      emoji: '🍢',
      placeholderColor: Color(0xFFD4A96A),
    ),
    _MenuItem(
      name: 'Grilled Bangus',
      description: 'Whole milkfish stuffed with tomato and onion',
      price: '₱180',
      rawPrice: 180,
      emoji: '🐟',
      placeholderColor: Color(0xFF7EC8A4),
    ),
    _MenuItem(
      name: 'Lechon Kawali',
      description: 'Deep-fried crispy pork belly, served with liver sauce',
      price: '₱290',
      rawPrice: 290,
      emoji: '🥓',
      placeholderColor: Color(0xFFE8A0A0),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _buildHeroSliver(context),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 20, 18, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildRestaurantInfo(),
                      const SizedBox(height: 24),
                      const Text(
                        'Popular Items',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A2E),
                        ),
                      ),
                      const SizedBox(height: 14),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(
                    18, 0, 18, _totalItems > 0 ? 90 : 24),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        _buildMenuItem(_menuItems[index]),
                    childCount: _menuItems.length,
                  ),
                ),
              ),
            ],
          ),
          // View Cart sticky bar
          if (_totalItems > 0)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: _buildViewCartBar(context),
            ),
        ],
      ),
    );
  }

  Widget _buildHeroSliver(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 240,
      pinned: false,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Hero image placeholder
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF8B2500), Color(0xFFD4651A)],
                ),
              ),
              child: const Center(
                child: Text('🍖', style: TextStyle(fontSize: 80)),
              ),
            ),
            // Dark overlay at bottom
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black26],
                ),
              ),
            ),
            // App bar row
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 8),
                child: Row(
                  children: [
                    // Back button
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: const BoxDecoration(
                          color: Color(0xFF6B2D8B),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.arrow_back,
                            color: Colors.white, size: 20),
                      ),
                    ),
                    const Spacer(),
                    // Avatar
                    Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: const Color(0xFF00C9A7), width: 2),
                        color: Colors.white,
                      ),
                      child: const Icon(Icons.person_outline,
                          color: Color(0xFF6B2D8B), size: 20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Manila Grill',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6B2D8B),
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Authentic Filipino BBQ • Quezon City',
          style: TextStyle(fontSize: 13, color: Colors.black54),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.star_rounded,
                size: 16, color: Color(0xFFFFB800)),
            const SizedBox(width: 4),
            const Text(
              '4.8',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A2E),
              ),
            ),
            const SizedBox(width: 16),
            const Icon(Icons.access_time_rounded,
                size: 15, color: Colors.black45),
            const SizedBox(width: 4),
            const Text(
              '20-30 mins',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMenuItem(_MenuItem item) {
    final qty = _cart[item.name] ?? 0;
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
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
          // Food image placeholder
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: item.placeholderColor.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child:
                  Text(item.emoji, style: const TextStyle(fontSize: 34)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A2E),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  item.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 12, color: Colors.black45),
                ),
                const SizedBox(height: 6),
                Text(
                  item.price,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A2E),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          // Quantity control
          qty == 0
              ? GestureDetector(
                  onTap: () =>
                      setState(() => _cart[item.name] = 1),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: Color(0xFF00C9A7),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add,
                        color: Colors.white, size: 18),
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () => setState(() {
                        if (qty == 1) {
                          _cart.remove(item.name);
                        } else {
                          _cart[item.name] = qty - 1;
                        }
                      }),
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xFF00C9A7)),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.remove,
                            color: Color(0xFF00C9A7), size: 16),
                      ),
                    ),
                    SizedBox(
                      width: 28,
                      child: Center(
                        child: Text(
                          '$qty',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1A2E),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setState(
                          () => _cart[item.name] = qty + 1),
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: const BoxDecoration(
                          color: Color(0xFF00C9A7),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.add,
                            color: Colors.white, size: 16),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildViewCartBar(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => const CheckoutScreen())),
      child: Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 12,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.shopping_cart_outlined,
              color: Colors.white, size: 20),
          const SizedBox(width: 10),
          const Text(
            'View Cart',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF00C9A7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '$_totalItems item${_totalItems > 1 ? 's' : ''}  •  ₱$_totalPrice',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}

class _MenuItem {
  final String name, description, price, emoji;
  final int rawPrice;
  final Color placeholderColor;
  const _MenuItem({
    required this.name,
    required this.description,
    required this.price,
    required this.rawPrice,
    required this.emoji,
    required this.placeholderColor,
  });
}
