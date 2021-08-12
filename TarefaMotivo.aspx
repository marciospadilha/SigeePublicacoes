<%@ Page Title="" Language="C#" MasterPageFile="~/SigeeMaster.Master" AutoEventWireup="true" CodeBehind="TarefaMotivo.aspx.cs" Inherits="Sigee.TarefaMotivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphConteudoPrincipal" runat="server">

    <asp:MultiView runat="server" ID="multiview">
        <asp:View ID="view" runat="server">
            <div class="row">
                <div class="col-lg-11">
                    <asp:Panel runat="server" ID="pnlAviso" CssClass="alert alert-info" Visible="false">
                           <asp:Label
                                runat="server"
                                ID="lblAviso">
                            </asp:Label>
                    </asp:Panel>

                       <div class="form-panel">
                         <h4 class="title">Cadastro de Motivo de Tarefas</h4>   
                           <div class="row">
                            <div class="col-lg-12">
                                <p style="text-align:left;">
                                    <asp:Button ID="btnIncluir" runat="server" Text="Novo" CssClass="btn btn-primary" OnClick="btnIncluir_Click" />
                                </p>
                            </div>
                        </div>
                      </div>
                 </div>
                </div>
             
             <%--##### grid #####--%>
            <div class="row">
                 <div class="col-lg-11">
                    <div class="form-panel">   
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


                   
                    <div class="row" style="padding-bottom:20px;">
                           <div class="col-lg-12">
                               <asp:Panel runat="server" ID="Panel1" CssClass="alert alert-info" Visible="false">
                                        <asp:Label runat="server" ID="Label1"></asp:Label>
                               </asp:Panel>
                           </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="table-responsive">

                                <div class="table-responsive">
                                           <asp:GridView
                                               runat="server"
                                               ID="grdTarefaMotivo"  
                                               AutoGenerateColumns="false" 
                                               AllowPaging="true" 
                                               PageSize="25" 
                                               Width="100%" 
                                               CellPadding="2"
                                               GridLines="None"
                                               CssClass="table table-hover"
                                               PagerSettings-Mode="NumericFirstLast" 
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
                                                                    CommandArgument='<%#Eval("CodTarefaMotivo").ToString() %>'
                                                                    OnClick="btnAlterar_Click"/>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                         <asp:BoundField 
                                                            DataField="CodTarefaMotivo" 
                                                            HeaderText="Cod"
                                                            HeaderStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField 
                                                            DataField="Descricao" 
                                                            HeaderText="Descrição"
                                                            HeaderStyle-HorizontalAlign="Center" />
                                                        <asp:TemplateField HeaderText="Ativo">
                                                            <ItemTemplate>
                                                                <asp:Label
                                                                    runat="server"
                                                                    ID="Label1"
                                                                    Text='<%# (Eval("Ativo").ToString().Equals("1")?"SIM":"NÃO") %>'>
                                                                </asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                    </Columns>
                                                    <EmptyDataTemplate>
                                                        Não foi encontrado nenhum registro para ser relacionado!
                                                    </EmptyDataTemplate>
                                           </asp:GridView>

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
