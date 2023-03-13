import { Controller } from "@hotwired/stimulus"
import { DateRangePicker } from 'vanillajs-datepicker';
import Datepicker from '../../../node_modules/vanillajs-datepicker/js/Datepicker.js';
import fr from '../../../node_modules/vanillajs-datepicker/js/i18n/locales/fr.js';

// TODO manage before send
// Check if the date range doesn't include reserved dates
export default class extends Controller {
  static values = {
    bookings: Array
  }

  connect() {
    this.#buildCalendar();
  }

  #buildCalendar() {
    // Set the language to the DatePicker factory object
    Object.assign(Datepicker.locales, fr);
    // Instanciate a new date range picker on the current element with options
    this.datepicker = new DateRangePicker(this.element, {
      datesDisabled: this.bookingsValue.map((date) => new Date(date)), // Map array of string yyyy-mm-dd to array of dates
      format: 'dd.mm.yyyy', // Display format
      minDate: new Date(), // Before today, it's locked
      language: 'fr' // Use fr as language
    });
  }
}
