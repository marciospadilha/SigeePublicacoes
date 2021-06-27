<%@ Page 
    Title="" 
    Language="C#" 
    MasterPageFile="~/SigeeMaster.Master" 
    AutoEventWireup="true" 
    CodeBehind="TiposClientes.aspx.cs" 
    Inherits="Sigee.TiposClientes" 
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
                            Relação de Tipos de Clientes
                        </h4>      
                        <div class="row">
                           <div class="col-lg-12">
                               <div class="panel panel-default">
                                   <div class="panel-body">
                                       <div class="table-responsive">
                                           <asp:GridView
                                               runat="server"
                                               ID="grdTiposClientes"  
                                               AutoGenerateColumns="false" 
                                               AllowPaging="true" 
                                               PageSize="25" 
                                               Width="100%"
                                               GridLines="None"
                                               CssClass="table table-hover"
                                               PagerSettings-Mode="NumericFirstLast"
                                               OnRowDeleting="grdTiposClientes_RowDeleting"
                                               OnPageIndexChanging="grdTiposClientes_PageIndexChanging"
                                               PagerStyle-HorizontalAlign="Center"
                                               PagerStyle-VerticalAlign="Bottom">
                                               <PagerStyle Font-Size="Medium" />
                                                    <Columns>
                                                        <asp:BoundField 
                                                            DataField="NomeTipoCliente" 
                                                            HeaderText="Nome do Tipo de Perfil"
                                                            HeaderStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField 
                                                            DataField="DtHrCadTipoCliente" 
                                                            HeaderText="Data de Lançamento"
                                                            HeaderStyle-HorizontalAlign="Center" />
                                                        <asp:TemplateField HeaderText="Ativo">
                                                            <ItemTemplate>
                                                                <asp:Label
                                                                    runat="server"
                                                                    ID="Label1"
                                                                    Text='<%# (Eval("FlagAtivoTipoCliente").ToString().Equals("1")?"SIM":"NÃO") %>'>
                                                                </asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                       <asp:TemplateField>
                                                            <ItemTemplate>
                                                                 <asp:ImageButton
                                                                    runat="server"
                                                                    ID="btnAlterar"
                                                                    ImageUrl="~/Imagens/1445643087_create.png"
                                                                    CommandArgument='<%#Eval("CodTipoCliente").ToString() %>'
                                                                    OnClick="btnAlterar_Click"/>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:ImageButton
                                                                    runat="server"
                                                                    ID="imgDeletar"
                                                                    ImageUrl="~/Imagens/1445550190_delete.png" 
                                                                    CommandName="Delete"
                                                                    CommandArgument='<%#Eval("CodTipoCliente").ToString() %>'/>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <EmptyDataTemplate>
                                                        Não foi encontrado nenhum tipo de cliente para ser relacionado!
                                                    </EmptyDataTemplate>
                                           </asp:GridView>
                                       </div>
                                   </div>
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
                            ID="btnIncluir" 
                            runat="server" 
                            Text="Incluir" 
                            CssClass="btn btn-primary"
                            OnClick="btnIncluir_Click" />
                    </p>
                </div>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
