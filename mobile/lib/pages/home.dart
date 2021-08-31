import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/models/product.dart' as Beer;
import 'package:mobile/services/beer_service.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getProducts();
    return Scaffold(
      appBar: AppBar(
        title: Text("Beer Tonight"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: FutureBuilder(
            future: getProducts(),
            builder: (BuildContext context, AsyncSnapshot<List<Beer.Product>> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Cannot load data!"),
                );
              }

              if (snapshot.hasData) {
                var products = snapshot.data;
                return ListView.builder(
                  itemCount: products!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CachedNetworkImage(imageUrl: baseUrl + products[index].images.first.formats.small.url),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(
                            '${products[index].title} (${products[index].alcohol} %)',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            '${products[index].price} €',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                      ],
                    );
                  },
                );
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
