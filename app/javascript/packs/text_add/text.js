let i = 1;

addForm.addEventListener('click', function(){
  const addForm = document.querySelector('#addForm');
  const textSentence = document.querySelector('#text_sentence');
  const parentForm = document.querySelector('#parent');
  const dupTexBox = textSentence.cloneNode(false);
  dupTexBox.id = 'text_sentece' + i;
  i++;
  parentForm.appendChild(dupTexBox);
})
