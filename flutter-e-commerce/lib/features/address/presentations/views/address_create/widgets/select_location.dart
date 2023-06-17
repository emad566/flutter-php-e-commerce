import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/shared/widgets/handle_loading.dart';
import 'package:flutter_e_commerce/features/address/presentations/view_models/controllers/address_create_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class SelectLocation extends StatelessWidget {
  const SelectLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressCreateControllerImp>(
      init: AddressCreateControllerImp(),
      builder: (controller) {
        return HandleLoading(
          state: controller.state,
          child: controller.currentLocation == null?
          const Text('Loading ...'):

          GoogleMap(
            indoorViewEnabled: true,
            markers: {controller.marker, },
            mapType: MapType.normal,
            onTap: (LatLng latLng)=>controller.setMarker(latLng),
            initialCameraPosition: controller.initialCameraPosition,
            onMapCreated: (GoogleMapController googleMapController) {
              controller.googleMapController.complete(
                  googleMapController
              );
            },
          ),
        );
      },
    );
  }
}
