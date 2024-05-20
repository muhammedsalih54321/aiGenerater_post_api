import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pr_8/bloc/ai/ai_bloc.dart';

import 'package:pr_8/repository/model/ai_model.dart';

class Generatedarea extends StatefulWidget {
  const Generatedarea({super.key});

  @override
  State<Generatedarea> createState() => _GeneratedareaState();
}

class _GeneratedareaState extends State<Generatedarea> {
  late Aimodel model;
  TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'AI IMAGE CREATER',
          style: TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          Container(
              height: 320.0,
              width: 320.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.white,
                  border: Border.all(width: 3, color: Colors.black)),
              child: BlocBuilder<AiBloc, AiState>(builder: (context, state) {
                if (state is Aiblocloadig) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is Aierror) {
                  return Center(
                    child: Text('error'),
                  );
                }
                if (state is Aiblocloaded) {
                  model = BlocProvider.of<AiBloc>(context).aimodel;
                  return Center(
                    child: Image.network(
                      model.imageUrl.toString(),
                      fit: BoxFit.cover,
                    ),
                  );
                } else {
                  return SizedBox();
                }
              })),
              SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              child: TextField(
                controller: message,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('enter something')),
              ),
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<AiBloc>(context)
                    .add(fetchai(massage: message.text)
                    
                    );
                    message.clear();
              },
              child: Text(
                'CREATER',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ))
        ],
      ),
    );
  }
}
