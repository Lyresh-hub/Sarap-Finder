// Import Flutter's UI toolkit so we can build the screen
import 'package:flutter/material.dart';

// This is the Terms & Conditions screen
// It shows the app's rules and policies to the user
// StatelessWidget means this screen has no changing data — it just displays text
class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key}); // Constructor — creates the screen

  // build() is called by Flutter to draw everything on screen
  @override
  Widget build(BuildContext context) {

    // Scaffold gives us the basic page structure (background, body, etc.)
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF), // Light off-white background color

      // CustomScrollView lets us mix a sticky app bar and scrollable content together
      body: CustomScrollView(
        slivers: [

          // ── Sticky top bar ───────────────────────────────────────────────
          // SliverAppBar stays pinned at the top while the user scrolls down
          SliverAppBar(
            pinned: true,                        // Keeps the bar visible when scrolling
            backgroundColor: Colors.white,       // White background for the top bar
            elevation: 0,                        // No shadow under the bar
            automaticallyImplyLeading: false,    // We handle the back button ourselves
            expandedHeight: 0,                   // No extra height when expanded

            // The content inside the top bar (back button + title)
            title: Row(
              children: [

                // Back button — tapping it goes back to the previous screen
                GestureDetector(
                  onTap: () => Navigator.pop(context), // Go back when tapped
                  child: Container(
                    width: 36,   // Button width
                    height: 36,  // Button height
                    decoration: const BoxDecoration(
                      color: Color(0xFFEDE9FF), // Light purple background
                      shape: BoxShape.circle,   // Makes it a circle
                    ),
                    // Arrow icon inside the circle button
                    child: const Icon(Icons.arrow_back,
                        color: Color(0xFF6B2D8B), size: 18), // Purple arrow
                  ),
                ),

                const SizedBox(width: 12), // Space between back button and title

                // Page title text
                const Text(
                  'Terms & Conditions',
                  style: TextStyle(
                    fontSize: 17,                    // Text size
                    fontWeight: FontWeight.bold,     // Bold text
                    color: Color(0xFF1A1A2E),        // Dark navy color
                  ),
                ),
              ],
            ),

            // Thin line drawn at the bottom of the app bar as a separator
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1), // Only 1 pixel tall
              child: Container(height: 1, color: const Color(0xFFF0F0F0)), // Light grey line
            ),
          ),

          // ── Scrollable content area ──────────────────────────────────────
          // SliverToBoxAdapter wraps normal widgets so they work inside CustomScrollView
          SliverToBoxAdapter(
            child: Padding(
              // Adds space around all the content (left, top, right, bottom)
              padding: const EdgeInsets.fromLTRB(18, 24, 18, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align everything to the left
                children: [

                  // ── Purple header banner ─────────────────────────────────
                  // This is the decorative card at the top with the app name and date
                  Container(
                    width: double.infinity, // Stretch to full width
                    padding: const EdgeInsets.all(20), // Space inside the card
                    decoration: BoxDecoration(
                      // Purple gradient background going from dark to light purple
                      gradient: const LinearGradient(
                        colors: [Color(0xFF6B2D8B), Color(0xFF9B4DC8)],
                        begin: Alignment.topLeft,     // Gradient starts top-left
                        end: Alignment.bottomRight,   // Gradient ends bottom-right
                      ),
                      borderRadius: BorderRadius.circular(16), // Rounded corners
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Left-align text
                      children: [

                        // App name with clipboard emoji
                        const Text(
                          '📋  SarapFinder',
                          style: TextStyle(
                            fontSize: 20,                    // Large text
                            fontWeight: FontWeight.bold,     // Bold
                            color: Colors.white,             // White text on purple
                          ),
                        ),

                        const SizedBox(height: 4), // Small gap

                        // Subtitle below the app name
                        const Text(
                          'Terms & Conditions',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70, // Slightly transparent white
                          ),
                        ),

                        const SizedBox(height: 12), // Gap before the date badge

                        // Small pill-shaped badge showing when the terms were last updated
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5), // Padding inside the badge
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2), // Semi-transparent white
                            borderRadius: BorderRadius.circular(20),    // Pill shape
                          ),
                          // The last updated date text
                          child: const Text(
                            'Last updated: May 2026',
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24), // Gap between banner and intro text

                  // ── Intro paragraph ──────────────────────────────────────
                  // Short welcome message before the numbered sections
                  const _Intro(
                    text:
                        'Welcome to SarapFinder. By accessing or using our application, you agree to be bound by these Terms and Conditions. Please read them carefully before using the service.',
                  ),

                  const SizedBox(height: 20), // Gap before first section

                  // ── Numbered sections ────────────────────────────────────
                  // Each _Section widget shows one rule/policy with a number, title, and body text

                  // Section 1 — What it means to agree to the terms
                  const _Section(
                    number: '1',
                    title: 'Acceptance of Terms',
                    body:
                        'By downloading, installing, or using SarapFinder, you confirm that you are at least 13 years of age and have the legal capacity to enter into a binding agreement. If you are using the app on behalf of an organization, you represent that you have the authority to bind that organization to these terms.\n\nContinued use of the application after any changes to these terms constitutes your acceptance of the revised terms.',
                  ),

                  // Section 2 — How users are allowed to use the app
                  const _Section(
                    number: '2',
                    title: 'Use of the Service',
                    body:
                        'SarapFinder provides a platform for discovering and ordering food from local stalls and eateries in Olongapo City and surrounding areas. You agree to use the service only for lawful purposes and in a manner that does not infringe the rights of others.\n\nYou must not:\n• Use the service to transmit any unsolicited or unauthorized advertising\n• Attempt to gain unauthorized access to any part of the service\n• Use automated tools to scrape, crawl, or extract data from the platform\n• Impersonate any person or entity or misrepresent your affiliation',
                  ),

                  // Section 3 — Rules about creating and managing an account
                  const _Section(
                    number: '3',
                    title: 'Account Registration',
                    body:
                        'To access certain features, you may be required to create an account. You are responsible for maintaining the confidentiality of your login credentials and for all activities that occur under your account.\n\nYou agree to provide accurate, current, and complete information during registration and to update such information to keep it accurate. SarapFinder reserves the right to suspend or terminate accounts that contain false or misleading information.',
                  ),

                  // Section 4 — How orders and payments work
                  const _Section(
                    number: '4',
                    title: 'Orders and Payments',
                    body:
                        'When you place an order through SarapFinder, you are entering into a transaction directly with the food stall or vendor. SarapFinder acts as an intermediary platform and is not a party to the transaction between you and the vendor.\n\nAll prices displayed are in Philippine Peso (₱) and are inclusive of applicable taxes unless stated otherwise. Payment must be completed at the time of order. SarapFinder is not responsible for pricing errors made by vendors.',
                  ),

                  // Section 5 — When and how users can cancel orders or get refunds
                  const _Section(
                    number: '5',
                    title: 'Cancellations and Refunds',
                    body:
                        'Orders may be cancelled within 5 minutes of placement, provided the vendor has not yet begun preparing the order. Once preparation has started, cancellations are subject to the individual vendor\'s policy.\n\nRefunds for valid cancellations or order errors will be processed within 3–5 business days to the original payment method. SarapFinder reserves the right to deny refund requests that do not meet the eligibility criteria.',
                  ),

                  // Section 6 — How user data is collected and used
                  const _Section(
                    number: '6',
                    title: 'Privacy and Data',
                    body:
                        'Your use of SarapFinder is also governed by our Privacy Policy, which is incorporated into these Terms by reference. We collect and process personal data such as your name, contact information, location, and order history to provide and improve the service.\n\nWe do not sell your personal data to third parties. Data may be shared with vendors solely for the purpose of fulfilling your orders.',
                  ),

                  // Section 7 — Who owns the app's content and design
                  const _Section(
                    number: '7',
                    title: 'Intellectual Property',
                    body:
                        'All content on SarapFinder — including but not limited to logos, graphics, text, and software — is the property of SarapFinder or its licensors and is protected by applicable intellectual property laws.\n\nYou may not reproduce, distribute, modify, or create derivative works from any content on the platform without prior written consent from SarapFinder.',
                  ),

                  // Section 8 — What SarapFinder is not responsible for
                  const _Section(
                    number: '8',
                    title: 'Limitation of Liability',
                    body:
                        'SarapFinder is provided on an "as is" and "as available" basis. We make no warranties, express or implied, regarding the reliability, accuracy, or availability of the service.\n\nTo the fullest extent permitted by law, SarapFinder shall not be liable for any indirect, incidental, special, or consequential damages arising from your use of or inability to use the service, including but not limited to food quality issues, delivery delays, or vendor conduct.',
                  ),

                  // Section 9 — How users will be notified if the terms change
                  const _Section(
                    number: '9',
                    title: 'Changes to Terms',
                    body:
                        'SarapFinder reserves the right to modify these Terms and Conditions at any time. We will notify users of significant changes through the application or via email. Your continued use of the service after such notification constitutes acceptance of the updated terms.',
                  ),

                  // Section 10 — Which country's laws apply to these terms
                  const _Section(
                    number: '10',
                    title: 'Governing Law',
                    body:
                        'These Terms and Conditions shall be governed by and construed in accordance with the laws of the Republic of the Philippines. Any disputes arising from these terms shall be subject to the exclusive jurisdiction of the courts of Olongapo City.',
                  ),

                  // Section 11 — How to reach the SarapFinder team
                  const _Section(
                    number: '11',
                    title: 'Contact Us',
                    body:
                        'If you have any questions or concerns about these Terms and Conditions, please contact us at:\n\n📧  support@sarapfinder.ph\n📍  Olongapo City, Zambales, Philippines',
                  ),

                  const SizedBox(height: 8), // Small gap before the footer

                  // ── Footer acknowledgment box ────────────────────────────
                  // A light purple box at the bottom reminding the user they agreed to the terms
                  Container(
                    width: double.infinity,  // Full width
                    padding: const EdgeInsets.all(16), // Space inside the box
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDE9FF),      // Light purple background
                      borderRadius: BorderRadius.circular(12), // Rounded corners
                    ),
                    // The acknowledgment message
                    child: const Text(
                      'By using SarapFinder, you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions.',
                      textAlign: TextAlign.center, // Center the text
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF6B2D8B),        // Purple text
                        fontWeight: FontWeight.w500,     // Medium weight
                        height: 1.5,                     // Line spacing
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Helper widgets ──────────────────────────────────────────────────────────

// _Intro — shows the short welcome paragraph at the top of the page
// It takes a 'text' string and displays it in a small grey font
class _Intro extends StatelessWidget {
  final String text; // The paragraph text to display
  const _Intro({required this.text}); // Constructor requires the text

  // build() draws the intro text on screen
  @override
  Widget build(BuildContext context) {
    return Text(
      text, // The actual paragraph content
      style: const TextStyle(
        fontSize: 13,            // Small readable size
        color: Colors.black54,   // Grey color (54% opacity black)
        height: 1.7,             // Line spacing — makes it easier to read
      ),
    );
  }
}

// _Section — shows one numbered policy section (e.g. "1. Acceptance of Terms")
// It takes a number, a title, and a body paragraph
class _Section extends StatelessWidget {
  final String number; // The section number shown in the purple circle (e.g. "1")
  final String title;  // The section heading (e.g. "Acceptance of Terms")
  final String body;   // The full paragraph text for this section

  // Constructor — all three fields are required
  const _Section({
    required this.number,
    required this.title,
    required this.body,
  });

  // build() draws the section header row and the content card below it
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20), // Space below each section
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Left-align everything
        children: [

          // ── Section header row (number circle + title) ───────────────────
          Row(
            crossAxisAlignment: CrossAxisAlignment.center, // Vertically center the circle and title
            children: [

              // Purple circle with the section number inside
              Container(
                width: 28,   // Circle width
                height: 28,  // Circle height
                decoration: const BoxDecoration(
                  color: Color(0xFF6B2D8B), // Purple fill
                  shape: BoxShape.circle,   // Makes it a circle
                ),
                child: Center(
                  // The number text centered inside the circle
                  child: Text(
                    number, // e.g. "1", "2", "3"
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White number on purple circle
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 10), // Gap between circle and title

              // Section title — takes up remaining space in the row
              Expanded(
                child: Text(
                  title, // e.g. "Acceptance of Terms"
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A2E), // Dark navy color
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10), // Gap between header and content card

          // ── Content card (white box with the body text) ──────────────────
          Container(
            width: double.infinity, // Full width
            padding: const EdgeInsets.all(14), // Space inside the card
            decoration: BoxDecoration(
              color: Colors.white,                    // White card background
              borderRadius: BorderRadius.circular(12), // Rounded corners
              boxShadow: [
                // Subtle shadow to make the card look slightly raised
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04), // Very light shadow
                  blurRadius: 6,                               // How soft the shadow is
                  offset: const Offset(0, 2),                  // Shadow goes slightly downward
                ),
              ],
            ),
            // The body paragraph text inside the card
            child: Text(
              body, // The full policy text for this section
              style: const TextStyle(
                fontSize: 13,            // Small readable size
                color: Colors.black54,   // Grey text
                height: 1.7,             // Line spacing for readability
              ),
            ),
          ),
        ],
      ),
    );
  }
}
