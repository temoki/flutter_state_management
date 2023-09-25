import 'package:app/common/data/fetch_catalog_items.dart';
import 'package:app/common/data/item.dart';
import 'package:app/common/data/my_cart_state.dart';
import 'package:app/common/widget/cart_button.dart';
import 'package:app/common/widget/catalog_item_tile.dart';
import 'package:app/common/widget/empty_state.dart';
import 'package:app/common/widget/error_state.dart';
import 'package:app/common/widget/loading_state.dart';
import 'package:app/p7/p7_my_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class P7CatalogPage extends StatefulWidget {
  const P7CatalogPage({super.key});

  @override
  State<P7CatalogPage> createState() => _P4CatalogPageState();
}

class _P4CatalogPageState extends State<P7CatalogPage> {
  Future<List<Item>> catalogItems = fetchCatalogItems();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog (P7)'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: BlocBuilder<P7MyCartCubit, MyCartState>(
              builder: (context, myCart) => CartButton(
                badgeCount: myCart.items.length,
                onPressed: () => Navigator.of(context).pushNamed('/my_cart'),
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            catalogItems = fetchCatalogItems();
          });
        },
        child: FutureBuilder<List<Item>>(
          future: catalogItems,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.waiting) {
              if (snapshot.hasData) {
                final items = snapshot.data!;
                return items.isNotEmpty
                    ? BlocBuilder<P7MyCartCubit, MyCartState>(
                        builder: (context, myCart) => ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            return CatalogItemTile(
                              item: item,
                              isAdded: myCart.items.contains(item),
                              onTapAdd: () =>
                                  context.read<P7MyCartCubit>().add(item),
                            );
                          },
                        ),
                      )
                    : const EmptyState();
              } else if (snapshot.hasError) {
                return ErrorState(error: snapshot.error!);
              }
            }
            return const LoadingState();
          },
        ),
      ),
    );
  }
}
