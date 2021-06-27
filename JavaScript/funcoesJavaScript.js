function abreData(strCampo, strForm) {
    var x = event.clientX - 266;
    var y = event.clientY;
    window.open('calendario.asp?acoes=<%= request("acoes") %>&strCampo=' + strCampo + '&strForm=' + strForm + '', 'Calendario', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,menubar=no,top=' + y + ',left=' + x + ',width=226,height=170');
}

function mascara(o, f) {
    v_obj = o
    v_fun = f
    setTimeout("execmascara()", 1)
}

function execmascara() {
    v_obj.value = v_fun(v_obj.value)
}

function leech(v) {
    v = v.replace(/o/gi, "0")
    v = v.replace(/i/gi, "1")
    v = v.replace(/z/gi, "2")
    v = v.replace(/e/gi, "3")
    v = v.replace(/a/gi, "4")
    v = v.replace(/s/gi, "5")
    v = v.replace(/t/gi, "7")
    return v
}

function soNumeros(v) {
    return v.replace(/\D/g, "")
}

function telefone(v) {
    v = v.replace(/\D/g, "")                 //Remove tudo o que não é dígito
    v = v.replace(/^(\d\d)(\d)/g, "($1) $2") //Coloca parênteses em volta dos dois primeiros dígitos
    v = v.replace(/(\d{4})(\d)/, "$1-$2")    //Coloca hífen entre o quarto e o quinto dígitos
    return v
}

function celular(v) {
    v = v.replace(/\D/g, "")                 //Remove tudo o que não é dígito
    v = v.replace(/^(\d\d)(\d)/g, "($1) $2") //Coloca parênteses em volta dos dois primeiros dígitos

    if (v.substring(0, 4) == "(11)") {
        if (v.substring(5, 6) == "9") {
            v = v.replace(/(\d{5})(\d)/, "$1-$2")    //Coloca hífen entre o quarto e o quinto dígitos
            v = v.substring(0, 15);
        }
        else {
            v = v.replace(/(\d{4})(\d)/, "$1-$2")    //Coloca hífen entre o quarto e o quinto dígitos
            v = v.substring(0, 14);
        }
    }
    else{
        v = v.replace(/(\d{4})(\d)/, "$1-$2")    //Coloca hífen entre o quarto e o quinto dígitos
        v = v.substring(0, 14);
    }
    return v
}

function telefoneSemDDD(v) {
    v = v.replace(/\D/g, "")                 //Remove tudo o que não é dígito
    v = v.replace(/(\d{4})(\d)/, "$1-$2")    //Coloca hífen entre o quarto e o quinto dígitos
    return v
}

function cpf(v) {
    v = v.replace(/\D/g, "")                    //Remove tudo o que não é dígito
    v = v.replace(/(\d{3})(\d)/, "$1.$2")       //Coloca um ponto entre o terceiro e o quarto dígitos
    v = v.replace(/(\d{3})(\d)/, "$1.$2")       //Coloca um ponto entre o terceiro e o quarto dígitos
    //de novo (para o segundo bloco de números)
    v = v.replace(/(\d{3})(\d{1,2})$/, "$1-$2") //Coloca um hífen entre o terceiro e o quarto dígitos
    return v
}

function data(v) {
    v = v.replace(/\D/g, "")                    //Remove tudo o que não é dígito
    v = v.replace(/(\d{2})(\d)/, "$1/$2")       //Coloca um / entre o segundo e o terceiro dígitos
    v = v.replace(/(\d{2})(\d)/, "$1/$2")       //Coloca um / entre o segundo e o terceiro dígitos
    return v
}

function cep(v) {
    v = v.replace(/\D/g, "")                 //Remove tudo o que não é dígito
    v = v.replace(/(\d{5})(\d)/, "$1-$2")    //Coloca hífen entre o quinto e o sexto dígitos
    return v
}

function cnpj(v) {
    v = v.replace(/\D/g, "")                           //Remove tudo o que não é dígito
    v = v.replace(/^(\d{2})(\d)/, "$1.$2")             //Coloca ponto entre o segundo e o terceiro dígitos
    v = v.replace(/^(\d{2})\.(\d{3})(\d)/, "$1.$2.$3") //Coloca ponto entre o quinto e o sexto dígitos
    v = v.replace(/\.(\d{3})(\d)/, ".$1/$2")           //Coloca uma barra entre o oitavo e o nono dígitos
    v = v.replace(/(\d{4})(\d)/, "$1-$2")              //Coloca um hífen depois do bloco de quatro dígitos
    return v
}

function romanos(v) {
    v = v.toUpperCase()             //Maiúsculas
    v = v.replace(/[^IVXLCDM]/g, "") //Remove tudo o que não for I, V, X, L, C, D ou M
    //Essa é complicada! Copiei daqui: http://www.diveintopython.org/refactoring/refactoring.html
    while (v.replace(/^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/, "") != "")
        v = v.replace(/.$/, "")
    return v
}

function site(v) {
    //Esse sem comentarios para que você entenda sozinho ;-)
    v = v.replace(/^http:\/\/?/, "")
    dominio = v
    caminho = ""
    if (v.indexOf("/") > -1)
        dominio = v.split("/")[0]
    caminho = v.replace(/[^\/]*/, "")
    dominio = dominio.replace(/[^\w\.\+-:@]/g, "")
    caminho = caminho.replace(/[^\w\d\+-@:\?&=%\(\)\.]/g, "")
    caminho = caminho.replace(/([\?&])=/, "$1")
    if (caminho != "") dominio = dominio.replace(/\.+$/, "")
    v = "http://" + dominio + caminho
    return v
}


// Formata Valor --------------------------------------------------------------------------------------
documentall = document.all;

function formatamoney(c) {
    var t = this; if (c == undefined) c = 2;
    var p, d = (t = t.split("."))[1].substr(0, c);
    for (p = (t = t[0]).length; (p -= 3) >= 1; ) {
        t = t.substr(0, p) + "." + t.substr(p);
    }
    return t + "," + d + Array(c + 1 - d.length).join(0);
}

String.prototype.formatCurrency = formatamoney

function demaskvalue(valor, currency) {
    /*
    * Se currency é false, retorna o valor sem apenas com os números. Se é true, os dois últimos caracteres são considerados as 
    * casas decimais
    */
    var val2 = '';
    var strCheck = '0123456789';
    var len = valor.length;
    if (len == 0) {
        return 0.00;
    }

    if (currency == true) {
        /* Elimina os zeros à esquerda 
        * a variável  <i> passa a ser a localização do primeiro caractere após os zeros e 
        * val2 contém os caracteres (descontando os zeros à esquerda)
        */

        for (var i = 0; i < len; i++)
            if ((valor.charAt(i) != '0') && (valor.charAt(i) != ',')) break;

        for (; i < len; i++) {
            if (strCheck.indexOf(valor.charAt(i)) != -1) val2 += valor.charAt(i);
        }

        if (val2.length == 0) return "0.00";
        if (val2.length == 1) return "0.0" + val2;
        if (val2.length == 2) return "0." + val2;

        var parte1 = val2.substring(0, val2.length - 2);
        var parte2 = val2.substring(val2.length - 2);
        var returnvalue = parte1 + "." + parte2;
        return returnvalue;

    }
    else {
        /* currency é false: retornamos os valores COM os zeros à esquerda, 
        * sem considerar os últimos 2 algarismos como casas decimais 
        */
        val3 = "";
        for (var k = 0; k < len; k++) {
            if (strCheck.indexOf(valor.charAt(k)) != -1) val3 += valor.charAt(k);
        }
        return val3;
    }
}

function reais(obj, event) {

    var whichCode = (window.Event) ? event.which : event.keyCode;
    /*
    Executa a formatação após o backspace nos navegadores !document.all
    */
    if (whichCode == 8 && !documentall) {
        /*
        Previne a ação padrão nos navegadores
        */
        if (event.preventDefault) { //standart browsers
            event.preventDefault();
        } else { // internet explorer
            event.returnValue = false;
        }
        var valor = obj.value;
        var x = valor.substring(0, valor.length - 1);
        obj.value = demaskvalue(x, true).formatCurrency();
        return false;
    }
    /*
    Executa o Formata Reais e faz o format currency novamente após o backspace
    */
    FormataReais(obj, '.', ',', event);
} // end reais


function backspace(obj, event) {
    /*
    Essa função basicamente altera o  backspace nos input com máscara reais para os navegadores IE e opera.
    O IE não detecta o keycode 8 no evento keypress, por isso, tratamos no keydown.
    Como o opera suporta o infame document.all, tratamos dele na mesma parte do código.
    */

    var whichCode = (window.Event) ? event.which : event.keyCode;
    if (whichCode == 8 && documentall) {
        var valor = obj.value;
        var x = valor.substring(0, valor.length - 1);
        var y = demaskvalue(x, true).formatCurrency();

        obj.value = ""; //necessário para o opera
        obj.value += y;

        if (event.preventDefault) { //standart browsers
            event.preventDefault();
        } else { // internet explorer
            event.returnValue = false;
        }
        return false;

    } // end if		
} // end backspace

function FormataReais(fld, milSep, decSep, e) {
    var sep = 0;
    var key = '';
    var i = j = 0;
    var len = len2 = 0;
    var strCheck = '0123456789';
    var aux = aux2 = '';
    var whichCode = (window.Event) ? e.which : e.keyCode;

    //if (whichCode == 8 ) return true; //backspace - estamos tratando disso em outra função no keydown
    if (whichCode == 0) return true;
    if (whichCode == 9) return true; //tecla tab
    if (whichCode == 13) return true; //tecla enter
    if (whichCode == 16) return true; //shift internet explorer
    if (whichCode == 17) return true; //control no internet explorer
    if (whichCode == 27) return true; //tecla esc
    if (whichCode == 34) return true; //tecla end
    if (whichCode == 35) return true; //tecla end
    if (whichCode == 36) return true; //tecla home

    /*
    O trecho abaixo previne a ação padrão nos navegadores. Não estamos inserindo o caractere normalmente, mas via script
    */

    if (e.preventDefault) { //standart browsers
        e.preventDefault()
    } else { // internet explorer
        e.returnValue = false
    }

    var key = String.fromCharCode(whichCode);  // Valor para o código da Chave
    if (strCheck.indexOf(key) == -1) return false;  // Chave inválida

    /*
    Concatenamos ao value o keycode de key, se esse for um número
    */
    fld.value += key;

    var len = fld.value.length;
    var bodeaux = demaskvalue(fld.value, true).formatCurrency();
    fld.value = bodeaux;

    /*
    Essa parte da função tão somente move o cursor para o final no opera. Atualmente não existe como movê-lo no konqueror.
    */
    if (fld.createTextRange) {
        var range = fld.createTextRange();
        range.collapse(false);
        range.select();
    }
    else if (fld.setSelectionRange) {
        fld.focus();
        var length = fld.value.length;
        fld.setSelectionRange(length, length);
    }
    return false;

}



function formataValorMonetario(campooriginal, decimais) {
    var posicaoPontoDecimal;
    var campo = '';
    var resultado = '';
    var pos, sep, dec;

    //Retira possiveis separadores de milhar
    for (pos = 0; pos < campooriginal.value.length; pos++) {
        if (campooriginal.value.charAt(pos) != '.')
            campo = campo + campooriginal.value.charAt(pos);
    }

    //Formata valor monetário com decimais
    posicaoPontoDecimal = campo.indexOf(',');
    if (posicaoPontoDecimal != -1) {
        sep = 0;
        for (pos = posicaoPontoDecimal - 1; pos >= 0; pos--) {
            sep++;
            if (sep > 3) {
                resultado = '.' + resultado;
                sep = 1;
            }

            resultado = campo.charAt(pos) + resultado;
        }

        // Trata parte decimal
        if (parseInt(decimais) > 0) {
            resultado = resultado + ',';

            pos = posicaoPontoDecimal + 1;
            for (dec = 1; dec <= parseInt(decimais); dec++) {
                if (pos < campo.length) {
                    resultado = resultado + campo.charAt(pos);
                    pos++;
                }
                else
                    resultado = resultado + '0';
            }

        } // trata decimais
    }
    // Trata valor monetário sem decimais
    else {
        sep = 0;
        for (pos = campo.length - 1; pos >= 0; pos--) {
            sep++;
            if (sep > 3) {
                resultado = '.' + resultado;
                sep = 1;
            }
            resultado = campo.charAt(pos) + resultado;
        }
        // Trata parte decimal
        if (parseInt(decimais) > 0) {
            resultado = resultado + ',';
            for (dec = 1; dec <= parseInt(decimais); dec++) {
                resultado = resultado + '0';
            }
        } // trata decimais
    }
    campooriginal.value = resultado;
}

function showHide(ID) {
    if (document.getElementById(ID).style.display == "none") {
        document.getElementById(ID).style.display = "";
        //document.getElementById(ID + "span").innerHTML = " [-] ";
    }
    else {
        document.getElementById(ID).style.display = "none";
        //document.getElementById(ID + "span").innerHTML = " [+] ";
    }
}

function ValidaEmail(campo) {
	if (campo.value != ""){
		var checa = campo.value
		pos = checa.indexOf(".")
		if (pos == -1){
			alert("Por favor, preencha o Email corretamente!\nExemplo: nome@dominio.com.br.");
			campo.focus();
			campo.value = "";
			return(false);
		}else{
			pos = checa.indexOf("@")
			if (pos == -1) {
				alert("Por favor, preencha o Email corretamente!\nExemplo: nome@dominio.com.br.");
				campo.focus();
				campo.value = "";
				return(false);
			}
		}
	}else{
		alert("Email é um campo obritatório !");	
		campo.focus();
		return (false);
	}
}
