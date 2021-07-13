<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/SigeeMaster.Master"
    AutoEventWireup="true"
    CodeBehind="Tarefa_Action.aspx.cs"
    Inherits="Sigee.Tarefa_Action" %>



 

<asp:Content ID="Content1" ContentPlaceHolderID="cphConteudoPrincipal" runat="server">
    <asp:MultiView runat="server" ID="multiview">
        <asp:View ID="view" runat="server">
            <script src="Scripts/BootBox/bootbox.min.js"></script>


            <div class="row">
                <div class="col-lg-12">
                    <div class="form-panel">
                            <asp:Button ID="btnSalvar" runat="server" Text="Salvar" OnClientClick="bootbox.alert('Oi', function() { return false;});" OnClick="btnSalvar_Click" CssClass="btn btn-primary" />
                        &nbsp;
                        <asp:Button ID="btnExcluir" runat="server" Text="Excluir" OnClientClick="return  confirm('Deseja realmente excluir a tarefa?');" OnClick="btnExcluir_Click" CssClass="btn btn-primary" />
                        &nbsp;
                        <asp:Button ID="btnGerarOS" runat="server" Text="Gerar O. S." CssClass="btn btn-primary" OnClick="btnGerarOS_Click" />
                          

                    </div>
                </div>
            </div>



            <div class="row">
                <asp:HiddenField runat="server" ID="hfCodDepesaKm" />
                <asp:HiddenField runat="server" ID="hfQtdKm" />
                <asp:HiddenField runat="server" ID="hfCodFunc" /> 
                <asp:DropDownList runat="server" ID="ddlTarefaAtiva" CssClass="form-control" Visible="false">
                                <asp:ListItem Text="Sim" Value="1"> </asp:ListItem>
                                <asp:ListItem Text="Não" Value="0"></asp:ListItem>
                            </asp:DropDownList>



                <div class="col-lg-12">
                    <asp:Panel runat="server" ID="pnlAviso" CssClass="alert alert-info" Visible="false">
                        <asp:Label runat="server" ID="lblAviso"> </asp:Label>
                    </asp:Panel>

                    <div class="form-panel">
                        <h4 class="mb title">Dados da Tarefa  <asp:Label runat="server" ID="codigoTarefa" > </asp:Label> </h4>

                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Descrição:</label>
                                <div class="col-sm-8">
                                    <asp:TextBox runat="server" ID="txtDescricao" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Cliente:</label>
                                <div class="col-sm-8"> 
                                    <asp:DropDownList runat="server" ID="ddlCliente" CssClass="form-control" AppendDataBoundItems="true">
                                        <asp:ListItem Text="Selecione" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Data da Tarefa:</label>
                                <div class="col-sm-2">
                                    <asp:TextBox runat="server" ID="txtDataCadastro" CssClass="form-control" ClientIDMode="Static" MaxLength="10" AutoPostBack="true" OnTextChanged="txtDataCadastro_TextChanged"></asp:TextBox>
                                </div>
                                <label class="col-sm-1 col-sm-1 control-label" style="text-align:right">Hora:</label>
                                <div class="col-sm-2">
                                    <asp:DropDownList runat="server" ID="ddlHora" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <label class="col-sm-1 col-sm-1 control-label" style="text-align:right">Minuto:</label>
                                <div class="col-sm-2" style="text-align:left">
                                    <asp:DropDownList runat="server" ID="ddlMinuto" CssClass="form-control"> </asp:DropDownList>
                                </div>
                             </div>
                        </div>


                         <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Data/Hora Check-In:</label>
                                <div class="col-sm-2">
                                    <asp:TextBox runat="server" ID="txtDataHoraCheckIn" CssClass="form-control" ReadOnly="true" Enabled="false"></asp:TextBox>
                                </div>
                                <label class="col-sm-2 col-sm-2 control-label">Data/Hora Check-Out:</label>
                                <div class="col-sm-2">
                                    <asp:TextBox runat="server" ID="txtDatataHoraChekout" CssClass="form-control" ReadOnly="true" Enabled="false"> </asp:TextBox>
                                </div>

                            </div>
                        </div>

                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Observações:
                                </label>
                                <div class="col-sm-8">
                                    <asp:TextBox runat="server" ID="txtObservacao" CssClass="form-control" TextMode="MultiLine" Rows="5"> </asp:TextBox>
                                </div>
                            </div>
                        </div>

                         <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label"> E-mail:</label>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="email@email.com.br" type="email"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

         

            <div class="row">
                <div class="col-lg-12">
                    <div class="form-panel">
                        <h4 class="mb title">Anexos
                        </h4>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Anexo:
                                </label>
                                <div class="col-sm-10">
                                    <asp:FileUpload
                                        ID="fileUpload"
                                        runat="server"
                                        CssClass="form-control" />
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Imagens:
                                </label>
                                <div class="col-sm-10">
                                    <asp:Literal
                                        ID="literal"
                                        runat="server"></asp:Literal>
                                    &nbsp;
                                    &nbsp;
                                    &nbsp;
                                    <asp:Panel ID="panelFotos" runat="server"></asp:Panel>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row" style="padding-bottom:20px;">
                <div class="col-lg-12">
                    <div class="form-panel">
                        <h4 class="mb title">Trajeto
                        </h4>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                </label>
                                <div class="col-sm-12">
                                    <div id="map" style="height: 400px;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <script src="Scripts/Bootstrap/jquery-1.9.1.min.js"></script>
            <script src="JavaScript/Validations.js"></script>
            <script type="text/javascript">
                $(document).ready(function () {
                    $("#txtDataCadastro").keyup(function () {
                        MascaraData(this, event);
                    });
                });

                
            </script>

            <script>
                var map;

                window.onload = function () {
                    initMap();
                }

                function initMap() {

                    var directionsService = new google.maps.DirectionsService;
                    var directionsDisplay = new google.maps.DirectionsRenderer;

                    map = new google.maps.Map(document.getElementById('map'), {
                        center: new google.maps.LatLng(40.601203, -8.668173),
                        scrollwheel: false,
                        zoom: 5
                    });

                    directionsDisplay.setMap(map);

                    calculateAndDisplayRoute(directionsService, directionsDisplay);
                }

                function calculateAndDisplayRoute(directionsService, directionsDisplay) {

                    var codEmpr = '<%= Session["CodEmpr"] %>';
                    var codPerfi = '<%= Session["CodPerfil"] %>';
                    var codFunc = '';
                    var codCli = '';
                    var codTarefa = '';
                    var idTarefa = '<%= Request.QueryString["id"] %>';

                    //Verifica se tem código de tarefa
                    if (idTarefa == '') {
                        codTarefa = '0';
                    }
                    else {
                        codTarefa = idTarefa;
                    }

                    //Monta os parâmetros através do perfil
                    if (codPerfi != "4") {
                        codCli = '0';
                        codFunc = '0';
                    }
                    else {
                        codCli = '0';
                        codFunc = '<%= Session["CodFunc"] %>'
                    }

                    $.ajax({
                        url: "Tarefa_Action.aspx/RetornarRotas", //URL da página com o WebMethod 
                        data: "{codFunc:'" + codFunc + "',codTarefa:'" + codTarefa + "',codCli:'" + codCli + "', codEmpr:'" + codEmpr + "'}", //Enviar os parâmetros
                        type: "POST", //Tipo do envio (POST ou GET)
                        dataType: "json", //Tipo retorno dos dados
                        contentType: "application/json; charset=utf-8", //Conteúdo do retorno (header)

                        //Função de sucesso do retorno dos dados feita pelo ajax
                        success: function (retorno) {
                            //alert(Number(retorno.d[0].Latitude));
                            //alert(Number(retorno.d[1].Latitude));

                            //console.log(retorno.d);

                            //alert(Number(retorno.d[0].Latitude) + "-" + Number(retorno.d[0].Longitude));

                            var waypts = [];
                            var ultimaPosicao = retorno.d.length - 1;

                            for (var i = 0; i < retorno.d.length; i++) {

                                if (i > 0 && i < ultimaPosicao) {
                                    waypts.push({
                                        location: new google.maps.LatLng(Number(retorno.d[i].Latitude), Number(retorno.d[i].Longitude)),
                                        stopover: true
                                    });
                                }
                            }

                            directionsService.route({
                                origin: new google.maps.LatLng(Number(retorno.d[0].Latitude), Number(retorno.d[0].Longitude)),
                                destination: new google.maps.LatLng(Number(retorno.d[ultimaPosicao].Latitude), Number(retorno.d[ultimaPosicao].Longitude)),
                                waypoints: waypts,
                                optimizeWaypoints: false,
                                travelMode: google.maps.TravelMode.DRIVING
                            }, function (response, status) {
                                if (status === google.maps.DirectionsStatus.OK) {
                                    directionsDisplay.setDirections(response);
                                    var route = response.routes[0];
                                    var totalDistance = "0-";

                                    console.log(route);

                                    // For each route, display summary information.
                                    for (var i = 0; i < route.legs.length; i++) {
                                        //var routeSegment = i + 1;

                                        //alert(route.legs[i].start_address + '-' + route.legs[i].end_address + '-'+ route.legs[i].distance.text);
                                        //summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
                                        //summaryPanel.innerHTML += route.legs[i].distance.text + '<br><br>';

                                        totalDistance += route.legs[i].distance.text;

                                        if (i < (route.legs.length - 1)) {
                                            totalDistance += "-";
                                        }
                                        //summaryPanel.innerHTML += '<b>Route Segment: ' + routeSegment +
                                        //'</b><br>';
                                        //summaryPanel.innerHTML += route.legs[i].start_address + ' to ';
                                        //summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
                                        //summaryPanel.innerHTML += route.legs[i].distance.text + '<br><br>';
                                    }

                                    //alert(totalDistance);

                                    document.getElementById('<%=hfQtdKm.ClientID%>').value = totalDistance;

                                } else {
                                    //window.alert('Directions request failed due to ' + status);
                                }
                            });
                        },
                        //Função de erro do retorno dos dados feita pelo ajax
                        error: function (req, status, error) {
                            // alert(error);
                        }
                    });
                }
            </script>

            <!-- Url da API do Google Maps, passando no parâmetro key a chave do aplicativo que foi criado no Google Developer -->
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD2IO9BkLK8i0setNb3WMn-LLwGs112nmQ&signed_in=true&libraries=places&callback=initMap"
                async="async" defer="defer"></script>
        </asp:View>
    </asp:MultiView>
</asp:Content>
