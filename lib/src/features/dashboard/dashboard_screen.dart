import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_voltis/src/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  static const String routeName = '/dashboard';
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.currentTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.colors.background,
      appBar: AppBar(
        title: Text("Wardrobe", style: theme.typography.headline),
        backgroundColor: theme.colors.background,
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/menu_bar.svg",
              colorFilter: ColorFilter.mode(theme.colors.text, BlendMode.srcIn),
            ),
            onPressed: () {
              // Navigate to settings screen
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Divider(color: theme.colors.textSecondary),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1506794778169006916-0d0f7a0b3c4e",
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Maddison2525",
                          style: TextStyle(
                            fontFamily: theme.typography.body.fontFamily,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: theme.colors.text,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/rating_icon.svg"),
                            const SizedBox(width: 5),
                            Text(
                              "(300)",
                              style: TextStyle(
                                fontSize: 14,
                                color: theme.colors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "London, United Kingdom",
                          style: TextStyle(
                            fontFamily: theme.typography.body.fontFamily,
                            fontSize: 14,
                            color: theme.colors.text,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(
                            width: 25,
                            "assets/icons/user_icon_one.svg",
                            colorFilter: ColorFilter.mode(
                              theme.colors.text,
                              BlendMode.srcIn,
                            ),
                          ),
                          onPressed: () {
                            // Navigate to notifications screen
                          },
                        ),
                        // const SizedBox(width: 1),
                        IconButton(
                          icon: SvgPicture.asset(
                            width: 25,
                            "assets/icons/reply_arrow.svg",
                            colorFilter: ColorFilter.mode(
                              theme.colors.primary,
                              BlendMode.srcIn,
                            ),
                          ),
                          onPressed: () {
                            // Navigate to settings screen
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                buildInfoItem(
                  context,
                  icon: "assets/icons/ship_icon.svg",
                  text: "Ships in 1 day",
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    buildInfoItem(
                      context,
                      icon: "assets/icons/check_mark_icon.svg",
                      text: "Email Verified",
                    ),
                    const SizedBox(width: 10),
                    buildInfoItem(
                      context,
                      icon: "assets/icons/check_mark_icon.svg",
                      text: "Number Verified",
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                buildInfoItem(
                  context,
                  icon: "assets/icons/last_seen_icon.svg",
                  text: "Last seen moments ago",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInfoItem(
    BuildContext context, {
    required String icon,
    required String text,
  }) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.currentTheme;
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(theme.colors.primary, BlendMode.srcIn),
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: theme.typography.body.fontFamily,
            color: theme.colors.textSecondary,
          ),
        ),
      ],
    );
  }
}
