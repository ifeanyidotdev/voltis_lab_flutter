import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_voltis/src/data/models/shopping_model.dart';
import 'package:flutter_test_voltis/src/data/source/local/shoping_data.dart';
import 'package:flutter_test_voltis/src/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = '/dashboard';
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool showContext = false;
  bool boysChecked = false;
  bool girlsChecked = false;

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
      body: SingleChildScrollView(
        child: Column(
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
                        // backgroundImage: NetworkImage(
                        //   "https://images.unsplash.com/photo-1506794778169006916-0d0f7a0b3c4e",
                        // ),
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
                  const SizedBox(height: 15),
                  Text(
                    """Welcome to my wardrobe, all items are shipped 
from a clean, smoke free and reputable home. If you
have any questions, please, reach out, thanks! """,
                    style: TextStyle(
                      fontFamily: theme.typography.body.fontFamily,
                      fontSize: 14,
                      color: theme.colors.text,
                      fontWeight: FontWeight.bold,
                      // letterSpacing: 0.34,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),
            Divider(color: theme.colors.textSecondary),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SizedBox(
                width: 400,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildListingItem(
                        context,
                        textOne: "2000",
                        textTwo: "Listings",
                      ),
                      const SizedBox(width: 35),
                      buildListingItem(
                        context,
                        textOne: "10",
                        textTwo: "Followings",
                      ),
                      const SizedBox(width: 35),
                      buildListingItem(
                        context,
                        textOne: "10000",
                        textTwo: "Followers",
                      ),
                      const SizedBox(width: 35),
                      buildListingItem(
                        context,
                        textOne: "300",
                        textTwo: "Reviews",
                      ),
                      const SizedBox(width: 35),
                      buildListingItem(
                        context,
                        textOne: "300",
                        textTwo: "Sold",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(color: theme.colors.textSecondary),
            GestureDetector(
              onTap: () {
                setState(() {
                  showContext = !showContext;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: theme.typography.body.fontFamily,
                        color: theme.colors.textSecondary,
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      showContext
                          ? "assets/icons/arrow_back.svg"
                          : "assets/icons/arrow_down.svg",
                    ),
                  ],
                ),
              ),
            ),
            Divider(color: theme.colors.textSecondary),
            if (showContext)
              Container(
                // padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    buildCategoryItem(
                      context,
                      icon: "assets/icons/arrow_down.svg",
                      subText: "(724 items)",
                      categoryText: "Men's",
                    ),
                    const SizedBox(height: 10),
                    buildCategoryItem(
                      context,
                      icon: "assets/icons/arrow_down.svg",
                      subText: "(923 items)",
                      categoryText: "Women's",
                    ),
                    const SizedBox(height: 10),
                    buildCategoryItem(
                      context,
                      icon: "assets/icons/arrow_down.svg",
                      subText: "(541 items)",
                      categoryText: "Kids's",
                    ),
                    const SizedBox(height: 10),
                    buildCategoryCheckBoxItem(
                      context,
                      icon: "assets/icons/arrow_down.svg",
                      subText: "(200 items)",
                      categoryText: "Boy's",
                      value: boysChecked,
                      onChanged: (value) {
                        setState(() {
                          boysChecked = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    buildCategoryCheckBoxItem(
                      context,
                      icon: "assets/icons/arrow_down.svg",
                      subText: "(341 items)",
                      categoryText: "Girl's",
                      value: girlsChecked,
                      onChanged: (value) {
                        setState(() {
                          girlsChecked = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Brands",
                    style: TextStyle(color: theme.colors.textSecondary),
                  ),
                  SvgPicture.asset("assets/icons/search_icon.svg"),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SizedBox(
                width: 400,
                height: 40,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildTopBrandCard(context, brandName: "Nike"),
                      SizedBox(width: 20),
                      buildTopBrandCard(context, brandName: "Levis"),
                      SizedBox(width: 20),
                      buildTopBrandCard(context, brandName: "Vintage"),
                      SizedBox(width: 20),
                      buildTopBrandCard(context, brandName: "The North Face"),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildFilterCard(
                    context,
                    icon: "assets/icons/filter_icon.svg",
                    text: "Filter",
                  ),
                  buildFilterCard(
                    context,
                    icon: "assets/icons/sort_icon.svg",
                    text: "Sort",
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.5,
                ),
                itemCount: shopping_data.length,
                itemBuilder: (context, index) {
                  final product = shopping_data[index];
                  return buildProductCard(context, product: product);
                },
              ),
            ),
          ],
        ),
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

  Widget buildListingItem(
    BuildContext context, {
    required String textOne,
    required String textTwo,
  }) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.currentTheme;
    return Column(
      children: [
        Text(
          textOne,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: theme.typography.body.fontFamily,
            color: theme.colors.text,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          textTwo,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: theme.typography.body.fontFamily,
            color: theme.colors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget buildCategoryItem(
    BuildContext context, {
    required String icon,
    required String categoryText,
    required String subText,
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
                categoryText,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: theme.typography.body.fontFamily,
                  color: theme.colors.text,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                subText,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: theme.typography.body.fontFamily,
                  color: theme.colors.textSecondary,
                ),
              ),
              Spacer(),
              SvgPicture.asset(
                icon,
                colorFilter: ColorFilter.mode(
                  theme.colors.textSecondary,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
        Divider(color: theme.colors.textSecondary),
      ],
    );
  }

  Widget buildCategoryCheckBoxItem(
    BuildContext context, {
    required String icon,
    required String categoryText,
    required String subText,
    bool value = false,
    void Function(bool?)? onChanged,
  }) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.currentTheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              Text(
                categoryText,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: theme.typography.body.fontFamily,
                  color: theme.colors.text,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                subText,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: theme.typography.body.fontFamily,
                  color: theme.colors.textSecondary,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    "Select",
                    style: TextStyle(
                      color: value ? theme.colors.primary : theme.colors.text,
                    ),
                  ),
                  SizedBox(width: 5),
                  Checkbox(
                    value: value,
                    onChanged: onChanged,
                    checkColor: theme.colors.surface,
                    activeColor: theme.colors.primary,
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(color: theme.colors.textSecondary),
      ],
    );
  }

  Widget buildTopBrandCard(BuildContext context, {required String brandName}) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.currentTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 223, 101, 230),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        brandName,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: theme.typography.body.fontFamily,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildFilterCard(
    BuildContext context, {
    required String icon,
    required String text,
  }) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.currentTheme;
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: theme.typography.body.fontFamily,
            color: theme.colors.textSecondary,
          ),
        ),
        const SizedBox(width: 9),
        SvgPicture.asset(
          icon,
          width: 20,
          colorFilter: ColorFilter.mode(theme.colors.primary, BlendMode.srcIn),
        ),
      ],
    );
  }

  Widget buildProductCard(
    BuildContext context, {
    required ShoppingModel product,
  }) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.currentTheme;
    return SizedBox(
      // height: 400,
      // width: 180,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 226,
                width: 166,
                decoration: BoxDecoration(
                  color: theme.colors.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7),
                    topRight: Radius.circular(7),
                    bottomLeft: Radius.circular(7),
                    bottomRight: Radius.circular(7),
                  ),
                  image: DecorationImage(image: AssetImage(product.image)),
                ),
              ),
              Positioned(
                top: 10,
                left: 120,
                child: SvgPicture.asset(
                  width: 25,
                  "assets/icons/pin_icon.svg",
                  colorFilter: ColorFilter.mode(
                    theme.colors.text,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 100,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colors.background,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        width: 20,
                        "assets/icons/heart_icon.svg",
                        colorFilter: ColorFilter.mode(
                          theme.colors.text,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        product.likes,
                        style: TextStyle(color: theme.colors.text),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          SizedBox(
            width: 166,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.brandName,
                  style: TextStyle(
                    color: theme.colors.primary,
                    fontWeight: FontWeight.bold,
                    fontFamily: theme.typography.body.fontFamily,
                  ),
                ),
                Text(
                  product.productName,
                  style: TextStyle(
                    color: theme.colors.text,
                    fontWeight: FontWeight.bold,
                    fontFamily: theme.typography.body.fontFamily,
                  ),
                ),
                Text(
                  product.type,
                  style: TextStyle(
                    color: theme.colors.textSecondary,
                    fontWeight: FontWeight.bold,
                    fontFamily: theme.typography.body.fontFamily,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "${product.currency}${product.amount}",

                      style: TextStyle(
                        decoration:
                            product.isDiscounted
                                ? TextDecoration.lineThrough
                                : null,
                        decorationColor: theme.colors.text,
                        color:
                            product.isDiscounted
                                ? theme.colors.textSecondary
                                : theme.colors.text,
                      ),
                    ),
                    SizedBox(width: 8),
                    if (product.isDiscounted) ...[
                      Text(
                        "${product.currency}${product.discountAmount}",
                        style: TextStyle(color: theme.colors.text),
                      ),
                    ],
                    SizedBox(width: 8),
                    if (product.isDiscounted) ...[
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colors.error,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "${product.discountPercentage}% off",
                              style: TextStyle(color: theme.colors.text),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
