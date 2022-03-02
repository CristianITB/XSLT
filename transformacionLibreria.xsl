<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="libro">
        <p><xsl:value-of select="autor"/>escribio
        <xsl:value-of select="titulo"/> en el año
        <xsl:value-of select="fechaPublicacion/@anyo"/></p>
    </xsl:template>
</xsl:stylesheet>