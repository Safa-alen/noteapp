import 'package:flutter/material.dart';

import 'package:noteapp/conest.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
    this.onTap,
    this.isloading = false,
  });
  final bool isloading;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(8)),
        child: MaterialButton(
          onPressed: () {},
          child: isloading
              ? Container(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Text(
                  "Add",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}
