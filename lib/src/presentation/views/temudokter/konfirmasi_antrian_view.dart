import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pasien/src/core/config/theme_colors.dart';
import 'package:pasien/src/core/util/dialogs.dart';
import 'package:pasien/src/core/util/extensions.dart';
import 'package:pasien/src/presentation/widgets/card_widget.dart';
import 'package:pasien/src/presentation/widgets/label_value_widget.dart';
import 'package:pasien/src/presentation/widgets/text_widget.dart';
import 'package:timelines/timelines.dart';

import 'verification_status_view.dart';

class KonfirmasiAntrianView extends StatefulWidget {
  static const String routeName =
      '/janji-temu-dokter/pertemuan/dokter/konfirmasi';

  const KonfirmasiAntrianView({Key? key}) : super(key: key);

  @override
  State<KonfirmasiAntrianView> createState() => _KonfirmasiAntrianViewState();
}

class _KonfirmasiAntrianViewState extends State<KonfirmasiAntrianView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konfirmasi Antrian'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Alfiani Cantika',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'No. RM 689689',
              style: TextStyle(fontSize: 12.sp, color: ThemeColors.greyCaption),
            ),
            const SizedBox(height: 8),
            Text(
              'Berikut ini adalah detail jadwal pertemuan Anda dengan dokter terkait. Silahkan konfirmasi kembali bahwa data yang diinputkan adalah benar.  ',
              style: TextStyle(fontSize: 10.sp),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    foregroundColor: Theme.of(context).primaryColor,
                    child: const Icon(Icons.calendar_month),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kamis, 31 Maret 2022 08.00 WIB',
                          style:
                              TextStyle(fontSize: 12.sp, color: Colors.white),
                        ),
                        Text(
                          'Rumah Sakit Yasmin Banyuwangi',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const HeaderLabel('Detail Pertemuan'),
            const SizedBox(height: 8),
            OutlineCard(
              padding: const EdgeInsets.all(16),
              child: Timeline.tileBuilder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                theme: TimelineThemeData(
                  nodePosition: 0,
                  color: ThemeColors.grey4,
                  indicatorTheme: const IndicatorThemeData(
                    position: 0.1,
                    size: 10.0,
                  ),
                  connectorTheme: const ConnectorThemeData(
                    thickness: 1.0,
                  ),
                ),
                builder: TimelineTileBuilder.fromStyle(
                  contentsAlign: ContentsAlign.basic,
                  contentsBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                    child: details[index],
                  ),
                  indicatorStyle: IndicatorStyle.outlined,
                  itemCount: details.length,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: ElevatedButton(
          onPressed: handleConfirm,
          child: const Text('Konfirmasi'),
        ),
      ),
    );
  }

  List<Widget> get details {
    return [
      const LabelValueVertical(
        label: 'Poli',
        value: 'Spesialis Penyakit Dalam',
      ),
      const LabelValueVertical(
        label: 'Dokter',
        value: 'dr. Halim Perdana, Sp.PD',
      ),
      const LabelValueVertical(
        label: 'Jenis Pelayanan',
        value: 'Umum',
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 4),
          Text(
            'Surat Rujukan',
            style: TextStyle(
              fontSize: 12.sp,
              color: ThemeColors.greyCaption,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: const BoxDecoration(
              color: ThemeColors.backgroundPage,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Icon(
                  Icons.document_scanner_outlined,
                  color: ThemeColors.grey4,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Filename_9283804.pdf',
                        style: TextStyle(fontSize: 10.sp),
                      ),
                      Text(
                        '2MB',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: ThemeColors.grey4,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: ThemeColors.blueDark,
                  foregroundColor: Colors.white,
                  radius: 12.sp,
                  child: Icon(Icons.arrow_downward, size: 12.sp),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: ThemeColors.red,
                  foregroundColor: Colors.white,
                  radius: 12.sp,
                  child: Icon(Icons.delete_forever, size: 12.sp),
                )
              ],
            ),
          ),
        ],
      ),
    ];
  }

  Future<void> handleConfirm() async {
    final navigator = Navigator.of(context);
    final confirmed = await showConfirmationDialog(
      context: context,
      title: 'Konfirmasi',
      message:
          'Apa Anda yakin untuk melakukan janji temu dokter sesuai dengan jadwal yang Anda pilih?',
    );

    if (confirmed == true && mounted) {
      final status = await context.showSelectionBottomSheet<VerificationStatus>(
        title: 'Pilih Status Verifikasi',
        mapLabelData: {
          'Menunggu Verifikasi': VerificationStatus.waiting,
          'Ditolak': VerificationStatus.rejected,
        },
      );

      if (status != null) {
        navigator.pushNamed(
          VerificationStatusView.routeName,
          arguments: status,
        );
      }
    }
  }
}
