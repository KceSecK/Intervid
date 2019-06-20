//Se utiliza para que el campo de texto solo acepte numeros
          function SoloNumeros(evt){
           if(window.event){//asignamos el valor de la tecla a keynum
           keynum = evt.keyCode; //IE
           }
          else{ 
           keynum = evt.which; //FF
           } 
          //comprobamos si se encuentra en el rango numérico y que teclas no recibirá.
           if((keynum > 47 && keynum < 58) || keynum == 8 || keynum == 13 || keynum == 6 || keynum == 43 ){
           return true;
           }
          else{
           return false;
           }
           }