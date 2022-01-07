const typedField = document.getElementById('typed');
const untypedField = document.getElementById('untyped');

const input = document.querySelector('input');
const value = input.getAttribute('value');
const jsonValue = JSON.parse(value);

const strs = jsonValue;

 function eventListener (e) {
   console.log(e);
  if (e.key !== untyped.substring(0, 1)) { return; }
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
  typed = '';
  untyped = nextString();
  updateTextField();
}

document.removeEventListener('keydown', eventListener);
document.addEventListener('keydown', eventListener);
next();
