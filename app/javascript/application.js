// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//= require jquery3
//= require popper
//= require bootstrap
//= require gon
//= require chartkick
//= require Chart.bundle

import Chartkick from "chartkick";
import Chart from "chart.js";

Chartkick.use(Chart);
