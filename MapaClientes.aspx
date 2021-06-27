<%@ Page 
    Title="" 
    Language="C#" 
    MasterPageFile="~/SigeeMaster.Master" 
    AutoEventWireup="true" 
    CodeBehind="MapaClientes.aspx.cs" 
    Inherits="Sigee.MapaClientes" 
%>

<asp:Content ID="Content1" ContentPlaceHolderID="cphConteudoPrincipal" runat="server">
    <asp:MultiView runat="server" ID="multiview">
        <asp:View ID="view" runat="server">
            <div class="row mt">
                <div class="col-lg-12">
                    <%--<input type="button" onclick="LimparMarcador()" />--%>
                    
                     <input type="radio" name="group" value="book_folder" onchange="initMap()" />Todos
                    <input type="radio" name="group" value="book_folder" onchange="initMap()" />Clientes
                    <input type="radio" name="group" value="book_chapter" onchange="initMap()" checked="checked" />Funcionários

                    <div>
                        Funcionário:
                        <asp:DropDownList 
                            runat="server" 
                            ID="ddlFuncionario">
                        </asp:DropDownList> 
                        Data:
                        <asp:TextBox 
                            runat="server" 
                            ID="txtDataTrajeto"
                            MaxLength="10">
                        </asp:TextBox>
                        <input type="button" value="Traçar Trajeto" onclick="InicioRota();" />
                        <input type="button" value="Limpar" onclick="removeline();" />
                    </div>

                    <div id="map" style="height:500px;"></div>
                     
                    <!--Inicio dos scripts-->
                    <script src="Scripts/Bootstrap/jquery-1.9.1.min.js"></script>
                    <script src="JavaScript/Validations.js"></script>

                    <script>
                        var map;
                        var markers = [];
                        var infowindow;
                        var image = '';
                        var poly;
                        
                        function initMap() {

                            var valorSessionEmpr = '<%= Session["CodEmpr"] %>';
                            //var conteudo;
                            var nomeWebMethod;

                            //0-Cliente 1-Funcionário
                            var opcao = RetornarOpcaoRadio();

                            image = ((opcao == 1) ? 'Imagens/icone_logo_aplicativo.ico' : 'Imagens/icone_funcionario_p.png');

                            //Retorna nome do WebMethod de acordo com a opção
                            if (opcao == 1) {
                                nomeWebMethod = "RetornarClientes";
                            }
                            else {
                                if (opcao == 2)
                                    nomeWebMethod = "RetornarFuncionarios";
                                else
                                    nomeWebMethod = "RetornarClientesFuncionarios";
                            }

                            //Utiliza o Ajax para retornar os clientes ou os funcionários dependendo da escolha
                            $.ajax({
                                url: "MapaClientes.aspx/" + nomeWebMethod, //URL da página com o WebMethod 
                                data: "{codEmpr:'" + valorSessionEmpr + "'}", //Enviar os parâmetros
                                type: "POST", //Tipo do envio (POST ou GET)
                                dataType: "json", //Tipo retorno dos dados
                                contentType: "application/json; charset=utf-8", //Conteúdo do retorno (header)

                                //Função de sucesso do retorno dos dados feita pelo ajax
                                success: function (retorno) {

                                    //console.log(retorno.d);

                                    //Configuração inicial do map (classe Map)
                                    map = new google.maps.Map(document.getElementById('map'), {
                                        center: new google.maps.LatLng(-23.5501138, -46.6334482),
                                        scrollwheel: true,
                                        zoom: 12
                                    });

                                    //console.log(retorno.d);

                                    //Objeto que guarda as posições de latitude e longitude
                                    var bounds = new google.maps.LatLngBounds();

                                    //Nome do funcionário ou do cliente de acordo com a opção
                                    var nomeFuncCli;

                                    //Endereço do cliente ou do funcionário de acordo com a opção
                                    var enderecoFuncCli;

                                    var bateriaFunc;
                                    var dataUltimaAtu;
                                    var valorData;

                                    var codUsu = 0;
                                    var compare = false;

                                    //Início do loop
                                    for (var i = 0; i < retorno.d.length; i++) {
                                        var latlng;
                                        
                                        if (opcao == 1) {
                                            latlng = new google.maps.LatLng(Number(retorno.d[i].LatitudeEnd), Number(retorno.d[i].LongitudeEnd));
                                            nomeFuncCli = retorno.d[i].RazaoCli;
                                            enderecoFuncCli = retorno.d[i].LogrEnd
                                            bateriaFunc = "";
                                            dataUltimaAtu = "";

                                            //Cria os marcadores
                                            CriarMarcador(latlng, nomeFuncCli, enderecoFuncCli, opcao, bateriaFunc, dataUltimaAtu, 'Imagens/icone_logo_aplicativo.ico');

                                            //Adiciona as longitudes e latitudes
                                            bounds.extend(latlng);
                                        }
                                        else {
                                            if (opcao == 2) {
                                                console.log(retorno.d);

                                                latlng = new google.maps.LatLng(Number(retorno.d[i].Latitude), Number(retorno.d[i].Longitude));
                                                nomeFuncCli = retorno.d[i].NomeFunc;
                                                bateriaFunc = retorno.d[i].Bateria;
                                                valorData = retorno.d[i].DtHrHistorico;
                                                enderecoFuncCli = retorno.d[i].Endereco;

                                                dataUltimaAtu = new Date(parseInt(valorData.substr(6)));
                                                dataUltimaAtu = dataUltimaAtu.toLocaleString();

                                                //Cria os marcadores
                                                CriarMarcador(latlng, nomeFuncCli, enderecoFuncCli, opcao, bateriaFunc, dataUltimaAtu, 'Imagens/icone_funcionario_p.png');

                                                //Adiciona as longitudes e latitudes
                                                bounds.extend(latlng);
                                            }
                                            else {
                                                console.log(retorno.d);

                                                if (codUsu == 0) {
                                                    
                                                    if (retorno.d[i].Funcionario == undefined)
                                                        codUsu = retorno.d[i].ClienteFuncionario.Funcionario.CodUsu;
                                                    else
                                                        codUsu = retorno.d[i].Funcionario.CodUsu;

                                                    compare = true;
                                                }

                                                if (retorno.d[i].Funcionario == undefined) {
                                                    if (codUsu == retorno.d[i].ClienteFuncionario.Funcionario.CodUsu && i > 0)
                                                        compare = false;
                                                }
                                                else {
                                                    if (codUsu == retorno.d[i].Funcionario.CodUsu && i > 0)
                                                        compare = false;
                                                }

                                                var _nomeFuncCli = ((retorno.d[i].Funcionario != undefined) ? retorno.d[i].Funcionario.NomeFunc : retorno.d[i].ClienteFuncionario.Funcionario.NomeFunc);
                                                var _bateriaFunc = ((retorno.d[i].Funcionario != undefined) ? retorno.d[i].Funcionario.Bateria : retorno.d[i].ClienteFuncionario.Funcionario.Bateria);
                                                var _valorData = ((retorno.d[i].Funcionario != undefined) ? retorno.d[i].Funcionario.DtHrHistorico : retorno.d[i].ClienteFuncionario.Funcionario.DtHrHistorico);
                                                var _enderecoFuncCli = ((retorno.d[i].Funcionario != undefined) ? retorno.d[i].Funcionario.Endereco : retorno.d[i].ClienteFuncionario.Funcionario.Endereco);

                                                if (compare) {

                                                    var _Latitude = ((retorno.d[i].Funcionario == undefined) ? Number(retorno.d[i].ClienteFuncionario.Funcionario.Latitude) : Number(retorno.d[i].Funcionario.Latitude));
                                                    var _Longitude = ((retorno.d[i].Funcionario == undefined) ? Number(retorno.d[i].ClienteFuncionario.Funcionario.Longitude) : Number(retorno.d[i].Funcionario.Longitude));

                                                    latlng = new google.maps.LatLng(_Latitude, _Longitude);
                                                    nomeFuncCli = _nomeFuncCli;
                                                    bateriaFunc = _bateriaFunc;
                                                    valorData = _valorData;
                                                    enderecoFuncCli = _enderecoFuncCli;
                                                    dataUltimaAtu = new Date(parseInt(valorData.substr(6)));
                                                    dataUltimaAtu = dataUltimaAtu.toLocaleString();

                                                    CriarMarcador(latlng, nomeFuncCli, enderecoFuncCli, opcao, bateriaFunc, dataUltimaAtu, 'Imagens/icone_funcionario_p.png');
                                                    bounds.extend(latlng);

                                                    // Por utilizar outro tipo de web method, via code behind com .NET Linq.
                                                    if (retorno.d[i].Funcionario == undefined) {
                                                        _nomeFuncCli = ((retorno.d[i].Cliente != undefined) ? retorno.d[i].Cliente.RazaoCli : retorno.d[i].ClienteFuncionario.Cliente.RazaoCli);
                                                        _enderecoFuncCli = ((retorno.d[i].Cliente != undefined) ? retorno.d[i].Cliente.LogrEnd : retorno.d[i].ClienteFuncionario.Cliente.LogrEnd);

                                                        var _Latitude = ((retorno.d[i].Cliente == undefined) ? Number(retorno.d[i].ClienteFuncionario.Cliente.LatitudeEnd) : Number(retorno.d[i].Cliente.LatitudeEnd));
                                                        var _Longitude = ((retorno.d[i].Cliente == undefined) ? Number(retorno.d[i].ClienteFuncionario.Cliente.LongitudeEnd) : Number(retorno.d[i].Cliente.LongitudeEnd));

                                                        latlng = new google.maps.LatLng(_Latitude, _Longitude);
                                                        nomeFuncCli = _nomeFuncCli;
                                                        enderecoFuncCli = _enderecoFuncCli;
                                                        bateriaFunc = "";
                                                        dataUltimaAtu = "";

                                                        CriarMarcador(latlng, nomeFuncCli, enderecoFuncCli, opcao, bateriaFunc, dataUltimaAtu, 'Imagens/icone_logo_aplicativo.ico');
                                                        bounds.extend(latlng);
                                                    }
                                                }
                                                else {
                                                    _nomeFuncCli = ((retorno.d[i].Cliente != undefined) ? retorno.d[i].Cliente.RazaoCli : retorno.d[i].ClienteFuncionario.Cliente.RazaoCli);
                                                    _enderecoFuncCli = ((retorno.d[i].Cliente != undefined) ? retorno.d[i].Cliente.LogrEnd : retorno.d[i].ClienteFuncionario.Cliente.LogrEnd);

                                                    var _Latitude = ((retorno.d[i].Cliente == undefined) ? Number(retorno.d[i].ClienteFuncionario.Cliente.LatitudeEnd) : Number(retorno.d[i].Cliente.LatitudeEnd));
                                                    var _Longitude = ((retorno.d[i].Cliente == undefined) ? Number(retorno.d[i].ClienteFuncionario.Cliente.LongitudeEnd) : Number(retorno.d[i].Cliente.LongitudeEnd));

                                                    latlng = new google.maps.LatLng(_Latitude, _Longitude);
                                                    nomeFuncCli = _nomeFuncCli;
                                                    enderecoFuncCli = _enderecoFuncCli;
                                                    bateriaFunc = "";
                                                    dataUltimaAtu = "";

                                                    CriarMarcador(latlng, nomeFuncCli, enderecoFuncCli, opcao, bateriaFunc, dataUltimaAtu, 'Imagens/icone_logo_aplicativo.ico');
                                                    bounds.extend(latlng);
                                                }
                                            }
                                        }

                                    //Fim do loop
                                    }

                                    //Mostar todos os ponteiros (acha o melhor zoom para todos ficarem visíveis
                                    map.fitBounds(bounds);
                                },
                                //Função de erro do retorno dos dados feita pelo ajax
                                error: function (req, status, error) {
                                    alert(error);
                                }
                            });
                        }
                        
                        //Função para criar marcadores
                        function CriarMarcador(latLong, cliente, endereco, opcao, bateria, ultimaAtualizacao, _image) {
                            var marker = new google.maps.Marker({
                                map: map,
                                position: latLong,
                                title: cliente,
                                icon: _image
                            });

                            google.maps.event.addListener(marker, 'click', function () {

                                var conteudo;

                                if (opcao == 1 || _image != 'Imagens/icone_funcionario_p.png') {
                                    conteudo = 'Cliente: ' + cliente + '<br />Endereço: ' + endereco;
                                }
                                else
                                    conteudo = 'Funcionário: ' + cliente + '<br />Endereço: ' + endereco + '<br /> Bateria:' + bateria + ' %' + '<br /> Última Atualização: ' + ultimaAtualizacao;

                                infowindow = new google.maps.InfoWindow({
                                    content: conteudo
                                });

                                infowindow.open(map, marker);
                                setPosition();
                            });

                            markers.push(marker);
                        }
                        
                        //Função para limpar todos os marcadores
                        function LimparMarcador()
                        {
                            for (var i = 0; i < markers.length; i++) {
                                markers[i].setMap(null);
                            }

                            markers = [];
                        }

                        //Retornar a opção do radiobutton
                        function RetornarOpcaoRadio() {
                            var ele = document.getElementsByName('group');
                            var opcao;

                            for(var i=0;i<ele.length;i++)
                            {
                                if(ele[i].checked)
                                {
                                    opcao = i;

                                    break;
                                }
                            }

                            return opcao;
                        }

                        function InicioRota() {
                            
                            if (poly != null)
                                removeline();

                            MostrarRota();
                        }

                        function MostrarRota() {
                            var codEmpr = '<%= Session["CodEmpr"] %>';
                            var codFunc = document.getElementById('<%=ddlFuncionario.ClientID%>').value;
                            var data = document.getElementById('<%=txtDataTrajeto.ClientID%>').value;

                            $.ajax({
                                url: "MapaClientes.aspx/RetornarTrajeto", //URL da página com o WebMethod 
                                data: "{codEmpr:'" + codEmpr + "', codFunc:'" + codFunc + "',data:'" + data + "'}", //Enviar os parâmetros
                                type: "POST", //Tipo do envio (POST ou GET)
                                dataType: "json", //Tipo retorno dos dados
                                contentType: "application/json; charset=utf-8", //Conteúdo do retorno (header)

                                //Função de sucesso do retorno dos dados feita pelo ajax
                                success: function (retorno) {

                                    var flightPlanCoordinates = [];

                                    if(retorno.d.length > 0)
                                    {
                                        for (var i = 0; i < retorno.d.length; i++) {
                                            flightPlanCoordinates.push({ lat: Number(retorno.d[i].Latitude), lng: Number(retorno.d[i].Longitude) });
                                        }
                                    }

                                    poly = new google.maps.Polyline({
                                        path: flightPlanCoordinates,
                                        geodesic: true,
                                        strokeColor: '#FF0000',
                                        strokeOpacity: 1.0,
                                        strokeWeight: 2
                                    });

                                    poly.setMap(map);
                                },
                                //Função de erro do retorno dos dados feita pelo ajax
                                error: function (req, status, error) {
                                    //alert(error);
                                }
                            });
                        }

                        function removeline() {
                            poly.setMap(null);
                        }
                     </script>
                     <!--Fim dos scripts-->

                     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD2IO9BkLK8i0setNb3WMn-LLwGs112nmQ&callback=initMap"
                     async="async" defer="defer"></script>
                </div>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
