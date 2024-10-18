
document.addEventListener('DOMContentLoaded', function() {
    const cards = document.querySelectorAll('.card.card-default');
    cards.forEach(card => {
        card.classList.add('animate');
    });
});