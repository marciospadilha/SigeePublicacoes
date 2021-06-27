<%@ Page Title="" 
    Language="C#" 
    MasterPageFile="~/SigeeMaster.Master" 
    AutoEventWireup="true" 
    CodeBehind="Empresa_Action.aspx.cs" 
    Inherits="Sigee.Empresa_Action" 
%>

<asp:Content ID="Content1" ContentPlaceHolderID="cphConteudoPrincipal" runat="server">
     <asp:MultiView runat="server" ID="multiview">
        <asp:View ID="view" runat="server">
            <asp:HiddenField
                runat="server"
                ID="hfCodEmpr" />
            <div class="row">
                <div class="col-lg-12">
                    <asp:Panel 
                        runat="server" 
                        ID="pnlAviso"
                        CssClass="alert alert-info"
                        Visible="false">
                            <asp:Label
                                runat="server"
                                ID="lblAviso">
                            </asp:Label>
                    </asp:Panel>
                    <div class="form-panel">
                        <h4 class="mb title">
                            Dados da Empresa
                        </h4>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    CPF/CNPJ:
                                </label>
                                <div class="col-sm-10">
                                    <asp:TextBox
                                        runat="server"
                                        ID="txtCpfCnpj"
                                        CssClass="form-control">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Razão Social:
                                </label>
                                <div class="col-sm-10">
                                    <asp:TextBox
                                        runat="server"
                                        ID="txtRazaoSocial"
                                        CssClass="form-control">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Nome Fantasia:
                                </label>
                                <div class="col-sm-10">
                                    <asp:TextBox
                                        runat="server"
                                        ID="txtNomeFantasia"
                                        CssClass="form-control">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Inscrição Estadual:
                                </label>
                                <div class="col-sm-10">
                                    <asp:TextBox
                                        runat="server"
                                        ID="txtInscricaoEstadual"
                                        CssClass="form-control">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Telefone:
                                </label>
                                <div class="col-sm-5">
                                    <asp:TextBox
                                        runat="server"
                                        ID="txtTelefone"
                                        CssClass="form-control">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Qtd. Usuários:
                                </label>
                                <div class="col-sm-5">
                                    <asp:TextBox
                                        runat="server"
                                        ID="txtQtdUsuarios"
                                        CssClass="form-control">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    E-mail:
                                </label>
                                <div class="col-sm-5">
                                    <asp:TextBox
                                        runat="server"
                                        ID="txtEmail"
                                        CssClass="form-control">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Preço Padrão KM:
                                </label>
                                <div class="col-sm-5">
                                    <asp:TextBox
                                        runat="server"
                                        ID="txtprecoPadraoKm"
                                        CssClass="form-control">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                   Ativo:
                                </label>
                                <div class="col-sm-10">
                                   <asp:DropDownList
                                       runat="server"
                                       ID="ddlEmpresaAtivo"
                                       CssClass="form-control">
                                            <asp:ListItem
                                                Text="Sim"
                                                Value="1">
                                            </asp:ListItem>
                                            <asp:ListItem
                                                Text="Não"
                                                Value="0">
                                            </asp:ListItem>
                                   </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                   Filial:
                                </label>
                                <div class="col-sm-10">
                                   <asp:CheckBox
                                       runat="server"
                                       ID="ckbMatriz" />
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <asp:Panel runat="server" ID="pnlEmpresaMatriz" CssClass="form-group" Visible="false">
                                <label class="col-sm-2 col-sm-2 control-label">
                                   Empresa Matriz:
                                </label>
                                <div class="col-sm-10">
                                   <asp:DropDownList
                                       runat="server"
                                       ID="ddlEmpresaMatriz"
                                       CssClass="form-control">
                                            <asp:ListItem
                                                Text="Selecione"
                                                Value="0">
                                            </asp:ListItem>
                                   </asp:DropDownList>
                                </div>
                            </asp:Panel>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                   Empresa Atual Logada:
                                </label>
                                <div class="col-sm-10">
                                    <asp:CheckBox
                                        runat="server"
                                        ID="ckbEmpresaAtual" />
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                   Data de Lançamento:
                                </label>
                                <div class="col-sm-10">
                                    <asp:TextBox
                                        runat="server"
                                        ID="txtDataCadastro"
                                        Enabled="false"
                                        CssClass="form-control">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt">
                <div class="col-lg-12">
                    <div class="form-panel">
                        <h4 class="mb title">
                            Dados do Endereço
                        </h4>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Logradouro:
                                </label>
                                <div class="col-sm-10">
                                    <asp:TextBox
                                        runat="server"
                                        ID="txtLogradouro"
                                        CssClass="form-control">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    CEP:
                                </label>
                                <div class="col-sm-3">
                                    <asp:TextBox
                                        runat="server"
                                        ID="txtCep"
                                        CssClass="form-control">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Número:
                                </label>
                                <div class="col-sm-10">
                                    <asp:TextBox
                                        runat="server"
                                        ID="txtNumero"
                                        CssClass="form-control">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Complemento:
                                </label>
                                <div class="col-sm-10">
                                    <asp:TextBox
                                        runat="server"
                                        ID="txtComplemento"
                                        CssClass="form-control">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Bairro:
                                </label>
                                <div class="col-sm-10">
                                    <asp:TextBox
                                        runat="server"
                                        ID="txtBairro"
                                        CssClass="form-control">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Cidade:
                                </label>
                                <div class="col-sm-10">
                                    <asp:TextBox
                                        runat="server"
                                        ID="txtCidade"
                                        CssClass="form-control">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    UF:
                                </label>
                                <div class="col-sm-2">
                                    <asp:TextBox
                                        runat="server"
                                        ID="txtUf"
                                        CssClass="form-control">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:Panel runat="server" ID="pnlEmail" CssClass="row mt">
                <div class="col-lg-12">
                    <div class="form-panel">
                        <h4 class="mb title">
                            Configuração  de E-mail
                        </h4>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Servidor SMTP:
                                </label>
                                <div class="col-sm-10">
                                    <asp:TextBox
                                        runat="server"
                                        ID="txtServidorSmtp"
                                        CssClass="form-control">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Porta:
                                </label>
                                <div class="col-sm-3">
                                    <asp:TextBox
                                        runat="server"
                                        ID="txtPorta"
                                        CssClass="form-control">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Habilita SSL:
                                </label>
                                <div class="col-sm-3">
                                    <asp:CheckBox
                                        runat="server"
                                        ID="chkHabilitaSsl" />
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Usuário Autenticação:
                                </label>
                                <div class="col-sm-10">
                                    <asp:TextBox
                                        runat="server"
                                        ID="txtUsuarioAutenticacao"
                                        CssClass="form-control"
                                        MaxLength="50">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Senha:
                                </label>
                                <div class="col-sm-10">
                                    <asp:TextBox
                                        runat="server"
                                        ID="txtSenhaAutenticacao"
                                        CssClass="form-control"
                                        MaxLength="50">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <asp:Button runat="server" ID="btnTesteEmail" Text="Enviar email Teste" OnClick="btnTesteEmail_Click"/>
                        </div>
                     </div>
                </div>
            </asp:Panel>
            <div class="row mt">
                <div class="col-lg-12">
                    <p style="text-align: center;">
                        <asp:Button 
                            ID="btnSalvar" 
                            runat="server" 
                            Text="Salvar"
                            OnClick="btnSalvar_Click"
                            CssClass="btn btn-primary"  />
                    </p>
                </div>
            </div>
            <script src="Scripts/Bootstrap/jquery-1.9.1.min.js"></script>
            <script src="Scripts/Mascaras/maskedinput-1.4.1.js"></script>

            <script type="text/javascript">
                $(document).ready(function () {
                    jQuery(function ($) {
                        $("#<%=txtCpfCnpj.ClientID%>").mask("99/99/9999");
                    });
                });
            </script>
        </asp:View>
     </asp:MultiView>
</asp:Content>
