import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:async';

import 'package:ultimate_flutter_icons/ficon.dart';
import 'package:ultimate_flutter_icons/icons/md.dart';
import 'package:url_launcher/url_launcher.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({super.key});

  @override
  State<CarouselPage> createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  int _currentIndex = 0;
  bool _isAutoPlaying = true;
  final _carouselController = CarouselSliderController();
  Timer? _autoPlayTimer;

  final List<Map<String, String>> images = [
    {
      'url':
          'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=1200&h=600&fit=crop',
      'title': 'Montañas al Atardecer',
    },
    {
      'url':
          'https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=1200&h=600&fit=crop',
      'title': 'Bosque Nebuloso',
    },
    {
      'url':
          'https://images.unsplash.com/photo-1501785888041-af3ef285b470?w=1200&h=600&fit=crop',
      'title': 'Paisaje Sereno',
    },
    {
      'url':
          'https://images.unsplash.com/photo-1511884642898-4c92249e20b6?w=1200&h=600&fit=crop',
      'title': 'Cielo Estrellado',
    },
    {
      'url':
          'https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?w=1200&h=600&fit=crop',
      'title': 'Naturaleza Salvaje',
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    super.dispose();
  }

  void _startAutoPlay() {
    if (_isAutoPlaying) {
      _autoPlayTimer?.cancel();
      _autoPlayTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
        if (_currentIndex < images.length - 1) {
          _carouselController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        } else {
          _carouselController.animateToPage(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      });
    }
  }

  void _toggleAutoPlay() {
    setState(() {
      _isAutoPlaying = !_isAutoPlaying;
      if (_isAutoPlaying) {
        _startAutoPlay();
      } else {
        _autoPlayTimer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Galería Moderna',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          // navigate tu flutter official website
          IconButton(
            icon: const FIcon(MD.MdWeb),
            onPressed: () {
              launchUrl(Uri.parse('https://flutter.dev'));
            },
            tooltip: 'Flutter Official Website',
          ),
        ],
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Carrusel
              Expanded(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: CarouselSlider.builder(
                            carouselController: _carouselController,
                            itemCount: images.length,
                            itemBuilder: (context, index, realIndex) {
                              return Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.network(
                                    images[index]['url']!,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey[800],
                                        child: const FIcon(
                                          MD.MdError,
                                          size: 50,
                                        ),
                                      );
                                    },
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.transparent,
                                          Colors.black.withOpacity(0.6),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 30,
                                    left: 30,
                                    child: Text(
                                      images[index]['title']!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                            blurRadius: 10,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                            options: CarouselOptions(
                              viewportFraction: 1.0,
                              enlargeCenterPage: false,
                              autoPlay: false,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentIndex = index;
                                });
                              },
                            ),
                          ),
                        ),
                        // Botones de navegación
                        Positioned(
                          left: 16,
                          top: 0,
                          bottom: 0,
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: const FIcon(MD.MdChevronLeft, size: 32),
                                color: Colors.white,
                                onPressed: () {
                                  _carouselController.previousPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  );
                                  setState(() {
                                    _isAutoPlaying = false;
                                  });
                                  _autoPlayTimer?.cancel();
                                },
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 16,
                          top: 0,
                          bottom: 0,
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: const FIcon(MD.MdChevronRight, size: 32),
                                color: Colors.white,
                                onPressed: () {
                                  _carouselController.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  );
                                  setState(() {
                                    _isAutoPlaying = false;
                                  });
                                  _autoPlayTimer?.cancel();
                                },
                              ),
                            ),
                          ),
                        ),
                        // Indicadores de puntos
                        Positioned(
                          bottom: 16,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: images.asMap().entries.map((entry) {
                              return GestureDetector(
                                onTap: () {
                                  _carouselController.animateToPage(entry.key);
                                  setState(() {
                                    _isAutoPlaying = false;
                                  });
                                  _autoPlayTimer?.cancel();
                                },
                                child: Container(
                                  width: _currentIndex == entry.key ? 32 : 8,
                                  height: 8,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: _currentIndex == entry.key
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.5),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Botón de control
              ElevatedButton.icon(
                onPressed: _toggleAutoPlay,
                icon: FIcon(_isAutoPlaying ? MD.MdPause : MD.MdPlayArrow),
                label: Text(
                  _isAutoPlaying
                      ? 'Pausar Automático'
                      : 'Reproducir Automático',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
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
