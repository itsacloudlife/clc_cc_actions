function updateCardColors() {
    var cards = document.getElementsByClassName('card');
    for (var i = 0; i < cards.length; i++) {
        var card = cards[i];
        var value = card.querySelector('.value');
        if (value) {
            var count = parseInt(value.textContent);
            if (count > 0) {
                card.style.backgroundColor = 'red';
            } else {
                card.style.backgroundColor = 'green';
            }
        }
    }
}
setTimeout(updateCardColors, 1000);
