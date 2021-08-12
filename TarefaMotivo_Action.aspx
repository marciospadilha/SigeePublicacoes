<%@ Page Title="" Language="C#" MasterPageFile="~/SigeeMaster.Master" AutoEventWireup="true" CodeBehind="TarefaMotivo_Action.aspx.cs" Inherits="Sigee.TarefaMotivo_Action" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphConteudoPrincipal" runat="server">

     <asp:MultiView runat="server" ID="multiview">
        <asp:View ID="view" runat="server">
            <div class="row">
                <div class="col-lg-12">
                     <div class="form-panel">
                          <h4 class="title">Cadastro de Motivo de Tarefas</h4>   
                            <button class="btn btn-primary" id="btn-voltar">Voltar</button>
                            <asp:Button ID="Button1" runat="server" Text="Salvar" CssClass="btn btn-primary" OnClick="btnSalvar_Click" />
                    </div>
                </div>
            </div>
             <div class="row">
                <div class="col-lg-12">
                    <asp:Panel runat="server" ID="pnlAviso" CssClass="alert alert-info" Visible="false">
                            <asp:Label runat="server" ID="lblAviso"></asp:Label>
                    </asp:Panel>

                    <div class="form-panel">
                        
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-1 col-sm-1 control-label" style="text-align:right;">Descrição:</label>
                                <div class="col-sm-6" style="text-align:left;">
                                    <asp:TextBox runat="server" ID="txtDescricao" CssClass="form-control" required="required"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" CssClass="col-sm-1 col-sm-1 control-label" ID="LabelAtivo">Ativo</asp:Label>
                                 
                                <div class="col-sm-2" style="text-align:left;">
                                   <asp:DropDownList runat="server" ID="ddTarefaMotivoAtivo" CssClass="form-control">
                                            <asp:ListItem Text="Sim" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Não" Value="0"></asp:ListItem>
                                   </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

<script>
   
     $(document).ready(function() {
         $("#btn-voltar").click(function () {
              event.preventDefault();
             window.location.href="TarefaMotivo.aspx"; 
          }); 
	}); 

</script>


        </asp:View>
     </asp:MultiView>
</asp:Content>
