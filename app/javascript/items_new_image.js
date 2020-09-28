$(function(){
  let file_field = document.querySelector('input[type=file]')
  // 1.ファイルを変更した時に〜する。
  $('#img-file').change(function(e){
    // 1-1. preview
    let src = window.URL.createObjectURL(e.target.files[0]);
    // let html= `<img src="${src}" width="114" height="80">`
    let html= ` <div class='item-image'>
                  <img src=${src} width="114" height="80" >
                    <div class='item-image__delete'>削除</div>
                </div>`
    $('#image-box__container').before(html);
    // 1-2. new file_field
    // 1-3. label for
  });
  // 2.削除ボタン押した時に〜する。
  $(document).on("click", '.item-image__delete', function(){
    let target_image = $(this).parent()
    target_image.remove();
    file_field.val("")
  })
});
  // 3.編集ボタン押した時に〜する。

