$(function(){
  let databox = new DataTransfer();
  let file_field = document.querySelector('input[type=file]')
  // 1.ファイルを変更した時に〜(発火)する。
  $('#image-box__container').on('change', '.js-file', function(e) {
    let files = $('input[type=file]').prop('files')[0];
    $.each(this.files, function(i, file){
      databox.items.add(file)
      file_field.files = databox.files
      let num = $('.item-image').length + 1 + i
    // 1-1. preview
    let src = window.URL.createObjectURL(e.target.files[num - 1]);
    let html= `<div class='item-image' data-image="${file.name}">
                <div class=' item-image__content'>
                  <div class='item-image__content--icon'>
                    <img src=${src} width="114" height="80" >
                  </div>
                </div>
                <div class='item-image__operetion'>
                  <div class='item-image__operetion--delete'>削除</div>
                  </div>
                </div>`
  $('#image-box__container').before(html);

    //画像が5枚になったら超えたらドロップボックスを削除する
    if (num == 5){
      $('#image-box__container').css('display', 'none')   
    }

    // let html= `<img src="${src}" width="114" height="80">`
    const buildFileField = (index)=> {
      const html = `<div data-index="${index}" class="sell-image__box__input">
                      <input class="js-file" type="file"
                      name="item[item_images_attributes][${index}][url]"
                      id="item_item_images_attributes_${index}_url"><br>
                      <div class="js-remove">削除</div>
                    </div>`;
      return html;
    }
    // file_fieldのnameに動的なindexをつける為の配列
    let fileIndex = [1,2,3,4,5,6,7,8,9,10];

    $('#image-box__container').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    
    $('#image-box__container').on('click', '.js-remove', function() {
      $(this).parent().remove();
      // 画像入力欄が0個にならないようにしておく
      if ($('.js-file').length == 0) $('#image-box__container').append(buildFileField(fileIndex[0]));
     });
  });

    // 1-2. new file_field
    // 1-3. label for
    });
  });
  // 2.削除ボタン押した時に〜する。
  $(document).on("click", '.item-image__delete', function(){
    let target_image = $(this).parent()
    target_image.remove();
    file_field.val("")
  })
  // 3.編集ボタン押した時に〜する。


  // let html1 = ` <input type="file" name="item[item_images_attributes][${ 変数+1}][image_url]" value="" style="display:none" id="img-file">`

