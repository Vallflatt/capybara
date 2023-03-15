// app/javascript/controllers/map_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    userlocation: Object,
  }
  static targets = ["locationError", "markerError"]

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    if (this.hasLocation && this.hasMarker) {
      this.#bootMap()
    } else {
      if (!this.hasLocation) {
        this.locationErrorTarget.style.display = "block";
      }
      if (!this.hasMarker) {
        this.markerErrorTarget.style.display = "block";
      }
    }
  }

  #bootMap() {
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addUserLocation()
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #addUserLocation() {
    if (this.hasLocation) {
      const popup = new mapboxgl.Popup().setHTML(this.userlocationValue.info_window_html)
      const el = document.createElement('div');
      el.className = 'marker';
      new mapboxgl.Marker(el)
        .setLngLat(this.userlocationValue.location)
        .setPopup(popup)
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
      new mapboxgl.Marker({ color: "#00FF00" })
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    if (this.hasLocation) {
      bounds.extend(this.userlocationValue.location)
    }
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 60, maxZoom: 15, duration: 0 })
  }

  get hasLocation() {
    return this.userlocationValue.location.length == 2
  }

  get hasMarker() {
    return this.markersValue.length > 0
  }
}
