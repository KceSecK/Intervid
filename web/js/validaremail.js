
function validarEmail(valor)
{
    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,6})+$/.test(valor)) {
        document.getElementById("txtco").setAttribute("class", "text-intervid");
        return(true);
    } else {
        return (false);
    }
}