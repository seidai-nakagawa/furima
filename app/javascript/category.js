$(function () {
  function appendOption(category) {
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChildrenBox(insertHTML) {
    var childSelectHtml = "";
    childSelectHtml = `<div class="listing-select-wrapper__added" id="children_wrapper">
                        <select id="child_category" name="item[category_id]" class="listing-select-wrapper--selectd">
                          <option value="">---</option>
                          ${insertHTML}
                        </select>
                      </div>`;
    $('.sell-title__bottoms').append(childSelectHtml);
  }
  function appendGrandchildrenBox(insertHTML) {
    var grandchildSelectHtml = "";
    grandchildSelectHtml = `<div class="listing-select-wrapper__added" id="grandchildren_wrapper">
                              <select id="grandchild_category" name="item[category_id]" class="listing-select-wrapper--selectd">
                                <option value="">---</option>
                                ${insertHTML}
                              </select>
                            </div>`;
    $('.sell-title__bottoms').append(grandchildSelectHtml);
  }
  // 親カテゴリー選択後のイベント
  $('#item_category_id').on('change', function () {
    var parentId = document.getElementById('item_category_id').value;  // 選択された親カテゴリーのvalueを取得
    if (parentId != "") {        // 親カテゴリーが初期値でないことを確認
      $.ajax({
        url: '/items/get_category_children',
        type: 'GET',
        data: { parent_id: parentId },
        dataType: 'json'
      })
      .done(function (children) {
        $('#children_wrapper').remove();   // 親が変更された時、子以下を削除
        $('#child_category').remove();   // 親が変更された時、子カテゴリのセレクトボックス削除
        $('#grandchildren_wrapper').remove();   // 子が変更された時、孫以下を削除
        $('#grandchild_category').remove();  // 子が変更された時、孫カテゴリのセレクトボックス削除
        var insertHTML = '';
        children.forEach(function (child) {
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
      })
      .fail(function () {
        alert('カテゴリー取得に失敗しました');
      })
    } else {
      $('#children_wrapper').remove();
      $('#child_category').remove();
      $('#grandchildren_wrapper').remove();
      $('#grandchild_category').remove();
    }
  });
  // 子カテゴリー選択後のイベント
  $('.sell-title__bottoms').on('change', '#child_category', function () {
    var childId = document.getElementById('child_category').value;
    if (childId != "") {
      $.ajax({
        url: '/items/get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function (grandchildren) {
        $('#grandchildren_wrapper').remove();   // 子が変更された時、孫以下を削除
        $('#grandchild_category').remove();  // 子が変更された時、孫カテゴリのセレクトボックス削除
        var insertHTML = '';
        grandchildren.forEach(function (grandchild) {
          insertHTML += appendOption(grandchild);
        });
        appendGrandchildrenBox(insertHTML);
      })
      .fail(function () {
        alert('カテゴリー取得に失敗しました');
      })
    } else {
      $('#grandchildren_wrapper').remove();
      $('#grandchild_category').remove();
    }
  })
}); 