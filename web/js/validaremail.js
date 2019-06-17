
function validarEmail(valor)
{
    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,6})+$/.test(valor)) {
        return(true);
    } else {
        return (false);
    }
}