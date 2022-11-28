import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pasien/src/core/assets/assets.gen.dart';
import 'package:pasien/src/core/config/theme_colors.dart';

class FaskesDetailView extends StatefulWidget {
  static const String routeName = '/faskes/detail';

  const FaskesDetailView({Key? key}) : super(key: key);

  @override
  State<FaskesDetailView> createState() => _FaskesDetailViewState();
}

class _FaskesDetailViewState extends State<FaskesDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: const _ContentView(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
    );
  }
}

class _ContentView extends StatelessWidget {
  const _ContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Assets.images.rs.rs2.image(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Rumah Sakit Yasmin Banyuwangi',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    textStyle: const TextStyle(fontSize: 10),
                    backgroundColor: ThemeColors.backgroundPage,
                    foregroundColor: ThemeColors.blackPrimary,
                    elevation: 0,
                  ),
                  child: const Text('1 KM'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('4.7'),
                const SizedBox(width: 4),
                RatingBar.builder(
                  initialRating: 4.7,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemSize: 20,
                  ignoreGestures: true,
                  onRatingUpdate: (rating) {},
                ),
                const SizedBox(width: 4),
                const Text('(427)'),
                const Spacer(),
                const Text(
                  'Rumah Sakit',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            child: Text(
              'Berdiri sejak tahun 1930 sebagai Pusat Kesehatan Sederhana jaman Belanda, yang hanya melayani Pelayanan Kesehatan Dasar dan Penyakit Menular hingga sekarang berkembang menjadi Rumah Sakit Kelas B Pemerintah dan lulus Akreditasi PARIPURNA KARS 2012',
              style: TextStyle(color: ThemeColors.greyCaption),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CircleAvatar(
                  backgroundColor: ThemeColors.backgroundField,
                  foregroundColor: ThemeColors.grey4,
                  child: Icon(Icons.location_on_rounded),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Jl. Letkol Istiqlah No.80-84, Singonegaran, Kec. Banyuwangi, Kabupaten Banyuwangi, Jawa Timur 68415',
                    style: TextStyle(color: ThemeColors.greyCaption),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CircleAvatar(
                  backgroundColor: ThemeColors.backgroundField,
                  foregroundColor: ThemeColors.grey4,
                  child: Icon(Icons.call),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    '(031) 71712463',
                    style: TextStyle(color: ThemeColors.greyCaption),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CircleAvatar(
                  backgroundColor: ThemeColors.backgroundField,
                  foregroundColor: ThemeColors.grey4,
                  child: Icon(Icons.email),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'rsudblambangan@gmail.com',
                    style: TextStyle(color: ThemeColors.greyCaption),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
