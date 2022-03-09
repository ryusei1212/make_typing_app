// const { contains } = require("jquery");

let i = 1;

// テキスト追加関数
const addFormFunction = function(){
  const addForm = document.querySelector('#addForm');
  const textSentence = document.querySelector('#title_sentence_sentence');
  const parentForm = document.querySelector('#parent');
  const dupTxtBox = textSentence.cloneNode(true);
  dupTxtBox.id = 'text_sentence_sentence' + i;
  
  // 親要素のある子要素を、最後の子要素の前に追加する
  const submitBtn = document.querySelector('#submit');
  parentForm.insertBefore(dupTxtBox, submitBtn);

  // 削除ボタンの追加
  const buttonData = document.createElement('button');
  buttonData.innerHTML = "削除";
  buttonData.id = "button" + i;
  buttonData.classList.add('btn-secondary');
  parentForm.insertBefore(buttonData, dupTxtBox.nextSibling);

  i++;
}

addForm.addEventListener('click', addFormFunction);

// 動的に追加した要素を取得
const target = document.querySelector("#parent");
const observer = new MutationObserver((mutationList) => {
  mutationList.forEach(mutation => {
    console.log(mutation);
    mutation.addedNodes.forEach(node => {
      node.addEventListener('click', function() {
        this.remove();
      });
    })
  });
});

const config = {childList: true};
observer.observe(target, config);

