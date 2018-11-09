console.log('ITS ALIVE')
var remover = document.querySelector('#delete_before')
var selectStat = document.querySelector('#select_stat')
var textStat = document.querySelector('#text_stat')
var clubSelect = document.querySelector('#select_club')
var playerSelect = document.querySelector('#select_player')
var check_player_form = document.querySelector("#check_player")
var check_result = document.querySelector("#check_result")

if (remover) {
  remover.addEventListener('click', function (event) {
    var button = event.target
    button.parentNode.removeChild(button.previousSibling)
    if (button.previousSibling.localName === 'label') button.classList.add('hidden')
  })
}

document.addEventListener('click', function (event) {
  var button = event.target
  if (!button.classList.contains('add_to_formula')) return
  var selectStatClone = selectStat.cloneNode(true)
  var textStatClone = textStat.cloneNode(true)
  selectStatClone.classList.remove('hidden')
  textStatClone.classList.remove('hidden')
  remover.classList.remove('hidden')
  var type = button.dataset.type
  var prependElement

  switch (type) {
    case 'select':
      prependElement = selectStatClone
      break;
    case 'input':
      prependElement = textStatClone
      break;
    default:
      prependElement = textStatClone
  }

  button.parentNode.insertBefore(prependElement, remover)
})

function getClub (selected) {
  var xhr = new XMLHttpRequest();
  playerSelect.options.length = 0;
  xhr.open('GET', '/async/club/' + selected.value + '/players', true);
  xhr.setRequestHeader('Content-type', 'application/json; charset=utf-8');
  xhr.onload = function () {
    var players = JSON.parse(xhr.responseText);
    for (id in players) {
      var option = new Option(players[id], id, false, false);
      playerSelect.add(option);
    }
    playerSelect.parentNode.classList.remove('hidden');
  }
  xhr.send(null);
}

check_player_form.addEventListener('submit', function (event) {
  event.preventDefault();
  check_result.innerHTML = 'checking...';
  var rate_id = check_player_form.querySelector('input[name="check_rate_id"]').value;
  var xhr = new XMLHttpRequest();
  xhr.open('GET', '/async/check/' + playerSelect.value + '?rate_id=' + rate_id, true);
  xhr.onload = function () {
    check_result.innerHTML = JSON.parse(xhr.responseText)['result'];
  }
  xhr.send(null);
});
