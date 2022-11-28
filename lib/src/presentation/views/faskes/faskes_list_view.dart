import 'package:flutter/material.dart';
import 'package:pasien/src/presentation/widgets/chip_widget.dart';
import 'package:pasien/src/presentation/widgets/text_field_widget.dart';

import 'faskes_detail_view.dart';
import 'faskes_item_tile.dart';

class FaskesListView extends StatefulWidget {
  static const String routeName = '/faskes';

  const FaskesListView({Key? key}) : super(key: key);

  @override
  State<FaskesListView> createState() => _FaskesListViewState();
}

class _FaskesListViewState extends State<FaskesListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const _ContentView(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Daftar Fasilitas Kesehatan'),
    );
  }
}

class _ContentView extends StatelessWidget {
  const _ContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SearchFieldBar(hintText: 'Cari Fasilitas Kesehatan'),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Wrap(
              spacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: const [
                Text(
                  'Urut Berdasarkan',
                  style: TextStyle(fontSize: 10),
                ),
                FilterChips('Terdekat'),
                FilterChips('Terpopuler', selected: true),
              ],
            ),
          ),
          const SizedBox(height: 16),
          FaskesListItem(
            image: 'assets/images/rs/rs1.webp',
            name: 'Rumah Sakit Yasmin Banyuwangi',
            type: 'Rumah Sakit',
            rating: 4.7,
            distance: 1,
            onTap: () => handleDetail(context),
          ),
          const Divider(indent: 20, endIndent: 20, color: Colors.grey),
          FaskesListItem(
            image: 'assets/images/rs/rs2.webp',
            name: 'Poli Blambangan',
            type: 'Rumah sakit',
            rating: 3.5,
            distance: 2,
            onTap: () => handleDetail(context),
          ),
          const Divider(indent: 20, endIndent: 20, color: Colors.grey),
          FaskesListItem(
            image: 'assets/images/rs/rs3.webp',
            name: 'Pukesmas Singoturunan',
            type: 'Klinik',
            rating: 2.9,
            distance: 3,
            onTap: () => handleDetail(context),
          ),
        ],
      ),
    );
  }

  handleDetail(BuildContext context) {
    Navigator.pushNamed(context, FaskesDetailView.routeName);
  }
}
