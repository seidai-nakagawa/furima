$(document).on('turbolinks:load', ()=> {
    let buildFileField = (index)=> {
    let html = `<div data-index="${index}" class="sell-image__box__input">
                    <input class="js-file" type="file"
                    name="item[item_images_attributes][${index}][url]"
                    id="item_item_images_attributes_${index}_url"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }
  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.sell-image__box__input:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('#image-box__container').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
      
    } else {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box__container').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });
  $('#image-box__container').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box__container').append(buildFileField(fileIndex[0]));
  });


    // 1-2. new file_field
    // 1-3. label for

// 2.削除ボタン押した時に〜する。
$(document).on("click", '.item-image__delete', function(){
  let target_image = $(this).parent()
  target_image.remove();
  file_field.val("")
})
// 3.編集ボタン押した時に〜する。


  $("#mint_id").on('click',function(){
    
  })
});