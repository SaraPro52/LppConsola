$(document).ready(function () {
    
      $('#fullpage').fullpage({
        sectionsColor: ['#1bbc9b', '#4BBFC3', '#7BAABE'],
        anchors: ['firstPage', 'secondPage', '3rdPage', 'FourPage'],
        menu: '#menu',
        loopTop: true,
        loopBottom: true
    });
    $('#audio').click(function () {
        var music = $('<audio/>', {
            'src': 'music/Through The Years And Far Away.mp3',
            'autoplay': 'autoplay'
        });
        $('#audio').append(music);
    })

    $('#audioDavid').click(function () {
        var music = $('<audio/>', {
            'src': 'music/As the Deer.mp3',
            'autoplay': 'autoplay'
        });
        $('#audio').append(music);
    })
});
