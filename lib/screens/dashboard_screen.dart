import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_admin_panel/consts/constants.dart';
import 'package:grocery_admin_panel/inner_screens/add_products.dart';
import 'package:grocery_admin_panel/responsive.dart';
import 'package:grocery_admin_panel/sevices/utils.dart';
import 'package:grocery_admin_panel/widgets/buttons.dart';
import 'package:grocery_admin_panel/widgets/grid_products.dart';
import 'package:grocery_admin_panel/widgets/header.dart';
import 'package:grocery_admin_panel/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:grocery_admin_panel/controllers/MenuController.dart '
    as menuController;
import '../widgets/order_list.dart';
import 'package:flutter/material.dart' hide Action;

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(
              fct: () {
                context
                    .read<menuController.MenuController>()
                    .controlDashboarkMenu();
              },
              title: "Dashboard",
            ),
            const SizedBox(
              height: 15,
            ),
            TextWidget(
              text: 'Latest Products',
              color: color,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ButtonsWidget(
                    onPressed: () {},
                    text: 'View All',
                    icon: Icons.store,
                    backgroundColor: Colors.blue,
                  ),
                  const Spacer(),
                  ButtonsWidget(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UploadProductForm(),
                        ),
                      );
                    },
                    text: 'Add Product',
                    icon: Icons.add,
                    backgroundColor: Colors.blue,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Responsive(
                        mobile: ProductGridWidget(
                          crossAxisCount: size.width < 650 ? 2 : 4,
                          childAspectRatio:
                              size.width < 650 && size.width > 350 ? 1.1 : 0.8,
                        ),
                        desktop: ProductGridWidget(
                          childAspectRatio: size.width < 1400 ? 0.8 : 1.05,
                        ),
                      ),
                      const OrderList(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
