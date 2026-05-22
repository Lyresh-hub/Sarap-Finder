import 'package:flutter/material.dart';
import 'stall_menu_screen.dart';

// ─── Category definitions ────────────────────────────────────────────────────

enum DishCategory {
  spicy,
  savory,
  sweet,
  sour,
  grilled,
  fried,
  healthy,
  refreshing,
  smoky,
  creamy,
}

extension DishCategoryX on DishCategory {
  String get label {
    switch (this) {
      case DishCategory.spicy:      return 'Spicy';
      case DishCategory.savory:     return 'Savory';
      case DishCategory.sweet:      return 'Sweet';
      case DishCategory.sour:       return 'Sour';
      case DishCategory.grilled:    return 'Grilled';
      case DishCategory.fried:      return 'Fried';
      case DishCategory.healthy:    return 'Healthy';
      case DishCategory.refreshing: return 'Refreshing';
      case DishCategory.smoky:      return 'Smoky';
      case DishCategory.creamy:     return 'Creamy';
    }
  }

  String get emoji {
    switch (this) {
      case DishCategory.spicy:      return '🌶️';
      case DishCategory.savory:     return '🧂';
      case DishCategory.sweet:      return '🍬';
      case DishCategory.sour:       return '🍋';
      case DishCategory.grilled:    return '🔥';
      case DishCategory.fried:      return '🍳';
      case DishCategory.healthy:    return '🥗';
      case DishCategory.refreshing: return '🧊';
      case DishCategory.smoky:      return '💨';
      case DishCategory.creamy:     return '🥛';
    }
  }

  Color get color {
    switch (this) {
      case DishCategory.spicy:      return const Color(0xFFE05C5C);
      case DishCategory.savory:     return const Color(0xFF8B6914);
      case DishCategory.sweet:      return const Color(0xFFE8A0C8);
      case DishCategory.sour:       return const Color(0xFFB8C400);
      case DishCategory.grilled:    return const Color(0xFFD4651A);
      case DishCategory.fried:      return const Color(0xFFD4A96A);
      case DishCategory.healthy:    return const Color(0xFF52B788);
      case DishCategory.refreshing: return const Color(0xFF0077B6);
      case DishCategory.smoky:      return const Color(0xFF6B6B6B);
      case DishCategory.creamy:     return const Color(0xFFAA6BC8);
    }
  }
}

// ─── Screen ──────────────────────────────────────────────────────────────────

class DishDetailScreen extends StatefulWidget {
  final MenuItemData item;
  final String stallName;

  const DishDetailScreen({
    super.key,
    required this.item,
    required this.stallName,
  });

  @override
  State<DishDetailScreen> createState() => _DishDetailScreenState();
}

class _DishDetailScreenState extends State<DishDetailScreen> {
  int _qty = 1;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // ── Hero image ──────────────────────────────────────────────
              SliverAppBar(
                expandedHeight: 300,
                pinned: false,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      item.imagePath != null
                          ? Image.asset(
                              item.imagePath!,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) =>
                                  _heroFallback(item),
                            )
                          : _heroFallback(item),
                      // gradient overlay
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black38],
                          ),
                        ),
                      ),
                      // back button
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 8),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
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
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ── Content ─────────────────────────────────────────────────
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 20, 18, 120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Stall name
                      Text(
                        widget.stallName,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF00C9A7),
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 4),

                      // Dish name
                      Text(
                        item.name,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A2E),
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Category chips
                      if (item.categories.isNotEmpty) ...[
                        Wrap(
                          spacing: 8,
                          children: item.categories
                              .map((cat) => _CategoryChip(category: cat))
                              .toList(),
                        ),
                        const SizedBox(height: 18),
                      ],

                      // Price
                      Row(
                        children: [
                          Text(
                            item.price,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6B2D8B),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Divider
                      const Divider(color: Color(0xFFEEEEEE), thickness: 1),
                      const SizedBox(height: 16),

                      // About section
                      const Text(
                        'About this dish',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A2E),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.fullDescription,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Divider
                      const Divider(color: Color(0xFFEEEEEE), thickness: 1),
                      const SizedBox(height: 16),

                      // Quantity selector
                      Row(
                        children: [
                          const Text(
                            'Quantity',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A1A2E),
                            ),
                          ),
                          const Spacer(),
                          _QtyButton(
                            icon: Icons.remove,
                            onTap: () {
                              if (_qty > 1) setState(() => _qty--);
                            },
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              '$_qty',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1A1A2E),
                              ),
                            ),
                          ),
                          _QtyButton(
                            icon: Icons.add,
                            onTap: () => setState(() => _qty++),
                            filled: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // ── Add to Order sticky bar ──────────────────────────────────────
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(18, 14, 18, 28),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 16,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () => Navigator.pop(context, _qty),
                child: Container(
                  height: 52,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6B2D8B),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.add_shopping_cart_rounded,
                          color: Colors.white, size: 20),
                      const SizedBox(width: 10),
                      Text(
                        'Add $_qty to Order  •  ₱${widget.item.rawPrice * _qty}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _heroFallback(MenuItemData item) {
    return Container(
      color: item.placeholderColor.withValues(alpha: 0.3),
      child: Center(
        child: Text(item.emoji, style: const TextStyle(fontSize: 100)),
      ),
    );
  }
}

// ─── Small widgets ───────────────────────────────────────────────────────────

class _CategoryChip extends StatelessWidget {
  final DishCategory category;
  const _CategoryChip({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: category.color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: category.color.withValues(alpha: 0.4),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(category.emoji, style: const TextStyle(fontSize: 13)),
          const SizedBox(width: 5),
          Text(
            category.label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: category.color,
            ),
          ),
        ],
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool filled;

  const _QtyButton({
    required this.icon,
    required this.onTap,
    this.filled = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: filled ? const Color(0xFF00C9A7) : Colors.white,
          shape: BoxShape.circle,
          border: filled
              ? null
              : Border.all(color: const Color(0xFF00C9A7), width: 1.5),
        ),
        child: Icon(
          icon,
          size: 18,
          color: filled ? Colors.white : const Color(0xFF00C9A7),
        ),
      ),
    );
  }
}
