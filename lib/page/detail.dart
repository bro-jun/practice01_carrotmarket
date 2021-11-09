import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DetailContentView extends StatefulWidget {
  Map<String, String> data;
  DetailContentView({Key? key, required this.data}) : super(key: key);

  @override
  _DetailContentViewState createState() => _DetailContentViewState();
}

class _DetailContentViewState extends State<DetailContentView> {
  late Size size;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }

  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back, color: Colors.white),
      ),
      actions: [
        IconButton(
            onPressed: () {}, icon: Icon(Icons.share, color: Colors.white)),
        IconButton(
            onPressed: () {}, icon: Icon(Icons.more_vert, color: Colors.white)),
      ],
    );
  }

  Widget _bodyWidget() {
    return Container(
      child: Column(
        children: [
          Hero(
            tag: widget.data["cid"].toString(),
            child: CarouselSlider(
              items: List.generate(5, (index) {
                return Image.asset(
                  widget.data["image"].toString(),
                  width: size.width,
                  fit: BoxFit.fill,
                );
              }),
              options: CarouselOptions(
                  height: size.width,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    print(index);
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomBarWidget() {
    return Container(
      width: size.width,
      height: 55,
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appbarWidget(),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomBarWidget(),
    );
  }
}
