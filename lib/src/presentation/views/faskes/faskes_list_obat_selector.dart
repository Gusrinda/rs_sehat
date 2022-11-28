import 'package:pasien/src/presentation/widgets/chip_widget.dart';
import 'package:pasien/src/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

import '../obat/pesan_obat_view.dart';
import 'faskes_item_tile.dart';

class FaskesListObatSelector extends StatefulWidget {
  static const String routeName = '/pesan-obat/faskes';

  const FaskesListObatSelector({Key? key}) : super(key: key);

  @override
  State<FaskesListObatSelector> createState() => _FaskesListObatSelectorState();
}

class _FaskesListObatSelectorState extends State<FaskesListObatSelector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const _ContentView(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Pilih Fasilitas Kesehatan'),
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
          FaskesObatItemTile(
            name: 'Rumah Sakit Yasmin Banyuwangi',
            address:
                'Jl. Letkol Istiqlah No.80-84, Singonegaran, Kec. Banyuwangi, Kabupaten Banyuwangi, Jawa Timur 68415',
            onPressed: () => handlePesanObat(context),
          ),
          const Divider(indent: 20, endIndent: 20, color: Colors.grey),
          FaskesObatItemTile(
            name: 'RSU Islam',
            address:
                'Jl. Basuki Rahmat No.113, Singotrunan, Kec. Banyuwangi, Kabupaten Banyuwangi, Jawa Timur 68414',
            onPressed: () => handlePesanObat(context),
          ),
          const Divider(indent: 20, endIndent: 20, color: Colors.grey),
          FaskesObatItemTile(
            name: 'RSUD Blambangan',
            address:
                'Jl. Letkol Istiqlah No.49, Singonegaran, Kec. Banyuwangi, Kabupaten Banyuwangi, Jawa Timur 68415',
            phone: '0333421118',
            onPressed: () => handlePesanObat(context),
          ),
          const Divider(indent: 20, endIndent: 20, color: Colors.grey),
          FaskesObatItemTile(
            name: 'Rumah Sakit Ibu Anak Bunda (RSIA Bunda)',
            address:
                'Jl. Adi Sucipto No.9, Tukangkayu, Kec. Banyuwangi, Kabupaten Banyuwangi, Jawa Timur 68411',
            phone: '0333423295',
            onPressed: () => handlePesanObat(context),
          ),
        ],
      ),
    );
  }

  handlePesanObat(BuildContext context) {
    Navigator.pushNamed(context, PesanObatView.routeName);
  }
}
