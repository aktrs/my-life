import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

document.addEventListener("DOMContentLoaded", function() {
    const graphContainer = document.querySelector(".graph-container");
  
    if (graphContainer) {
      graphContainer.addEventListener("click", function(event) {
        const target = event.target;
  
        // 点がクリックされたかどうかを確認
        if (target.tagName === 'circle' || target.tagName === 'path') {
          const graphLink = target.getAttribute('data-link');
          if (graphLink) {
            window.location.href = graphLink; // リンク先に遷移
          }
        }
      });
    }
  });
  