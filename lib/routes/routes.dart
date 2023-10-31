import 'package:get/get.dart';
import 'package:ppppppp/routes/AppRoutes.dart';
import 'package:ppppppp/screens/EntryPage.dart';
import 'package:ppppppp/screens/auth/siginUp_page.dart';
import 'package:ppppppp/screens/auth/Login_page.dart';
import 'package:ppppppp/screens/crud/categories/addScreen.dart';
import 'package:ppppppp/screens/crud/notes/NotesAppPage.dart';
import 'package:ppppppp/screens/crud/notes/addNote.dart';
import 'package:ppppppp/screens/crud/notes/updateNote.dart';
import 'package:ppppppp/screens/crud/notes/viewNote.dart';
import 'package:ppppppp/test.dart';

List<GetPage<dynamic>> route = [
  GetPage(name: AppRoute.TestPage ,page: () => TestPage()),
  GetPage(name: AppRoute.SingIn ,page: () => Login()),
  GetPage(name: AppRoute.SiginUp ,page: () => SiginUp()),
  GetPage(name: AppRoute.EntryPage ,page: () => EntryPage()),
  GetPage(name: AppRoute.AddCategory ,page: () => AddCategory()),
  GetPage(name: AppRoute.NotePage ,page: () => NotePage()),
  GetPage(name: AppRoute.AddNote ,page: () => AddNote()),
  GetPage(name: AppRoute.UpdateNote ,page: () => UpdateNote()),
  GetPage(name: AppRoute.ViewNote ,page: () => ViewNote()),
];