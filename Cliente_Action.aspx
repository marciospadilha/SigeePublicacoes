<%@ Page 
    Title="" 
    Language="C#" 
    MasterPageFile="~/SigeeMaster.Master" 
    AutoEventWireup="true" 
    CodeBehind="Cliente_Action.aspx.cs" 
    Inherits="Sigee.Cliente_Action" 
%>

<asp:Content ID="Content1" ContentPlaceHolderID="cphConteudoPrincipal" runat="server">
   <asp:MultiView runat="server" ID="multiview">
        <asp:View ID="view" runat="server">
            <div class="row">
                <div class="col-lg-12">
                    <asp:Panel  runat="server" ID="pnlAviso" CssClass="alert alert-info" Visible="false">
                            <asp:Label runat="server" ID="lblAviso"></asp:Label>
                    </asp:Panel>
                     <div class="row">
                        <div class="col-lg-12">
                            <div class="form-panel">
                                    <button class="btn btn-primary"  onclick="javascript: location.href='Clientes.aspx'">Voltar</button>
                                    <asp:Button ID="btnSalvar" runat="server" Text="Salvar" OnClick="btnSalvar_Click" CssClass="btn btn-primary"  />
                            </div>
                        </div>
                    </div>

                    <div class="form-panel">
                        <h4 class="mb title">Dados do Cliente</h4>
                        

                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label"> Razão Social:</label>
                                <div class="col-sm-8">
                                    <asp:TextBox runat="server" ID="txtRazaoSocial" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Nome Fantasia:</label>
                                <div class="col-sm-8">
                                    <asp:TextBox runat="server" ID="txtNomeFantasia" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                         <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">CPF/CNPJ:</label>
                                <div class="col-sm-4">
                                    <asp:TextBox runat="server" ID="txtCpfCnpj" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                         
                                <label class="col-sm-2 col-sm-2 control-label" style="text-align:right"> Inscrição Estadual:</label>
                                <div class="col-sm-4">
                                    <asp:TextBox runat="server" ID="txtInscricaoEstadual" CssClass="form-control"> </asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">E-Mail:</label>
                                <div class="col-sm-5">
                                    <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" ClientIDMode="Static" type="email"></asp:TextBox>
                                </div>
                           
                                <label class="col-sm-2 col-sm-2 control-label" style="text-align:right">Telefone:</label>
                                <div class="col-sm-3">
                                    <asp:TextBox runat="server" ID="txtTelefone" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Funcionário Resp.:</label>
                                <div class="col-sm-4">
                                   <asp:DropDownList runat="server" ID="ddlFuncionario" CssClass="form-control" AppendDataBoundItems="true">
                                            <asp:ListItem Text="Selecione" Value="0"></asp:ListItem> 
                                   </asp:DropDownList>
                                </div>

                                <label class="col-sm-2 col-sm-2 control-label">Data de Lançamento:</label>
                                <div class="col-sm-2">
                                    <asp:TextBox runat="server" ID="txtDataCadastro" Enabled="false" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>
                        </div>
                        

                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Ativo:</label>
                                <div class="col-sm-2">
                                   <asp:DropDownList runat="server" ID="ddlClienteAtivo" CssClass="form-control">
                                            <asp:ListItem Text="Sim" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Não" Value="0"></asp:ListItem>
                                   </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="row" style="padding-bottom:20px;">
                <div class="col-lg-12">
                    <div class="form-panel">
                        <h4 class="mb title">Dados do Endereço</h4>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Logradouro:</label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="txtLogradouro" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">CEP:</label>
                                <div class="col-sm-2">
                                    <asp:TextBox runat="server" ID="txtCep" CssClass="form-control" ClientIDMode="Static" ></asp:TextBox>
                                </div>
                                <label class="col-sm-1 col-sm-1 control-label" style="text-align:right">Número:</label>
                                <div class="col-sm-2"> 
                                    <asp:TextBox runat="server" ID="txtNumero" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                                <label class="col-sm-2 col-sm-2 control-label" style="text-align:right">Complemento:</label>
                                <div class="col-sm-3">
                                    <asp:TextBox runat="server" ID="txtComplemento" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>
                        </div>
                        

                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Bairro:</label>
                                <div class="col-sm-4">
                                    <asp:TextBox runat="server" ID="txtBairro" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                                <label class="col-sm-1 col-sm-1 control-label" style="text-align:right">Cidade:</label>
                                <div class="col-sm-3">
                                    <asp:TextBox runat="server" ID="txtCidade" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                                 <label class="col-sm-1 col-sm-1 control-label" style="text-align:right">UF:</label>
                                <div class="col-sm-1">
                                    <asp:TextBox runat="server" ID="txtUf" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        

                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Latitude:</label>
                                <div class="col-sm-4">
                                    <asp:TextBox runat="server" ID="txtLatitude" CssClass="form-control"></asp:TextBox>
                                </div>
                                <label class="col-sm-2 col-sm-2 control-label" style="text-align:right">Longitude:</label>
                                <div class="col-sm-4">
                                    <asp:TextBox runat="server" ID="txtLongitude" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>
                        </div>
                     
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                               <label class="col-sm-2 col-sm-2 control-label"></label>
                                <div class="col-sm-8"><div id="map" style="height:200px;"></div>
                                 </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
          

            
            <script src="<%# ResolveUrl("~/") %>Scripts/Mascaras/maskedinput-1.4.1.js"></script>
            

            <!-- Funções para os mapas -->
            <script>
                
                var autoComplete;
                var map;

                var componentForm = {
                    street_number: 'short_name',
                    route: 'long_name',
                    locality: 'long_name',
                    administrative_area_level_1: 'short_name',
                    country: 'long_name',
                    postal_code: 'short_name'
                };

                window.onload = function () {
                    initMap();
                }

                function initMap() {

                    var urlParams;
                    var codCliente;
                    var codEmpr = '<%= Session["CodEmpr"] %>';

                    (window.onpopstate = function () {
                        var match,
                            pl = /\+/g,  // Regex for replacing addition symbol with a space
                            search = /([^&=]+)=?([^&]*)/g,
                            decode = function (s) { return decodeURIComponent(s.replace(pl, " ")); },
                            query = window.location.search.substring(1);

                        urlParams = {};
                        while (match = search.exec(query))
                            urlParams[decode(match[1])] = decode(match[2]);
                    })();

                    map = new google.maps.Map(document.getElementById('map'), {
                        center: new google.maps.LatLng(40.601203, -8.668173),
                        scrollwheel: false,
                        zoom: 5
                    });

                    if (urlParams["id"] != undefined) {
                        codCliente = urlParams["id"];

                        $.ajax({
                            url: "Cliente_Action.aspx/RetornarCliente", //URL da página com o WebMethod 
                            data: "{codCli:'" + codCliente + "',codEmpr:'" + codEmpr + "'}", //Enviar os parâmetros
                            type: "POST", //Tipo do envio (POST ou GET)
                            dataType: "json", //Tipo retorno dos dados
                            contentType: "application/json; charset=utf-8", //Conteúdo do retorno (header)

                            //Função de sucesso do retorno dos dados feita pelo ajax
                            success: function (retorno) {

                                var bounds = new google.maps.LatLngBounds();
                                var latlng = new google.maps.LatLng(Number(retorno.d.LatitudeEnd), Number(retorno.d.LongitudeEnd));

                                var marker = new google.maps.Marker({
                                    map: map,
                                    position: latlng,
                                    title: "Marcador",
                                    draggable: true
                                });

                                google.maps.event.addListener(marker, 'dragend', function (evt) {
                                    var caixaLatitude = document.getElementById('<%=txtLatitude.ClientID%>');
                                    var caixaLongitude = document.getElementById('<%=txtLongitude.ClientID%>');

                                    caixaLatitude.value = evt.latLng.lat();
                                    caixaLongitude.value = evt.latLng.lng();
                                });

                                //Adiciona as longitudes e latitudes
                                bounds.extend(latlng);

                                //Mostar todos os ponteiros (acha o melhor zoom para todos ficarem visíveis
                                map.fitBounds(bounds);
                            },
                            //Função de erro do retorno dos dados feita pelo ajax
                            error: function (req, status, error) {
                                alert(error);
                            }
                        });
                    }
                }

                //Função para auto completar a caixa de texto do endereço, buscando na API do Google de AutoComplete dos endereços
                function initAutocomplete() {
                    var txtAutoComplete = document.getElementById('<%=txtLogradouro.ClientID%>');

                    autocomplete = new google.maps.places.Autocomplete(txtAutoComplete);

                    autocomplete.addListener('place_changed', fillInAddress);
                }

                //Função utilizada popular os campos com os dados retornados do endereço escolhido e utiliza a API do GeoCode do Google para buscar a Latitude e Longitude
                function fillInAddress() {
                    var place = autocomplete.getPlace();
                    var valorLogradouro;

                    for (var i = 0; i < place.address_components.length; i++) {
                        var addressType = place.address_components[i].types[0];

                        //UF
                        if (addressType == 'administrative_area_level_1') {
                            document.getElementById('<%=txtUf.ClientID%>').value = place.address_components[i][componentForm[addressType]];
                        }

                        //Endereco
                        //if (addressType == 'route') {
                            //alert(place.address_components[i][componentForm[addressType]]);
                        //}

                        //Cidade
                        if (addressType == 'locality') {
                            document.getElementById('<%=txtCidade.ClientID%>').value = place.address_components[i][componentForm[addressType]];
                        }

                        //CEP
                        if (addressType == 'postal_code') {
                            document.getElementById('<%=txtCep.ClientID%>').value = place.address_components[i][componentForm[addressType]];
                        }
                    }

                    var enderecoCompleto = document.getElementById('<%=txtLogradouro.ClientID%>').value;

                    var geocoder = new google.maps.Geocoder();
                    geocoder.geocode({ 'address': enderecoCompleto }, function (results, status) {
                        if (status === google.maps.GeocoderStatus.OK) {
                            var retornoLatLong = "'" + results[0].geometry.location + "'";

                            var valorSplitRetorno = retornoLatLong.toString().split(",");

                            document.getElementById('<%=txtLatitude.ClientID%>').value = valorSplitRetorno[0].replace("(", "").replace("'", "");
                            document.getElementById('<%=txtLongitude.ClientID%>').value = valorSplitRetorno[1].replace(")", "").replace("'", "");

                            //CriarMarcador(valorSplitRetorno[0].replace("(", "").replace("'", ""), valorSplitRetorno[1].replace(")", "").replace("'", ""));

                            var latlng = new google.maps.LatLng(Number(valorSplitRetorno[0].replace("(", "").replace("'", "")), Number(valorSplitRetorno[1].replace(")", "").replace("'", "")));
                            var bounds = new google.maps.LatLngBounds();
                            bounds.extend(latlng);

                            var marker = new google.maps.Marker({
                                map: map,
                                position: latlng,
                                title: "Marcador",
                                draggable: true
                            });

                            google.maps.event.addListener(marker, 'dragend', function (evt) {
                                var caixaLatitude = document.getElementById('<%=txtLatitude.ClientID%>');
                                 var caixaLongitude = document.getElementById('<%=txtLongitude.ClientID%>');

                                 caixaLatitude.value = evt.latLng.lat();
                                 caixaLongitude.value = evt.latLng.lng();
                            });

                            map.fitBounds(bounds);
                        }
                    });
                }

                function CriarMarcador(latitude, longitude) {

                    var latlng = new google.maps.LatLng(Number(latitude, Number(longitude)));
                    var bounds = new google.maps.LatLngBounds();
                    bounds.extend(latlng);

                    var marker = new google.maps.Marker({
                        map: map,
                        position: latlng,
                        title: "Marcador",
                        draggable: true
                    });

                    google.maps.event.addListener(marker, 'dragend', function (evt) {
                        var caixaLatitude = document.getElementById('<%=txtLatitude.ClientID%>');
                        var caixaLongitude = document.getElementById('<%=txtLongitude.ClientID%>');

                        caixaLatitude.value = evt.latLng.lat();
                        caixaLongitude = evt.latLng.lng();
                    });

                    map.fitBounds(bounds);
                }
             </script>

             <!-- Url da API do Google Maps, passando no parâmetro key a chave do aplicativo que foi criado no Google Developer -->
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD2IO9BkLK8i0setNb3WMn-LLwGs112nmQ&signed_in=true&libraries=places&callback=initAutocomplete"
            async="async" defer="defer"></script>  
         </asp:View>
    </asp:MultiView>    
    <script type="text/javascript">

                function AjustarCep(campoCep) {
                    var cep = campoCep.value;
                    return cep.replace(/\.|\-/g, '');
                }


                 $(document).ready(function() {
                    $("#txtCpfCnpj").mask("999.999.999-99", { placeholder: "" });
                    $("#txtCep").mask("99999-099", { placeholder: "" });
                     
                  });


            </script>
</asp:Content>

