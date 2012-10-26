<%@ Page Title="" Language="C#" MasterPageFile="~/MP_Principal.Master" AutoEventWireup="true"
    CodeBehind="Index.aspx.cs" Inherits="IMSS_RMN.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h2 class="centrado">
            IMSS | UMAE | Unidad de Alta Especialidad</h2>
            <div class="span8 offset2">
        <div id="myCarousel" class="carousel slide">
            <!-- Carousel items -->
            <div class="carousel-inner">
                <div class="active item">
                    <img src="Imagenes/logosIMSS/umae1.jpg" style="width:auto;" />
                    <div class="carousel-caption">
                        <h4>
                            UMAE 1</h4>
                        <p>
                            Descripción UMAE 1
                        </p>
                    </div>
                </div>
                <div class="item">
                    <img src="Imagenes/logosIMSS/umae2.jpg" />
                    <div class="carousel-caption">
                        <h4>
                            UMAE 2</h4>
                        <p>
                            Descripción UMAE 2
                        </p>
                    </div>
                </div>
                <div class="item">
                    <img src="Imagenes/logosIMSS/umae3.jpg" />
                    <div class="carousel-caption">
                        <h4>UMAE 3</h4>
                        <p>
                            Descripción UMAE 3
                        </p>
                    </div>
                </div>
            </div>
            <!-- Carousel nav -->
            <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
            <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
        </div>
        </div>
    </div>
    <script type="text/javascript">
        $('.carousel').carousel({
            interval: 5000
        })
    </script>
</asp:Content>
