<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/root/prediccion">
    <html>
    <body>
        <table style="border: 1px solid" border="3">
            <tr>
                <th style="text-align:center">Fecha</th>
                <th style="text-align:center">Máxima</th>
                <th style="text-align:center">Mínima</th>
                <th style="text-align:center">Predicción</th>
            </tr>
            <xsl:for-each select="dia">
            <xsl:sort select="temperatura/maxima" order="descending"/>
            <tr>
                <th><xsl:value-of select="@fecha"></xsl:value-of></th>
                <th><xsl:value-of select="temperatura/maxima"></xsl:value-of></th>
                <th><xsl:value-of select="temperatura/minima"></xsl:value-of></th>
                <th><xsl:value-of select="estado_cielo[1]/@descripcion"></xsl:value-of></th>
            </tr>
            </xsl:for-each>
        </table>
    </body>
    </html>
    </xsl:template>
</xsl:stylesheet>