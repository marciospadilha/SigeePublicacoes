<%@ Page 
    Title="" 
    Language="C#" 
    MasterPageFile="~/SigeeMaster.Master" 
    AutoEventWireup="true" 
    CodeBehind="Cargo_Action.aspx.cs" 
    Inherits="Sigee.Cargo_Action" 
%>

<asp:Content ID="Content1" ContentPlaceHolderID="cphConteudoPrincipal" runat="server">
    <asp:MultiView runat="server" ID="multiview">
        <asp:View ID="view" runat="server">
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
                    <div class="form-panel">
                        <h4 class="mb title">
                            Dados do Cargo
                        </h4>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Nome do Cargo:
                                </label>
                                <div class="col-sm-10">
                                    <asp:TextBox
                                        runat="server"
                                        ID="txtNomeCargo"
                                        CssClass="form-control"
                                        ClientIDMode="Static">
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
                                       ID="ddlCargoAtivo"
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
                                   Possui Supervisor:
                                </label>
                                <div class="col-sm-10">
                                   <asp:DropDownList
                                       runat="server"
                                       ID="dddPossuiSupervisor"
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
         </asp:View>
    </asp:MultiView>      
</asp:Content>
