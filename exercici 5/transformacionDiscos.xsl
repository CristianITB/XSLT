<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes"/>
<xsl:variable name="id1" select="//group[1]"></xsl:variable>
<xsl:variable name="id2" select="//group[2]"></xsl:variable>
    <xsl:template match="discos">
        <lista>
            <xsl:apply-templates select="disco"/>
        </lista>
    </xsl:template>
    <xsl:template match="disco">
        <xsl:choose>
            <xsl:when test="interpreter/@id = $id1/@id">
                <disco><xsl:value-of select="title"/> interpretado por <xsl:value-of select="$id1/name"/></disco>
            </xsl:when>
            <xsl:otherwise>
                <disco><xsl:value-of select="title"/> interpretado por <xsl:value-of select="$id2/name"/></disco>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>