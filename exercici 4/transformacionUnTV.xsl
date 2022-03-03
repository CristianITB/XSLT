<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="programacio">
        <cadena>
            <nom>Un TV</nom>
            <programes>
                <xsl:for-each select="audiencia">
                    <programa>
                        <xsl:attribute name="hora">
                            <xsl:value-of select="hora"/>
                        </xsl:attribute>
                        <nom-programa>
                            <xsl:value-of select="cadenes/cadena[@nom='Un TV']"/>
                        </nom-programa>
                        <audiencia>
                            <xsl:value-of select="cadenes/cadena[@nom='Un TV']/@percentatge"/>
                        </audiencia>
                    </programa>
                </xsl:for-each>
            </programes>
        </cadena>
    </xsl:template>
    <xsl:template match="hora">
    </xsl:template>
</xsl:stylesheet>


    <!--  XPATH 
hora = programacio/audiencia/hora
    / > cat programacio/audiencia/hora

nom (Cadena) = programacio/audiencia/cadenes/cadena[@nom="Un TV"]
    / > cat programacio/audiencia/cadenes/cadena[@nom="Un TV"]

nom programa = programacio/audiencia/cadenes/cadena/[@nom="Un TV"]

percentatge = programacio/audiencia/cadenes/cadena[@percentatge]
    / > cat programacio/audiencia/cadenes/cadena[@nom="Un TV"]/@percentatge

  -->