<%@ 
    Page Title="" 
    Language="C#" 
    MasterPageFile="~/SigeeMaster.Master" 
    AutoEventWireup="true" 
    CodeBehind="Usuarios.aspx.cs" Inherits="Sigee.Usuarios" 
%>

<asp:Content ID="Content1" ContentPlaceHolderID="cphConteudoPrincipal" runat="server">
    <asp:MultiView runat="server" ID="multiview">
        <asp:View ID="view" runat="server">

            <div class="row">

                <div class="col-lg-11">
                    <div class="form-panel">
                        <div class="form-group">
                        <asp:Button ID="btnIncluir" runat="server" Text="Novo Usuário" CssClass="btn btn-primary" OnClick="btnIncluir_Click" />
                        </div>

                    </div>
                </div>
            </div>
    
                <%--####### LISTA DE USUARIOS ###########--%>
            <div class="row">
                <div class="col-lg-11">
                    <asp:Panel  runat="server" ID="pnlAviso" CssClass="alert alert-info" Visible="false">
                            <asp:Label runat="server" ID="lblAviso"></asp:Label>
                    </asp:Panel>

                    <div class="form-panel">
                        <%--### PESQUISAR ###--%>
                        <div class="row" style="padding-bottom:10px;">
                           <div class="col-lg-10">
                                        <div class="form-group">
                                                <div class="col-sm-2">
                                                    <asp:Button ID="btnPesquisar" runat="server" Text="Pesquisar" CssClass="btn btn-primary" OnClick="btnPesquisar_Click" />
                                                 </div>
                                                <div class="col-sm-10">
                                                    <asp:TextBox ID="txtPesquisar" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                        </div>
                            </div>
                        </div>
                       <%-- ### FIM PESQUISAR ###--%>


                        <div class="row">
                           <div class="col-lg-12">
                               <div class="panel panel-default">
                                   <div class="panel-body">
                                       <div class="table-responsive">
                                           <asp:GridView
                                               runat="server"
                                               ID="grdUsuarios"  
                                               AutoGenerateColumns="false" 
                                               AllowPaging="true" 
                                               PageSize="25" 
                                               OnRowDeleting="grdUsuarios_RowDeleting"
                                               GridLines="None"
                                               CssClass="table table-hover"
                                               PagerSettings-Mode="NumericFirstLast"
                                               OnPageIndexChanging="grdUsuarios_PageIndexChanging"
                                               PagerStyle-HorizontalAlign="Center"
                                               PagerStyle-VerticalAlign="Bottom">
                                               <PagerStyle Font-Size="Medium" />
                                                    <Columns>
                                                         <asp:TemplateField>
                                                            <ItemTemplate>
                                                                 <asp:ImageButton
                                                                    runat="server"
                                                                    ID="btnAlterar"
                                                                    ImageUrl="~/Imagens/1445643087_create.png"
                                                                    CommandArgument='<%#Eval("CodFunc").ToString() %>'
                                                                    OnClick="btnAlterar_Click"  />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:ImageButton
                                                                    runat="server"
                                                                    ID="imgDeletar"
                                                                    ImageUrl="~/Imagens/1445550190_delete.png" 
                                                                    CommandName="Delete"
                                                                    CommandArgument='<%#Eval("CodFunc").ToString() %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                     
                                                         <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:ImageButton
                                                                    runat="server"
                                                                    ID="btnAlterarSenha"
                                                                    ImageUrl="~/Imagens/key.png" 
                                                                    OnClick="btnAlterarSenha"
                                                                    CommandArgument='<%#Eval("Usuario.CodUsu").ToString() %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Cod">
                                                            <ItemTemplate>
                                                                 <asp:Label runat="server" ID="lblCodUsuarioGrid" Text='<%#Eval("Usuario.CodUsu").ToString() %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>


                                                       <asp:BoundField DataField="NomeFunc" HeaderText="Funcionário" />
                                                         
                                                       <asp:TemplateField HeaderText="Usuário">
                                                            <ItemTemplate>
                                                                 <asp:Label runat="server" ID="lblLoginUsuarioGrid" Text='<%#Eval("Usuario.LoginUsu").ToString() %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Perfil">
                                                            <ItemTemplate>
                                                                 <asp:Label 
                                                                     runat="server"
                                                                     ID="lblPerfilGrid"
                                                                     Text='<%#Eval("Usuario.Perfil.NomPerfil").ToString() %>'>
                                                                 </asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                       

                                                    </Columns>
                                           </asp:GridView>
                                       </div>
                                   </div>
                               </div>
                           </div>
                       </div>   

                   </div>
                </div>
            </div>
           
        </asp:View>
    </asp:MultiView>
</asp:Content>
