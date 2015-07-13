<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

  <xsl:variable name="gpocollection">Code of Federal Regulations</xsl:variable>
  <xsl:variable name="cfrnumber" select="//FDSYS/CFRTITLE"/>
  <xsl:variable name="cfrvolume" select="//FDSYS/VOL"/>
  <xsl:variable name="cfrdate" select="//FDSYS/DATE"/>
  <xsl:variable name="cfrorigdate" select="//FDSYS/ORIGINALDATE"/>
  <xsl:variable name="cfrtitle" select="//FDSYS/CFRTITLETEXT"/>
  <xsl:variable name="cfrtitle2" select="//FDSYS/TITLE"/>
  <xsl:variable name="cfrgranulenum" select="//FDSYS/GRANULENUM"/>
  <xsl:variable name="cfrheading" select="//FDSYS/HEADING"/>
  <xsl:variable name="cfrancestors" select="//FDSYS/ANCESTORS/PARENT/@HEADING"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Code of Federal Regulations</title>
        <style type="text/css">

	  <!-- Update Dec 03, 2009 5:45pm - NZambrano
	       FDSYS Meta data tags have been updated based on 
	       GPO request. Ancestors tag hadnt been formatted before. Now
	       it is working as it is expected. Thre new templates have been 
	       created to get the FDSYS section to look like as GPO wanted.

	  -->

          <!-- Update Nov 26, 2009 11:00pm - RMATAMOROS  
            PRTPAGE fix when it is found within FL-2 and SECTNO
          -->                    

          <!-- Update Nov 25, 2009 8:06 pm EST USA.
             Tags: 
             LDRWK Section created, and childs re configured. 
             EXTRACT-FP re configured
             PART-SECTION re configured
             SECTION-SECTNO re configured
             SECTION-LDRWK, and SECTION-RESERVED re configured as well.
          -->


          <!-- Update Nov 25, 2009 06:00pm - RMATAMOROS  
            PRTPAGE fix when it is found within a ROW (GPOTABLE) tag.
            (This is an improvement, yet the final fix needs to split
             the whole table)
          -->          

          <!-- Update Nov 25, 2009 05:00pm - NZAMBRANO  
	        Changed Top/Bottom Spacing for CFR SubPart tags.
	        SUBPART-SECTION created
          -->

          <!-- Update Nov 25, 2009 02:09pm - RMATAMOROS  
            PRTPAGE fix when it is found within a PG, SUBJECT,
            CITA and P Tag.
          -->          

          <!-- Update Nov 24, 2009 04:48pm - RMATAMOROS  
            Included page header support (missing formatting fix).
          -->          

          <!-- Update Nov 23, 2009 06:37pm - RMATAMOROS  
            Included support for the ABBREV  tag.
          -->          

          <!-- Update Nov 23, 2009 01:20pm - RMATAMOROS  
            Changed Font for CFR Header CSS H1
            Included missing period to the CFRDOC-FDSYS class tag
          -->

          <!-- Update Nov 20, 2009 10:30pm - NZambrano  
          	Meta Data Tags configured
          	Aligning issues fixed
          	More space bet some titles
          	Emanuel new tags have been configured
          	The proclamation pdf documents done as well
          -->

       	  <!-- Update Nov 18, 2009 4:30pm - NZambrano
       	        fixing some spacing & aligning issues
       	  -->	

          <!-- MetaData Tags   -->

          .FDSYSLINE {display:block;width:100%;margin-bottom:10px;text-align:left;border-bottom-style:solid;border-width:1px;}
          .CFRFDSYS {display:block;width:100%;margin-top:5px;margin-bottom:5px;text-align:left;}
          .FDSYSANCESTORS, .FDSYSHEADINGTITLE2, .FDSYSORIGDATE, .FDSYSDATE, .FDSYSNUMTITLE1, .FDSYSVOLUME {display:block;}



          <!-- End of MetaData Tags  -->

          <!-- Headers -->
           H1 {display:block;font-weight:bold; font-size:18pt;margin-top:3cm;text-align:center;font-family:sans-serif;}
          .SUBCHAP-HED {text-align:center;font-size:12pt;font-weight:bold;display:block;margin-top:1cm;margin-bottom:1cm;}
          .SUBCHAP-RESERVED {text-align:center;font-size:12pt;font-weight:bold;display:block;margin-top:1cm;} 
          .CFRGRANULE, .CFRDOC {font-family:sans-serif;font-size:10pt;}
          .CFRGRANULE-CHAPINDX, .CFRGRANULE-BMTR, .APPENDIX-GPH, .CFRGRANULE-TOC, .CFRGRANULE-CROSSREF {display:block;width:100%;margin-top:1cm;margin-bottom:1cm;text-align:left;}
          .CFRDOC-CHAPINDX, .CFRDOC-BMTR, .CFRDOC-TOC, .CFRDOC-CROSSREF {display:block;width:100%;margin-top:1cm;margin-bottom:1cm;text-align:left;}
          .CFRGRANULE-CONTENTS, CFRDOC-CONTENTS {display:block;width:100%;margin-top:1cm;margin-bottom:1cm;text-align:left;}
          .SUBPART-SUBJGRP, .CFRGRANULE-SOURCE, CFRDOC-SOURCE, .CFRGRANULE-AUTH, .CFRDOC-AUTH {display:block;width:100%;margin-top:20px;margin-bottom:20px;text-align:left;}
          .CONTENTS-SUBPART {display:block;width:100%;margin-top:20px;margin-bottom:20px;text-align:left;}
          .EXPLA-SIG, .EXPLA-IPAR, .CFRGRANULE-ALPHLIST, .CFRDOC-ALPHLIST, .TOCTAC-TITLENO {display:block;width:100%;margin-top:20px;margin-bottom:2cm;text-align:left;}
          .PART-ROPIND {display:block;width:100%;margin-top:20px;margin-bottom:2cm;text-align:left;}
          .ROPIND-HED {display:block;margin-top:20px;margin-bottom:10px;font-size:12pt;text-align:center;}
          .ROPIND-SUBJECT {display:block;text-align:left;clear:both;font-style:italic;}
          .ROPIND-SUBJL {display:block;width:55%;text-align:left;float:left;}
          .ROPIND-SUBJ1L {display:block;width:55%;text-align:left;float:left;}
          .ROPIND-SUBJ2L {display:block;width:53.53%;text-align:left;margin-left:0.5cm;float:left;}
          .ROPIND-SECTNO {display:block;width:25%;text-align:right;margin-right:1cm;float:left;clear:right;}
          .TITLENO-SUBTI, .TOC-EXPL, .TITLENO-CHAPTI {width:100%;margin-bottom:5px;margin-top:5px;}          
          .SUBJGRP-SECTION, .SUBPART-SECTION {width:100%;margin-bottom:10px;margin-top:20px;}
          .SECTION-LDRWK {width:100%;margin-bottom:5px;margin-top:5px;display:block;}
          .PART-SECTION {width:100%;margin-bottom:5px;margin-top:10px;display:block;}
          .TOC-TITLENO {display:block;margin-top:1cm;margin-bottom:1cm;}          
          .TOC-CHAPTI, .TOC-FAIDS {display:block;width:100%;margin-top:0.5cm;margin-bottom:0.5cm;text-align:left;}          
          .CFRTOC-ABBR {display:block;width:100%;margin-top:1cm;margin-bottom:1cm;text-align:left;}
          .SSAINDEX-EDNOTE, .AR-NOTE, .AR-PUBLI {width:100%;text-indent:1cm;}
          .SECTION-EXTRACT {display:block;width:100%;text-align:left;}
          .CFRGRANULE-SECTION, .CFRDOC-SECTION {display:block;width:100%;margin-top:1cm;margin-bottom:1cm;text-align:left;}
          .APPENDIX-LDRWK {display:block;margin-left:1cm;margin-top:10px;text-align:left;width:60%;}
          .CFRGRANULE-GROUPHD, .CFRDOC-GROUPHD {display:block;width:100%;margin-top:1cm;margin-bottom:1cm;text-align:left;}
          .BMTR-INCORP {display:block;width:100%;margin-top:1cm;margin-bottom:1cm;text-align:left;}        
          .CFRTOC-PTHD, .TOC-PGHD {font-style:italic;display:block;text-align:right;width:80%;}          
          .CFRGRANULE-HED, .CFRDOC-HED, .TOC-HED {margin-left:1cm;font-size:30pt;display:block;border-bottom-style:double;border-width:2px; border-color:black;margin-top:3cm;margin-bottom:2cm;text-align:center;}
          .EXTRACT-CTRHD, .CTRHD-FP {display:block;text-align:left;margin-left:1cm;margin-top:20px;}
          .CHAPTI-RESERVED {text-align:left;margin-left:2cm;float:left;}
          .CHAPTI-SUBJECT {text-align:left;width:74%;margin-left:2cm;float:left;display:inline;}          
          .EXPL-SUBJECT {text-align:left;width:77%;display:block;float:left;}
          .SUBTI-HED {text-align:left;width:73.5%;margin-left:1cm;float:left;}
          .EXPL-PG, .SUBTI-PG, .CHAPTI-PG {width:5%;text-align:left;display:inline;float:left;}
          .MATH-MID {text-align:left;margin-left:2cm;font-size:9pt;font-style:italic;display:block;}          
          .FAIDS-PG  {width:20%;text-align:right;}
          .FAIDS-HED, {text-align:left;width:77%;}
          .FAIDS-SUBJECT {text-align:left;width:77%;}         
          .SIG-NAME {text-align:right;width:90%;display:block;text-transform:uppercase;}
          .SIG-OFFICE, .SIG-POSITION {text-align:right;width:90%;display:block;text-style:italic;}
          .EXPLA-DATE {text-align:left;margin-left:1cm;width:90%;display:block;text-style:italic;font-weight:bold;}          
          .CFRGRANULE-HED, CFRDOC-HED, .CFRGRANULE-PROC, .CFRDOC-PROC {text-align:center;font-size:18pt;margin-top:1cm;margin-bottom:1cm;width:100%;clear:both;}
          .CFRGRANULE-MEMO, .CFRDOC-MEMO {text-align:left;margin-left:1cm;margin-top:0.5cm;margin-bottom:0.5cm;width:100%;}          
          .CFRGRANULE-RESERVED, .CFRDOC-RESERVED {width:75%;text-align:left;display:block;}
          .CFRGRANULE-ENTRY, .CFRDOC-ENTRY {width:75%;text-align:left;float:left;display:block;margin-bottom:20px;}
          .CFRGRANULE-PG, .CFRDOC-PG {width:80%;text-align:right;display:block;float:left;}
          .CFRGRANULE-DETNO, CFRDOC-DETNO, .CFRGRANULE-PNOTICE, .CFRDOC-PNOTICE, .CFRGRANULE-DATE, .CFRDOC-DATE {margin-left:1cm;font-style:italic;display:block;margin-top:0.5cm;}          
          .CFRGRANULE-STUB, .CFRDOC-STUB {text-align:left;display:block;width:90%;float:left;font-weight:bold;}
          .CFRGRANULE-SUBJECT, CFRDOC-SUBJECT {margin-left:1cm;text-align:left;display:block;}
          .CFRGRANULE-SUBJECT1, .CFRDOC-SUBJECT1 {margin-left:2cm;text-align:left;display:block;}         
          .EXPLA-HED, .THISTITL-HED {display:block;font-size:16pt;text-align:center;margin-bottom:2cm;margin-top:3cm;}
          .LSA-HED, .ALPHLIST-HED {display:block;font-size:18pt;text-align:center;margin-left:1cm;margin-top:3cm;width:80%;border-bottom-style:double;border-width:5px;}          
          <!--
          .LDRWK-FL-2 {display:inline;text-align:left;margin-top:10px;}
          .LDRWK-LDRFIG {display:inline;text-align:right;display:block;}
	        .LDRWK-FL-2 {text-align:left;margin-left:1cm;float:left;clear:left;width:80%;border:1px solid black;}
	        .LDRWK-LDRFIG {text-align:right;display:block;width:100%;border:1px solid black;clear:right;}
          -->          
          .LDRWK-FL-2 {text-align:left;margin-left:1cm;width:90%;float:left;}
          .LDRWK-LDRFIG {text-align:right;width:100%;display:block;}
          .INCORP-RRH, .INCORP-LRH {text-align:center;font-weight:bold;font-size:18px;display:block;}
          .INCORP-HED {text-align:center;font-weight:bold;display:block;margin-top:1cm;}
          .CFRGRANULE-TABLHED, .CFRDOC-TABLHED {text-align:center;font-weight:bold;display:block;margin-top:3cm;font-size:14pt;clear:both;}
          .PART-CITA, .CHAPTER-JOURNAL {text-align:left;margin-left:0.5cm;display:block;margin-top:1cm;margin-bottom:1cm;clear:both;}
          .EXTRACT-DOCKETHD {font-variant:small-caps;text-align:center;display:block;}
          .EXTRACT-HD1 {margin-left:1cm;font-variant:small-caps;text-align:left;display:block;margin-bottom:10px;margin-top:10px;}
          .EXTRACT-FP {text-indent:1cm;display:block;text-align:left;margin-top:5px;margin-bottom:5px;}
          .SECTION-APPRO, .SECTION-FP {text-indent:1cm;display:block;text-align:left;margin-top:5px;margin-bottom:5px;font-weight:bold;}
          .SECTION-EXT-XREF {text-indent:2cm;display:block;text-align:left;margin-top:5px;margin-bottom:5px;}
          .SECTION-BOXTXT {text-indent:2cm;text-align:center;border:1px solid black;display:block;padding:10px;width:80%;margin:20px;}  
          .GPH-GID {text-indent:1cm;display:block;text-align:left;margin-top:10px;margin-bottom:20px;}          
          .APPENDIX-SECAUTH, .GPH-BCAP {text-indent:1cm;display:block;text-align:left;margin-top:10px;margin-bottom:5px;}          
          .SSAINDEX-HED, .ACQRUL-HED, .ABBR-HED {font-size:14px;font-variant:small-caps;text-indent:1cm;display:block;text-align:left;margin-top:10px;margin-bottom:10px;}
          .EXTRACT-HD2 {text-align:left;margin-left:1cm;font-weight:bold;display:block;margin-top:20px;}
          .EDNOTE-NOTE-HED {font-variant:small-caps;text-indent:2cm;}
          .ACQRUL-E-04 {font-size:14px;font-variant:small-caps;}
          .ACQRUL-E-03 {font-style:italic;margin-top:25px;text-indent:2cm;}          
          .CHAPTER-CHAPNO {margin-left:1cm;font-size:14pt;font-weight:bold;display:block;text-align:left;}
          .CHAPTER-OWNER {font-size:12pt;font-weight:bold;margin-top:20px;margin-left:1cm;display:block;text-align:left;}
          .CHAPTER-ADDR {display:block;margin-bottom:10px;text-align:left;margin-left:1cm;}
          .CHAPTER-AGENCY, .CHAPTER-AVAIL {display:block;text-indent:1cm;text-align:left;margin-bottom:5px;width:80%;}
          .CHAPTER-CFRHD {text-align:right;display:block;margin-right:1cm;margin-bottom:5px}          
          .CUSTOM-CHAPTER-PUBLI {font-style:normal;}
          .CUSTOM-CHAPTER-CFRNO {font-style:normal;}         
          .CHAPTER-CFRNO-MAINCONTAINER {margin-top:-33px;width:1200px;}
          .CHAPTER-CFRNO-MAINCONTAINER2 {margin-bottom:10px;width:1200px;clear:both;}
          .CHAPTER-CFRNO-SIDECONTAINER {width:350px;padding:10px;margin:0px;float:left;}
          .CHAPTER-CFRNO-CONTENTCONTAINER {width:400px;padding:10px;text-align:right;margin:0px;float:left;}	
          .CUSTOM-CHAPTER-CFRNO-DUMP {text-align:right;}
          .CHAPTER-PUBLI-CONTAINER {text-align:left;width:650px;padding:5px;display:block;}
          .CHAPTER-ANOTE {text-indent:1cm;display:block;margin-bottom:10px} 
          .FAIDS-HED {margin-top:10px;display:block;}
          .FAIDS-SUBJECT {text-indent:1cm;display:block;text-align:left;margin-top:10px;}
          .FAIDS-PG  {position:absolute;right:5cm;margin-top:-17px;text-align:right;}
          .CHAPINDX-SUBJECT {display:block;text-align:left;margin-top:10px;font-weight:bold;width:100%;}
          .CHAPINDX-SUBJL {display:inline;text-indent:1cm;display:block;text-align:left;margin-top:10px;}
          .CHAPINDX-PT {display:inline;text-align:right;}          
          .LSA-PUBYEAR {display:block;margin-top:2cm;margin-bottom:2cm;text-align:center;}          
          .CFRGRANULE-APPHED, .CFRGRANULE-APP, .CFRDOC-APPHED, .CFRDOC-APP {display:block;text-indent:1cm;text-align:left;width:60%;}
          .CFRGRANULE-PG, .CFRDOC-PG {text-align:right;display:block;margin-right:6cm;margin-top:-22px;}          
          .CHAPINDX-HED, .BLMINDEX-ALPHHD, .CHAPINDX-ALPHHD {text-align:center;width:100%;font-weight:bold;display:block;font-size:14pt;margin-bottom:20px;margin-top:10px;}
          .BLMINDEX-HD2, .BLMINDEX-HD {text-align:left;display:block;text-indent:2cm;margin-top:10px;}
          .BLMINDEX-STUB {display:block;text-align:right;margin-right:1cm;margin-top:-18px;}
          .CROSSREF-HED {display:block;text-align:left;margin-left:1cm;}          
          .REGINDEX-INDEXHD {text-align:center;font-weight:bold;display:block;font-size:12pt;margin-bottom:20px;margin-top:20px;}
          .REGINDEX-ALPHHD {margin-left:3cm;text-align:left;font-weight:bold;display:block;font-size:12pt;margin-bottom:20px;margin-top:1cm;}
          .REGINDEX-FP {text-transform:uppercase;margin-top:1cm;}          
          .PUBYEAR-YEAR {text-align:center;font-weight:bold;display:block;font-size:14pt;margin-bottom:20px;}
          .PUBYEAR-CFRNO {text-align:left;font-weight:bold;display:block;font-size:12pt;margin-bottom:20px;}
          .PUBYEAR-VOLHD {text-align:right;display:block;font-size:10pt;margin-bottom:20px;margin-top:-42px;}
          .PUBYEAR-PGHD {text-align:right;display:block;font-size:10pt;margin-bottom:20px;margin-top:-19px;}
          .PUBYEAR-REV, .PUBYEAR-CHAPNO, .PUBYEAR-ENTRY {text-align:left;display:block;font-size:12pt;}
          .PUBYEAR-PG {text-align:right;display:block;font-size:12pt;margin-top:-20px;}
          .PUBYEAR-MOREPGS {text-indent:2cm;text-align:center;border:1px solid black;display:block;padding:10px;width:80%;margin:20px;}          
          .PUBLI1-SU {font-size:8pt;font-style:italic;margin-left:2px;margin-right:2px;vertical-align:super}
          .FP-SU, .P-SU {font-size:8pt;font-style:italic;margin-left:2px;margin-right:2px;vertical-align:super}
          .P-FR {font-size:8pt}
          .SECTION-FTNT {text-indent:1cm;font-size:8pt;font-style:italic;display:block;text-decoration:overline}          
          .TITLEHD-HED {display:block;font-weight:bold;font-size:22pt;text-align:center;margin-top:3cm;margin-bottom:1cm;border-bottom-style:double;border-width:3px;}
          .BLMINDEX-HED, .CHAPTER-HED, .TOCTAC-HED, .SUBTITLE-HED, .TOCHD-HED {font-size:22pt;display:block;border-bottom-style:double;border-width:2px; border-color:black;margin-top:2cm;text-align:center;}          
          .PART-HED {font-weight:bold;font-size:12pt;display:block;margin-top:1cm;margin-bottom:1cm;text-align:center;}
          .PART-RESERVED {font-weight:bold;font-size:12pt;display:block;margin-top:3cm;margin-bottom:3px;text-align:center;}
          .APPENDIX-LHD1, .APPENDIX-HD3, .APPENDIX-HD1, .APPENDIX-HED {font-weight:bold;display:block;font-size:12pt;text-align:left;margin-bottom:10px;margin-top:10px}        
          .APPENDIX-HD2 {font-weight:bold;display:block;font-size:12pt;text-align:center;margin-bottom:10px;margin-top:10px}        
          .SIDEHED-HED {text-indent:1cm;display:block;font-size:12pt;text-align:left;margin-bottom:10px;margin-top:10px}
          .SUBPART-APP {text-align:center;font-size:12pt;margin-top:20pt;margin-bottom:10pt;display:block;}   
          .SUBJGRP-HED {font-size:12pt;margin-bottom:20pt;margin-top:25pt;display:block;font-weight:bold;width:80%;}   
          .CONTENTS-APP {display:block;text-align:left;margin-top:1cm;text-indent:2cm;font-weight:bold;}                   
          .SECTION-SECTNO {font-weight:bold;text-align:left;width:15%;float:left;}                   
          .SECTION-SUBJECT {font-weight:bold;width:70%;}      
          .SECTION-RESERVED {font-weight:bold;width:70%;}          
          .SUBJGRP-SECTNO, .CONTENTS-SECTNO {font-weight:bold;display:block;text-align:left;width:15%;float:left;}                   
          .SUBJGRP-SUBJECT,.AUTH-SOURCE-P, .CONTENTS-SUBJECT {width:90%;display:block;text-align:left;}  
          .SOURCE-HED, .AUTH-HED {font-weight:bold;display:block;text-align:left;width:15%;float:left;}          
          .INCORP-REV, .BLMINDEX-DATE, .TOCTAC-REV {font-weight:bold;font-size:8pt;text-align:center;display:block;}
          .ALPHLIST-AGHD {font-weight:bold;text-align:left;margin-left:1cm;display:block;width:30%;float:left;}
          .ALPHLIST-AGENCY {text-align:left;display:block;width:70%;float:left;}
          .ALPHLIST-SUBAGCY {text-align:left;margin-left:1cm;display:block;width:65.7%;float:left;}
          .ALPHLIST-CFRHD {font-weight:bold;text-align:right;display:block;width:90%;}
          .ALPHLIST-CFRID {text-align:right;display:block;width:90%;}                     
          .LSA-LRH {text-align:left;float:left;width:30%;display:block;clear:both;}
          .LSA-RRH {float:left;width:50%;display:block;}          
          .GID {font-family:Sans-serif;font-size:10pt;margin-top:2pt;margin-bottom:6pt;display:block;}         
          .ALPHLIST-REV {text-align:center;font-weight:bold; font-size:8pt;display:block;margin-bottom:1cm;width:80%;}          
          .TOCTAC-CHHD, .APPENDIX-EAR, .CHAPTER-LRH, .CHAPTER-RRH, .TITLE-LRH, .TITLE-RRH, .PART-EAR {display:none;}          
          .CFRGRANULE-LRH,.CFRDOC-LRH, .CFRGRANULE-RRH,.CFRDOC-RRH {display:none;}
          .FAIDS-P, .EFFDNOTP-P, .APPENDIX-P, .AUTH-P, .SOURCE-P, .SIDEHED-P, .THISTITL-P, .SECTION-P, .EXTRACT-P {text-indent:1cm;display:block;text-align:left;margin-top:5pt;margin-bottom:5pt;}
          .CHAPINDX-FP {text-indent:2cm;display:block;text-align:left;margin-top:5pt;margin-bottom:5pt;width:100%;}  
          .APPENDIX-FP {text-indent:1cm;display:block;text-align:left;margin-top:5pt;margin-bottom:5pt;font-style:italic;}
          .CHAPTI-PT {text-align:left;width:5%;float:left;display:inline;clear:left;}          
          .CFRGRANULE-PTHD, .CFRDOC-PTHD {text-align:left;font-style:italic;width:40%;display:block;float:left;}          
          .CFRGRANULE-PGHD, .CFRDOC-PGHD {text-align:right;margin-right:1cm;font-style:italic;width:45%;display:block;float:left;}
          .TOC-PTHD {text-indent:1cm;display:block;font-style:italic;margin-top:20pt;}          
          .EFFDNOTP-HED {text-indent:2cm;text-align:left;}          
          .AUTH-SOURCE-P {text-indent:3cm;display:block;}          
          .EXPLAP.SIDEHEDP {text-indent:1cm;display:block;}          
          .TITLENO-SUBTITL {text-transform:uppercase;margin-top:15px;display:block;text-align:left;margin-bottom:15px;width:90%;}          
          .TITLENO-HED  {margin-top:15px;display:block;}                
          .TITLENO-RESERVED {font-size:18px;margin-bottom:15px;margin-top:15px;display:block;font-weight:bold;}
          .MyTITLENO-HED {font-size:18px;margin-bottom:15px;margin-top:15px;display:block;font-weight:bold;width:90%;}
          .SUBPART-SECTNO {display:block;text-align:left;font-weight:bold;float:left;width:15%;}
          .SUBPART-SUBJECT {display:block;text-align:left;width:75%;}          
          .TITLENO-SUBJECT {text-indent:2cm;display:block;text-align:left;}
          .SUBJECT-PREVCHAPNO {text-indent:1px;display:block;text-align:left;width:90%;}
          .TITLENO-CHAPNO {display:block;text-align:left;width:10%;float:left;}          
          .SUBJGRP-SECHD, .SUBPART-SECHD {display:block;text-align:left;font-weight:bold;}          
          .CONTENTS-SECHD {display:block;text-align:left;font-weight:bold;}
          .MyRESERVED {font-weight:bold;display:block;font-size:12pt;text-align:left;margin-top:10px;margin-bottom:10px;}          
          .SUBPART-HED {font-weight:bold;display:block;font-size:12pt;text-align:left;margin-top:20px;margin-bottom:10px;}          
          .EXPL {display:block;width:500px;}
          .EXPL {width:100%;}
          .IPAR-P {margin-left:1cm;text-align:left;float:left;width:30%;}
          .IPAR-STUB {margin-right:1cm;width:30%;float:left;clear:right;}           

          <!--  CITE SECTION  -->
          .CFRGRANULE-CITE, .CFRDOC-CITE {margin-left:5cm;display:block;font-style:italic;font-size:12pt;width:50%;border-bottom-style:double;border-top-style:double;border-width:2px;margin-top:6cm;margin-bottom:6cm;text-align:center;}
          .CITE-CITEP {display:block;font-style:italic;margin-top:10px;margin-bottom:10px;}
          .E-01 {font-size:12pt;font-weight:bold;margin-left:8px;font-style:normal;}                  
          .E {font-weight:bold;font-style:normal;}
          .E-02 {font-weight:bold;font-style:normal;font-size:12pt;}
          .E-03, .URL {margin-left:0.5cm;font-style:italic;}
          .E-04 {margin-left:0.2cm;font-weight:bold;}
          .E-05 {margin-left:1.5cm;font-variant:small-caps;}
          .E-15 {font-variant:small-caps;}
          .E-22, .E-52 {font-size:6pt;vertical-align:sub;}
          .E-51 {font-size:6pt;vertical-align:top;}

	        .CFRGRANULE-FP, .CFRDOC-FP, .CFRGRANULE-AMDPAR, .CFRDOC-AMDPAR, .HED-P, .HD1-P, .P {margin-left:1cm;text-align:left;display:block;margin-top:10px;margin-bottom:10px;clear:both;}	 
	        .SSAINDEX-HED-P {text-indent:1cm;text-align:left;}	 
	        .MyP {text-indent:1cm;text-align:left;display:block;}
	        .APPENDIX-CITA, .CITA {text-indent:1cm;text-align:left;margin-top:5pt;margin-bottom:20pt;} 	 
          <!-- GPO Tables -->
          .GPOTABLE {margin-top:10pt;margin-bottom:10pt;margin-left:1cm;display:block;border-collapse:collapse;empty-cells:show;border-bottom-style:solid;border-top-style:solid;border-width:1px;border-color:black;}
          .GPOTABLE-TTITLE {text-align:center}			
          .CHED {font-size:8pt;padding:5px;font-weight:bold;border-top-style:solid;border-bottom-style:solid;border-width:1px; border-color:black;}
          .ENT {font-size:8pt;padding:5px;}
          .TNOTE {font-size:8pt;padding-left:15px;}
          .TRPRTPAGE, .TDPRTPAGE {width:100%;} 

	        .OMBNOS {display:block;margin-top:30px;margin-bottom:30px;}
	        .OMBNOS-LRH, .OMBNOS-RRH, .REDES-LRH, .REDES-RRH, .REGINDEX-LRH, .REGINDEX-RRH, .SUBCHIND-LRH, .SUBCHIND-RRH  {display:block;margin-top:10px;margin-bottom:10px;width:100%;text-align:center;font-weight:bold;font-size:14pt;}
	        .OMBNOS-HED, .REDES-HED, .REGINDEX-HED, .SUBCHIND-HED, .SUBJIND-HED {display:block;margin-top:50px;margin-bottom:5px;width:100%;text-align:center;font-weight:bold;font-size:18pt;}
	        .ONOTE {display:block;margin-top:20px;text-indent:1.5cm}
	        .SECTION-PARAUTH {display:block;margin-top:10px;text-indent:2cm;font-size:8pt;}
	        .APPENDIX-PARTHD {display:block;margin-top:10px;width:100%;text-align:center;font-weight:bold}	 
	        .PUBYEAR-REG {display:block;width:100%;text-align:center;} 
	        .EDNOTE, .WEDNOTE {display:block;width:100%;text-align:center;margin-top:20px;}
	        .EDNOTE-HED, .WEDNOTE-HED {text-transform:uppercase;}
	        .EDNOTEP, .WEDNOTEP {display:inline;text-indent:0cm;text-align:center;margin-right:0cm;margin-left:0cm;}    
	        .RESCIS-HED {text-transform:uppercase;display:block;width:100%;text-align:center;margin-top:20px;}
	        .SCOL2 {display:block;margin-top:15px;margin-bottom:15px;}
	        .SCOL2-LI {display:block;text-indent:2cm;}
	        .SUBCHPHD {display:block;margin-top:25px;margin-bottom:5px;width:100%;text-align:center;font-weight:bold;font-size:12pt;}
	        .SUBJIND-EAR {display:none}
	        .CHAPINDX-LRH, .CHAPINDX-RRH {display:block;margin-top:10px;margin-bottom:10px;width:100%;text-align:center;font-weight:bold;font-size:14pt;}
	        .ALPHHD {display:block;margin-top:50px;margin-bottom:5px;width:100%;text-align:center;font-weight:bold;font-size:18pt;}	 
	        .CHAPINDX-PT {text-align:right;position:absolute;right:50px;}
	        .CHAPINDX-SUBJ1L, .CHAPINDX-SUBJECT1 {margin-left:20px;margin-top:5px;}
	        .CHAPINDX-SUBJ2L, .CHAPINDX-SUBJECT2 {margin-left:40px;margin-top:5px;}
	        .CHAPINDX-SUBJ3L, .CHAPINDX-SUBJECT3 {margin-left:60px;margin-top:5px;}
	        .CHAPINDX-PT-P {margin-top:10px;margin-bottom:10px;}
	        .SUBPUBLI {display:block;text-indent:0.5cm;margin-top:5px;margin-bottom:5px;}
	        .TCAP {display:block;width:100%;text-align:center;margin-top:10px;}
	        .TDESC {display:block;width:100%;text-align:center;font-size:8pt;}
	        .SUBTI2 {display:block;margin-top:20px;margin-bottom:10px;width:100%}
	        .SUBTI2-HED {margin-left:40px;}
	        .SUBTI2-PG {text-align:right;position:absolute;right:6.5cm;}

	        .CFRGRANULE-ABBREV, .CFRDOC-ABBREV {float:left;display:block;width:15%;clear:both;text-align:left;}
	        .CFRGRANULE-NAME, .CFRDOC-NAME {margin-bottom:10px;float:left;display:block;width:85%;text-align:left;}

	        /* Page Header */
	        .PGHEAD {width:100%;margin-top:24pt;margin-bottom:0pt;margin-left:0pt;margin-right:0pt;text-indent:0cm;font-style:normal;}
	        .PGHDRCOLLECTION {font-weight:bold;}
	        .PGLABEL {text-align:left;font-size:10pt;}			
	        .PRTPAGE {text-align:right;font-weight:bold;position:absolute;right:50px;font-size:11pt;}
	        .PRTPAGELN1 {width:100%;border-bottom-style:solid;border-width:6px;border-color:black;padding-bottom:3pt;}
	        .PRTPAGELN2 {width:100%;border-bottom-style:solid;border-width:1px;border-color:black;margin-bottom:24pt;padding-bottom:3pt;}

        </style>
      </head>
      <body style="margin-left:50px;margin-right:50px;">
            <center>
               <H1>Code of Federal Regulations</H1>
            </center>
            <xsl:apply-templates select=".//PART"/>
      </body>        
    </html>
  </xsl:template>


<!-- 
	
	<PART>
<EAR>Pt. 1</EAR>
<HD SOURCE="HED">PART 1—PRACTICE AND PROCEDURE</HD>
<CONTENTS>
<SUBPART>
<HD SOURCE="HED">Subpart A—General Rules of Practice and Procedure</HD>
<SUBJGRP>
<HD SOURCE="HED">General</HD>
<SECHD>Sec.</SECHD>
<SECTNO>1.1</SECTNO>
<SUBJECT>Proceedings before the Commission.</SUBJECT>
<SECTNO>1.2</SECTNO>
<SUBJECT>Declaratory rulings.</SUBJECT>


<PART>
<EAR>Pt. 2</EAR>
<HD SOURCE="HED">PART 2—FREQUENCY ALLOCATIONS AND RADIO TREATY MATTERS; GENERAL RULES AND REGULATIONS</HD>
<CONTENTS>
<SUBPART>
<HD SOURCE="HED">Subpart A—Terminology</HD>
<SECHD>Sec.</SECHD>
<SECTNO>2.1</SECTNO>
<SUBJECT>Terms and definitions.</SUBJECT>
</SUBPART>

………
<PART>
	<EAR>Pt. 3</EAR>
	<HD SOURCE="HED">PART 3—AUTHORIZATION AND ADMINISTRATION OF ACCOUNTING AUTHORITIES IN MARITIME AND MARITIME MOBILE-SATELLITE RADIO SERVICES</HD>
	<CONTENTS>
	<SUBJGRP>
	<HD SOURCE="HED">General</HD>
	<SECHD>Sec.</SECHD>
	<SECTNO>3.1</SECTNO>
	<SUBJECT>Scope, basis, purpose.</SUBJECT>
	<SECTNO>3.2</SECTNO>
	<SUBJECT>Terms and definitions.</SUBJECT>
	</SUBJGRP>
	<SUBJGRP>
	<HD SOURCE="HED">Eligibility</HD>
	<SECTNO>3.10</SECTNO>
	<SUBJECT>Basic qualifications.</SUBJECT>


<PART>
	<EAR>Pt. 5</EAR>
	<HD SOURCE="HED">PART 5—EXPERIMENTAL RADIO SERVICE (OTHER THAN BROADCAST)</HD>
	<CONTENTS>
	<SUBPART>
	<HD SOURCE="HED">Subpart A—General</HD>
	<SECHD>Sec.</SECHD>
	<SECTNO>5.1</SECTNO>
	<SUBJECT>Basis and purpose.</SUBJECT>
	<SECTNO>5.3</SECTNO>
	<SUBJECT>Scope of service.</SUBJECT>
	<SECTNO>5.5</SECTNO>





<PART>
	<EAR>Pt. 8</EAR>
	<HD SOURCE="HED">PART 8—PRESERVING THE OPEN INTERNET</HD>
	<CONTENTS>
	<SECHD>Sec.</SECHD>
	<SECTNO>8.1</SECTNO>
	<SUBJECT>Purpose.</SUBJECT>
	<SECTNO>8.3</SECTNO>
	<SUBJECT>Transparency.</SUBJECT>
	<SECTNO>8.5</SECTNO>



<PART>
<EAR>Pt. 12</EAR>
<HD SOURCE="HED">PART 12—REDUNDANCY OF COMMUNICATIONS SYSTEMS</HD>
<CONTENTS>
<SECHD>Sec.</SECHD>
<SECTNO>12.1</SECTNO>
<SUBJECT>Purpose.</SUBJECT>
<SECTNO>12.2</SECTNO>
<SUBJECT>Backup power.</SUBJECT>
<SECTNO>12.3</SECTNO>
<SUBJECT>911 and E911 analyses and reports.</SUBJECT>
</CONTENTS>

………

<PART>
<EAR>Pt. 17</EAR>
<HD SOURCE="HED">PART 17—CONSTRUCTION, MARKING, AND LIGHTING OF ANTENNA STRUCTURES</HD>
<CONTENTS>
<SUBPART>
<HD SOURCE="HED">Subpart A—General Information</HD>
<SECHD>Sec.</SECHD>
<SECTNO>17.1</SECTNO>
<SUBJECT>Basis and purpose.</SUBJECT>
<SECTNO>17.2</SECTNO>
<SUBJECT>Definitions.</SUBJECT>
<SECTNO>17.4</SECTNO> 

-->

  <xsl:template match="PART">
      <!--h2>
			<xsl:value-of select="EAR" /> |
			<xsl:value-of select="HD" />
		</h2 -->
		<div>
			<xsl:apply-templates select="CONTENTS/SUBPART/SECTNO" />
			<xsl:apply-templates select="CONTENTS/SUBJGRP/SECTNO" />
			<xsl:apply-templates select="CONTENTS/SECTNO" />
		</div>
  </xsl:template>

  <xsl:template match="CONTENTS/SUBPART/SECTNO">
      <div>
		<xsl:value-of select="../../../HD" /> > <xsl:value-of select="../HD" /> > <xsl:value-of select="." />&#x2014;<xsl:value-of select="(following-sibling::*)" /> > 47 CFR <xsl:value-of select="." />
	  </div>
  </xsl:template>

  <xsl:template match="CONTENTS/SUBJGRP/SECTNO">
	<div>
		<xsl:value-of select="../../../HD" /> > <xsl:value-of select="." />&#x2014;<xsl:value-of select="following-sibling::*" /> > 47 CFR <xsl:value-of select="." />
	</div>
  </xsl:template>

  <xsl:template match="CONTENTS/SECTNO">
    <div>
      <xsl:value-of select="../../HD" /> > <xsl:value-of select="." />&#x2014;<xsl:value-of select="(following-sibling::*)" /> > 47 CFR <xsl:value-of select="." />
    </div>
  </xsl:template>


</xsl:stylesheet>