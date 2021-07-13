<%@ Page 
    Title="" 
    Language="C#" 
    MasterPageFile="~/SigeeMaster.Master" 
    AutoEventWireup="true" 
    CodeBehind="Despesa_Action.aspx.cs" 
    Inherits="Sigee.Despesa_Action" 
%>

<asp:Content ID="Content1" ContentPlaceHolderID="cphConteudoPrincipal" runat="server">
    <asp:MultiView runat="server" ID="multiview">
        <asp:View ID="view" runat="server">
            <div class="row ">
                <div class="col-lg-12">
                    <asp:Panel runat="server" ID="pnlAviso" CssClass="alert alert-info" Visible="false">
                            <asp:Label runat="server" ID="lblAviso"></asp:Label>
                    </asp:Panel>

                    <asp:TextBox runat="server" Visible="false" ID="txtDataCadastro" Enabled="false" CssClass="form-control"></asp:TextBox>


                     <div class="row">
                        <div class="col-lg-12">
                            <div class="form-panel">
                                    <button class="btn btn-primary"  onclick="javascript: location.href='Despesas.aspx'">Voltar</button>
                                    <asp:Button ID="btnSalvar" runat="server" Text="Salvar" OnClick="btnSalvar_Click" CssClass="btn btn-primary"  />
                            </div>
                        </div>
                    </div>



                    <div class="form-panel">
                        <h4 class="mb title">
                            Dados do Tipo de Despesa
                        </h4>
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Descrição da Despesa:</label>
                                <div class="col-sm-6">
                                    <asp:TextBox runat="server" ID="txtNomeDespesa" CssClass="form-control" required="required"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                   Ativo:
                                </label>
                                <div class="col-sm-2">
                                   <asp:DropDownList runat="server" ID="ddlDespesaAtivo" CssClass="form-control">
                                            <asp:ListItem Text="Sim" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Não" Value="0"></asp:ListItem>
                                   </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

         </asp:View>
    </asp:MultiView>      
</asp:Content>
