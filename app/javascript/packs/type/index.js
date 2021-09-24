const typedField = document.getElementById('typed');
const untypedField = document.getElementById('untyped');

const strs = [
  'be crowded with',
  'take a day off',
  'at work',
  'look out',
  'by means of ~',
  'catch sight of ~'
];


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

document.addEventListener('keydown', function(e) {
  if (e.key !== untyped.substring(0, 1)) { return; }
  typed += untyped.substring(0, 1);
  untyped = untyped.substring(1);

  updateTextField();

  if (untyped === '') {
    next();
  }
});

next();