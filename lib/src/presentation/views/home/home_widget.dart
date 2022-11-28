import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pasien/src/core/assets/assets.gen.dart';
import 'package:pasien/src/presentation/widgets/card_widget.dart';
import 'package:pasien/src/presentation/widgets/chip_widget.dart';
import 'package:pasien/src/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class OnlineAppointmentsCard extends StatelessWidget {
  const OnlineAppointmentsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GreenCard(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Online\nAppointments',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Select the specialist and make an appointment through our app',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 32.sp),
              Expanded(
                flex: 2,
                child: Assets.images.doctorFull.image(height: 144.sp),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: Assets.images.vectorCard.image(),
        ),
      ],
    );
  }
}

class TodayScheduleCard extends StatelessWidget {
  const TodayScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TitleLabel('dr. Halim Perdana, Sp.PD'),
                SizedBox(height: 8),
                RsSubtitleLabel('Rumah Sakit Yasmin Banyuwangi'),
                SizedBox(height: 8),
                GreenChip('Pukul 08:00'),
              ],
            ),
          ),
          Assets.images.doctorAvatar.image(height: 72.sp),
        ],
      ),
    );
  }
}

class ActiveTransactionCard extends StatelessWidget {
  const ActiveTransactionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            radius: 29.sp,
            child: Assets.icons.home.pesanObat.image(
              color: Colors.white,
              colorBlendMode: BlendMode.srcIn,
              height: 35.sp,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TitleLabel('Alfiani, ada tagihan obat!'),
                SizedBox(height: 8),
                RsSubtitleLabel('Rumah Sakit Yasmin Banyuwangi'),
                SizedBox(height: 8),
                ColorChip('Rp. 50.000'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}