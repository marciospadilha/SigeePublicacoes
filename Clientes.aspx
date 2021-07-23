<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/SigeeMaster.Master"
    AutoEventWireup="true"
    CodeBehind="Clientes.aspx.cs"
    Inherits="Sigee.Clientes"
    EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphConteudoPrincipal" runat="server">
    <asp:MultiView runat="server" ID="multiview">
        <asp:View ID="view" runat="server">
          
              <div class="row">
                <div class="col-lg-12">
                    <div class="form-panel">
                        <div class="form-group">
                        <asp:Button ID="btnIncluir" runat="server" Text="Novo Cliente" CssClass="btn btn-primary" OnClick="btnIncluir_Click" />
                        <asp:Button runat="server" ID="btnExportarExcel" Text="Exportar para Excel" CssClass="btn btn-primary" OnClick="btnExportarExcel_Click" />
                        </div>
                    </div>
                </div>
            </div>

                       

            <div class="row" style="padding-bottom:20px;">
                <div class="col-lg-12">
                    <div class="form-panel">
                        <div class="col-lg-10" style="padding-bottom:10px;">
                                        <div class="form-group">
                                                <div class="col-sm-2">
                                                    <asp:Button ID="btnPesquisar" runat="server" Text="Pesquisar" CssClass="btn btn-primary" OnClick="btnPesquisar_Click" />
                                                 </div>
                                                <div class="col-sm-10">
                                                    <asp:TextBox ID="txtPesquisar" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                        </div>
                            </div>
                        

                        <div class="row">
                           <div class="col-lg-12">
                               <asp:Panel runat="server"  ID="pnlAviso" CssClass="alert alert-info" Visible="false">
                                    <asp:Label runat="server" ID="lblAviso"></asp:Label>
                               </asp:Panel>
                               <div class="panel panel-default">
                                   <div class="panel-body">
                                       <div class="table-responsive">
                                           <asp:GridView
                                               runat="server"
                                               ID="grdClientes"  
                                               AutoGenerateColumns="false" 
                                               AllowPaging="true" 
                                               PageSize="25" 
                                               Width="100%"
                                               GridLines="None"
                                               CssClass="table table-hover"
                                               PagerSettings-Mode="NumericFirstLast"
                                               OnRowDeleting="grdClientes_RowDeleting"
                                               OnPageIndexChanging="grdClientes_PageIndexChanging"
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
                                                                    CommandArgument='<%#Eval("CodCli").ToString() %>'
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
                                                                    CommandArgument='<%#Eval("CodCli").ToString() %>'/>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:BoundField DataField="RazaoCli" HeaderText="Razão Social" HeaderStyle-HorizontalAlign="Center"/>
                                                        <asp:BoundField DataField="NReduzCli" HeaderText="Nome Fantasia" HeaderStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="Tel1Cli" HeaderText="Telefone" HeaderStyle-HorizontalAlign="Center" />
                                                        <%--<asp:BoundField DataField="CgcCpfCli" HeaderText="CPF/CNPJ" HeaderStyle-HorizontalAlign="Center"/>--%>
                                                         
                                                    </Columns>
                                                    <EmptyDataTemplate>
                                                        Não foi encontrado nenhum cliente para ser relacionado!
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
        </asp:View>
    </asp:MultiView>
</asp:Content>
