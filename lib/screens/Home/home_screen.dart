import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workspace/constants.dart';
import 'package:workspace/models/category.dart';
import 'package:workspace/models/product_model.dart';
import 'package:workspace/screens/Home/Widget/image_slider.dart';
import 'package:workspace/screens/Home/Widget/product_cart.dart';
import 'package:workspace/screens/Home/Widget/search_bar.dart';
import 'Widget/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int selectedCategory = 0;

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;

  List<List<Product>> productsList = [
    all,
    shoes,
    beauty,
    womenFashion,
    jewelry,
    menFashion,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              // fro custom appbar
              CustomAppBar(),
              SizedBox(
                height: 10,
              ),
              // for search bar
              MySearchBAR(),
              SizedBox(
                height: 10,
              ),
              // for image slider
              ImageSlider(
                currentSlide: currentSlider,
                onChange: (value) {
                  setState(() {
                    currentSlider = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              // Category Scrolling
              CategoryList(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Special For You",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),

              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: productsList[selectedCategory].length,
                itemBuilder: (context, index) =>
                    ProductCart(product: productsList[selectedCategory][index]),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.78,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox CategoryList() {
    return SizedBox(
        height: 130,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = index;
                  });
                },
                child: Column(
                  children: [
                    Container(
                      width: 75,
                      height: 85,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: selectedCategory == index
                              ? Colors.blue[200]
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        height: 65,
                        width: 65,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(categoryList[index].image),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(categoryList[index].title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              );
            },
            itemCount: categoryList.length));
  }
}
