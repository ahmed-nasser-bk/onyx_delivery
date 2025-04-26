import 'package:flutter/material.dart';

class CustomToggleTabs extends StatefulWidget {
  const CustomToggleTabs({super.key});

  @override
  State<CustomToggleTabs> createState() => _CustomToggleTabsState();
}

class _CustomToggleTabsState extends State<CustomToggleTabs> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final tabWidth = (size.width * 0.8) / 2;

    return Container(
      width: size.width * 0.8,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildTab(title: 'New', index: 0, width: tabWidth),
          _buildTab(title: 'Others', index: 1, width: tabWidth),
        ],
      ),
    );
  }

  Widget _buildTab({required String title, required int index, required double width}) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() => selectedIndex = index);
        // TODO: تنفيذ فلترة أو تغيير المحتوى حسب التبويب المختار
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF004D61) : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black54,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
