<%@ Page 
    Title="" Language="C#" MasterPageFile="~/SigeeMaster.Master" 
    AutoEventWireup="true"  CodeBehind="RelatorioReembolso_Action.aspx.cs" 
    Inherits="Sigee.RelatorioReembolso_Action" 
%>

<asp:Content ID="Content1" ContentPlaceHolderID="cphConteudoPrincipal" runat="server">
    <asp:MultiView runat="server" ID="multiview">
        <asp:View ID="view" runat="server">
            <asp:HiddenField runat="server" ID="hfDataInicial" />
            <asp:HiddenField runat="server" ID="hfDataFinal" />
            <asp:HiddenField runat="server" ID="hfCodEmpr" />
            <asp:HiddenField runat="server" ID="hfCodFunc" />
            <asp:Panel runat="server" ID="pnlRelatorio" CssClass="row mt">
                <div class="col-lg-12">
                    <h4 class="mb title">
                        Relatório de Reembolsos
                    </h4>   
                    <asp:Literal runat="server" ID="ltlHtml"></asp:Literal>
                </div>
            </asp:Panel>
            <div class="row" style="text-align:center; padding-bottom: 30px;">
                <asp:Button runat="server" ID="btnExportarExcel" Text="Exportar Excel" OnClick="btnExportarExcel_Click" />
                <a href="#" onclick="printDiv();">Imprimir</a>
            </div>

            <script type="text/javascript">
                function printDiv() {
                    var printContents = document.getElementById('<%=pnlRelatorio.ClientID%>').innerHTML;

                    var originalContents = document.body.innerHTML;

                    document.body.innerHTML = printContents;

                    window.print();

                    document.body.innerHTML = originalContents;
                }
            </script>
        </asp:View>
    </asp:MultiView>
</asp:Content>
