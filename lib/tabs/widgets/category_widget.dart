import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel category;
  final int index;
  const CategoryWidget(this.category,this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: index%2==0?
        const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomLeft: Radius.circular(20),):
        const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomRight: Radius.circular(20),)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(category.imgUrl,height: 100,),
          Text(category.title,style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white),)
        ],
      ),
    );
  }
}
