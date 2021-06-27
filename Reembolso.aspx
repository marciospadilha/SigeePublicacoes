<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/SigeeMaster.Master"
    AutoEventWireup="true"
    CodeBehind="Reembolso.aspx.cs"
    Inherits="Sigee.Reembolso" %>

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
                        <h4 class="mb title">Relação de Reembolsos
                        </h4>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <asp:GridView
                                                runat="server"
                                                ID="grdReembolsos"
                                                AutoGenerateColumns="false"
                                                AllowPaging="true"
                                                PageSize="25"
                                                Width="100%"
                                                GridLines="None"
                                                CssClass="table table-hover"
                                                PagerSettings-Mode="NumericFirstLast"
                                                OnRowDeleting="grdReembolsos_RowDeleting"
                                                OnPageIndexChanging="grdReembolsos_PageIndexChanging"
                                                PagerStyle-HorizontalAlign="Center"
                                                PagerStyle-VerticalAlign="Bottom">
                                                <PagerStyle Font-Size="Medium" />
                                                <Columns>
                                                    <asp:BoundField
                                                        DataField="CodReembolsoDespesa"
                                                        HeaderText="Código Reembolso" />
                                                    <asp:TemplateField HeaderText="Funcionario">
                                                        <ItemTemplate>
                                                            <asp:Label
                                                                runat="server"
                                                                ID="lblNomeFuncGrid"
                                                                Text='<%#Eval("Funcionario.NomeFunc").ToString() %>'>
                                                            </asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Despesa">
                                                        <ItemTemplate>
                                                            <asp:Label
                                                                runat="server"
                                                                ID="lblNomeDespesaGrid"
                                                                Text='<%# Eval("TipoDespesa.NomeDespesa").ToString() %>'>
                                                            </asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Valor">
                                                        <ItemTemplate>
                                                            <asp:Label
                                                                runat="server"
                                                                ID="lblValorReembolsoGrid"
                                                                Text='<%# Convert.ToDouble(Eval("ValorDespesa").ToString()).ToString("c") %>'>
                                                            </asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Data">
                                                        <ItemTemplate>
                                                            <asp:Label
                                                                runat="server"
                                                                ID="lblDataGrid"
                                                                Text='<%# Convert.ToDateTime(Eval("DtHrCadReembolsoDespesa").ToString()).ToString("dd/MM/yyyy") %>'>
                                                            </asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Status" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label
                                                                runat="server"
                                                                ID="lblStatusrid"
                                                                Text='<%# (Eval("FlagAutorizado").ToString().Equals("0")?"Não Autorizado":"Autorizado") %>'>
                                                            </asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Pago">
                                                        <ItemTemplate>
                                                            <asp:Label
                                                                runat="server"
                                                                ID="lblStatusPgto"
                                                                Text='<%# (Eval("Pago").ToString().ToLower().Equals("0")?"Não":"Sim") %>'>
                                                            </asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Situação">
                                                        <ItemTemplate>
                                                            <asp:Label
                                                                runat="server"
                                                                ID="lblStatusAutorizado"
                                                                Text='<%# (Eval("FlagAutorizado").ToString().Equals("0")?"Não Autorizado":"Autorizado") %>'>
                                                            </asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:ImageButton
                                                                runat="server"
                                                                ID="btnAlterar"
                                                                ImageUrl="~/Imagens/1445643087_create.png"
                                                                CommandArgument='<%#Eval("CodReembolsoDespesa").ToString() %>'
                                                                OnClick="btnAlterar_Click" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:ImageButton
                                                                runat="server"
                                                                ID="imgDeletar"
                                                                ImageUrl="~/Imagens/1445550190_delete.png"
                                                                CommandName="Delete"
                                                                OnClientClick="return confirm('Deseja excluir esse reembolso?');"
                                                                CommandArgument='<%#Eval("CodReembolsoDespesa").ToString() %>' />
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
