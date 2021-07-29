<%@ Page Language="C#" MasterPageFile="~/SigeeMaster.Master"  AutoEventWireup="true" CodeBehind="UsuarioAlterarSenha.aspx.cs" Inherits="Sigee.UsuarioAlterarSenha" %>



<asp:Content ID="Content1" ContentPlaceHolderID="cphConteudoPrincipal" runat="server">
    <asp:MultiView runat="server" ID="multiview">
        <asp:View ID="view" runat="server">
            <asp:HiddenField runat="server" ID="hfCodUsu" />

             <div class="row">
                <div class="col-lg-12">
                    <asp:Panel runat="server" ID="pnlAviso" CssClass="alert alert-info" Visible="false">
                            <asp:Label runat="server" ID="lblAviso"></asp:Label>
                    </asp:Panel>
                </div>
            </div>

           <div class="row">
                <div class="col-lg-12">
                    <div class="form-panel">
                            <button class="btn btn-primary"  onclick="Voltar();">Voltar</button>
                            <asp:Button ID="btnSalvar" runat="server" Text="Salvar" CssClass="btn btn-primary" OnClick="btnSalvar_Click" />
                    </div>
                </div>
            </div>

            <div class="form-panel">
                        <h4 class="mb title">Alterar Senha do Funcionário</h4>      
                        <div class="form-horizontal style-form">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Nome do Funcionário:</label>
                                <div class="col-sm-10">
                                   <h4> <asp:Label runat="server" ID="txtNomeFuncionario" ></asp:Label></h4>
                                </div>
                            </div>
                       
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Nova Senha:</label>
                                <div class="col-sm-4">
                                   <asp:TextBox runat="server" ID="txtNovaSenha" TextMode="Password" CssClass="form-control" required="required"></asp:TextBox>
                                </div>
                            </div>
                        </div>
             </div>
<script>

    function Voltar() {
        location.href = 'Usuarios.aspx';
    }



</script>

    </asp:View>
    </asp:MultiView>
</asp:Content>



