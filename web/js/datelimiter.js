/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var max = new Date();
var min = new Date();
var dd = max.getDate();
var mm = max.getMonth() + 1; //January is 0!
var yyyy = max.getFullYear() - 15;
var yyyymin = max.getFullYear() - 100;
if (dd < 10) {
    dd = '0' + dd;
}
if (mm < 10) {
    mm = '0' + mm;
}
max = yyyy + '-' + mm + '-' + dd;
min = yyyymin + '-' + mm + '-' + dd;
document.getElementById("datefield").setAttribute("max", max);
document.getElementById("datefield").setAttribute("min", min);
