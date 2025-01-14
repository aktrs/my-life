// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//= require jquery3
//= require popper
//= require bootstrap
//= require gon
//= require chartkick
//= require Chart.bundle

import "chartkick"
import "Chart.bundle"

document.addEventListener("turbo:load", function() {
    // Turboによるページ遷移後に非同期で処理を適用
    const followButtons = document.querySelectorAll(".follow-button");
  
    followButtons.forEach(button => {
      button.addEventListener("ajax:success", function(event) {
        const [data, status, xhr] = event.detail;
        const followButtonContainer = document.querySelector("#follow-button-container");
        followButtonContainer.innerHTML = data;
      });
    });
  });
  