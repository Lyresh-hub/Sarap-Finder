import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'browse_screen.dart';
import 'profile_screen.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  bool _showActive = true;

  static const List<_PastOrder> _pastOrders = [
    _PastOrder(
      restaurant: 'Urban Burger Co.',
      date: 'Oct 24',
      items: 'Double Truffle Burger, Sweet Potato Fries, Craft Cola',
      price: '₱149.00',
      emoji: '🍔',
      placeholderColor: Color(0xFFD4A96A),
    ),
    _PastOrder(
      restaurant: 'Sakura Sushi',
      date: 'Oct 18',
      items: 'Spicy Tuna Roll, Dragon Roll, Miso Soup',
      price: '₱129.00',
      emoji: '🍱',
      placeholderColor: Color(0xFFE8A0A0),
    ),
    _PastOrder(
      restaurant: 'Green Leaf Kitchen',
      date: 'Oct 12',
      items: 'Quinoa Power Bowl, Green Detox Juice',
      price: '₱79.00',
      emoji: '🥗',
      placeholderColor: Color(0xFF7EC8A4),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),
      bottomNavigationBar: _buildBottomNav(context),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            const SizedBox(height: 16),
            _buildTabBar(),
            const SizedBox(height: 4),
            Expanded(
              child: _showActive
                  ? _buildActiveTab()
                  : _buildPastTab(),
            ),
          ],
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
              border: Border.all(
                  color: const Color(0xFF6B2D8B),
                  width: 1.5,
                  style: BorderStyle.solid),
              color: const Color(0xFFEDE9FF),
            ),
            child: const Icon(Icons.person_outline,
                color: Color(0xFF6B2D8B), size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: const Color(0xFFE0E0E0)),
        ),
        child: Row(
          children: [
            _tab('Active Orders', active: _showActive,
                onTap: () => setState(() => _showActive = true)),
            _tab('Past Orders', active: !_showActive,
                onTap: () => setState(() => _showActive = false)),
          ],
        ),
      ),
    );
  }

  Widget _tab(String label,
      {required bool active, required VoidCallback onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.all(3),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: active ? const Color(0xFF6B2D8B) : Colors.transparent,
            borderRadius: BorderRadius.circular(26),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: active ? Colors.white : Colors.black45,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ── ACTIVE ORDERS TAB ──────────────────────────────────────────────────────
  Widget _buildActiveTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          // Current Order
          const Text(
            'Current Order',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A2E),
            ),
          ),
          const SizedBox(height: 12),
          _buildCurrentOrderCard(),
          const SizedBox(height: 28),
          // Past Orders below — scroll down to see
          Row(
            children: [
              const Text(
                'Past Orders',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A2E),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: const [
                    Text(
                      'Filter',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF6B2D8B),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down_rounded,
                        size: 18, color: Color(0xFF6B2D8B)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ..._pastOrders.map(_buildPastOrderCard),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildCurrentOrderCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── LIVE TRACKING PLACEHOLDER ────────────────────────────────
          // TODO (Backend Dev): Replace this Container with your live map
          // widget (e.g. GoogleMap / flutter_map) and connect real-time
          // driver coordinates from your tracking API / WebSocket here.
          // ────────────────────────────────────────────────────────────
          Stack(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(16)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFD8CFFF), Color(0xFFEDE9FF)],
                  ),
                ),
                child: Stack(
                  children: [
                    CustomPaint(
                      size: const Size(double.infinity, 150),
                      painter: _MapGridPainter(),
                    ),
                    const Center(
                      child: Icon(Icons.location_on_rounded,
                          color: Color(0xFF6B2D8B), size: 48),
                    ),
                    const Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          'Live Map — Backend Integration Point',
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF6B2D8B),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFF00C9A7),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        'Live Tracking',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A2E),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Expected Arrival',
                            style: TextStyle(
                                fontSize: 11, color: Colors.black45)),
                        SizedBox(height: 2),
                        Text(
                          '25-35 mins',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1A2E),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text('Order #84729',
                            style: TextStyle(
                                fontSize: 11, color: Colors.black45)),
                        SizedBox(height: 2),
                        Text(
                          'Bistro Bella Vita',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1A1A2E),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildProgressTracker(),
                const SizedBox(height: 16),
                const Divider(color: Color(0xFFEEEEEE)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('3 Items',
                            style: TextStyle(
                                fontSize: 12, color: Colors.black45)),
                        SizedBox(height: 2),
                        Text(
                          '₱649.50',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1A2E),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00C9A7),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        elevation: 0,
                      ),
                      child: const Text('View Details',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600)),
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

  Widget _buildProgressTracker() {
    final steps = ['Preparing', 'On the Way', 'Delivered'];
    final icons = [
      Icons.restaurant_rounded,
      Icons.delivery_dining_rounded,
      Icons.home_rounded,
    ];
    const currentStep = 1;

    return Row(
      children: List.generate(steps.length * 2 - 1, (i) {
        if (i.isOdd) {
          final stepIndex = i ~/ 2;
          final filled = stepIndex < currentStep;
          return Expanded(
            child: Container(
              height: 2,
              color: filled
                  ? const Color(0xFF6B2D8B)
                  : const Color(0xFFDDDDDD),
            ),
          );
        }
        final stepIndex = i ~/ 2;
        final done = stepIndex <= currentStep;
        return Column(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: done
                    ? const Color(0xFF6B2D8B)
                    : const Color(0xFFEEEEEE),
              ),
              child: Icon(icons[stepIndex],
                  size: 16,
                  color: done ? Colors.white : Colors.black38),
            ),
            const SizedBox(height: 4),
            Text(
              steps[stepIndex],
              style: TextStyle(
                fontSize: 10,
                color: done ? const Color(0xFF6B2D8B) : Colors.black38,
                fontWeight:
                    done ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        );
      }),
    );
  }

  // ── PAST ORDERS TAB ────────────────────────────────────────────────────────
  Widget _buildPastTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              const Text(
                'Past Orders',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A2E),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: const [
                    Text(
                      'Filter',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF6B2D8B),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down_rounded,
                        size: 18, color: Color(0xFF6B2D8B)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ..._pastOrders.map(_buildPastOrderCard),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildPastOrderCard(_PastOrder order) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: order.placeholderColor.withValues(alpha: 0.25),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(order.emoji,
                        style: const TextStyle(fontSize: 30)),
                  ),
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
                              order.restaurant,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1A1A2E),
                              ),
                            ),
                          ),
                          Text(order.date,
                              style: const TextStyle(
                                  fontSize: 11, color: Colors.black38)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        order.items,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 12, color: Colors.black45),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0xFFEEEEEE)),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Text(
                  order.price,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A2E),
                  ),
                ),
                const Spacer(),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh_rounded, size: 14),
                  label: const Text('Reorder',
                      style: TextStyle(fontSize: 12)),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF6B2D8B),
                    side: const BorderSide(color: Color(0xFF6B2D8B)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
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
            _navItem(Icons.home_rounded, 'Home', onTap: () =>
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()))),
            _navItem(Icons.search_rounded, 'Browse', onTap: () =>
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const BrowseScreen()))),
            _navItem(Icons.receipt_long_outlined, 'Orders', active: true),
            _navItem(Icons.person_outline_rounded, 'Profile', onTap: () =>
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const ProfileScreen()))),
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
            color: active ? const Color(0xFF6B2D8B) : Colors.black38),
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

// ── BACKEND DEV NOTE ──────────────────────────────────────────────────────────
// _MapGridPainter is a visual stand-in for the live map widget.
// Replace the Container using this painter in _buildCurrentOrderCard()
// with your actual map (e.g. GoogleMap, FlutterMap).
// Connect driver lat/lng from your WebSocket or polling API to update
// the marker position in real time.
// ─────────────────────────────────────────────────────────────────────────────
class _MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF6B2D8B).withValues(alpha: 0.12)
      ..strokeWidth = 1;

    const step = 24.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    final routePaint = Paint()
      ..color = const Color(0xFF6B2D8B).withValues(alpha: 0.5)
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(size.width * 0.15, size.height * 0.8)
      ..cubicTo(
        size.width * 0.2, size.height * 0.4,
        size.width * 0.6, size.height * 0.6,
        size.width * 0.55, size.height * 0.35,
      );
    canvas.drawPath(path, routePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _PastOrder {
  final String restaurant, date, items, price, emoji;
  final Color placeholderColor;
  const _PastOrder({
    required this.restaurant,
    required this.date,
    required this.items,
    required this.price,
    required this.emoji,
    required this.placeholderColor,
  });
}
