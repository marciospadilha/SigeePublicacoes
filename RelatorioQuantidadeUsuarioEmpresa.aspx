<%@ Page 
    Title="" 
    Language="C#" 
    MasterPageFile="~/SigeeMaster.Master" 
    AutoEventWireup="true" 
    CodeBehind="RelatorioQuantidadeUsuarioEmpresa.aspx.cs" 
    Inherits="Sigee.RelatorioQuantidadeUsuarioEmpresa" 
%>

<asp:Content ID="Content1" ContentPlaceHolderID="cphConteudoPrincipal" runat="server">
     <asp:MultiView runat="server" ID="multiview">
        <asp:View ID="view" runat="server">
            <div class="row mt">
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
                <div class="col-lg-12">
                    <div class="form-panel">
                        <h4 class="mb title">
                            Filtros do Relatórios de Quantidade Usuario x Empresa
                        </h4>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Empresa:
                                </label>
                                <div class="col-sm-10">
                                    <asp:DropDownList
                                        runat="server"
                                        ID="ddlEmpresa"
                                        AppendDataBoundItems="true"
                                        CssClass="form-control">
                                            <asp:ListItem Text="Todos" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Data Inicial:
                                </label>
                                <div class="col-sm-5">
                                    <asp:TextBox
                                        runat="server"
                                        ID="txtDataInicial"
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
                                    Data Final:
                                </label>
                                <div class="col-sm-5">
                                    <asp:TextBox
                                        runat="server"
                                        ID="txtDataFinal"
                                        CssClass="form-control"
                                        MaxLength="10"
                                        onkeypress="return isNumberKey(event)"
                                        onkeyup="formataData(this, retornaKeyCode(event));">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt">
                <div class="col-lg-12">
                    <p style="text-align: center;">
                        <asp:Button 
                            ID="btnGerar" 
                            runat="server" 
                            Text="Gerar"
                            OnClick="btnGerar_Click"
                            CssClass="btn btn-primary"  />
                    </p>
                </div>
            </div>

            <script src="JavaScript/Validations.js"></script>
         </asp:View>
    </asp:MultiView>      
</asp:Content>
