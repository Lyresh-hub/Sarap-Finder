import 'package:flutter/material.dart';

class FoodPreferencesScreen extends StatefulWidget {
  const FoodPreferencesScreen({super.key});

  @override
  State<FoodPreferencesScreen> createState() => _FoodPreferencesScreenState();
}

class _FoodPreferencesScreenState extends State<FoodPreferencesScreen> {
  // Favorite Cuisines
  final List<String> _allCuisines = [
    'Filipino', 'Japanese', 'Korean', 'Fast Food', 'Italian', 'Mexican'
  ];
  final Set<String> _selectedCuisines = {'Filipino', 'Japanese'};

  // Spice Tolerance
  double _spice = 1; // 0=Mild, 1=Medium, 2=Hot, 3=Extreme
  final List<String> _spiceLabels = ['Mild', 'Medium', 'Hot', 'Extreme'];

  // Budget Range
  int _budget = 1; // 0=$, 1=$$, 2=$$$
  final List<String> _budgetLabels = ['\$', '\$\$', '\$\$\$'];

  // Dietary Setup
  final Map<String, bool> _dietary = {
    'Vegetarian': false,
    'Vegan': false,
    'Halal': true,
    'Low Carb / Keto': false,
  };

  // Food Allergies
  final List<String> _allergies = ['Peanuts', 'Shellfish'];
  final _allergyController = TextEditingController();

  // Current Cravings
  final List<String> _allCravings = [
    'Sweet', 'Savory', 'Cold Drinks', 'Crunchy', 'Comfort Food'
  ];
  final Set<String> _selectedCravings = {'Sweet', 'Savory'};

  // Meal Times
  final Map<String, bool> _mealTimes = {
    'Breakfast': false,
    'Lunch': true,
    'Dinner': true,
    'Late Night Snack': false,
  };
  final Map<String, IconData> _mealIcons = {
    'Breakfast': Icons.wb_twilight_rounded,
    'Lunch': Icons.wb_sunny_outlined,
    'Dinner': Icons.nightlight_round,
    'Late Night Snack': Icons.local_bar_outlined,
  };

  @override
  void dispose() {
    _allergyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),
      bottomNavigationBar: _buildBottomNav(),
      body: SafeArea(
        child: Column(
          children: [
            // App bar
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 14, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Row(
                      children: [
                        Icon(Icons.arrow_back,
                            color: Color(0xFF6B2D8B), size: 20),
                        SizedBox(width: 4),
                        Text('Go Back',
                            style: TextStyle(
                              color: Color(0xFF6B2D8B),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(18, 16, 18, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    const Text(
                      'My Food Preferences',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6B2D8B),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Customize your taste profile to get personalized recommendations tailored just for you.',
                      style: TextStyle(fontSize: 13, color: Colors.black45),
                    ),
                    const SizedBox(height: 20),

                    // 1. Favorite Cuisines
                    _dashedCard(
                      icon: '🍴',
                      title: 'Favorite Cuisines',
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          ..._allCuisines.map((c) => _toggleChip(
                                label: c,
                                selected: _selectedCuisines.contains(c),
                                onTap: () => setState(() {
                                  _selectedCuisines.contains(c)
                                      ? _selectedCuisines.remove(c)
                                      : _selectedCuisines.add(c);
                                }),
                              )),
                          _addMoreChip(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // 2. Spice Tolerance
                    _dashedCard(
                      icon: '🌶️',
                      title: 'Spice Tolerance',
                      child: Column(
                        children: [
                          SliderTheme(
                            data: SliderThemeData(
                              activeTrackColor: const Color(0xFF6B2D8B),
                              inactiveTrackColor:
                                  const Color(0xFF6B2D8B).withValues(alpha: 0.15),
                              thumbColor: const Color(0xFF6B2D8B),
                              overlayColor:
                                  const Color(0xFF6B2D8B).withValues(alpha: 0.1),
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 10),
                              trackHeight: 4,
                            ),
                            child: Slider(
                              value: _spice,
                              min: 0,
                              max: 3,
                              divisions: 3,
                              onChanged: (v) =>
                                  setState(() => _spice = v),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: _spiceLabels
                                  .map((l) => Text(l,
                                      style: const TextStyle(
                                          fontSize: 11,
                                          color: Colors.black45)))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // 3. Budget Range
                    _dashedCard(
                      icon: '💰',
                      title: 'Budget Range',
                      child: Row(
                        children: List.generate(3, (i) {
                          final selected = _budget == i;
                          return Expanded(
                            child: GestureDetector(
                              onTap: () =>
                                  setState(() => _budget = i),
                              child: AnimatedContainer(
                                duration:
                                    const Duration(milliseconds: 180),
                                margin: EdgeInsets.only(
                                    right: i < 2 ? 10 : 0),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10),
                                decoration: BoxDecoration(
                                  color: selected
                                      ? const Color(0xFF6B2D8B)
                                      : Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(10),
                                  border: Border.all(
                                    color: selected
                                        ? const Color(0xFF6B2D8B)
                                        : const Color(0xFFDDDDDD),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    _budgetLabels[i],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                      color: selected
                                          ? Colors.white
                                          : Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // 4. Dietary Setup
                    _dashedCard(
                      icon: '🌿',
                      title: 'Dietary Setup',
                      child: Column(
                        children: _dietary.keys.map((key) {
                          final checked = _dietary[key]!;
                          return GestureDetector(
                            onTap: () => setState(
                                () => _dietary[key] = !checked),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  AnimatedContainer(
                                    duration:
                                        const Duration(milliseconds: 150),
                                    width: 22,
                                    height: 22,
                                    decoration: BoxDecoration(
                                      color: checked
                                          ? const Color(0xFF00C9A7)
                                          : Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(4),
                                      border: Border.all(
                                        color: checked
                                            ? const Color(0xFF00C9A7)
                                            : Colors.black26,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: checked
                                        ? const Icon(Icons.check,
                                            color: Colors.white,
                                            size: 14)
                                        : null,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(key,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87)),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // 5. Food Allergies
                    _dashedCard(
                      icon: '⚠️',
                      title: 'Food Allergies',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: _allergies
                                .map((a) => _allergyChip(a))
                                .toList(),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _allergyController,
                                  style: const TextStyle(fontSize: 13),
                                  decoration: const InputDecoration(
                                    hintText: 'Add allergy...',
                                    hintStyle: TextStyle(
                                        color: Colors.black38,
                                        fontSize: 13),
                                    border: InputBorder.none,
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                  onSubmitted: (v) => _addAllergy(v),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => _addAllergy(
                                    _allergyController.text),
                                child: const Icon(Icons.add,
                                    color: Color(0xFF6B2D8B), size: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // 6. Current Cravings
                    _dashedCard(
                      icon: '😋',
                      title: 'Current Cravings',
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: _allCravings
                            .map((c) => _toggleChip(
                                  label: c,
                                  selected:
                                      _selectedCravings.contains(c),
                                  onTap: () => setState(() {
                                    _selectedCravings.contains(c)
                                        ? _selectedCravings.remove(c)
                                        : _selectedCravings.add(c);
                                  }),
                                ))
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // 7. Preferred Meal Times
                    _dashedCard(
                      icon: '🕐',
                      title: 'Preferred Meal Times',
                      child: Column(
                        children: _mealTimes.keys.map((key) {
                          final checked = _mealTimes[key]!;
                          return GestureDetector(
                            onTap: () => setState(
                                () => _mealTimes[key] = !checked),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Icon(_mealIcons[key],
                                      size: 20,
                                      color: const Color(0xFF6B2D8B)),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(key,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black87)),
                                  ),
                                  AnimatedContainer(
                                    duration:
                                        const Duration(milliseconds: 150),
                                    width: 22,
                                    height: 22,
                                    decoration: BoxDecoration(
                                      color: checked
                                          ? const Color(0xFF00C9A7)
                                          : Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(4),
                                      border: Border.all(
                                        color: checked
                                            ? const Color(0xFF00C9A7)
                                            : Colors.black26,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: checked
                                        ? const Icon(Icons.check,
                                            color: Colors.white,
                                            size: 14)
                                        : null,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Save button
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton.icon(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.save_outlined, size: 18),
                        label: const Text('Save Preferences',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2D1B69),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 0,
                        ),
                      ),
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

  void _addAllergy(String value) {
    final v = value.trim();
    if (v.isNotEmpty && !_allergies.contains(v)) {
      setState(() {
        _allergies.add(v);
        _allergyController.clear();
      });
    }
  }

  // ── Reusable widgets ──────────────────────────────────────────────────────

  Widget _dashedCard({
    required String icon,
    required String title,
    required Widget child,
  }) {
    return CustomPaint(
      painter: _DashedBorderPainter(),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(icon, style: const TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            child,
          ],
        ),
      ),
    );
  }

  Widget _toggleChip({
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color:
              selected ? const Color(0xFF6B2D8B) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected
                ? const Color(0xFF6B2D8B)
                : const Color(0xFFDDDDDD),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: selected ? Colors.white : Colors.black54,
          ),
        ),
      ),
    );
  }

  Widget _addMoreChip() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFDDDDDD)),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add, size: 14, color: Colors.black45),
            SizedBox(width: 4),
            Text('Add More',
                style:
                    TextStyle(fontSize: 13, color: Colors.black45)),
          ],
        ),
      ),
    );
  }

  Widget _allergyChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFFFEEEE),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFE05C5C))),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: () =>
                setState(() => _allergies.remove(label)),
            child: const Icon(Icons.close,
                size: 13, color: Color(0xFFE05C5C)),
          ),
        ],
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
            _navItem(Icons.home_rounded, 'Home'),
            _navItem(Icons.search_rounded, 'Browse'),
            _navItem(Icons.receipt_long_outlined, 'Orders'),
            _navItem(Icons.person_outline_rounded, 'Profile',
                active: true),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, {bool active = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon,
            size: 24,
            color: active
                ? const Color(0xFF6B2D8B)
                : Colors.black38),
        const SizedBox(height: 3),
        Text(label,
            style: TextStyle(
              fontSize: 11,
              fontWeight:
                  active ? FontWeight.w600 : FontWeight.normal,
              color: active
                  ? const Color(0xFF6B2D8B)
                  : Colors.black38,
            )),
      ],
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF6B2D8B).withValues(alpha: 0.25)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    const dash = 6.0;
    const gap = 4.0;

    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        const Radius.circular(14),
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
