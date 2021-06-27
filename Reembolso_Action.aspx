<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/SigeeMaster.Master"
    AutoEventWireup="true"
    CodeBehind="Reembolso_Action.aspx.cs"
    Inherits="Sigee.Reembolso_Action" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphConteudoPrincipal" runat="server">
    <asp:MultiView runat="server" ID="multiview">
        <asp:View ID="view" runat="server">
            <asp:HiddenField runat="server" ID="hfCodFunc" />
            <div class="row mt">
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
                    <asp:Panel runat="server" CssClass="form-panel" Visible="false">
                        <asp:HiddenField
                            runat="server"
                            ID="hfCodReembolso"
                            Value="" />
                        <h4 class="mb title">Dados do Reembolso
                        </h4>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Tarefa:
                                </label>
                                <div class="col-sm-10">
                                    <asp:DropDownList
                                        runat="server"
                                        ID="ddlTarefa"
                                        AppendDataBoundItems="true"
                                        CssClass="form-control">
                                        <asp:ListItem Text="Selecione" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Cliente:
                                </label>
                                <div class="col-sm-10">
                                    <asp:DropDownList
                                        runat="server"
                                        ID="ddlCliente"
                                        AppendDataBoundItems="true"
                                        CssClass="form-control">
                                        <asp:ListItem Text="Selecione" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
            <!--Dados da Despesa-->
            <div class="row mt">
                <div class="col-lg-12">
                    <div class="form-panel">
                        <h4 class="mb title">Dados da Despesa
                        </h4>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Despesa:
                                </label>
                                <div class="col-sm-10">
                                    <asp:DropDownList
                                        runat="server"
                                        ID="ddlDespesa"
                                        AppendDataBoundItems="true"
                                        CssClass="form-control"
                                        AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlDespesa_SelectedIndexChanged">
                                        <asp:ListItem Text="Selecione" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <asp:Panel runat="server" ID="pnlKilometragem" CssClass="form-horizontal style-form" Visible="false">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Preço KM:
                                </label>
                                <div class="col-sm-6">
                                    <asp:TextBox
                                        runat="server"
                                        ID="txtPrecoKilometragem"
                                        CssClass="form-control"
                                        onkeydown="Formata(this,10,event,2)"
                                        onkeypress="return isNumberKey(event)"
                                        Enabled="false">
                                    </asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Kilometragem:
                                </label>
                                <div class="col-sm-6">
                                    <asp:TextBox
                                        runat="server"
                                        ID="txtKilometragem"
                                        CssClass="form-control"
                                        onkeydown="Formata(this,10,event,2)"
                                        onkeypress="return isNumberKey(event)"
                                        OnTextChanged="txtKilometragem_TextChanged"
                                        AutoPostBack="true">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </asp:Panel>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Quantidade KM:
                                </label>
                                <div class="col-sm-6">
                                    <asp:Label
                                        ID="lblQtdKm"
                                        runat="server">
                                    </asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Valor R$:
                                </label>
                                <div class="col-sm-10">
                                    <asp:TextBox
                                        runat="server"
                                        ID="txtValorDespesa"
                                        CssClass="form-control"
                                        onkeydown="Formata(this,10,event,2)"
                                        onkeypress="return isNumberKey(event)">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Pago:
                                </label>
                                <div class="col-sm-5">
                                    <asp:DropDownList
                                        ID="cmbPago"
                                        runat="server"
                                        CssClass="form-control"
                                        OnSelectedIndexChanged="cmbPago_SelectedIndexChanged"
                                        AutoPostBack="true">
                                        <asp:ListItem Value="0">Não</asp:ListItem>
                                        <asp:ListItem Value="1">Sim</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Label runat="server" ID="lblDataPago" Text=""></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Autorizado:
                                </label>
                                <div class="col-sm-10">
                                    <asp:DropDownList
                                        runat="server"
                                        ID="ddlDespesaAtivo"
                                        CssClass="form-control">
                                        <asp:ListItem
                                            Text="Sim"
                                            Value="1">
                                        </asp:ListItem>
                                        <asp:ListItem
                                            Text="Não"
                                            Value="0"
                                            Selected="True">
                                        </asp:ListItem>
                                    </asp:DropDownList>
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
                                        CssClass="form-control"
                                        MaxLength="10"
                                        onkeypress="return isNumberKey(event)"
                                        onkeyup="formataData(this, retornaKeyCode(event));">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Observação:
                                </label>
                                <div class="col-sm-10">
                                    <asp:TextBox
                                        runat="server"
                                        ID="txtObservacaoDespesa"
                                        CssClass="form-control"
                                        TextMode="MultiLine"
                                        Rows="5"
                                        Style="resize: none;"
                                        MaxLength="500">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Logs:
                                </label>
                                <div class="col-sm-10">
                                    <asp:TextBox
                                        runat="server"
                                        ID="txtLogs"
                                        CssClass="form-control"
                                        TextMode="MultiLine"
                                        Rows="5"
                                        Style="resize: none;"
                                        MaxLength="500"
                                        ReadOnly="true">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--Anexos-->
            <div class="row mt">
                <div class="col-lg-12">
                    <div class="form-panel">
                        <h4 class="mb title">Anexos
                        </h4>
                        <div class="form-horizontal style-form">
                            <asp:Panel runat="server" ID="pnlUpload" class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Upload do Arquivo:
                                </label>
                                <div class="col-sm-10">
                                    <asp:FileUpload
                                        runat="server"
                                        ID="fuArquivo" />
                                </div>

                            </asp:Panel>
                            <asp:Panel runat="server" ID="pnlImagem" CssClass="form-group" Visible="true">
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
                            </asp:Panel>
                            <div class="form-group">
                                <div class="col-sm-12" style="text-align: center">
                                    <asp:Button
                                        runat="server"
                                        ID="btnInserirAnexo"
                                        Text="Inserir"
                                        CssClass="btn btn-primary"
                                        OnClick="btnInserirAnexo_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:Panel runat="server" CssClass="row mt" Visible="false">
                <div class="col-lg-12">
                    <p style="text-align: center;">
                        <asp:Button
                            ID="btnIncluir"
                            runat="server"
                            Text="Incluir Despesa"
                            CssClass="btn btn-primary"
                            OnClick="btnIncluir_Click" />
                    </p>
                </div>
            </asp:Panel>
            <div class="row mt">
                <div class="col-lg-12">
                    <p style="text-align: center;">
                        <asp:Button
                            ID="btnSalvar"
                            runat="server"
                            Text="Salvar"
                            CssClass="btn btn-primary"
                            OnClick="btnSalvar_Click" />
                    </p>
                </div>
            </div>

            <script src="JavaScript/Validations.js"></script>

        </asp:View>
    </asp:MultiView>
</asp:Content>
