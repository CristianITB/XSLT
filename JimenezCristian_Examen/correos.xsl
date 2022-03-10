<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Correos</title>
                <link href="correos.css" rel="stylesheet" type="text/css" />
            </head>
            <body>
                <h1>Correos</h1>
                <xsl:for-each select="correos/carta">
                    <xsl:sort select="fechaExpedicion"/>
                    <xsl:choose>
                        <xsl:when test="@urgente = 'SI'">
                            <table style="border: 1px solid red" border="3">
                                <tr>
                                    <th>Destinatario</th>
                                    <th>Remitente</th>
                                </tr>
                                <xsl:apply-templates select="carta" />
                            </table>
                        </xsl:when>
                        <xsl:otherwise>
                            <table style="border: 1px solid" border="3">
                                <tr>
                                    <th>Destinatario</th>
                                    <th>Remitente</th>
                                </tr>
                                <xsl:apply-templates select="carta" />
                            </table>                            
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="carta">
        <tr>
            <th>Nombre</th>
            <th><xsl:value-of select="destinatario/nombre"/></th>
            <th>Nombre</th>
            <th><xsl:value-of select="remite/nombre"/></th>
        </tr>
        <tr>
            <th>Direccion</th>
            <th><xsl:value-of select="destinatario/direccion"/></th>
            <th>Direccion</th>
            <th><xsl:value-of select="remite/direccion"/></th>
        </tr>
        <tr>
            <th></th>
            <th><xsl:value-of select="destinatario/cp"/>, <xsl:value-of select="destinatario/ciudad"/></th>
            <th></th>
            <th><xsl:value-of select="remite/cp"/> <xsl:value-of select="remite/ciudad"/></th>
        </tr>
        <tr>
            <th></th>
            <th><xsl:value-of select="destinatario/provincia"/></th>
            <th></th>
            <th><xsl:value-of select="remite/provincia"/></th>
        </tr>        
        <tr>
            <th></th>
            <th><xsl:value-of select="destinatario/pais"/></th>
            <th></th>
            <th><xsl:value-of select="remite/pais"/></th>
        </tr> 
        <tr>
            <th>Fecha Expedicion</th>
            <th></th>
            <th>Fecha Entrega</th>
        </tr>
        <tr>
            <xsl:apply-templates select="destinatario"/>
            <th></th>

        </tr>
    </xsl:template>

    <xsl:template match="destinatario">
        <th><xsl:value-of select="fechaExpedicion/@dia"/> - <xsl:value-of select="fechaExpedicion/@mes"/> - <xsl:value-of select="fechaExpedicion/@anyo"/></th>
    </xsl:template>

    <xsl:template match="remite">
        <xsl:choose>
            <xsl:when test="fechaEntrega/@dia = 0">
                <th>No entregado</th>
            </xsl:when>
            <xsl:otherwise>
                <th><xsl:value-of select="fechaEntrega/@dia"/> - <xsl:value-of select="fechaEntrega/@mes"/> - <xsl:value-of select="fechaEntrega/@anyo"/></th> 
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


<!-- En el caso de querer reaprovechar el mismo template para un eleemnto
y otro, podemos usar la Pipe | indica que lo usaremos para ambos elementos.
La llamadas se hacen por separado

/////
<xsl:apply-templates select="elementoA" />
<xsl:apply-templates select="elementoB" />

/////

 <xsl:template match="elementoA | elementoB">
     CODIGO DEL TEMPLATE
</xsl:template>

-->
</xsl:stylesheet>
