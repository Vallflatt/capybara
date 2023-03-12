import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "name", "address", "searchButton", "locationButton" ]

  coordinates = null

  connect() {
    this.#applyDisableToButton();
    this.#requestPosition()
  }

  /* -----------------
  /    Search logic
  / ----------------- */

  inputChange() {
    this.#applyDisableToButton();
  }


  #applyDisableToButton() {
    this.searchButtonTarget.disabled = this.#isDisable;
  }

  get #isDisable() {
    return this.addressTarget.value.length < 3 || this.nameTarget.value.length < 3
  }

  /* -----------------
  /      GEOLOC
  / ----------------- */

  #requestPosition() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition((position) => {
        const {latitude, longitude} = position.coords;
        this.coordinates = [latitude, longitude];
        this.locationButtonTarget.style.display = "block";
      });
    }
  }

  async searchAddress() {
    if (this.coordinates) {
      const address = await this.#fetchAddress()
      this.addressTarget.value = `${address.road || ''} ${address.postcode || ''} ${address.city || ''}`
    }
  }

  async #fetchAddress() {
    const res = await fetch(`/api/address-from-coordinates?lat=${this.coordinates[0]}&lon=${this.coordinates[1]}`).then(async (res) => await res.json())
    return res.data.address
  }

}
