import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_learn/controllers/my_drawer_controller.dart';
import 'package:quiz_learn/core/utils/app_colors.dart';

class MenuPage extends GetView<MyDrawerController> {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
        gradient: mainGradient(),
      ),
      child: Theme(
        data: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: onSurfaceText,
            ),
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: BackButton(
                  color: Colors.white,
                  onPressed: () {
                    controller.toggleDrawer();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.3,
                  left: 15.w,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    Obx(
                      () => controller.user.value != null
                          ? CircleAvatar(
                              radius: 40.r,
                              backgroundImage: NetworkImage(
                                controller.user.value!.photoURL ?? '',
                              ),
                            )
                          : CircleAvatar(
                              radius: 40.r,
                              backgroundImage: const NetworkImage(
                                "https://tse2.mm.bing.net/th?id=OIP.e1KNYwnuhNwNj7_-98yTRwHaF7&pid=Api&P=0",
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Obx(
                      () => controller.user.value == null
                          ? const SizedBox()
                          : Text(
                              controller.user.value!.displayName ?? '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    DrawerButton(
                      icon: Icons.web,
                      label: 'Website',
                      onTap: () {
                        controller.website();
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 15.w,
                      ),
                      child: DrawerButton(
                        icon: Icons.email,
                        label: 'Email',
                        onTap: () {
                          controller.email();
                        },
                      ),
                    ),
                    const Spacer(
                      flex: 4,
                    ),
                    DrawerButton(
                      icon: Icons.logout,
                      label: 'Sign Out',
                      onTap: () {
                        controller.signOut();
                      },
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  const DrawerButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(
        icon,
        size: 15.sp,
      ),
      label: Text(
        label,
      ),
      onPressed: onTap,
    );
  }
}
