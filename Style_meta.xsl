<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <!-- Format et encodage de sortie. -->
    <xsl:output method="html" encoding="UTF-8"/>
    
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Encodage de Tertullien</title>
                <!-- Ajout d'une feuille de style en CSS. -->
                <link rel="stylesheet" type="text/css" href="/Users/mathildeschwoerer/Documents/Humanités Numériques/Database_XML/Theme_Tertullien_XML.css"/>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <!-- Le contenu du Tei-Header n'est pas copié. -->
    
    <xsl:template match="teiHeader"/>
    
    <!-- Le contenu de div2 est copié.  -->
    <!-- Les balises div2 contiennent chacune un chapitre du texte. On leur donne trois attributs : type, subtype et n. Ainsi, pour le chapitre 1 : <div2 type="textpart" subtype="chapter" n="1"> -->
    
    <xsl:template match="div2">
        <div2>
            <xsl:apply-templates/>
        </div2>
    </xsl:template>
    
    <!-- Traduction du titre principal (XML "head", attribut = "main") en balise HTML <h1>.  -->
    <!-- Le titre principal correspond au nom de l'oeuvre encodé, dans son titre latin.  -->
    <xsl:template match="head[@type='main']">
        <h1>
            <xsl:apply-templates/>
        </h1>
    </xsl:template>
    
    <!-- Traduction du titre secondaire (XML "head", attribut = "sub") en balise HTML <h2>. -->
    <!-- Le titre secondaire est invariable : "Encodage des images littéraires". -->
    <xsl:template match="head[@type='sub']">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    
    <!-- Traduction de p en p avec un break après le contenu. -->
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
        <br/>
    </xsl:template>

    <!-- Création du tooltip pour les éléments <span> -->
    <xsl:template match="span[@ana]">
        <span class="tooltip1">
            <span class="tooltiptext1">
                <xsl:value-of select="@ana"/>
            </span>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!-- Création du tooltip pour les éléments <quote> -->
    <xsl:template match="quote">
        <span class="tooltip2">
            <span class="tooltiptext2">
                <xsl:value-of select="@n"/>
            </span>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
</xsl:stylesheet>
