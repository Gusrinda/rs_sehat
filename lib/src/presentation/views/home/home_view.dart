import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pasien/src/core/config/theme_colors.dart';
import 'package:pasien/src/core/repository/push_notification_repository.dart';
import 'package:pasien/src/presentation/blocs/auth/authentication/authentication_bloc.dart';
import 'package:pasien/src/presentation/widgets/text_field_widget.dart';
import 'package:pasien/src/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../faskes/faskes_list_view.dart';
import '../notification/notification_view.dart';
import '../profile/profile_view.dart';
import 'emergency_view.dart';
import 'home_menu.dart';
import 'home_rs.dart';
import 'home_widget.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/home';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final rxShowFab = ValueNotifier(true);
  final scrollController = ScrollController();

  void _listener() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      rxShowFab.value = true;
    } else if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      rxShowFab.value = false;
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PushNotificationRepository>().requestPermission();
    });

    scrollController.addListener(_listener);
  }

  @override
  void dispose() {
    scrollController.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: rxShowFab,
      builder: (context, show, child) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: _ContentView(scrollController: scrollController),
          floatingActionButton: show ? const _Fab() : null,
        );
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: false,
      titleSpacing: 20,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello',
            style: TextStyle(fontSize: 12.sp),
          ),
          const SizedBox(height: 2),
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            buildWhen: (previous, current) =>
                previous.userModel != current.userModel,
            builder: (context, state) {
              final user = state.userModel;
              String name = '';
              if (user != null &&
                  user.namePrefix != null &&
                  user.nameSuffix != null) {
                name = '${user.namePrefix} ${user.nameSuffix}';
              }

              if (name.isEmpty) {
                name = user?.name ?? '';
              }

              return Text(
                name,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              );
            },
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, NotificationView.routeName);
          },
          icon: const Icon(
            Icons.notifications_outlined,
            color: ThemeColors.grey4,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProfileView.routeName);
          },
          child: const Icon(
            Icons.account_circle_outlined,
            color: ThemeColors.grey5,
            size: 38,
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

class _Fab extends StatelessWidget {
  const _Fab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, EmergencyView.routeName);
      },
      backgroundColor: ThemeColors.red,
      foregroundColor: Colors.white,
      child: const Icon(Icons.call),
    );
  }
}

class _ContentView extends StatelessWidget {
  const _ContentView({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SearchFieldBar(hintText: 'Cari Dokter'),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: OnlineAppointmentsCard(),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: HeaderLabel('Menu'),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: HomeMenuGridView(),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: HeaderLabel('Jadwal Hari ini'),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TodayScheduleCard(),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: HeaderLabel('Segera Bayar Tagihanmu!'),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ActiveTransactionCard(),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: HeaderLabel(
              'Rumah Sakit Terdekat',
              onTapTrailing: () {
                Navigator.pushNamed(context, FaskesListView.routeName);
              },
            ),
          ),
          const SizedBox(height: 8),
          const HomeRsGridView(),
        ],
      ),
    );
  }
}
