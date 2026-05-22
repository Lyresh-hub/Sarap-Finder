import 'package:flutter/material.dart';
import 'checkout_screen.dart';
import 'dish_detail_screen.dart';

// ─── Data models ────────────────────────────────────────────────────────────

class MenuItemData {
  final String name, description, fullDescription, price, emoji;
  final int rawPrice;
  final Color placeholderColor;
  final String? imagePath;
  final List<DishCategory> categories;

  const MenuItemData({
    required this.name,
    required this.description,
    required this.fullDescription,
    required this.price,
    required this.rawPrice,
    required this.emoji,
    required this.placeholderColor,
    this.imagePath,
    this.categories = const [],
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
        fullDescription: 'A beloved Filipino bar chow made from chopped pork face, ears, and liver seasoned with calamansi, chili, and onions. Served on a scorching cast-iron plate, it arrives still sizzling at your table. Best enjoyed with steamed rice and a cold drink.',
        price: '₱280',
        rawPrice: 280,
        emoji: '🍳',
        placeholderColor: Color(0xFFD4A96A),
        imagePath: 'assets/images/sizzling_pork_sisig.png',
        categories: [DishCategory.spicy, DishCategory.savory],
      ),
      MenuItemData(
        name: 'Chicken Inasal Pecho',
        description: 'Grilled chicken breast marinated in citrus and spices',
        fullDescription: 'Originating from Bacolod, this iconic grilled chicken is marinated overnight in a blend of calamansi juice, vinegar, lemongrass, ginger, and annatto oil. The pecho (breast) cut is prized for its tenderness. Served with garlic rice and a side of chicken oil for dipping.',
        price: '₱220',
        rawPrice: 220,
        emoji: '🍗',
        placeholderColor: Color(0xFFE8C56A),
        imagePath: 'assets/images/chicken_inasal_pecho.png',
        categories: [DishCategory.grilled, DishCategory.savory],
      ),
      MenuItemData(
        name: 'Inihaw na Liempo',
        description: 'Sweet and savory grilled pork belly served with rice',
        fullDescription: 'Thick slabs of pork belly marinated in a sweet soy-garlic glaze, then grilled over live charcoal until caramelized and slightly charred. The fat renders beautifully, giving each bite a juicy, smoky finish. Served with spiced vinegar dipping sauce and steamed rice.',
        price: '₱250',
        rawPrice: 250,
        emoji: '🥩',
        placeholderColor: Color(0xFFB05E3A),
        imagePath: 'assets/images/inihaw_na_liempo.png',
        categories: [DishCategory.grilled, DishCategory.smoky],
      ),
      MenuItemData(
        name: 'Pork BBQ Skewers',
        description: 'Classic Filipino-style marinated pork on a stick',
        fullDescription: 'Thin strips of pork shoulder threaded onto bamboo skewers and marinated in a sweet banana ketchup, soy sauce, and garlic mixture. Grilled over charcoal and basted repeatedly for a sticky, caramelized coating. A staple street food that is hard to eat just one of.',
        price: '₱60',
        rawPrice: 60,
        emoji: '🍢',
        placeholderColor: Color(0xFFD4A96A),
        categories: [DishCategory.sweet, DishCategory.smoky],
      ),
      MenuItemData(
        name: 'Grilled Bangus',
        description: 'Whole milkfish stuffed with tomato and onion',
        fullDescription: 'A whole milkfish butterflied and stuffed with a mixture of diced tomatoes, onions, ginger, and salted egg. Wrapped in foil and grilled until the flesh is flaky and the stuffing is fragrant. A classic Filipino comfort dish that is both light and deeply flavorful.',
        price: '₱180',
        rawPrice: 180,
        emoji: '🐟',
        placeholderColor: Color(0xFF7EC8A4),
        categories: [DishCategory.grilled, DishCategory.savory],
      ),
      MenuItemData(
        name: 'Lechon Kawali',
        description: 'Deep-fried crispy pork belly, served with liver sauce',
        fullDescription: 'Pork belly is first boiled until tender with aromatics, then deep-fried in hot oil until the skin blisters into an impossibly crunchy crackling. Served chopped into pieces alongside a rich liver sauce made from pork liver, vinegar, and spices. Pure indulgence.',
        price: '₱290',
        rawPrice: 290,
        emoji: '🥓',
        placeholderColor: Color(0xFFE8A0A0),
        categories: [DishCategory.fried, DishCategory.savory],
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
        fullDescription: 'A quintessential Filipino sour soup made with pork ribs simmered in a tamarind broth until fall-off-the-bone tender. Loaded with kangkong, eggplant, radish, and string beans. The sourness is bright and clean, making it the ultimate comfort food on a rainy day.',
        price: '₱180',
        rawPrice: 180,
        emoji: '🍲',
        placeholderColor: Color(0xFF7EC8A4),
        imagePath: 'assets/images/sinigang_na_baboy.jpg',
        categories: [DishCategory.sour, DishCategory.savory],
      ),
      MenuItemData(
        name: 'Adobong Manok',
        description: 'Classic chicken adobo braised in vinegar and soy sauce',
        fullDescription: 'The unofficial national dish of the Philippines. Chicken pieces are braised low and slow in a mixture of vinegar, soy sauce, garlic, bay leaves, and black peppercorns until the sauce reduces into a glossy, deeply savory coating. Every family has their own version — this one is Lola\'s.',
        price: '₱150',
        rawPrice: 150,
        emoji: '🍗',
        placeholderColor: Color(0xFFD4A96A),
        imagePath: 'assets/images/adobong_manok.jpg',
        categories: [DishCategory.savory, DishCategory.sour],
      ),
      MenuItemData(
        name: 'Kare-Kare',
        description: 'Oxtail stew in rich peanut sauce with bagoong',
        fullDescription: 'A slow-cooked stew of oxtail and tripe in a thick, golden peanut sauce made from ground roasted peanuts and toasted rice. Served with a side of bagoong alamang (fermented shrimp paste) that cuts through the richness. A festive dish that takes hours to perfect.',
        price: '₱220',
        rawPrice: 220,
        emoji: '🥜',
        placeholderColor: Color(0xFFE8C56A),
        imagePath: 'assets/images/kare_kare.jpg',
        categories: [DishCategory.savory, DishCategory.creamy],
      ),
      MenuItemData(
        name: 'Pinakbet',
        description: 'Mixed vegetables sautéed with shrimp paste',
        fullDescription: 'An Ilocano vegetable medley of bitter melon, eggplant, okra, squash, and string beans sautéed with pork and bagoong isda (fermented fish paste). The bagoong gives it a deeply umami, slightly funky depth that makes the vegetables sing. A humble dish with bold flavors.',
        price: '₱120',
        rawPrice: 120,
        emoji: '🥦',
        placeholderColor: Color(0xFF8BC48A),
        imagePath: 'assets/images/pinakbet.jpg',
        categories: [DishCategory.savory, DishCategory.healthy],
      ),
      MenuItemData(
        name: 'Halo-Halo',
        description: 'Crushed ice dessert with ube, leche flan, and fruits',
        fullDescription: 'The Philippines\' most iconic dessert — a towering glass of shaved ice layered with sweetened beans, nata de coco, kaong, banana, jackfruit, leche flan, and a generous scoop of ube ice cream on top. Mix it all together before eating for the full experience.',
        price: '₱95',
        rawPrice: 95,
        emoji: '🍧',
        placeholderColor: Color(0xFFE8A0A0),
        imagePath: 'assets/images/halo_halo.jpg',
        categories: [DishCategory.sweet, DishCategory.refreshing],
      ),
      MenuItemData(
        name: 'Puto at Kutsinta',
        description: 'Steamed rice cakes served with grated coconut',
        fullDescription: 'A classic Filipino merienda pairing. Puto are soft, fluffy steamed rice cakes with a subtle sweetness, while kutsinta are chewy, amber-colored cakes made from rice flour and lye water. Both are topped with freshly grated coconut. Best enjoyed warm with a cup of coffee.',
        price: '₱60',
        rawPrice: 60,
        emoji: '🍮',
        placeholderColor: Color(0xFFD4A96A),
        imagePath: 'assets/images/puto_at_kutsinta.jpg',
        categories: [DishCategory.sweet, DishCategory.creamy],
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
        fullDescription: 'Young coconut strips and pandan-flavored jelly blended with coconut milk and crushed ice into a thick, fragrant shake. The pandan gives it a distinct green hue and a sweet, floral aroma. Topped with extra coconut strips for texture. A tropical refresher like no other.',
        price: '₱70',
        rawPrice: 70,
        emoji: '🥤',
        placeholderColor: Color(0xFF8BC48A),
        imagePath: 'assets/images/buko_pandan_shake.jpg',
        categories: [DishCategory.sweet, DishCategory.refreshing],
      ),
      MenuItemData(
        name: "Tita's Mais Con Hielo",
        description: 'Sweet corn with shaved ice and evaporated milk',
        fullDescription: 'A beloved Filipino cold dessert featuring sweet yellow corn kernels piled over finely shaved ice, drizzled generously with evaporated milk and a touch of sugar. Simple, nostalgic, and incredibly satisfying on a hot day. Tita\'s secret is the extra drizzle of condensed milk.',
        price: '₱85',
        rawPrice: 85,
        emoji: '🌽',
        placeholderColor: Color(0xFF7EC8A4),
        imagePath: 'assets/images/titas_mais_con_hielo.png',
        categories: [DishCategory.sweet, DishCategory.refreshing],
      ),
      MenuItemData(
        name: 'Mango Sago',
        description: 'Fresh mango chunks with sago pearls in coconut milk',
        fullDescription: 'Ripe Philippine mangoes — some of the sweetest in the world — cut into generous chunks and served in a chilled coconut milk base with chewy sago pearls. The natural sweetness of the mango needs no added sugar. A light, elegant dessert that feels like a tropical vacation.',
        price: '₱90',
        rawPrice: 90,
        emoji: '🥭',
        placeholderColor: Color(0xFFE8C56A),
        imagePath: 'assets/images/mango_sago.jpg',
        categories: [DishCategory.sweet, DishCategory.creamy],
      ),
      MenuItemData(
        name: 'Fishball & Kwek-Kwek',
        description: 'Street-style fishballs and quail eggs in batter',
        fullDescription: 'The ultimate Filipino street food combo. Fishballs are made from ground fish paste, skewered, and fried until golden. Kwek-kwek are hard-boiled quail eggs coated in a bright orange batter and deep-fried. Both are served with your choice of sweet, spicy, or vinegar dipping sauce.',
        price: '₱40',
        rawPrice: 40,
        emoji: '🍡',
        placeholderColor: Color(0xFFD4A96A),
        imagePath: 'assets/images/fishball_at_kwekkwek.jpg',
        categories: [DishCategory.fried, DishCategory.savory],
      ),
      MenuItemData(
        name: 'Banana Cue',
        description: 'Caramelized sugar-coated fried banana on a stick',
        fullDescription: 'Saba bananas (a starchy Filipino variety) are skewered on bamboo sticks and deep-fried in oil with brown sugar until a thick, crackling caramel shell forms around each banana. The outside is crunchy and sweet, the inside is soft and warm. A classic afternoon merienda.',
        price: '₱25',
        rawPrice: 25,
        emoji: '🍌',
        placeholderColor: Color(0xFFE8C56A),
        imagePath: 'assets/images/banana_cue.jpg',
        categories: [DishCategory.sweet, DishCategory.fried],
      ),
      MenuItemData(
        name: 'Calamansi Juice',
        description: 'Fresh-squeezed calamansi with honey, served cold',
        fullDescription: 'Freshly squeezed calamansi — the small, intensely citrusy Filipino lime — mixed with honey and chilled water over ice. Calamansi has a unique flavor that sits between lime and mandarin orange. Naturally high in Vitamin C and incredibly refreshing. No artificial flavors, ever.',
        price: '₱45',
        rawPrice: 45,
        emoji: '🍋',
        placeholderColor: Color(0xFF8BC48A),
        imagePath: 'assets/images/calamansi_juice.jpg',
        categories: [DishCategory.sour, DishCategory.refreshing],
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
        fullDescription: 'Two thin beef patties are smashed hard onto a screaming-hot griddle, creating a lacy, crispy crust (the "smash"). Topped with melted American cheese, dill pickles, shredded lettuce, and a house special sauce on a toasted brioche bun. Simple technique, extraordinary results.',
        price: '₱280',
        rawPrice: 280,
        emoji: '🍔',
        placeholderColor: Color(0xFFD4A96A),
        imagePath: 'assets/images/classic_smash_burger.jpg',
        categories: [DishCategory.savory, DishCategory.fried],
      ),
      MenuItemData(
        name: 'Crispy Chicken Sandwich',
        description: 'Buttermilk fried chicken with coleslaw and sriracha mayo',
        fullDescription: 'A thick chicken thigh brined in buttermilk for 24 hours, then dredged in seasoned flour and fried until shatteringly crispy. Served on a toasted potato bun with creamy coleslaw and a generous smear of sriracha mayo. The heat from the sauce balances the richness perfectly.',
        price: '₱250',
        rawPrice: 250,
        emoji: '🥪',
        placeholderColor: Color(0xFFE8C56A),
        imagePath: 'assets/images/crispy_chicken_sandwich.jpg',
        categories: [DishCategory.spicy, DishCategory.fried],
      ),
      MenuItemData(
        name: 'Loaded Fries',
        description: 'Crispy fries topped with cheese sauce, bacon, and jalapeños',
        fullDescription: 'A mountain of double-fried golden fries smothered in a warm, velvety cheddar cheese sauce, topped with crispy bacon bits, pickled jalapeño slices, and a drizzle of sour cream. Designed to be shared — or not. No judgment here.',
        price: '₱150',
        rawPrice: 150,
        emoji: '🍟',
        placeholderColor: Color(0xFFD4A96A),
        imagePath: 'assets/images/loaded_fries.jpg',
        categories: [DishCategory.spicy, DishCategory.savory],
      ),
      MenuItemData(
        name: 'BBQ Bacon Burger',
        description: 'Beef patty with smoky BBQ sauce, bacon, and onion rings',
        fullDescription: 'A thick, hand-formed beef patty grilled to order and stacked with crispy bacon strips, a crunchy onion ring, melted cheddar, and a smoky house-made BBQ sauce. The combination of textures — crunchy, juicy, chewy — makes every bite an event.',
        price: '₱320',
        rawPrice: 320,
        emoji: '🥓',
        placeholderColor: Color(0xFFB05E3A),
        imagePath: 'assets/images/bbq_bacon_burger.jpg',
        categories: [DishCategory.smoky, DishCategory.savory],
      ),
      MenuItemData(
        name: 'Milkshake',
        description: 'Thick and creamy shake in chocolate, vanilla, or strawberry',
        fullDescription: 'Made with real ice cream and whole milk, blended to a thick, spoonable consistency. Choose from classic chocolate, vanilla bean, or fresh strawberry. Each shake is topped with whipped cream and a cherry. So thick the straw stands up on its own.',
        price: '₱120',
        rawPrice: 120,
        emoji: '🥛',
        placeholderColor: Color(0xFFE8A0A0),
        imagePath: 'assets/images/milkshake.jpg',
        categories: [DishCategory.sweet, DishCategory.creamy],
      ),
      MenuItemData(
        name: 'Onion Rings',
        description: 'Golden battered onion rings with dipping sauce',
        fullDescription: 'Thick-cut sweet onion rings dipped in a seasoned beer batter and fried until perfectly golden and crispy. The onion inside steams soft while the outside stays crunchy. Served with a smoky chipotle dipping sauce. The ideal side — or honestly, the main event.',
        price: '₱90',
        rawPrice: 90,
        emoji: '🧅',
        placeholderColor: Color(0xFFE8C56A),
        imagePath: 'assets/images/onion_rings.jpg',
        categories: [DishCategory.fried, DishCategory.savory],
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
        fullDescription: 'Thick-cut pork belly marinated for 12 hours in a blend of soy sauce, calamansi, garlic, and brown sugar, then slow-grilled over charcoal. Basted repeatedly with the marinade as it cooks, building up a sticky, caramelized glaze. Served with garlic fried rice and atchara.',
        price: '₱220',
        rawPrice: 220,
        emoji: '🥩',
        placeholderColor: Color(0xFFB05E3A),
        imagePath: 'assets/images/pork_belly_bbq.jpg',
        categories: [DishCategory.smoky, DishCategory.sweet],
      ),
      MenuItemData(
        name: 'Chicken Inasal',
        description: 'Whole leg quarter grilled over charcoal with annatto oil',
        fullDescription: 'A whole chicken leg quarter marinated in a Bacolod-style blend of lemongrass, ginger, garlic, vinegar, and calamansi. Grilled over live charcoal and brushed with annatto-infused oil for a vibrant color and earthy flavor. Served with unlimited rice and a bowl of chicken oil.',
        price: '₱180',
        rawPrice: 180,
        emoji: '🍗',
        placeholderColor: Color(0xFFE8C56A),
        imagePath: 'assets/images/chicken_inasal.jpg',
        categories: [DishCategory.grilled, DishCategory.savory],
      ),
      MenuItemData(
        name: 'Inihaw na Pusit',
        description: 'Grilled squid stuffed with tomato and onion',
        fullDescription: 'Fresh whole squid cleaned and stuffed with a mixture of diced tomatoes, onions, and ginger, then grilled directly over charcoal. The squid chars slightly on the outside while the stuffing steams inside, creating a juicy, smoky, and slightly briny bite. Served with spiced vinegar.',
        price: '₱200',
        rawPrice: 200,
        emoji: '🦑',
        placeholderColor: Color(0xFF7EC8A4),
        imagePath: 'assets/images/inihaw_na_pusit.jpg',
        categories: [DishCategory.grilled, DishCategory.smoky],
      ),
      MenuItemData(
        name: 'BBQ Pork Ribs',
        description: 'Fall-off-the-bone ribs with smoky house sauce',
        fullDescription: 'A full rack of pork ribs slow-cooked for 4 hours until the meat pulls cleanly from the bone, then finished on the grill with a house-made BBQ sauce of tamarind, brown sugar, and smoked paprika. The result is tender, smoky, and deeply satisfying. Served with grilled corn.',
        price: '₱380',
        rawPrice: 380,
        emoji: '🍖',
        placeholderColor: Color(0xFFD4A96A),
        imagePath: 'assets/images/bbq_pork_ribs.jpg',
        categories: [DishCategory.smoky, DishCategory.savory],
      ),
      MenuItemData(
        name: 'Grilled Corn',
        description: 'Charcoal-grilled corn on the cob with butter and cheese',
        fullDescription: 'Sweet yellow corn grilled directly over charcoal until the kernels are slightly charred and smoky. Slathered with butter and rolled in grated cheese while still hot. A simple but irresistible side that pairs perfectly with anything off the grill.',
        price: '₱55',
        rawPrice: 55,
        emoji: '🌽',
        placeholderColor: Color(0xFF8BC48A),
        imagePath: 'assets/images/grilled_corn.jpg',
        categories: [DishCategory.grilled, DishCategory.sweet],
      ),
      MenuItemData(
        name: 'Iced Sago Gulaman',
        description: 'Sweet brown sugar drink with sago and gulaman',
        fullDescription: 'A classic Filipino cold drink made from brewed brown sugar syrup poured over ice, with chewy sago pearls and cubes of firm gulaman (agar jelly). The brown sugar gives it a deep, molasses-like sweetness. Refreshing, filling, and the perfect companion to any grilled dish.',
        price: '₱40',
        rawPrice: 40,
        emoji: '🧋',
        placeholderColor: Color(0xFFE8A0A0),
        imagePath: 'assets/images/iced_sago_gulaman.jpg',
        categories: [DishCategory.sweet, DishCategory.refreshing],
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
        fullDescription: 'A nourishing bowl built on a base of warm brown rice, topped with sliced ripe avocado, shelled edamame, thinly sliced cucumber, shredded purple cabbage, and toasted sesame seeds. Finished with a drizzle of house-made sesame-ginger dressing. Packed with healthy fats and plant protein.',
        price: '₱220',
        rawPrice: 220,
        emoji: '🥑',
        placeholderColor: Color(0xFF8BC48A),
        imagePath: 'assets/images/avocado_power_bowl.jpg',
        categories: [DishCategory.healthy, DishCategory.savory],
      ),
      MenuItemData(
        name: 'Garden Fresh Salad',
        description: 'Mixed greens, cherry tomatoes, nuts, and balsamic vinaigrette',
        fullDescription: 'A vibrant mix of arugula, baby spinach, and romaine tossed with halved cherry tomatoes, candied walnuts, shaved parmesan, and house-made balsamic vinaigrette. Light yet satisfying, with a balance of peppery, sweet, and tangy notes in every forkful.',
        price: '₱180',
        rawPrice: 180,
        emoji: '🥗',
        placeholderColor: Color(0xFF7EC8A4),
        imagePath: 'assets/images/garden_fresh_salad.jpg',
        categories: [DishCategory.healthy, DishCategory.sour],
      ),
      MenuItemData(
        name: 'Veggie Wrap',
        description: 'Whole wheat wrap with hummus, roasted veggies, and feta',
        fullDescription: 'A whole wheat tortilla spread with creamy hummus and filled with oven-roasted bell peppers, zucchini, red onion, and cherry tomatoes. Topped with crumbled feta cheese and fresh baby spinach. Rolled tight and served with a side of tzatziki. Filling, flavorful, and fully plant-based.',
        price: '₱160',
        rawPrice: 160,
        emoji: '🌯',
        placeholderColor: Color(0xFFE8C56A),
        imagePath: 'assets/images/veggie_wrap.jpg',
        categories: [DishCategory.healthy, DishCategory.savory],
      ),
      MenuItemData(
        name: 'Acai Smoothie Bowl',
        description: 'Blended acai topped with granola, banana, and berries',
        fullDescription: 'Frozen acai blended with banana and a splash of almond milk into a thick, spoonable base. Topped with house-made granola, fresh banana slices, blueberries, strawberries, and a drizzle of raw honey. Rich in antioxidants and naturally energizing — the perfect breakfast or post-workout meal.',
        price: '₱195',
        rawPrice: 195,
        emoji: '🫐',
        placeholderColor: Color(0xFFE8A0A0),
        imagePath: 'assets/images/acai_smoothie_bowl.jpg',
        categories: [DishCategory.healthy, DishCategory.sweet],
      ),
      MenuItemData(
        name: 'Cold Brew Coffee',
        description: 'Slow-steeped cold brew served over ice with oat milk',
        fullDescription: 'Single-origin coffee grounds steeped in cold filtered water for 18 hours, producing a smooth, low-acid concentrate. Served over ice with a generous pour of creamy oat milk. No bitterness, no heat — just a clean, rich coffee flavor that keeps you going all afternoon.',
        price: '₱110',
        rawPrice: 110,
        emoji: '☕',
        placeholderColor: Color(0xFFD4A96A),
        imagePath: 'assets/images/cold_brew_coffee.jpg',
        categories: [DishCategory.refreshing, DishCategory.creamy],
      ),
      MenuItemData(
        name: 'Chia Seed Pudding',
        description: 'Overnight chia pudding with mango and coconut cream',
        fullDescription: 'Chia seeds soaked overnight in coconut milk until they swell into a thick, tapioca-like pudding. Layered with fresh mango puree and topped with diced ripe mango and a drizzle of coconut cream. Naturally sweet, high in fiber and omega-3s, and completely guilt-free.',
        price: '₱130',
        rawPrice: 130,
        emoji: '🍮',
        placeholderColor: Color(0xFF8BC48A),
        imagePath: 'assets/images/chia_seed_pudding.jpg',
        categories: [DishCategory.healthy, DishCategory.creamy],
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
    return GestureDetector(
      onTap: () async {
        final result = await Navigator.push<int>(
          context,
          MaterialPageRoute(
            builder: (_) => DishDetailScreen(
              item: item,
              stallName: widget.stall.name,
            ),
          ),
        );
        if (result != null && result > 0) {
          setState(() => _cart[item.name] = (_cart[item.name] ?? 0) + result);
        }
      },
      child: Container(
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
