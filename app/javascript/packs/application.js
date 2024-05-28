import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "@hotwired/turbo-rails"

Rails.start()
ActiveStorage.start()

import "bootstrap"
import "../stylesheets/application"

import "trix"
import "@rails/actiontext"

document.addEventListener('turbo:load', () => {
  if (document.querySelector('.splide')) {
    let spliders = document.querySelectorAll('.splide');
    for (let i = 0; i < spliders.length; i++) {
      new Splide(spliders[i], {
        autowidth: true,
        arrows: false,
        pagination: false
      }).mount();
    }
  }

  //modal
  const projectModal = document.querySelector('#projectsModal')
  const topicModal = document.querySelector('#topicModal')

  if (document.querySelector('#topicModal'))
    topicModal.addEventListener('show.bs.modal', function(event) {
      //trigger
      const btn_topic = event.relatedTarget
      //parms
      const title = btn_topic.getAttribute('data-bs-taskTitle')
      const topic = btn_topic.getAttribute('data-bs-taskTopic')
      const desc = btn_topic.getAttribute('data-bs-taskDesc')
      //elements
      const modalTitle = topicModal.querySelector('.modal_title')
      const modalTopic = topicModal.querySelector('.modal_topic')
      const modalBodyText = topicModal.querySelector('.modal_desc')
      modalTitle.textContent = title
      modalTopic.textContent = topic
      modalBodyText.innerHTML = desc
    });


  if (document.querySelector('#projectsModal'))
    projectModal.addEventListener('show.bs.modal', function(event) {
      //trigger
      const btn_project = event.relatedTarget
      //parms
      const title = btn_project.getAttribute('data-bs-modaltitle')
      const desc = btn_project.getAttribute('data-bs-modaldesc')
      const ptoject = btn_project.getAttribute('data-bs-project')
      //elements
      const modalTitle = projectModal.querySelector('.modal_title')
      const modalBodyText = projectModal.querySelector('.modal_desc')
      modalTitle.textContent = title
      modalBodyText.innerHTML = desc
      if (projectModal.querySelector('.modal_btn')) {
        const modalBtn = projectModal.querySelector('.modal_btn')
        modalBtn.setAttribute('href', ptoject)
      }
    });

});
