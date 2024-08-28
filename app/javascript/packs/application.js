// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";
import "slick-carousel"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('turbolinks:load', function() {
  const imageFieldsContainer = document.getElementById('image_fields');

  if (imageFieldsContainer) { // 要素が存在するか確認
    imageFieldsContainer.addEventListener('change', function(event) {
      if (event.target && event.target.classList.contains('image-input')) {
        // 選択された画像がある場合のみ、新しいファイル入力フィールドを追加
        if (event.target.files.length > 0) {
          // 既存の画像入力フィールドの数を取得
          const currentImageFieldsCount = imageFieldsContainer.querySelectorAll('.image-input').length;

          // 画像入力フィールドが4つ未満の場合のみ、新しいフィールドを追加
          if (currentImageFieldsCount < 4) {
            const newField = document.createElement('p');
            newField.innerHTML = '<input type="file" name="post[images][]" accept="image/*" class="image-input">';
            imageFieldsContainer.appendChild(newField);
          }
        }
      }
    });
  }
});




document.addEventListener("turbolinks:load", function() {
  const bioTextarea = document.getElementById("bio-textarea");
  const bioCharCount = document.getElementById("bio-char-count");

  if (bioTextarea) {
    const updateCharCount = () => {
      const currentLength = bioTextarea.value.length;
      bioCharCount.textContent = `${currentLength}/160`;
    };

    bioTextarea.addEventListener("input", updateCharCount);
    
    // 初期状態で文字数をカウント
    updateCharCount();
  }

  const editButton = document.getElementById("edit-profile-button");
  const nameDisplay = document.getElementById("user-name-display");
  const bioDisplay = document.getElementById("user-bio-display");
  const nameEdit = document.getElementById("user-name-edit");
  const cancelEditButton = document.getElementById("cancel-edit");
  const editForm = document.getElementById("edit-user-form");

  if (editButton) {
    editButton.addEventListener("click", function() {
      nameDisplay.style.display = "none";
      bioDisplay.style.display = "none";
      nameEdit.style.display = "block";
      editButton.style.display = "none";
    });
  }

  if (cancelEditButton) {
    cancelEditButton.addEventListener("click", function() {
      nameDisplay.style.display = "block";
      bioDisplay.style.display = "block";
      nameEdit.style.display = "none";
      editButton.style.display = "inline-block";
    });
  }

  if (editForm) {
    editForm.addEventListener("ajax:success", function(event) {
      const [data, status, xhr] = event.detail;
      nameDisplay.querySelector("h3").innerText = data.name;
      bioDisplay.querySelector("p").innerText = data.bio || '';

      nameDisplay.style.display = "block";
      bioDisplay.style.display = "block";
      nameEdit.style.display = "none";
      editButton.style.display = "inline-block";
    });
  }
});


document.addEventListener("turbolinks:load", () => {
  console.log("slick-loaded");
  
  $('.slider').slick({
    dots: true,
    infinite: true,
    lazyLoad: 'ondemand',
    slidesToShow: Math.min(6, $('.slider .genre-block').length), // ジャンルが6つ以下の場合に対応
    slidesToScroll: 1,  // ここは変更しない
    swipeToSlide: true,  // これを追加して、スワイプで任意のスライドに移動できるようにする
    touchMove: true      // タッチ操作でもスライドを自由に動かせるようにする
  });
});

