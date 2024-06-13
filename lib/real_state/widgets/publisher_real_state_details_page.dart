
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:my_widgets/real_state/other/collections.dart';

class PublisherRealSTateDetailsPage extends StatelessWidget {
  PublisherRealSTateDetailsPage(
      {super.key,
      required this.realState,
      required this.delete,
      required this.modify,
      required this.actualiser});
  final delete;
  final modify;
  final actualiser;
  final RealState realState;

  CarouselController buttonCarouselController = CarouselController();
  var currentImage = 0.obs;
  @override
  Widget build(BuildContext context) {
    return EScaffold(
      body: Stack(
        children: [
          EColumn(
            children: [
              _ImageWidget(
                  realState: realState,
                  buttonCarouselController: buttonCarouselController,
                  currentImage: currentImage),
              12.h,
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ETextRich(textSpans: [
                      ETextSpan(
                          text: "Ref",
                          underline: true,
                          weight: FontWeight.bold),
                      ETextSpan(text: ': '),
                      ETextSpan(text: realState.id)
                    ]),
                    EText(
                      categorieToPresentationSingle(realState.categorie) +
                          (realState.vente ? " à vendre" : " à louer"),
                      size: 26,
                      maxLines: 4,
                      weight: FontWeight.bold,
                    ),
                    9.h,
                    EText(
                      realState.quartier,
                    ),
                    Text.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: "${realState.ville} - ",
                            style:
                                const TextStyle(fontWeight: FontWeight.w600)),
                        TextSpan(
                            text: realState.region,
                            style:
                                const TextStyle(fontWeight: FontWeight.w500)),
                      ]),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      textScaleFactor: .7,
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                    9.h,
                    Row(
                      children: [
                        EText(
                          "${GFunctions.priceString(realState.prix.toInt().toString())} F",
                          weight: FontWeight.w700,
                          size: 26,
                        ),
                        EText((realState.vente
                            ? ''
                            : realState.categorie == Categories.terrains
                                ? '/ an'
                                : '  / mois'))
                      ],
                    ),
                    12.h,
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 6.0),
                      decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(2)),
                      child: EText(
                          GFunctions.isToday(realState.date)
                              ? "Aujourd'hui"
                              : GFunctions.isYesterday(realState.date)
                                  ? 'Hier'
                                  : GFunctions.ilYa(realState.date),
                          color: Colors.white,
                          weight: FontWeight.w600,
                          size: 18),
                    ),
                    const Divider(),
                    12.h,
                    const BigTitleText(
                      'Descriptif du bien',
                    ),
                    6.h,
                    EText(
                      realState.description.replaceAll('*', ''),
                      maxLines: 40,
                    ),
                    12.h,
                    const BigTitleText(
                      'Exigences',
                    ),
                    6.h,
                    EText(
                      IsNullString(realState.exigence)
                          ? 'Aucune'
                          : realState.exigence,
                      weight: FontWeight.w500,
                      maxLines: 30,
                    ),
                    12.h,
                    const Divider(),
                    12.h,
                    const BigTitleText(
                      'Géolocalisation',
                    ),
                    12.h,
                    EText(
                      "Quartier ${realState.quartier}",
                      size: 22,
                      weight: FontWeight.w500,
                    ),
                    9.h,
                    Container(
                        height: Get.width / 1.9,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 216, 216),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: realState.localisation == null
                            ? Center(
                                child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.info),
                                  6.h,
                                  const EText("Localisation non pécisée"),
                                ],
                              ))
                            : Stack(
                                children: [
                                  FlutterMap(
                                    options: MapOptions(
                                      initialCenter: LatLng(
                                          realState.localisation!.latitude,
                                          realState.localisation!.longitude),
                                      initialZoom: 12.2,
                                    ),
                                    children: [
                                      TileLayer(
                                        urlTemplate:
                                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                        userAgentPackageName: 'com.example.app',
                                      ),
                                      MarkerLayer(
                                        markers: [
                                          marker(
                                            LatLng(
                                                realState
                                                    .localisation!.latitude,
                                                realState
                                                    .localisation!.longitude),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      height: Get.width / 1.7,
                                      width: Get.width,
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ],
                              )),
                    12.h,
                    const Divider(),
                    12.h,
                    Center(
                      child: TextButton(
                        onPressed: () {
                          signalerDialog(context);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.flag_outlined,
                              color: Colors.red,
                            ),
                            3.w,
                            const EText(
                              "Signaler l'annonce",
                              underline: true,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              24.h,
            ],
          ),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
                height: 45,
                width: 45,
                margin: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black45),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SimpleOutlineButton(
              height: 50,
              radius: 3,
              width: Get.width - 130,
              color: GFunctions.isToday(realState.date) ? Colors.grey : null,
              onTap: GFunctions.isToday(realState.date) ? () {} : actualiser,
              child: EText(
                "Actualiser",
                color: GFunctions.isToday(realState.date)
                    ? Colors.grey
                    : Theme.of(context).primaryColor,
                weight: FontWeight.bold,
              ),
            ),
            6.w,
            SimpleOutlineButton(
              radius: 3,
              width: 50,
              height: 50,
              color: Colors.black54,
              onTap: modify == null?(){
                        Toasts.error(context, description: "Impossible de modifier l'annonce");
                      }: modify,
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image(
                      image: AssetImage(("assets/icons/edit.png")),
                      height: 25,
                      color: Colors.black54),
                ],
              ),
            ),
            6.w,
            SimpleButton(
              radius: 3,
              width: 50,
              height: 50,
              color: Colors.black,
              onTap: delete,
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    CupertinoIcons.trash,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void signalerDialog(context) {
    final phoneScallerFactor = MediaQuery.of(context).textScaleFactor;
    String message = "";
    var isLoading = false.obs;
    return Custom.showDialog(Obx(
      () => IgnorePointer(
        ignoring: isLoading.value,
        child: Dialog(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: EColumn(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                12.h,
                const EText("Un problème avec cette annonce ?",
                    weight: FontWeight.bold,
                    size: 28,
                    maxLines: 4,
                    align: TextAlign.center),
                24.h,
                ETextField(
                  phoneScallerFactor: phoneScallerFactor,
                  placeholder: "Votre message*",
                  onChanged: (value) {
                    message = value;
                  },
                  maxLines: 6,
                ),
                24.h,
                SimpleButton(
                    width: 150,
                    onTap: () async {
                      if (message.isEmpty) {
                        Toasts.error(context,
                            description: "Veuillez saisir votre message");
                        return;
                      }
                      FocusManager.instance.primaryFocus?.unfocus();
                      isLoading.value = true;
                      await DB
                          .firestore(Collections.signalisations)
                          .add({"message": message, "id": realState.id});
                      isLoading.value = false;

                      // Send function
                      Get.back();
                    },
                    child: Obx(
                      () => isLoading.value
                          ? const SizedBox(
                              height: 25,
                              width: 25,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 1.3,
                              ))
                          : const EText(
                              'Envoyer',
                              weight: FontWeight.bold,
                              color: Colors.white,
                            ),
                    )),
                9.h,
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({
    required this.realState,
    required this.buttonCarouselController,
    required this.currentImage,
  });

  final RealState realState;
  final CarouselController buttonCarouselController;
  final RxInt currentImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 2.7,
      width: Get.width,
      child: Hero(
        tag: realState.id,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              height: Get.height / 2.7,
              width: Get.width,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 226, 226, 226),
              ),
              child: realState.images.isEmpty
                  ? const Image(
                      image: AssetImage('assets/images/placeholder.png'),
                      fit: BoxFit.cover,
                    )
                  : CarouselSlider(
                      items: realState.images
                          .map((e) => GestureDetector(
                              onTap: () {
                                final imageProvider =
                                    CachedNetworkImageProvider(e);
                                showImageViewer(context, imageProvider,
                                    doubleTapZoomable: true,
                                    immersive: false,
                                    useSafeArea: true,
                                    onViewerDismissed: () {});
                              },
                              child: SizedBox(
                                  height: 100,
                                  width: Get.width,
                                  child: EFadeInImage(
                                      image: CachedNetworkImageProvider(e)))))
                          .toList(),
                      carouselController: buttonCarouselController,
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          currentImage.value = index;
                        },
                        autoPlay: false,
                        // enlargeCenterPage: true,
                        viewportFraction: 1,
                        aspectRatio: 1.0,
                        initialPage: 0,
                      ),
                    ),
            ),
            Positioned(
              bottom: 12,
              left: 12,
              child: Obx(
                () => Container(
                  height: 30,
                  width: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3)),
                  child: EText(realState.images.isNotEmpty
                      ? "${currentImage.value + 1}/${realState.images.length}"
                      : "${currentImage.value}/0"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Marker marker(location) => Marker(
      width: 80.0,
      height: 80.0,
      point: location,
      child: Container(
        child: const Icon(
          Icons.location_pin,
          size: 40.0,
          color: Colors.red,
        ),
      ),
    );
