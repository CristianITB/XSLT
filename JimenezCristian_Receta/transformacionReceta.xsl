<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="receptes/recepta">
<!--<xsl:template match="receptes/recepta[@id='1'">-->
<xsl:choose>
    <xsl:when test="@id='1'">
        <html lang="es">
            <head>
                <meta charset="UTF-8" />
                <title>Receta by Cristian Jimenez</title>
                <link>
                    <xsl:attribute name="rel">stylesheet</xsl:attribute>
                    <xsl:attribute name="href">CSS/styleGeneral.css</xsl:attribute>
                    <xsl:attribute name="charset">UTF-8</xsl:attribute>
                </link>
                <link>
                    <xsl:attribute name="rel">stylesheet</xsl:attribute>
                    <xsl:attribute name="href">CSS/styleReceta.css</xsl:attribute>
                    <xsl:attribute name="charset">UTF-8</xsl:attribute>
                </link>
                <!--
                <link href="CSS/styleGeneral.css" rel="stylesheet" charset="UTF-8" />
                <link href="CSS/styleReceta.css" rel="stylesheet" charset="UTF-8" />
                -->
            </head>
            <body>
                <img class="imgTitulo" alt="Imagen del título" src="Imagenes/Logo-Delicias.png"/>
                <header>
                    <nav class="menu">
                        <ul>
                            <li><a target="blank" href="../index.html">INICIO</a></li>
                            <li><a target="blank" href="https://es.wikipedia.org/wiki/Mi_(nota)">SOBRE MÍ</a></li>
                            <li><a target="blank" href="listaRecetas.html">RECETAS</a></li>
                            <li><a target="blank" href="formulario.html">CONTACTO</a></li>
                            <li><a target="blank" href="https://www.twitch.tv/">OTRAS COSAS</a></li>
                        </ul>
                    </nav>
                </header>
                <main>
                    <div class="titulo">
                        <h1><xsl:value-of select="nom"/></h1>
                        <p>Por <b>Cristian Jiménez</b></p>
                        <p><xsl:value-of select="./@fecha"/></p>
                        <p>Categoría: <b><xsl:value-of select="categoria"/></b></p>
                    </div>

                    <xsl:apply-templates select="informacio_general/foto"/>

                    <div class="sobreReceta">
                        <h2>Sobre la receta</h2>
                        <p><xsl:value-of select="informacio_general/resum"/>
                        </p>
                    </div>
                    <section class="preparacionReceta">
                        <div class="recuadroFlotante">
                            <p><b>Dificultad:</b> <xsl:value-of select="informacio_general/dificultat"/> </p>
                            <p><b>Tiempo total:</b><xsl:value-of select="informacio_general/temps" /><xsl:text> </xsl:text><xsl:value-of select="informacio_general/temps/@unitat" /></p>
                            <p><b>Raciones:</b> <xsl:value-of select="informacio_general/comensals"/></p>
                        </div>
                        <div class="ingredientes">
                            <span>INGREDIENTES</span>
                            <xsl:apply-templates select="ingredients" />
                        </div>
                        <div class="preparacion">
                            <span>PREPARACIÓN</span>
                            <xsl:apply-templates select="preparacio" />
                        </div>
                    </section>
                    <section class="paginacion">
                        <a href="https://google.com">Prev.</a>
                        <a href="https://google.com">1</a>
                        <a href="https://google.com">2</a>
                        <a href="https://google.com">3</a>
                        <a href="https://google.com">4</a>
                        <a href="https://google.com">5</a>
                        <a href="https://google.com">6</a>
                        <a href="https://google.com">7</a>
                        <a href="https://google.com">8</a>
                        <a href="https://google.com">9</a>
                        <a href="https://google.com">10</a>
                        <a href="https://google.com">Next</a>
                    </section>
                </main>
                <footer>
                    <nav>
                        <ul>
                            <li><a target="blank" href="https://facebook.com">FACEBOOK</a></li>
                            <li><a target="blank" href="https://twitter.com">TWITTER</a></li>
                            <li><a target="blank" href="https://instagram.com">INSTAGRAM</a></li>
                            <li><a target="blank" href="https://pinterest.com">PINTEREST</a></li>
                            <li><a target="blank" href="https://gmail.com">EMAIL</a></li>
                            <li><a target="blank" href="https://ca.wikipedia.org/wiki/Xarxa_social">RSS</a></li>
                        </ul>
                    </nav>
                </footer>
            </body>
        </html>
    </xsl:when>
</xsl:choose>
</xsl:template>

<xsl:template match="informacio_general/foto">
<!--<img class="imgPasta" alt="Imagen de la receta" src="Imagenes/Pasta.jpg"/>-->
    <img>
        <xsl:attribute name="src">
            <xsl:value-of select="."/>
        </xsl:attribute>
        <xsl:attribute name="alt">
            <xsl:value-of select="../nom"/>
        </xsl:attribute>
        <xsl:attribute name="class">imgReceta</xsl:attribute>
    </img>
</xsl:template>

<xsl:template match="ingredients">
    <xsl:for-each select="ingredient">
        <p><b><xsl:value-of select="@quantitat"/><xsl:text> </xsl:text><xsl:value-of select="@unitat"/></b><xsl:text> </xsl:text><xsl:value-of select="."/></p>
    </xsl:for-each>
</xsl:template>

<xsl:template match="preparacio">
    <xsl:for-each select="pas">
        <p><b><xsl:value-of select="@numero" style="background-color: yellow"/>. </b><xsl:value-of select="."/> </p>    
    </xsl:for-each>
    <p><b>Et voilà!</b></p>
    <!--<p><b><xsl:value-of select="@numero[last()] + 1"/>. </b>Et voilà!</p>-->    
</xsl:template>

</xsl:stylesheet>