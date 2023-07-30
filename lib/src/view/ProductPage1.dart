
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobilicis/src/Service/ProductService.dart';
import 'package:mobilicis/src/Utils/Consts/consts.dart';
import 'package:mobilicis/src/view/SearchPage.dart';
import 'package:mobilicis/src/Utils/Components/slider.dart';
import 'package:provider/provider.dart';

class ProductPage1 extends StatelessWidget {
  const ProductPage1({super.key});

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;

  final productModel = Provider.of<ProductPageService>(context);
    String formatDateString(String dateStr) {
      DateTime date = DateFormat("dd/MM/yyyy").parse(dateStr);
      String formattedDate = DateFormat("MMMM d'th'").format(date);
      return formattedDate;
    }

    String formatIndianNumberFormat(String numberStr) {
      int number = int.parse(numberStr);
      final format = NumberFormat.decimalPattern("en_IN");
      return format.format(number);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: productModel.onRefresh,
        child: CustomScrollView(
          controller: productModel.controller,
          slivers: [
            SliverAppBar(
              backgroundColor: kAppBarColor,
              expandedHeight: 105,
              pinned: true,
              flexibleSpace: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      children: [
                        InkWell(onTap:(){},child: const Icon(Icons.menu, color: Colors.white,size: 35,)),
                        SizedBox(height: 30,width: 100,child: Image.asset(kLogo)),
                        SizedBox(width: width * 0.32,),
                        const Text('India', style: TextStyle(color: Colors.white,fontSize: 14),),
                        InkWell(onTap:(){},child: kIconLocation),
                        SizedBox(width: width * 0.02,),
                        InkWell(onTap:(){},child: kIconBell),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:5,left: 5,right: 5 ),
                    child: TextFormField(
                      readOnly: true,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const SearchPage()));
                      },
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          CupertinoIcons.search,
                          color: kAppBarColor.withOpacity(0.6),
                        ),
                        prefixIconConstraints: const BoxConstraints(minHeight: 20, minWidth: 30),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Search with make and model...",
                        isCollapsed: true,
                        contentPadding: const EdgeInsets.all(10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 0),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 0),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Buy Top Brands',
                        style: TextStyle(fontSize: 13, color: kGreyText),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {},
                            child: Image.network(
                              kAppleLink,
                              height: 50,
                              width: 80,
                            )),
                        InkWell(
                            onTap: () {},
                            child: Image.network(
                              kSamsungLink,
                              height: 50,
                              width: 80,
                            ),),
                        InkWell(
                            onTap: () {},
                            child: Image.network(
                              kMiLink,
                              height: 50,
                              width: 80,
                            )),
                        InkWell(
                            onTap: () {},
                            child: Image.network(
                              kVivoLink,
                              height: 50,
                              width: 80,
                            ),),
                      ],
                    ),
                  ),
                  const SizedBox(height: 230, child: SliderBar()),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Shop By',
                        style: TextStyle(fontSize: 13, color: kGreyText),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {},
                          child: Image.asset(
                            kBS,
                            height: height * 0.093,
                            width: width * 0.2,
                            fit: BoxFit.fitWidth,
                          )),
                      InkWell(
                          onTap: () {},
                          child: Image.asset(
                            kVD,
                            height: height * 0.093,
                            width: width * 0.2,
                            fit: BoxFit.fitWidth,
                          )),
                      InkWell(
                          onTap: () {},
                          child: Image.asset(
                            kLN,
                            height: height * 0.093,
                            width: width * 0.2,

                          )),
                      InkWell(
                          onTap: () {},
                          child: Image.asset(
                            kPW,
                            height: height * 0.093,
                            width: width * 0.2,
                            fit: BoxFit.fitWidth,
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text('Best Deals Near You  ',style: TextStyle(fontSize: 10,color: kGreyText),),
                            InkWell(
                                onTap: (){},
                                child: const Text('India',style: TextStyle(decoration: TextDecoration.underline,fontSize: 12,color: Colors.yellow ),)),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                                onTap: (){},
                                child: const Text('Filters',style: TextStyle(fontSize: 20,color: kAppBarColor ),)),
                            InkWell(
                                onTap: (){},
                                child: const Icon(Icons.filter_list,color: kAppBarColor,)),
                          ],
                        )

                      ],
                    ),
                  )
                ],
              ),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 330,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) {

                  if(index < productModel.listings.length){
                    var show = productModel.listings[index];
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        height: 400,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                    onTap: () {},
                                    child: Icon(Icons.favorite_border,
                                        color: Colors.pink.shade300)),
                              ],
                            ),
                            Container(
                              height: height * 0.2,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage((show.defaultImage!.fullImage.toString()))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '₹ ${formatIndianNumberFormat('${show.listingNumPrice}')}',
                                        style: const TextStyle(
                                            color: kDarkText,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  SizedBox(height: height * 0.005),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '${show.model}',
                                        style: const TextStyle(
                                          color: kDarkText,
                                          fontSize: 15,
                                        ),
                                      )),
                                  SizedBox(height: height * 0.01),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${show.deviceStorage}',
                                        style: const TextStyle(
                                          color: kDarkText,
                                          fontSize: 11,
                                        ),
                                      ),
                                      Text(
                                        'Condition: ${show.deviceCondition}',
                                        style: const TextStyle(
                                          color: kDarkText,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: height * 0.01),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${show.listingLocation}',
                                        style: const TextStyle(
                                          color: kDarkText,
                                          fontSize: 11,
                                        ),
                                      ),
                                      Text(
                                        formatDateString('${show.listingDate}'),
                                        style: const TextStyle(
                                          color: kDarkText,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }else{
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: CircularProgressIndicator(color: kAppBarColor,)),
                    );
                  }
                },
                childCount: productModel.listings.length +1 ,
              ),
            )
          ],
        ),
      ),
    );
  }
}