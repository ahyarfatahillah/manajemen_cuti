part of 'app_route.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'listcuti',
          name: AppRoute.listCuti,
          builder: (context, state) => const ListCutiScreen(),
        ),
        GoRoute(
          path: 'ajukancuti',
          name: AppRoute.ajukanCuti,
          builder: (context, state) => const AjukanCutiScreen(),
        ),
        GoRoute(
          path: 'kuotacuti',
          name: AppRoute.kuotaCuti,
          builder: (context, state) => const KuotaCutiScreen(),
        ),
        GoRoute(
          path: 'cutidiajukan',
          name: AppRoute.cutiDiajukan,
          builder: (context, state) => const CutiDiajukanScreen(),
        ),
        GoRoute(
          path: 'profil',
          name: AppRoute.profil,
          builder: (context, state) => const ProfilScreen(),
        ),
      ],
    ),
  ],
);
