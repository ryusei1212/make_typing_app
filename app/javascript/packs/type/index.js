const typedField = document.getElementById('typed');
const untypedField = document.getElementById('untyped');
const resultScreen = document.querySelector('.result-screen');
const freeModeLink = document.querySelector('.free-mode-link');

const input = document.querySelector('input');
const value = input.getAttribute('value');
const texts = JSON.parse(value);

// 問題文
let strs = texts;

let missTypeCount = 0;
let successTypeCount = 0;

 function keyDownEventStart (e) {
  if(strs.length === 0){ return ;}

  if (e.key !== untyped.substring(0, 1)){
    missTypeCount += 1;
    return;
  }

  successTypeCount += 1;
  typed += untyped.substring(0, 1);
  untyped = untyped.substring(1);

  updateTextField();

  if (untyped === '') {
    next();
  }
};


function randomInt(max) {
  return Math.floor(Math.random() * Math.floor(max));
}

function nextString() {
  const idx = randomInt(strs.length);
  return strs[idx];
}

function updateTextField() {
  typedField.textContent = typed;
  untypedField.textContent = untyped;
}

function next() {
  if(strs.length === 0){
    resultScreen.textContent = `入力文字数 ${successTypeCount } ミスタイプ数 ${missTypeCount}`;
    styleOpen();
  }

  typed = '';
  untyped = nextString();
  updateTextField();
}

// タイトル一覧へのリンクを表示
function styleOpen() {
  freeModeLink.style.display = "block";
}

document.addEventListener('keydown', keyDownEventStart);

function deleteString() {
  const filterItem = strs.filter(function(typedString) {
    return typedString !== typed;
  })
  strs = filterItem;
}

next();
