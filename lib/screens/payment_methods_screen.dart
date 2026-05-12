import 'package:flutter/material.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  int _selectedWallet = 0; // 0 = GCash, 1 = Maya
  bool _codSelected = false;

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
          child: const Icon(Icons.arrow_back,
              color: Color(0xFF6B2D8B), size: 22),
        ),
        title: const Text(
          'Payment Methods',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Color(0xFF6B2D8B),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Your Wallets ──────────────────────────────────────────────
            _sectionLabel('Your Wallets'),
            const SizedBox(height: 10),
            _buildWalletCard(
              index: 0,
              label: 'G',
              labelColor: Colors.white,
              avatarColor: const Color(0xFF007AFF),
              name: 'GCash',
              number: '0917 •••• 1234',
            ),
            const SizedBox(height: 10),
            _buildWalletCard(
              index: 1,
              label: 'M',
              labelColor: Colors.white,
              avatarColor: const Color(0xFF00B44F),
              name: 'Maya',
              number: '0917 •••• 5678',
            ),
            const SizedBox(height: 24),
            // ── Credit / Debit Cards ──────────────────────────────────────
            _sectionLabel('Credit / Debit Cards'),
            const SizedBox(height: 10),
            _buildCardRow(
              brandWidget: _visaLogo(),
              name: 'BPI Debit',
              number: '•••• 4242',
            ),
            const Divider(height: 1, indent: 56, color: Color(0xFFF0F0F0)),
            _buildCardRow(
              brandWidget: _mastercardLogo(),
              name: 'BDO Credit',
              number: '•••• 5555',
            ),
            const SizedBox(height: 24),
            // ── Other Methods ─────────────────────────────────────────────
            _sectionLabel('Other Methods'),
            const SizedBox(height: 10),
            _buildCodRow(),
            const SizedBox(height: 24),
            // ── Add New ───────────────────────────────────────────────────
            _buildAddNewButton(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _sectionLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      ),
    );
  }

  // ── Wallet card ───────────────────────────────────────────────────────────
  Widget _buildWalletCard({
    required int index,
    required String label,
    required Color labelColor,
    required Color avatarColor,
    required String name,
    required String number,
  }) {
    final selected = _selectedWallet == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedWallet = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected
                ? const Color(0xFF6B2D8B).withValues(alpha: 0.2)
                : Colors.transparent,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: avatarColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    color: labelColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      )),
                  const SizedBox(height: 2),
                  Text(number,
                      style: const TextStyle(
                          fontSize: 12, color: Colors.black45)),
                ],
              ),
            ),
            selected
                ? Container(
                    width: 28,
                    height: 28,
                    decoration: const BoxDecoration(
                      color: Color(0xFF00A86B),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.check,
                        color: Colors.white, size: 16),
                  )
                : const Icon(Icons.more_vert,
                    color: Colors.black38, size: 20),
          ],
        ),
      ),
    );
  }

  // ── Card row (in a shared white container) ────────────────────────────────
  Widget _buildCardRow({
    required Widget brandWidget,
    required String name,
    required String number,
  }) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      child: Row(
        children: [
          brandWidget,
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    )),
                const SizedBox(height: 2),
                Text(number,
                    style: const TextStyle(
                        fontSize: 12, color: Colors.black45)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.edit_outlined,
                color: Color(0xFF6B2D8B), size: 20),
          ),
        ],
      ),
    );
  }

  // ── Cash on Delivery ──────────────────────────────────────────────────────
  Widget _buildCodRow() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFFEDE9FF),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.receipt_long_outlined,
                color: Color(0xFF6B2D8B), size: 20),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Cash on Delivery',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    )),
                SizedBox(height: 2),
                Text('Pay when your order arrives',
                    style:
                        TextStyle(fontSize: 12, color: Colors.black45)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => setState(() => _codSelected = !_codSelected),
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: _codSelected
                      ? const Color(0xFF6B2D8B)
                      : Colors.black26,
                  width: 2,
                ),
                color: _codSelected
                    ? const Color(0xFF6B2D8B)
                    : Colors.transparent,
              ),
              child: _codSelected
                  ? const Icon(Icons.check,
                      color: Colors.white, size: 14)
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  // ── Add new button (dashed border) ────────────────────────────────────────
  Widget _buildAddNewButton() {
    return GestureDetector(
      onTap: () {},
      child: CustomPaint(
        painter: _DashedBorderPainter(),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.add, color: Color(0xFF6B2D8B), size: 18),
              SizedBox(width: 8),
              Text(
                'Add New Payment Method',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6B2D8B),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Card brand logos ──────────────────────────────────────────────────────
  Widget _visaLogo() {
    return Container(
      width: 48,
      height: 30,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1F71),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Center(
        child: Text(
          'VISA',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w900,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }

  Widget _mastercardLogo() {
    return SizedBox(
      width: 48,
      height: 30,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 4,
            child: Container(
              width: 22,
              height: 22,
              decoration: const BoxDecoration(
                color: Color(0xFFEB001B),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: 4,
            child: Container(
              width: 22,
              height: 22,
              decoration: const BoxDecoration(
                color: Color(0xFFF79E1B),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF6B2D8B).withValues(alpha: 0.3)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    const dash = 6.0;
    const gap = 4.0;
    const r = 14.0;

    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        const Radius.circular(r),
      ));

    for (final metric in path.computeMetrics()) {
      double d = 0;
      while (d < metric.length) {
        final t1 = metric.getTangentForOffset(d);
        final t2 = metric.getTangentForOffset(d + dash);
        if (t1 != null && t2 != null) {
          canvas.drawLine(t1.position, t2.position, paint);
        }
        d += dash + gap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
