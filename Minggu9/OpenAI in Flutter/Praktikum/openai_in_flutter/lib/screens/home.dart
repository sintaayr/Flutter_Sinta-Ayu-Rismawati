import 'package:flutter/material.dart';
import 'package:openai_in_flutter/screens/result.dart';
import '../services/recommendation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _cameraController = TextEditingController();
  final TextEditingController _storageController = TextEditingController();
  bool isLoading = false;

  void _getRecommendations() async {
    setState(() {
      isLoading = true;
    });

    try {
      final result = await RecommendationService.getSmartphoneRecommendations(
        price: _priceController.text,
        cameraQuality: _cameraController.text,
        storageCapacity: _storageController.text,
      );

      if (mounted) {
        setState(() {
          isLoading = false;
        });

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ResultScreen(gptResponseData: result);
            },
          ),
        );
      }
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('Failed to send a request. Please try again.'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      setState(() {
        isLoading=false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Smartphone Recommendation'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                heightFactor: 4,
                child: Text(
                  'Smartphone Recommendations by AI',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Masukkan harga yang diinginkan",
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _priceController,
                      decoration: const InputDecoration(
                        hintText: 'Masukkan harga dalam IDR',
                      ),
                      validator: (String? value) {
                        bool isInvalid = value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null;

                        if (isInvalid) {
                          return 'Data tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Masukkan kriteria kamera yang diinginkan",
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _cameraController,
                      decoration: const InputDecoration(
                        hintText: 'Kriteria kamera',
                      ),
                      validator: (String? value) {
                        bool isInvalid = value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null;

                        if (isInvalid) {
                          return 'Data tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Masukkan besar penyimpanan internal yang diinginkan",
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _storageController,
                      decoration: const InputDecoration(
                        hintText: 'Kriteria penyimpanan internal',
                      ),
                      validator: (String? value) {
                        bool isInvalid = value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null;

                        if (isInvalid) {
                          return 'Data tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: isLoading && _formKey.currentState!.validate() != false
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        onPressed: _getRecommendations,
                        child: const Center(
                          child: Text("Get Recommendations"),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
