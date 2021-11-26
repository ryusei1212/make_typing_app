let a = document.getElementById('text_area');
console.log(a);

let i = 1;
function addForm () {
  let parent = document.getElementById('text_area');
  const textInput = document.createElement('input');
  textInput.id ='inputform_' + i;
  textInput.placeholder = '表示したい文字列';
  textInput.type = 'text';
  parent.appendChild(textInput);

  //削除ボタンの追加
  let buttonData = document.createElement('button');
  buttonData.onclick = function(){deleteBtn(this);}
  buttonData.id = i;
  buttonData.innerHTML = '削除';
  let getTextId = document.getElementById(textInput.id);
  parent.appendChild(buttonData);

  i++;
}

//削除機能を追加
function deleteBtn(target) {
  let target_id = target.id;
  let parent = document.getElementById('text_area');
  let ipt_id = document.getElementById('inputform_' + target_id);
  let tgt_id = document.getElementById(target_id);
  parent.removeChild(ipt_id);
  parent.removeChild(tgt_id);

}
