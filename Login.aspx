<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Sigee.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Sigee - Login</title>
         <!-- Tag Meta para ajustar o responsivo pelo tamanho da tela -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />

        <!-- Css do Bootstrap -->
        <link href="Css/Bootstrap/bootstrap.css" rel="stylesheet" />
        <link href="Css/signin.css" rel="stylesheet" />
    </head>
    <body>
        <div class="container">
            <asp:Panel runat="server" ID="pnlAviso" CssClass="alert alert-info alert-dismissable" Visible="false">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                    <asp:Label runat="server" ID="lblAviso"></asp:Label>
            </asp:Panel>


            <div class="row" style="text-align:center; padding-top:40px;">
                <div class="col-lg-4"></div>
                    <div class="col-lg-4 loginNovo">
                        
                    <form id="form1" runat="server" class="form-signin">
                
                
                        <img src="Imagens/logoSigee.png" />

                        <h2 class="form-signin-heading">Login</h2>

                        <div class="row">
                            <div class="col-lg-12 form-group">
                                <asp:Label runat="server" ID="lblEmail" CssClass="sr-only" Text="Email" AssociatedControlID="txtEmail"></asp:Label>
                                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" ClientIDMode="Static"> </asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 form-group">
                        
                                <asp:Label runat="server" ID="lblSenha" CssClass="sr-only" Text="Senha" AssociatedControlID="txtSenha"></asp:Label>
                                <asp:TextBox runat="server" ID="txtSenha" CssClass="form-control" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                            </div>
                        </div>
                        <asp:Button runat="server" ID="btnEntrar" CssClass="btn btn-lg btn-danger btn-block" Text="Entrar" OnClick="btnEntrar_Click"/>
    
                
                    </form>

                   </div>
                <div class="col-lg-4"></div>
            </div>
        </div>
        <script src="Scripts/Bootstrap/jQuery.js"></script>
        <script src="Scripts/Bootstrap/Bootstrap-min.js"></script>
    </body>
</html>
