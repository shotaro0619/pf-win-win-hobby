// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require jquery

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require social-share-button

// ジャンル検索時
$(document).on('turbolinks:load', function() {
  $(document).on('click', 'input[name="hobby[genre_id]"]', function(){
    let text = $(this).next().text();
    $('.btn.btn-outline-primary.shadow-sm.rounded-pill.selectbotton').text(text);
  });
});

// aboutページのトップに戻るボタン
document.addEventListener('turbolinks:load', function(event) {
  $('.back-btn a').on('click',function(event){
    $('body, html').animate({
      scrollTop:0
    }, 500);
    event.preventDefault();
  });
});

// エラーメッセージ
 $(function(){
    $(".topalert").fadeOut(5000);
  });

// aboutページの一つ目の画像
  $(document).on('turbolinks:load', function(){
    $('.imgone').hide().fadeIn(3000);
  });

// DM機能のスクロール
document.addEventListener("turbolinks:load", () => {
  const messageDetails = document.getElementById('chatchatbox');
  function scrollToEnd() {
      messageDetails.scrollTop = messageDetails.scrollHeight;
  }
  scrollToEnd();
});

// messesのトップに戻るボタン
document.addEventListener('turbolinks:load', function(event) {
  $('.back-btn2 a').on('click',function(event){
    $('#chatchatbox').animate({
      scrollTop:0
    }, 500);
    event.preventDefault();
  });
});