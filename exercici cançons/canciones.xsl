<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
    <html>
    <body>
        <h1>Mis canciones favoritas</h1>
        <table style="border: 1px solid blue">
            <tr style="background-color:lightblue">
                <th style="text-align:left">Titulo</th>
                <th style="text-align:left">Artista</th>
                <th style="text-align:left">Disco</th>
            </tr>
            <xsl:for-each select="canciones/archivo">
            <tr>
                <th><xsl:value-of select="cancion"></xsl:value-of></th>
                <th><xsl:value-of select="artista"></xsl:value-of></th>
                <th><xsl:value-of select="disco"></xsl:value-of></th>
            </tr>
            </xsl:for-each>
        </table>
    </body>
    </html>
    </xsl:template>
</xsl:stylesheet>