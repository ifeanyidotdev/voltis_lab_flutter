import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_voltis/src/providers/theme_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = "/product_detail";
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.currentTheme;
    return Scaffold(
      backgroundColor: theme.colors.background,
      // appBar: AppBar(
      //   backgroundColor: theme.colors.background,
      //   leading: IconButton(
      //     onPressed: () {
      //       context.pop();
      //     },
      //     icon: Icon(Icons.arrow_back_ios, color: theme.colors.text),
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 499,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage("assets/images/product_one.png"),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "Asos Edited patchwork quilt jacket in red and cherry",
                  style: TextStyle(
                    color: theme.colors.text,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Asos Original",
                      style: TextStyle(
                        color: theme.colors.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "Size S",
                      style: TextStyle(
                        color: theme.colors.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Text(
                      "New with tags",
                      style: TextStyle(
                        color: theme.colors.textSecondary,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 15),
                    SvgPicture.asset("assets/icons/color_select.svg"),
                  ],
                ),
              ),
              SizedBox(height: 13),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "£300",
                  style: TextStyle(
                    color: theme.colors.textSecondary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Text(
                      "£300",
                      style: TextStyle(
                        color: theme.colors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 3),
                    Text(
                      "including ",
                      style: TextStyle(
                        color: theme.colors.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 3),
                    Text(
                      "Buyers Protection ",
                      style: TextStyle(
                        color: theme.colors.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: theme.colors.primary,
                        decorationThickness: 1,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage(
                        "assets/images/avater_two.png",
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "selena204",
                          style: TextStyle(
                            fontFamily: theme.typography.body.fontFamily,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: theme.colors.text,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/rating_icon.svg"),
                            const SizedBox(width: 5),
                            Text(
                              "(250)",
                              style: TextStyle(
                                fontSize: 14,
                                color: theme.colors.text,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(
                              color: theme.colors.text,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            "Ask a Question",
                            style: TextStyle(
                              color: theme.colors.text,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Divider(color: theme.colors.textSecondary, thickness: 10),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "Description",
                  style: TextStyle(
                    color: theme.colors.textSecondary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "Item has never been worn, it was initially bought as a gift for my sister but it didn’t fit.",
                  style: TextStyle(
                    color: theme.colors.text,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),

              Divider(color: theme.colors.textSecondary, thickness: 2),
              buildDescriptionItem(
                context,
                descriptionText: "Category",
                subText: "Jackets",
              ),
              buildDescriptionItem(
                context,
                descriptionText: "Brand",
                subText: "Asos",
              ),
              buildDescriptionItem(
                context,
                descriptionText: "Size",
                subText: "S",
              ),
              buildDescriptionItem(
                context,
                descriptionText: "Condition",
                subText: "New with tags",
              ),
              buildDescriptionItem(
                context,
                descriptionText: "Views",
                subText: "240",
              ),
              buildDescriptionItem(
                context,
                descriptionText: "Uploaded",
                subText: "1 week ago",
              ),
              buildDescriptionItem(
                context,
                descriptionText: "Postage",
                subText: "from 1.99",
                descriptionColor: theme.colors.textSecondary,
                subColor: theme.colors.primary,
              ),
              Divider(color: theme.colors.textSecondary, thickness: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDescriptionItem(
    BuildContext context, {
    required String descriptionText,
    required String subText,
    Color? descriptionColor,
    Color? subColor,
    double thickness = 1,
  }) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.currentTheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
          child: Row(
            children: [
              Text(
                descriptionText,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: theme.typography.body.fontFamily,
                  color: descriptionColor ?? theme.colors.text,
                ),
              ),
              Spacer(),
              Text(
                subText,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: theme.typography.body.fontFamily,
                  color: subColor ?? theme.colors.text,
                ),
              ),
            ],
          ),
        ),
        Divider(color: theme.colors.textSecondary, thickness: thickness),
      ],
    );
  }
}
