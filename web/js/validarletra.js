function soloLetras(e) {
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toString();
    letras = " áéíóúabcdefghijklmnñopqrstuvwxyzÁÉÍÓÚABCDEFGHIJKLMNÑOPQRSTUVWXYZ";//Se define todo el abecedario que se quiere que se muestre.
    especiales = [8, 37, 39, 46, 6]; //Es la validación del KeyCodes, que teclas recibe el campo de texto.

    tecla_especial = false
    for (var i in especiales) {
        if (key == especiales[i]) {
            tecla_especial = true;
            break;
        }
    }

    if (letras.indexOf(tecla) == -1 && !tecla_especial) {
        return false;
    }
}

function charcountupdate(str) {
    var lng = str.length;
    document.getElementById("charcount").innerHTML = lng + ' de 2000 caracteres';
}

function charcountupdate2(str) {
    var lng = str.length;
    document.getElementById("charcount2").innerHTML = lng + ' de 5000 caracteres';
}

function charcountupdate3(str) {
    var lng = str.length;
    document.getElementById("charcount3").innerHTML = lng + ' de 5000 caracteres';
}