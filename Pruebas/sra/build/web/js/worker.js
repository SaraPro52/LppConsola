this.addEventListener('message', function (e) {
    var data = e.data;
    
    var xhr = new XMLHttpRequest();
    xhr.open("POST","../"+ data[0] +"?data="+data[1], true);
    xhr.setRequestHeader('Content-type', 'application/json; charset=utf-8');
    xhr.onload = function (e) {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                console.log(e);
                console.log(xhr.responseText);
            } else {
                console.error(xhr.statusText);
            }
        }
    };
    xhr.onerror = function (e) {
        console.log(e);
        console.error(xhr.statusText);
    };
    xhr.send();
    console.log(xhr);
    this.postMessage(data);
}, false);
