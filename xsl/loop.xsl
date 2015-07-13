<?xml version="1.0" encoding="UTF-8"?>
<!-- Edited by Hand -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:template name="for.loop"> 
	<xsl:param name="i" /> 
	<xsl:param name="count" /> 
	<!--begin_: Line_by_Line_Output --> 
	<xsl:if test="$i &lt;= $count"> 
	<br /> <b><xsl:value-of select="$i" />.</b>Hello world! 
	</xsl:if> 

	<!--begin_: RepeatTheLoopUntilFinished--> 
	<xsl:if test="$i &lt;= $count"> 
	<xsl:call-template name="for.loop"> 
	<xsl:with-param name="i"> 
	<xsl:value-of select="$i + 1"/> 
	</xsl:with-param> 
	<xsl:with-param name="count"> 
	<xsl:value-of select="$count"/> 
	</xsl:with-param> 
	</xsl:call-template> 
	</xsl:if> 

	</xsl:template> 

	<xsl:call-template name="for.loop"> 
	<xsl:with-param name="i">1</xsl:with-param> 
	<xsl:with-param name="count">10</xsl:with-param> 
	</xsl:call-template>	

</xsl:stylesheet>