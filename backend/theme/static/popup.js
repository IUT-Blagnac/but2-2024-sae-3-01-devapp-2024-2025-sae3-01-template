// Permet de récupérer des données simulées ou réelles
function fetchData(roomName) {
    const realData = {
        temperature: null,
        humidity: null,
        co2: null,
        eco2: null
    };

    // Données de test si les données réelles ne sont pas disponibles
    const testData = {
        temperature: '22°C',
        humidity: '45%',
        co2: '400 ppm',
        eco2: '450 ppm'
    };

    return {
        temperature: realData.temperature || testData.temperature,
        humidity: realData.humidity || testData.humidity,
        co2: realData.co2 || testData.co2,
        eco2: realData.eco2 || testData.eco2
    };
}

// Permet d'afficher le popup
function showPopup(element) {
    const popup = document.getElementById('popup');
    const roomName = element.getAttribute('data-room');

    // récupération des données
    const data = fetchData(roomName);

    // on met à jour les valeurs du popup
    document.getElementById('popup-title').innerText = `Données en ${roomName}`;
    document.getElementById('temp-value').innerText = data.temperature;
    document.getElementById('humidity-value').innerText = data.humidity;
    document.getElementById('co2-value').innerText = data.co2;
    document.getElementById('eco2-value').innerText = data.eco2;

    // permet de positionner le popup à côté de l'élément cliqué
    const rect = element.getBoundingClientRect();
    popup.style.top = `${rect.top + window.scrollY + element.offsetHeight}px`;
    popup.style.left = `${rect.left + window.scrollX}px`;

    // Afficher le popup
    popup.style.display = 'block';
}

// Permet de cacher le popup
function hidePopup() {
    document.getElementById('popup').style.display = 'none';
}

// Permet de cacher le popup en cliquant à l'extérieur
document.addEventListener('click', (event) => {
    const popup = document.getElementById('popup');
    const isClickInside = popup.contains(event.target) || event.target.classList.contains('trigger-btn') || event.target.hasAttribute('data-room');
    if (!isClickInside) {
        hidePopup();
    }
});

// Permet d'ajouter les événements aux boutons
document.querySelectorAll('.trigger-btn').forEach(button => {
    button.addEventListener('click', () => showPopup(button));
});

// Permet d'ajouter les événements aux salles
document.querySelectorAll('path[data-room]').forEach(path => {
    path.addEventListener('click', () => showPopup(path));
});

// Permet d'ajouter l'événement au bouton de fermeture
document.querySelector('.close-btn').addEventListener('click', hidePopup);