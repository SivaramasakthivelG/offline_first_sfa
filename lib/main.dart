import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_outlet/core/di/injections.dart';
import 'package:offline_outlet/viewmodels/outlet/outlet_cubit.dart';
import 'package:offline_outlet/views/outlet/outlet_list_page.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await setupDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => getIt<OutletCubit>()..loadOutlets(),
        child: const OutletListPage(),
      ),
    );
  }
}



