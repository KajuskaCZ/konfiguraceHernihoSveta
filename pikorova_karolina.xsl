<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text"/>
    <xsl:template match="/konfigurace_oblasti">
        {
            "Oblasti": [ <xsl:for-each select="oblasti/oblast">
                <xsl:sort select="@o_nazev" order="ascending"/>
                {
                    "ID": "<xsl:value-of select="@id"/>",
                    "Název": "<xsl:value-of select="@o_nazev"/>",
                    "Bossové": [ <xsl:for-each select="hlavni_nepratele/hlavni_nepritel[level > 9]">
                        {
                            "ID": "<xsl:value-of select="@id"/>",
                            "Jméno": "<xsl:value-of select="@jmeno"/>",
                            "Třída": "<xsl:value-of select="@trida"/>",
                            "Úrověň": "<xsl:value-of select="level"/>",
                            "Dohled": "<xsl:value-of select="dohled"/>",
                            "Životy": "<xsl:value-of select="staty/zivoty"/>",
                            "Pohyblivost": "<xsl:value-of select="staty/pohyblivost"/>",
                            "Rychlost útoku": "<xsl:value-of select="staty/rychlost_utoku"/>",
                            "Zbraň": "<xsl:value-of select="zvlastni_schpnost/@zbran"/>",
                            "Zvláštní schopnost": "<xsl:value-of select="zvlastni_schpnost"/>",
                            "XP": "<xsl:value-of select="typ_odmeny/@xp"/>",
                            "Typ odměny": "<xsl:value-of select="typ_odmeny"/>"
                        } <xsl:if test="position() != last()">,</xsl:if>
                    </xsl:for-each>
                    ]
                } <xsl:if test="position() != last()">,</xsl:if>
            </xsl:for-each>
            ]
        }
    </xsl:template>
</xsl:stylesheet>