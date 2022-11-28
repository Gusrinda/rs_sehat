import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pasien/src/core/assets/assets.gen.dart';
import 'package:pasien/src/core/config/theme_colors.dart';
import 'package:pasien/src/core/util/dialogs.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyView extends StatelessWidget {
  static const String routeName = '/emergency';

  const EmergencyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kontak Darurat'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Assets.icons.redCall.image(height: 140.sp),
            ),
            SizedBox(height: 24.sp),
            Text(
              'Kontak Darurat',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                height: 1.5,
              ),
            ),
            Text(
              'Berikut adalah kontak darurat dari rumah sakit terkait :',
              style: TextStyle(
                fontSize: 12.sp,
                height: 1.5,
              ),
            ),
            SizedBox(height: 12.sp),
            const _CallTile(
              title: 'RSUD Srengat',
              phone: '+62342-5651555',
            ),
            SizedBox(height: 12.sp),
            const _CallTile(
              title: 'RSUD Ngudi Waluyo Wlingi',
              phone: '+62342-691006',
            ),
          ],
        ),
      ),
    );
  }
}

class _CallTile extends StatelessWidget {
  const _CallTile({
    Key? key,
    required this.title,
    required this.phone,
  }) : super(key: key);

  final String title;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.sp)),
        border: Border.all(
          color: ThemeColors.grey6,
        ),
      ),
      child: ListTile(
        leading: const CircleAvatar(
          foregroundColor: ThemeColors.red,
          backgroundColor: ThemeColors.backgroundPage,
          child: Icon(Icons.call),
        ),
        title: Text(title, style: TextStyle(fontSize: 14.sp)),
        subtitle: Text(phone, style: TextStyle(fontSize: 12.sp)),
        onTap: () async {
          final confirm = await showConfirmationDialog(
            context: context,
            title: 'Konfirmasi',
            message: 'Apa Anda yakin untuk memanggil bantuan?',
          );

          if (confirm == true) {
            launchUrl(Uri.parse('tel:$phone'));
          }
        },
      ),
    );
  }
}
