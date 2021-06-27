<%@ Page 
    Title="" 
    Language="C#" 
    MasterPageFile="~/SigeeMaster.Master" 
    AutoEventWireup="true" 
    CodeBehind="Empresa.aspx.cs" 
    Inherits="Sigee.Empresa" 
%>

<asp:Content ID="Content1" ContentPlaceHolderID="cphConteudoPrincipal" runat="server">
    <asp:MultiView runat="server" ID="multiview">
        <asp:View ID="view" runat="server">
            <div class="row mt">
                <div class="col-lg-12">
                    <div class="form-panel">
                        <h4 class="mb title">Pesquisar
                        </h4>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-panel">
                                    <div class="form-horizontal style-form">
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">
                                                Palavra-chave:
                                            </label>
                                            <div class="col-sm-10">
                                                <asp:TextBox ID="txtPesquisar" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <p style="text-align: center">
                                            <asp:Button ID="btnPesquisar" runat="server" Text="Pesquisar" CssClass="btn btn-primary" OnClick="btnPesquisar_Click" />
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            &nbsp;
            <div class="row mt">
                <div class="col-lg-12">
                    <div class="form-panel">
                        <h4 class="mb title">
                            Relação de Empresa
                        </h4>      
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
                               <div class="panel panel-default">
                                   <div class="panel-body">
                                       <div class="table-responsive">
                                           <asp:GridView
                                               runat="server"
                                               ID="grdEmpresa"  
                                               AutoGenerateColumns="false" 
                                               AllowPaging="true" 
                                               PageSize="25" 
                                               GridLines="None"
                                               Width="100%"
                                               CssClass="table table-hover"
                                               PagerSettings-Mode="NumericFirstLast"
                                               OnRowDeleting="grdEmpresa_RowDeleting"
                                               OnPageIndexChanging="grdEmpresa_PageIndexChanging"
                                               PagerStyle-HorizontalAlign="Center"
                                               PagerStyle-VerticalAlign="Bottom">
                                               <PagerStyle Font-Size="Medium" />
                                                    <Columns>
                                                        <asp:BoundField 
                                                            DataField="RazaoEmpr" 
                                                            HeaderText="Razão Social"
                                                            HeaderStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField 
                                                            DataField="NReduzEmpr" 
                                                            HeaderText="Nome Reduzido" />
                                                        <asp:TemplateField HeaderText="CPF/CNPJ">
                                                            <ItemTemplate>
                                                                <asp:Label
                                                                    runat="server"
                                                                    ID="lblCpfCnpjGrid"
                                                                    Text='<%#Eval("CnpjEmpr").ToString() %>'>
                                                                </asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField 
                                                            DataField="DtHrCadEmpr" 
                                                            HeaderText="Data de Lançamento"
                                                            HeaderStyle-HorizontalAlign="Center" />
                                                         <asp:TemplateField HeaderText="Tipo">
                                                            <ItemTemplate>
                                                                <asp:Label
                                                                    runat="server"
                                                                    ID="lblFilialGrid"
                                                                    Text='<%# (Eval("FlagMatriz").ToString().Equals("1")?"FILIAL":"MATRIZ") %>'>
                                                                </asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Ativo">
                                                            <ItemTemplate>
                                                                <asp:Label
                                                                    runat="server"
                                                                    ID="Label1"
                                                                    Text='<%# (Eval("FlagAtivoEmpr").ToString().Equals("1")?"SIM":"NÃO") %>'>
                                                                </asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                 <asp:ImageButton
                                                                    runat="server"
                                                                    ID="btnAlterar"
                                                                    ImageUrl="~/Imagens/1445643087_create.png"
                                                                    CommandArgument='<%#Eval("CodEmpr").ToString() %>'
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
                                                                    CommandArgument='<%#Eval("CodEmpr").ToString() %>'
                                                                   />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <EmptyDataTemplate>
                                                        Não foi encontrado nenhuma empresa para ser relacionado!
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
                            Text="Inserir" 
                            CssClass="btn btn-primary"
                            OnClick="btnIncluir_Click"/>
                    </p>
                </div>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
