// $(document).on('turbolinks:load', ()=> {
$(function(){
  let buildFileField = (num)=> {
  let html = `<div data-index="${num}" class="sell-image__box__input">
                  <input type="file" class="js-file" 
                  name="item[item_images_attributes][${num}][url]"
                  id="item_item_images_attributes_${num}_url"><br>
                </div>`;
  return html;
}
// プレビュー用のimgタグを生成する関数(プレビューの表示)
const buildImg = (index, url)=> {
  const img_html = `<div id="parent" data-index="${index}"><img src="${url}" class="js-img" id="js-img_${index}">
                    <div class="js-remove" data-index="${index}" id="remove_${index}">削除</div>`;
  return img_html;
}
  
//【アクションプラン】カメラボタンを押した時に、一番最後の"ファイルを選択"のボタンがクリックされたことにする。
// ①カメラボタンが押されたときのイベントを作る
// ②一番最後にあるfile_field(ファイルを選択)を取得するし、変数化する
// ③その変数をクリックするメソッドを使用する
$(document).on("click", '.fas.fa-camera', function(){
  lastFile_field = $('.js-file:last')
  $(lastFile_field).click();
})


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
      // fileIndexの先頭の数字を使ってinputを作る(inputを1つ追加。)
      $('#image-box__container').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  $('#image-box__container').on('change', '.js-file', function(e) {
    //画像が5枚を超えたらドロップボックスを削除する
    // num = 画像のクラス名（id名）.length
    num = $('.js-img').length;
    if (num >= 5){
      alert('これ以上投稿できません')
      $('#image-box__container').css('display', 'none')
    }
  });


  // 2.削除ボタン押した時に〜する。
  $('#previews').on('click', '.js-remove', function() {
    const targetIndex = $(this).data('index');
    $(`#item_item_images_attributes_${targetIndex}_url`).remove();
    $(`#js-img_${targetIndex}`).remove();
    $(`#remove_${targetIndex}`).remove();
    // 画像入力欄が0個にならないようにしておく
    num = $('.js-img').length;
    if ($('.js-file').length == 0) $('#image-box__container').append(buildFileField(fileIndex[0]));
    // 画像が５枚以下になった時に画像入力欄が復活する
    if (num < 5){
      $('#image-box__container').css('display', '')
    }
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);
  });

    // 1-2. new file_field
    // 1-3. label for

// 3.編集ボタン押した時に〜する。


  $("#mint_id").on('click',function(){
    
  })
});