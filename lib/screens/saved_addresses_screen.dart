import 'package:flutter/material.dart';

class SavedAddressesScreen extends StatefulWidget {
  const SavedAddressesScreen({super.key});

  @override
  State<SavedAddressesScreen> createState() => _SavedAddressesScreenState();
}

class _SavedAddressesScreenState extends State<SavedAddressesScreen> {
  final List<_Address> _addresses = [
    _Address(
      label: 'Home',
      badge: 'DEFAULT',
      badgeColor: Color(0xFF00A86B),
      icon: Icons.home_rounded,
      address: 'Apt 4B, The Regency\nResidences',
      contact: 'Sarah Jenkins • +1 (555) 019-2834',
      note: '"Please leave at the front desk. The concierge knows."',
      isDefault: true,
    ),
    _Address(
      label: 'Work',
      badge: 'OFFICE',
      badgeColor: Color(0xFF6B2D8B),
      icon: Icons.work_outline_rounded,
      address: 'TechNova Solutions, Floor 14\n890 Innovation Boulevard, Tech Park',
      contact: 'Sarah J. (Reception) • +1 (555) 998-3321',
      note: '"Call upon arrival, building requires badge access for elevators."',
      isDefault: false,
    ),
  ];

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
          'Saved Addresses',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Color(0xFF6B2D8B),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(Icons.add,
                  color: Color(0xFF6B2D8B), size: 26),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: Column(
          children: [
            _buildAddNewCard(),
            const SizedBox(height: 14),
            ..._addresses.asMap().entries.map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: _buildAddressCard(e.value, e.key),
                  ),
                ),
          ],
        ),
      ),
    );
  }

  // ── Add new address card (dashed border) ─────────────────────────────────
  Widget _buildAddNewCard() {
    return GestureDetector(
      onTap: () {},
      child: CustomPaint(
        painter: _DashedBorderPainter(),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 22),
          child: Column(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: const BoxDecoration(
                  color: Color(0xFFEDE9FF),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.location_on_rounded,
                    color: Color(0xFF6B2D8B), size: 26),
              ),
              const SizedBox(height: 10),
              const Text(
                'Add New Address',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6B2D8B),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Save a new location for quick delivery',
                style: TextStyle(fontSize: 12, color: Colors.black45),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Address card ─────────────────────────────────────────────────────────
  Widget _buildAddressCard(_Address addr, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEDE9FF),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(addr.icon,
                      color: const Color(0xFF6B2D8B), size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            addr.label,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: addr.badgeColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (addr.isDefault)
                                  const Icon(Icons.star_rounded,
                                      size: 10, color: Colors.white),
                                if (addr.isDefault)
                                  const SizedBox(width: 3),
                                Text(
                                  addr.badge,
                                  style: const TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        addr.address,
                        style: const TextStyle(
                            fontSize: 13, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Contact
            Row(
              children: [
                const Icon(Icons.person_outline,
                    size: 14, color: Colors.black38),
                const SizedBox(width: 6),
                Text(
                  addr.contact,
                  style: const TextStyle(
                      fontSize: 12, color: Colors.black45),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Note
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F0FF),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.info_outline,
                      size: 14, color: Color(0xFF6B2D8B)),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      addr.note,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Action buttons
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: const [
                      Icon(Icons.edit_outlined,
                          size: 15, color: Color(0xFF6B2D8B)),
                      SizedBox(width: 4),
                      Text(
                        'EDIT',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF6B2D8B),
                          letterSpacing: 0.4,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () => _confirmDelete(index),
                  child: Row(
                    children: const [
                      Icon(Icons.delete_outline,
                          size: 15, color: Color(0xFFE05C5C)),
                      SizedBox(width: 4),
                      Text(
                        'DELETE',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFE05C5C),
                          letterSpacing: 0.4,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                if (!addr.isDefault)
                  GestureDetector(
                    onTap: () => _setDefault(index),
                    child: const Text(
                      'Set Default',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black45,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _setDefault(int index) {
    setState(() {
      for (int i = 0; i < _addresses.length; i++) {
        _addresses[i] = _addresses[i].copyWith(isDefault: i == index);
        if (i == index) {
          _addresses[i] = _addresses[i].copyWith(
              badge: 'DEFAULT', badgeColor: const Color(0xFF00A86B));
        } else {
          _addresses[i] = _addresses[i].copyWith(
              badge: _addresses[i].label == 'Work' ? 'OFFICE' : 'HOME',
              badgeColor: const Color(0xFF6B2D8B));
        }
      }
    });
  }

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)),
        title: const Text('Delete Address',
            style: TextStyle(fontWeight: FontWeight.bold)),
        content: Text(
            'Remove "${_addresses[index].label}" from saved addresses?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel',
                style: TextStyle(color: Colors.black45)),
          ),
          TextButton(
            onPressed: () {
              setState(() => _addresses.removeAt(index));
              Navigator.pop(context);
            },
            child: const Text('Delete',
                style: TextStyle(color: Color(0xFFE05C5C))),
          ),
        ],
      ),
    );
  }
}

// ── Dashed border painter ─────────────────────────────────────────────────────
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

// ── Data model ────────────────────────────────────────────────────────────────
class _Address {
  final String label, badge, address, contact, note;
  final Color badgeColor;
  final IconData icon;
  final bool isDefault;

  const _Address({
    required this.label,
    required this.badge,
    required this.badgeColor,
    required this.icon,
    required this.address,
    required this.contact,
    required this.note,
    required this.isDefault,
  });

  _Address copyWith({
    String? badge,
    Color? badgeColor,
    bool? isDefault,
  }) {
    return _Address(
      label: label,
      badge: badge ?? this.badge,
      badgeColor: badgeColor ?? this.badgeColor,
      icon: icon,
      address: address,
      contact: contact,
      note: note,
      isDefault: isDefault ?? this.isDefault,
    );
  }
}
