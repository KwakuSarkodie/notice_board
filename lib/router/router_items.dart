class RouterItem {
  final String path;
  final String name;
  RouterItem({
    required this.path,
    required this.name,
  });

  static final RouterItem homeRoute = RouterItem(path: '/home', name: 'home');
  static final RouterItem loginRoute =
      RouterItem(path: '/login', name: 'login');
      static final RouterItem registerRoute =
      RouterItem(path: '/register', name: 'register');
  static final RouterItem forgotPasswordRoute =
      RouterItem(path: '/forgot-password', name: 'forgotPassword');


      static final RouterItem noticeDetailsRoute =
      RouterItem(path: '/notice/:noticeId', name: 'noticeDetailsRoute');

//dashboard routes
  static final RouterItem secretariesRoute =
      RouterItem(path: '/admin/secretaies', name: 'secretariesRoute');
  static final RouterItem dashboardRoute =
      RouterItem(path: '/dashboard', name: 'dashboard');
  static final RouterItem departmentsRoute =
      RouterItem(path: '/admin/departments', name: 'departmentsRoute');
  static final RouterItem noticeRoute =
      RouterItem(path: '/notice', name: 'notice');
  static final RouterItem requestRoute =
      RouterItem(path: '/request', name: 'request');
static final RouterItem profileRoute =
      RouterItem(path: '/profile', name: 'profile');
static List<RouterItem> allRoutes = [
    homeRoute,
    loginRoute,
    dashboardRoute,
    departmentsRoute,
    noticeRoute,
  ];

  static RouterItem getRouteByPath(String fullPath) {
    return allRoutes.firstWhere((element) => element.path == fullPath);
  }
}
