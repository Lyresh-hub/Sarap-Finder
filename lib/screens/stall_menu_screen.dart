import 'package:flutter/material.dart';
import 'checkout_screen.dart';

// ─── Data models ────────────────────────────────────────────────────────────

class MenuItemData {
  final String name, description, price, emoji;
  final int rawPrice;
  final Color placeholderColor;
  final String? imagePath;

  const MenuItemData({
    required this.name,
    required this.description,
    required this.price,
    required this.rawPrice,
    required this.emoji,
    required this.placeholderColor,
    this.imagePath,
  });
}

class StallData {
  final String name;
  final String subtitle;
  final String rating;
  final String deliveryTime;
  final String heroImage;
  final List<Color> heroGradient;
  final String heroEmoji;
  final List<MenuItemData> menuItems;

  const StallData({
    required this.name,
    required this.subtitle,
    required this.rating,
    required this.deliveryTime,
    required this.heroImage,
    required this.heroGradient,
    required this.heroEmoji,
    required this.menuItems,
  });
}

// ─── Store catalogue ─────────────────────────────────────────────────────────

class StallCatalogue {
  static const StallData manilaGrill = StallData(
    name: 'Manila Grill',
    subtitle: 'Authentic Filipino BBQ • Olongapo City',
    rating: '4.8',
    deliveryTime: '20-30 mins',
    heroImage: 'assets/images/manila_grill.png',
    heroGradient: [Color(0xFF8B2500), Color(0xFFD4651A)],
    heroEmoji: '🍖',
    menuItems: [
      MenuItemData(
        name: 'Sizzling Pork Sisig',
        description: 'Crispy chopped pork mask and liver, sizzling hot',
        price: '₱280',
        rawPrice: 280,
        emoji: '🍳',
        placeholderColor: Color(0xFFD4A96A),
        imagePath: 'assets/images/sizzling_pork_sisig.png',
      ),
      MenuItemData(
        name: 'Chicken Inasal Pecho',
        description: 'Grilled chicken breast marinated in citrus and spices',
        price: '₱220',
        rawPrice: 220,
        emoji: '🍗',
        placeholderColor: Color(0xFFE8C56A),
        imagePath: 'assets/images/chicken_inasal_pecho.png',
      ),
      MenuItemData(
        name: 'Inihaw na Liempo',
        description: 'Sweet and savory grilled pork belly served with rice',
        price: '₱250',
        rawPrice: 250,
        emoji: '🥩',
        placeholderColor: Color(0xFFB05E3A),
        imagePath: 'assets/images/inihaw_na_liempo.png',
      ),
      MenuItemData(
        name: 'Pork BBQ Skewers',
        description: 'Classic Filipino-style marinated pork on a stick',
        price: '₱60',
        rawPrice: 60,
        emoji: '🍢',
        placeholderColor: Color(0xFFD4A96A),
      ),
      MenuItemData(
        name: 'Grilled Bangus',
        description: 'Whole milkfish stuffed with tomato and onion',
        price: '₱180',
        rawPrice: 180,
        emoji: '🐟',
        placeholderColor: Color(0xFF7EC8A4),
      ),
      MenuItemData(
        name: 'Lechon Kawali',
        description: 'Deep-fried crispy pork belly, served with liver sauce',
        price: '₱290',
        rawPrice: 290,
        emoji: '🥓',
        placeholderColor: Color(0xFFE8A0A0),
      ),
    ],
  );

  static const StallData lolasEatery = StallData(
    name: "Lola's Eatery",
    subtitle: 'Filipino Home Cooking • Olongapo City',
    rating: '4.5',
    deliveryTime: '15-20 mins',
    heroImage: 'assets/images/lolas_eatery.png',
    heroGradient: [Color(0xFF6B2D8B), Color(0xFFAA6BC8)],
    heroEmoji: '🍲',
    menuItems: [
      MenuItemData(
        name: 'Sinigang na Baboy',
        description: 'Sour tamarind soup with tender pork and vegetables',
        price: '₱180',
        rawPrice: 180,
        emoji: '🍲',
        placeholderColor: Color(0xFF7EC8A4),
        imagePath: 'assets/images/sinigang_na_baboy.jpg',
      ),
      MenuItemData(
        name: 'Adobong Manok',
        description: 'Classic chicken adobo braised in vinegar and soy sauce',
        price: '₱150',
        rawPrice: 150,
        emoji: '🍗',
        placeholderColor: Color(0xFFD4A96A),
        imagePath: 'assets/images/adobong_manok.jpg',
      ),
      MenuItemData(
        name: 'Kare-Kare',
        description: 'Oxtail stew in rich peanut sauce with bagoong',
        price: '₱220',
        rawPrice: 220,
        emoji: '🥜',
        placeholderColor: Color(0xFFE8C56A),
        imagePath: 'assets/images/kare_kare.jpg',
      ),
      MenuItemData(
        name: 'Pinakbet',
        description: 'Mixed vegetables sautéed with shrimp paste',
        price: '₱120',
        rawPrice: 120,
        emoji: '🥦',
        placeholderColor: Color(0xFF8BC48A),
        imagePath: 'assets/images/pinakbet.jpg',
      ),
      MenuItemData(
        name: 'Halo-Halo',
        description: 'Crushed ice dessert with ube, leche flan, and fruits',
        price: '₱95',
        rawPrice: 95,
        emoji: '🍧',
        placeholderColor: Color(0xFFE8A0A0),
        imagePath: 'assets/images/halo_halo.jpg',
      ),
      MenuItemData(
        name: 'Puto at Kutsinta',
        description: 'Steamed rice cakes served with grated coconut',
        price: '₱60',
        rawPrice: 60,
        emoji: '🍮',
        placeholderColor: Color(0xFFD4A96A),
        imagePath: 'assets/images/puto_at_kutsinta.jpg',
      ),
    ],
  );

  static const StallData kantoRefreshments = StallData(
    name: 'Kanto Refreshments',
    subtitle: 'Snacks & Cold Drinks • Olongapo City',
    rating: '4.2',
    deliveryTime: '25-35 mins',
    heroImage: 'assets/images/kanto_refreshments.png',
    heroGradient: [Color(0xFF0077B6), Color(0xFF00C9A7)],
    heroEmoji: '🥤',
    menuItems: [
      MenuItemData(
        name: 'Buko Pandan Shake',
        description: 'Creamy coconut pandan blend with crushed ice',
        price: '₱70',
        rawPrice: 70,
        emoji: '🥤',
        placeholderColor: Color(0xFF8BC48A),
        imagePath: 'assets/images/buko_pandan_shake.jpg',
      ),
      MenuItemData(
        name: "Tita's Mais Con Hielo",
        description: 'Sweet corn with shaved ice and evaporated milk',
        price: '₱85',
        rawPrice: 85,
        emoji: '🌽',
        placeholderColor: Color(0xFF7EC8A4),
        imagePath: 'assets/images/titas_mais_con_hielo.png',
      ),
      MenuItemData(
        name: 'Mango Sago',
        description: 'Fresh mango chunks with sago pearls in coconut milk',
        price: '₱90',
        rawPrice: 90,
        emoji: '🥭',
        placeholderColor: Color(0xFFE8C56A),
        imagePath: 'assets/images/mango_sago.jpg',
      ),
      MenuItemData(
        name: 'Fishball & Kwek-Kwek',
        description: 'Street-style fishballs and quail eggs in batter',
        price: '₱40',
        rawPrice: 40,
        emoji: '🍡',
        placeholderColor: Color(0xFFD4A96A),
        imagePath: 'assets/images/fishball_at_kwekkwek.jpg',
      ),
      MenuItemData(
        name: 'Banana Cue',
        description: 'Caramelized sugar-coated fried banana on a stick',
        price: '₱25',
        rawPrice: 25,
        emoji: '🍌',
        placeholderColor: Color(0xFFE8C56A),
        imagePath: 'assets/images/banana_cue.jpg',
      ),
      MenuItemData(
        name: 'Calamansi Juice',
        description: 'Fresh-squeezed calamansi with honey, served cold',
        price: '₱45',
        rawPrice: 45,
        emoji: '🍋',
        placeholderColor: Color(0xFF8BC48A),
        imagePath: 'assets/images/calamansi_juice.jpg',
      ),
    ],
  );

  static const StallData urbanBites = StallData(
    name: 'Urban Bites & Burgers',
    subtitle: 'American Fast Food • Olongapo City',
    rating: '4.8',
    deliveryTime: '20-30 mins',
    heroImage: 'assets/images/urban_bites.png',
    heroGradient: [Color(0xFF1A1A2E), Color(0xFF4A4A6A)],
    heroEmoji: '🍔',
    menuItems: [
      MenuItemData(
        name: 'Classic Smash Burger',
        description: 'Double smashed beef patty with American cheese and pickles',
        price: '₱280',
        rawPrice: 280,
        emoji: '🍔',
        placeholderColor: Color(0xFFD4A96A),
        imagePath: 'assets/images/classic_smash_burger.jpg',
      ),
      MenuItemData(
        name: 'Crispy Chicken Sandwich',
        description: 'Buttermilk fried chicken with coleslaw and sriracha mayo',
        price: '₱250',
        rawPrice: 250,
        emoji: '🥪',
        placeholderColor: Color(0xFFE8C56A),
        imagePath: 'assets/images/crispy_chicken_sandwich.jpg',
      ),
      MenuItemData(
        name: 'Loaded Fries',
        description: 'Crispy fries topped with cheese sauce, bacon, and jalapeños',
        price: '₱150',
        rawPrice: 150,
        emoji: '🍟',
        placeholderColor: Color(0xFFD4A96A),
        imagePath: 'assets/images/loaded_fries.jpg',
      ),
      MenuItemData(
        name: 'BBQ Bacon Burger',
        description: 'Beef patty with smoky BBQ sauce, bacon, and onion rings',
        price: '₱320',
        rawPrice: 320,
        emoji: '🥓',
        placeholderColor: Color(0xFFB05E3A),
        imagePath: 'assets/images/bbq_bacon_burger.jpg',
      ),
      MenuItemData(
        name: 'Milkshake',
        description: 'Thick and creamy shake in chocolate, vanilla, or strawberry',
        price: '₱120',
        rawPrice: 120,
        emoji: '🥛',
        placeholderColor: Color(0xFFE8A0A0),
        imagePath: 'assets/images/milkshake.jpg',
      ),
      MenuItemData(
        name: 'Onion Rings',
        description: 'Golden battered onion rings with dipping sauce',
        price: '₱90',
        rawPrice: 90,
        emoji: '🧅',
        placeholderColor: Color(0xFFE8C56A),
        imagePath: 'assets/images/onion_rings.jpg',
      ),
    ],
  );

  static const StallData fireGrillBbq = StallData(
    name: 'Fire Grill BBQ',
    subtitle: 'Filipino Grill & BBQ • Olongapo City',
    rating: '4.5',
    deliveryTime: '35-45 mins',
    heroImage: 'assets/images/fire_grill_bbq.png',
    heroGradient: [Color(0xFF8B2500), Color(0xFFFF8C42)],
    heroEmoji: '🔥',
    menuItems: [
      MenuItemData(
        name: 'Pork Belly BBQ',
        description: 'Slow-grilled pork belly glazed with sweet BBQ marinade',
        price: '₱220',
        rawPrice: 220,
        emoji: '🥩',
        placeholderColor: Color(0xFFB05E3A),
        imagePath: 'assets/images/pork_belly_bbq.jpg',
      ),
      MenuItemData(
        name: 'Chicken Inasal',
        description: 'Whole leg quarter grilled over charcoal with annatto oil',
        price: '₱180',
        rawPrice: 180,
        emoji: '🍗',
        placeholderColor: Color(0xFFE8C56A),
        imagePath: 'assets/images/chicken_inasal.jpg',
      ),
      MenuItemData(
        name: 'Inihaw na Pusit',
        description: 'Grilled squid stuffed with tomato and onion',
        price: '₱200',
        rawPrice: 200,
        emoji: '🦑',
        placeholderColor: Color(0xFF7EC8A4),
        imagePath: 'assets/images/inihaw_na_pusit.jpg',
      ),
      MenuItemData(
        name: 'BBQ Pork Ribs',
        description: 'Fall-off-the-bone ribs with smoky house sauce',
        price: '₱380',
        rawPrice: 380,
        emoji: '🍖',
        placeholderColor: Color(0xFFD4A96A),
        imagePath: 'assets/images/bbq_pork_ribs.jpg',
      ),
      MenuItemData(
        name: 'Grilled Corn',
        description: 'Charcoal-grilled corn on the cob with butter and cheese',
        price: '₱55',
        rawPrice: 55,
        emoji: '🌽',
        placeholderColor: Color(0xFF8BC48A),
        imagePath: 'assets/images/grilled_corn.jpg',
      ),
      MenuItemData(
        name: 'Iced Sago Gulaman',
        description: 'Sweet brown sugar drink with sago and gulaman',
        price: '₱40',
        rawPrice: 40,
        emoji: '🧋',
        placeholderColor: Color(0xFFE8A0A0),
        imagePath: 'assets/images/iced_sago_gulaman.jpg',
      ),
    ],
  );

  static const StallData greenLeafCafe = StallData(
    name: 'Green Leaf Cafe',
    subtitle: 'Healthy & Vegan • Olongapo City',
    rating: '4.9',
    deliveryTime: '15-25 mins',
    heroImage: 'assets/images/green_leaf_cafe.png',
    heroGradient: [Color(0xFF2D6A4F), Color(0xFF52B788)],
    heroEmoji: '🥗',
    menuItems: [
      MenuItemData(
        name: 'Avocado Power Bowl',
        description: 'Brown rice, avocado, edamame, cucumber, and sesame dressing',
        price: '₱220',
        rawPrice: 220,
        emoji: '🥑',
        placeholderColor: Color(0xFF8BC48A),
        imagePath: 'assets/images/avocado_power_bowl.jpg',
      ),
      MenuItemData(
        name: 'Garden Fresh Salad',
        description: 'Mixed greens, cherry tomatoes, nuts, and balsamic vinaigrette',
        price: '₱180',
        rawPrice: 180,
        emoji: '🥗',
        placeholderColor: Color(0xFF7EC8A4),
        imagePath: 'assets/images/garden_fresh_salad.jpg',
      ),
      MenuItemData(
        name: 'Veggie Wrap',
        description: 'Whole wheat wrap with hummus, roasted veggies, and feta',
        price: '₱160',
        rawPrice: 160,
        emoji: '🌯',
        placeholderColor: Color(0xFFE8C56A),
        imagePath: 'assets/images/veggie_wrap.jpg',
      ),
      MenuItemData(
        name: 'Acai Smoothie Bowl',
        description: 'Blended acai topped with granola, banana, and berries',
        price: '₱195',
        rawPrice: 195,
        emoji: '🫐',
        placeholderColor: Color(0xFFE8A0A0),
        imagePath: 'assets/images/acai_smoothie_bowl.jpg',
      ),
      MenuItemData(
        name: 'Cold Brew Coffee',
        description: 'Slow-steeped cold brew served over ice with oat milk',
        price: '₱110',
        rawPrice: 110,
        emoji: '☕',
        placeholderColor: Color(0xFFD4A96A),
        imagePath: 'assets/images/cold_brew_coffee.jpg',
      ),
      MenuItemData(
        name: 'Chia Seed Pudding',
        description: 'Overnight chia pudding with mango and coconut cream',
        price: '₱130',
        rawPrice: 130,
        emoji: '🍮',
        placeholderColor: Color(0xFF8BC48A),
        imagePath: 'assets/images/chia_seed_pudding.jpg',
      ),
    ],
  );
}

// ─── Screen ──────────────────────────────────────────────────────────────────

class StallMenuScreen extends StatefulWidget {
  final StallData stall;

  const StallMenuScreen({super.key, required this.stall});

  @override
  State<StallMenuScreen> createState() => _StallMenuScreenState();
}

class _StallMenuScreenState extends State<StallMenuScreen> {
  final Map<String, int> _cart = {};

  int get _totalItems => _cart.values.fold(0, (a, b) => a + b);

  int get _totalPrice {
    int total = 0;
    for (final entry in _cart.entries) {
      final item = widget.stall.menuItems.firstWhere((i) => i.name == entry.key);
      total += item.rawPrice * entry.value;
    }
    return total;
  }

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
                padding: EdgeInsets.fromLTRB(18, 0, 18, _totalItems > 0 ? 90 : 24),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => _buildMenuItem(widget.stall.menuItems[index]),
                    childCount: widget.stall.menuItems.length,
                  ),
                ),
              ),
            ],
          ),
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
            Image.asset(
              widget.stall.heroImage,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              errorBuilder: (_, __, ___) => Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: widget.stall.heroGradient,
                  ),
                ),
                child: Center(
                  child: Text(widget.stall.heroEmoji,
                      style: const TextStyle(fontSize: 80)),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black26],
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                child: Row(
                  children: [
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
                    Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFF00C9A7), width: 2),
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
        Text(
          widget.stall.name,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6B2D8B),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          widget.stall.subtitle,
          style: const TextStyle(fontSize: 13, color: Colors.black54),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.star_rounded, size: 16, color: Color(0xFFFFB800)),
            const SizedBox(width: 4),
            Text(
              widget.stall.rating,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A2E),
              ),
            ),
            const SizedBox(width: 16),
            const Icon(Icons.access_time_rounded, size: 15, color: Colors.black45),
            const SizedBox(width: 4),
            Text(
              widget.stall.deliveryTime,
              style: const TextStyle(fontSize: 13, color: Colors.black54),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMenuItem(MenuItemData item) {
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
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: item.imagePath != null
                ? Image.asset(
                    item.imagePath!,
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _emojiBox(item),
                  )
                : _emojiBox(item),
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
                  style: const TextStyle(fontSize: 12, color: Colors.black45),
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
          qty == 0
              ? GestureDetector(
                  onTap: () => setState(() => _cart[item.name] = 1),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: Color(0xFF00C9A7),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 18),
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
                          border: Border.all(color: const Color(0xFF00C9A7)),
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
                      onTap: () => setState(() => _cart[item.name] = qty + 1),
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: const BoxDecoration(
                          color: Color(0xFF00C9A7),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.add, color: Colors.white, size: 16),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _emojiBox(MenuItemData item) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        color: item.placeholderColor.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(item.emoji, style: const TextStyle(fontSize: 34)),
      ),
    );
  }

  Widget _buildViewCartBar(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const CheckoutScreen())),
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
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
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
