<%@ 
    Page Title="" 
    Language="C#" 
    MasterPageFile="~/SigeeMaster.Master" 
    AutoEventWireup="true" 
    CodeBehind="Usuario_Action.aspx.cs" 
    Inherits="Sigee.Usuario_Action" 
%>

<asp:Content ID="Content1" ContentPlaceHolderID="cphConteudoPrincipal" runat="server">
    <asp:MultiView runat="server" ID="multiview">
        <asp:View ID="view" runat="server">
            <asp:HiddenField runat="server" ID="hfCodUsu" />
            <asp:DropDownList runat="server" Visible="false" ID="ddlAtivo" CssClass="form-control" required> 
                 <asp:ListItem Text="Selecione" Value="1" Selected="True"></asp:ListItem>
            </asp:DropDownList>

            <div class="row">
                <div class="col-lg-12">
                    <div class="form-panel">
                            <button class="btn btn-primary"  onclick="javascript: location.href='Usuarios.aspx'">Voltar</button>
                            <asp:Button ID="Button1" runat="server" Text="Salvar" CssClass="btn btn-primary" OnClick="btnSalvar_Click" />
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <asp:Panel runat="server" ID="pnlAviso" CssClass="alert alert-info" Visible="false">
                            <asp:Label runat="server" ID="lblAviso"></asp:Label>
                    </asp:Panel>

                    <div class="form-panel">
                        <h4 class="mb title">Dados do Funcionário</h4>      
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Nome do Funcionário:</label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="txtNomeFuncionario" CssClass="form-control" required="required"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <%--#### CPF E TELEFONE--%>

                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">CPF/CNPJ:</label>
                                <div class="col-sm-4">
                                    <asp:TextBox runat="server" ID="txtCpfCnpj" CssClass="form-control"></asp:TextBox>
                                </div>
                                 <label class="col-sm-1 col-sm-1 control-label" style="text-align:right">DDI: </label>
                                <div class="col-sm-2">
                                    <asp:TextBox runat="server" ID="texDDItel1" MaxLength="5" CssClass="form-control" ClientIDMode="Static" required="required"></asp:TextBox>
                                </div>

                                <label class="col-sm-1 col-sm-1 control-label" style="text-align:right">Celular: </label>
                                <div class="col-sm-2" style="text-align:left">
                                    <asp:TextBox runat="server" ID="txtCelular" CssClass="form-control" ClientIDMode="Static" onkeydown="mascara( this )" onkeyup="mascara( this )" required="required"></asp:TextBox>
                                </div>

                            </div>
                        </div> 



                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Cargo:</label>
                                <div class="col-sm-4">
                                    <asp:DropDownList runat="server" ID="ddlCargo" CssClass="form-control" AppendDataBoundItems="true">
                                            <asp:ListItem Text="Selecione" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <asp:Panel runat="server" ID="pnlDataCadastro" CssClass="form-horizontal style-form">

                                    <label class="col-sm-2 col-sm-2 control-label" style="text-align:right">Data de Lançamento: </label>
                                    <div class="col-sm-3">
                                        <asp:TextBox runat="server" ID="txtDataCadastro" CssClass="form-control" Enabled="false"></asp:TextBox>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>

                        <%--### Logradouro Inicial ####--%>
            <div class="row">
                <div class="col-lg-12">
                        <h4 class="mb title">Logradouro Inicial</h4>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Logradouro:</label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="txtLogradouroInicial" CssClass="form-control" required="required"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Latitude:</label>
                                <div class="col-sm-4">
                                    <asp:TextBox runat="server" ID="txtLatitudeIni" CssClass="form-control" required="required"></asp:TextBox>
                                </div>
                                 <label class="col-sm-2 col-sm-2 control-label" style="text-align:right">Longitude:</label>
                                <div class="col-sm-4">
                                    <asp:TextBox runat="server" ID="txtLongitudeIni" CssClass="form-control" required="required"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
            
                        <%--### LOGRADOURO FINAL--%>
                        
             <div class="row ">
                <div class="col-lg-12">
                        <h4 class="mb title">Logradouro Final</h4>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Logradouro:</label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="txtLogradouroFim" CssClass="form-control" required="required"> </asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Latitude:</label>
                                <div class="col-sm-4">
                                    <asp:TextBox runat="server" ID="txtLatitudeFim" CssClass="form-control" required="required"></asp:TextBox>
                                </div>
                                <label class="col-sm-2 col-sm-2 control-label" style="text-align:right">Longitude:</label>
                                <div class="col-sm-4">
                                    <asp:TextBox runat="server" ID="txtLongitudeFim" CssClass="form-control" required="required"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                </div>
            </div>                    
                        

                        <asp:Panel
                            runat="server"
                            ID="pnlCodEmpr"
                            CssClass="form-horizontal style-form"
                            Visible="false">
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">
                                       Empresa:
                                    </label>
                                    <div class="col-sm-10">
                                        <asp:DropDownList
                                            runat="server"
                                            ID="ddlEmpresa"
                                            CssClass="form-control" 
                                            required>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                        </asp:Panel>               
                   </div>
                </div>
            </div>


            <div class="row">
                <div class="col-lg-12">
                    <div class="form-panel">
                        <h4 class="mb title">
                            Dados do Usuário
                        </h4>

                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label"> Perfil:</label>
                                <div class="col-sm-4">
                                    <asp:DropDownList runat="server" ID="ddlPergil" CssClass="form-control" AppendDataBoundItems="true"
                                        OnSelectedIndexChanged="ddlPergil_SelectedIndexChanged" AutoPostBack="true" required>
                                            <asp:ListItem Text="Selecione" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                 <asp:Panel runat="server" ID="pnlSupervisor" CssClass="form-horizontal style-form">
                                     <label class="col-sm-2 col-sm-2 control-label" style="text-align:right"> Supervisor:</label>
                                <%--<asp:Label runat="server" ID="lblSuperior" CssClass="col-sm-2 col-sm-2 control-label" Text="Supervisor:"></asp:Label>--%>
                                        <div class="col-sm-4">
                                            <asp:DropDownList runat="server" ID="ddlSupervisor" CssClass="form-control" AppendDataBoundItems="true" required>
                                                    <asp:ListItem Text="Selecione" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                </asp:Panel>

                            </div>
                            
                        </div>  


                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Email:</label>
                                <div class="col-sm-5">
                                    <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" required="required"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        
                    </div>
                 </div>
            </div>

            
            <div class="row">
                <div class="col-lg-12">
                    <p style="text-align: center; padding-bottom:20px;">
                        <asp:Button ID="btnSalvar" runat="server" Text="Salvar" CssClass="btn btn-primary" OnClick="btnSalvar_Click" />
                    </p>
                </div>
            </div>


            <script type="text/javascript">
                //Função para auto completar a caixa de texto do endereço, buscando na API do Google de AutoComplete dos endereços
                function initAutocomplete() {
                    var txtAutoCompleteLogIni = document.getElementById('<%=txtLogradouroInicial.ClientID%>');
                    var txtAutoCompleteLogFim = document.getElementById('<%=txtLogradouroFim.ClientID%>');

                    autocomplete = new google.maps.places.Autocomplete(txtAutoCompleteLogIni);
                    autocomplete.addListener('place_changed', fillInAddress1);

                    autocomplete = new google.maps.places.Autocomplete(txtAutoCompleteLogFim);
                    autocomplete.addListener('place_changed', fillInAddress2);
                }

                function fillInAddress1() {
                    var geocoder = new google.maps.Geocoder();
                    var enderecoCompleto = document.getElementById('<%=txtLogradouroInicial.ClientID%>').value;
                    geocoder.geocode({ 'address': enderecoCompleto }, function (results, status) {
                        if (status === google.maps.GeocoderStatus.OK) {
                            var retornoLatLong = "'" + results[0].geometry.location + "'";

                            var valorSplitRetorno = retornoLatLong.toString().split(",");

                            document.getElementById('<%=txtLatitudeIni.ClientID%>').value = valorSplitRetorno[0].replace("(", "").replace("'", "");
                            document.getElementById('<%=txtLongitudeIni.ClientID%>').value = valorSplitRetorno[1].replace(")", "").replace("'", "");
                        }
                    });
                }

                function fillInAddress2() {
                    var geocoder = new google.maps.Geocoder();
                    var enderecoCompleto = document.getElementById('<%=txtLogradouroFim.ClientID%>').value;
                    geocoder.geocode({ 'address': enderecoCompleto }, function (results, status) {
                        if (status === google.maps.GeocoderStatus.OK) {
                            var retornoLatLong = "'" + results[0].geometry.location + "'";

                            var valorSplitRetorno = retornoLatLong.toString().split(",");

                            document.getElementById('<%=txtLatitudeFim.ClientID%>').value = valorSplitRetorno[0].replace("(", "").replace("'", "");
                            document.getElementById('<%=txtLongitudeFim.ClientID%>').value = valorSplitRetorno[1].replace(")", "").replace("'", "");
                        }
                    });
                }

                function mascara(campo) {
                    campo.value = campo.value.replace(/[^\d]/g, '')
                                               
                                             .replace(/^(\d\d)(\d)/, '($1) $2')
                        .replace(/(\d{5})(\d)/, '$1-$2');
                    console.log(campo.value);
                    if (campo.value.length > 18) campo.value = stop;
                    else stop = campo.value;
                }
            </script>

            <!-- Url da API do Google Maps, passando no parâmetro key a chave do aplicativo que foi criado no Google Developer -->
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD2IO9BkLK8i0setNb3WMn-LLwGs112nmQ&signed_in=true&libraries=places&callback=initAutocomplete"
            async="async" defer="defer"></script>
            
        </asp:View>
    </asp:MultiView>
</asp:Content>
