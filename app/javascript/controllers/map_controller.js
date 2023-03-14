// app/javascript/controllers/map_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    userlocation: Array,
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addUserLocation()
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #addUserLocation() {
    if (this.userlocationValue) {
      new mapboxgl.Marker({ color: "#FFFFFF" })
        .setLngLat(this.userlocationValue)
        .addTo(this.map)
    }
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
        .on("open", (popup) => {
          const p = popup.target;

          // console.log("click", p)
        })
      new mapboxgl.Marker({ color: "#D8833B" })
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    if (this.userlocationValue) {
      bounds.extend(this.userlocationValue)
    }
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 60, maxZoom: 15, duration: 0 })
  }

}
