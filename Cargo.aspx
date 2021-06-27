<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/SigeeMaster.Master"
    AutoEventWireup="true"
    CodeBehind="Cargo.aspx.cs"
    Inherits="Sigee.Cargo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphConteudoPrincipal" runat="server">
    <asp:UpdatePanel runat="server" ID="upCargo">
        <ContentTemplate>
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
                                <h4 class="mb title">Relação de Cargos
                                </h4>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="panel panel-default">
                                            <div class="panel-body">
                                                <div class="table-responsive">
                                                    <asp:GridView
                                                        runat="server"
                                                        ID="grdCargos"
                                                        AutoGenerateColumns="false"
                                                        AllowPaging="true"
                                                        PageSize="25"
                                                        Width="100%"
                                                        GridLines="None"
                                                        CssClass="table table-hover"
                                                        PagerSettings-Mode="NumericFirstLast"
                                                        OnRowDeleting="grdCargos_RowDeleting"
                                                        OnPageIndexChanging="grdCargos_PageIndexChanging"
                                                        PagerStyle-HorizontalAlign="Center"
                                                        PagerStyle-VerticalAlign="Bottom">
                                                        <PagerStyle Font-Size="Medium" />
                                                        <Columns>
                                                            <asp:BoundField
                                                                DataField="NomeCargo"
                                                                HeaderText="Nome do Cargo"
                                                                HeaderStyle-HorizontalAlign="Center" />
                                                            <asp:BoundField
                                                                DataField="DtHrCadCargo"
                                                                HeaderText="Data de Lançamento"
                                                                HeaderStyle-HorizontalAlign="Center" />
                                                            <asp:TemplateField HeaderText="Possui Supervisor">
                                                                <ItemTemplate>
                                                                    <asp:Label
                                                                        runat="server"
                                                                        ID="lblPossuiSupervisorGrid"
                                                                        Text='<%# (Eval("PossuiSupervisor").ToString().Equals("1")?"SIM":"NÃO") %>'>
                                                                    </asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Ativo">
                                                                <ItemTemplate>
                                                                    <asp:Label
                                                                        runat="server"
                                                                        ID="lblAtivoGrid"
                                                                        Text='<%# (Eval("CargoAtivo").ToString().Equals("1")?"SIM":"NÃO") %>'>
                                                                    </asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:ImageButton
                                                                        runat="server"
                                                                        ID="btnAlterar"
                                                                        CommandName="Select"
                                                                        ImageUrl="~/Imagens/1445643087_create.png"
                                                                        CommandArgument='<%#Eval("CodCargo").ToString() %>'
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
                                                                        CommandArgument='<%#Eval("CodCargo").ToString() %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <EmptyDataTemplate>
                                                            Não foi encontrado nenhum cargo para ser relacionado!
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>