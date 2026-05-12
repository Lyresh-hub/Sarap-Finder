import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F9FF),
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, color: Colors.black87, size: 22),
        ),
        title: const Text(
          'Checkout',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),
      bottomNavigationBar: _buildPlaceOrderBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 8, 18, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── DELIVERY DETAILS ──────────────────────────────────────────
            _sectionLabel('DELIVERY DETAILS'),
            const SizedBox(height: 10),
            _buildDeliveryCard(),
            const SizedBox(height: 14),
            _buildArrivalCard(),
            const SizedBox(height: 24),
            // ── ORDER SUMMARY ─────────────────────────────────────────────
            _sectionLabel('ORDER SUMMARY'),
            const SizedBox(height: 10),
            _buildOrderSummary(),
          ],
        ),
      ),
    );
  }

  Widget _sectionLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        color: Colors.black54,
        letterSpacing: 0.9,
      ),
    );
  }

  // ── Delivery map + address card ──────────────────────────────────────────
  Widget _buildDeliveryCard() {
    return Container(
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
          // ── MAP PLACEHOLDER ─────────────────────────────────────────────
          // TODO (Backend Dev): Replace this Container with a real map widget
          // (e.g. GoogleMap / flutter_map) showing the delivery pin location.
          // ────────────────────────────────────────────────────────────────
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(14)),
            child: Container(
              height: 130,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFEDE9D0), Color(0xFFD8E8CC)],
                ),
              ),
              child: Stack(
                children: [
                  CustomPaint(
                    size: const Size(double.infinity, 130),
                    painter: _MapGridPainter(),
                  ),
                  const Center(
                    child: Icon(Icons.location_on_rounded,
                        color: Color(0xFF6B2D8B), size: 42),
                  ),
                  const Positioned(
                    bottom: 6,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        'Map — Backend Integration Point',
                        style: TextStyle(
                          fontSize: 9,
                          color: Color(0xFF6B2D8B),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Delivery to:',
                        style:
                            TextStyle(fontSize: 12, color: Colors.black45)),
                    SizedBox(height: 2),
                    Text(
                      'Olongapo City',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Change',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF6B2D8B),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Expected arrival card ────────────────────────────────────────────────
  Widget _buildArrivalCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF00C9A7),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.25),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.access_time_rounded,
                color: Colors.white, size: 22),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'EXPECTED ARRIVAL',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Colors.white70,
                  letterSpacing: 0.8,
                ),
              ),
              SizedBox(height: 2),
              Text(
                '12:45 PM',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Order summary ────────────────────────────────────────────────────────
  Widget _buildOrderSummary() {
    return Container(
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
          // Items
          _buildOrderItem(qty: 1, name: 'Pork Sisig',
              extras: 'Extra egg, Spicy level 2', price: '₱250'),
          const Divider(height: 1, indent: 14, endIndent: 14,
              color: Color(0xFFF0F0F0)),
          _buildOrderItem(qty: 2, name: 'Garlic Rice',
              extras: '', price: '₱80'),
          const Divider(height: 1, color: Color(0xFFF0F0F0)),
          // Pricing
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
            child: Column(
              children: [
                _buildPriceRow('Subtotal', '₱580'),
                const SizedBox(height: 8),
                _buildPriceRow('Delivery Fee', '₱45', showInfo: true),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Divider(color: Color(0xFFF0F0F0)),
                ),
                Row(
                  children: const [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '₱625',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6B2D8B),
                      ),
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

  Widget _buildOrderItem({
    required int qty,
    required String name,
    required String extras,
    required String price,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: const Color(0xFFF2F2F7),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                '${qty}x',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                if (extras.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    extras,
                    style: const TextStyle(
                        fontSize: 12, color: Colors.black45),
                  ),
                ],
              ],
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value,
      {bool showInfo = false}) {
    return Row(
      children: [
        Text(label,
            style:
                const TextStyle(fontSize: 13, color: Colors.black54)),
        if (showInfo) ...[
          const SizedBox(width: 4),
          const Icon(Icons.info_outline,
              size: 14, color: Colors.black38),
        ],
        const Spacer(),
        Text(value,
            style: const TextStyle(
                fontSize: 13, color: Colors.black87)),
      ],
    );
  }

  Widget _buildPlaceOrderBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 28),
      color: const Color(0xFFF9F9FF),
      child: SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2D1B69),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 0,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Place Order',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

class _MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.brown.withValues(alpha: 0.12)
      ..strokeWidth = 1;

    const step = 20.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    final roadPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.7)
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(0, size.height * 0.4),
        Offset(size.width, size.height * 0.4), roadPaint);
    canvas.drawLine(Offset(size.width * 0.35, 0),
        Offset(size.width * 0.35, size.height), roadPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
