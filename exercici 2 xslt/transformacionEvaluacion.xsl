<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="evaluacion">
    <html>
    <body>
        <table style="border: 1px solid" border="3">
            <tr style="background-color: lightgreen">
                <th style="text-align:center">Nombre</th>
                <th style="text-align:center">Apellidos</th>
                <th style="text-align:center">Teléfono</th>
                <th style="text-align:center">Repetidor</th>
                <th style="text-align:center">Nota Práctica</th>
                <th style="text-align:center">Nota Examen</th>
                <th style="text-align:center">Nota Total</th>
            </tr>
            <xsl:for-each select="alumno">
                <xsl:sort select="apellidos" order="ascending"/>
            
                <tr>
                    <th><xsl:value-of select="nombre"></xsl:value-of></th>
                    <th><xsl:value-of select="apellidos"></xsl:value-of></th>
                    <th><xsl:value-of select="telefono"></xsl:value-of></th>
                    <th><xsl:value-of select="@repite"></xsl:value-of></th>
                    
                    <xsl:apply-templates select="notas"/>
                    <th>
                        <img>
                            <xsl:attribute name="src">
                                <xsl:value-of select="img/src"/>
                            </xsl:attribute>
                        </img>
                    </th>
                </tr>
            </xsl:for-each>
        </table>
    </body>
    </html>
    </xsl:template>
    <xsl:template match="notas">
        <th><xsl:value-of select="practicas"/></th>
        <th><xsl:value-of select="examen"/></th>
        <xsl:choose>
            <xsl:when test = "((examen + practicas) div 2) &lt;5">
                <th style="color:red"><xsl:value-of select="(examen + practicas) div 2"/></th>
            </xsl:when>
            <xsl:when test = "((examen + practicas) div 2) &gt;8">
                <th style="color:blue"><xsl:value-of select="(examen + practicas) div 2"/></th>
            </xsl:when>
            <xsl:otherwise>
                <th style="color:green"><xsl:value-of select="(examen + practicas) div 2"/></th>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>