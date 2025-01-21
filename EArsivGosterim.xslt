<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	    xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
	    xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
	    xmlns:ccts="urn:un:unece:uncefact:documentation:2"
	    xmlns:clm54217="urn:un:unece:uncefact:codelist:specification:54217:2001"
	    xmlns:clm5639="urn:un:unece:uncefact:codelist:specification:5639:1988"
	    xmlns:clm66411="urn:un:unece:uncefact:codelist:specification:66411:2001"
	    xmlns:clmIANAMIMEMediaType="urn:un:unece:uncefact:codelist:specification:IANAMIMEMediaType:2003"
	    xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:link="http://www.xbrl.org/2003/linkbase"
	    xmlns:n1="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
	    xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
	    xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2"
	    xmlns:xbrldi="http://xbrl.org/2006/xbrldi" xmlns:xbrli="http://www.xbrl.org/2003/instance"
	    xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:xlink="http://www.w3.org/1999/xlink"
	    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
	    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	    exclude-result-prefixes="cac cbc ccts clm54217 clm5639 clm66411 clmIANAMIMEMediaType fn link n1 qdt udt xbrldi xbrli xdt xlink xs xsd xsi">

  <!-- VIO VERSION 02 -->

  <xsl:character-map name="a">
    <xsl:output-character character="&#133;" string=""/>
    <xsl:output-character character="&#158;" string=""/>
    <xsl:output-character character="&#129;" string=""/>
    <xsl:output-character character="&#130;" string=""/>
    <xsl:output-character character="&#131;" string=""/>
    <xsl:output-character character="&#132;" string=""/>
    <xsl:output-character character="&#133;" string=""/>
    <xsl:output-character character="&#134;" string=""/>
    <xsl:output-character character="&#135;" string=""/>
    <xsl:output-character character="&#136;" string=""/>
    <xsl:output-character character="&#137;" string=""/>
    <xsl:output-character character="&#138;" string=""/>
    <xsl:output-character character="&#139;" string=""/>
    <xsl:output-character character="&#140;" string=""/>
    <xsl:output-character character="&#141;" string=""/>
    <xsl:output-character character="&#142;" string=""/>
    <xsl:output-character character="&#143;" string=""/>
    <xsl:output-character character="&#144;" string=""/>
    <xsl:output-character character="&#145;" string=""/>
    <xsl:output-character character="&#146;" string=""/>
    <xsl:output-character character="&#147;" string=""/>
    <xsl:output-character character="&#148;" string=""/>
    <xsl:output-character character="&#149;" string=""/>
    <xsl:output-character character="&#150;" string=""/>
    <xsl:output-character character="&#151;" string=""/>
    <xsl:output-character character="&#152;" string=""/>
    <xsl:output-character character="&#153;" string=""/>
    <xsl:output-character character="&#154;" string=""/>
    <xsl:output-character character="&#155;" string=""/>
    <xsl:output-character character="&#156;" string=""/>
    <xsl:output-character character="&#157;" string=""/>
    <xsl:output-character character="&#158;" string=""/>
    <xsl:output-character character="&#159;" string=""/>
  </xsl:character-map>

  <xsl:decimal-format name="european" decimal-separator="," grouping-separator="." NaN=""/>
  <xsl:output version="4.0" method="html" indent="no" encoding="UTF-8"
      doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN" doctype-system="http://www.w3.org/TR/html4/loose.dtd"
      use-character-maps="a"/>
  <xsl:param name="SV_OutputFormat" select="'HTML'"/>
  <xsl:variable name="space" select="'&#160;'"/>
  <xsl:variable name="XML" select="/" />
  <xsl:variable name="xroot" select="node()"/>

  <!--__iptal__fiyatFormatStr-->
  <!--__iptal__bedelFormatStr-->

  <xsl:param name="_belgeTipi" select="$xroot/cbc:ProfileID"/>
  
  <xsl:variable name="_fiyatFormatStr"
        select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType='PARAM' and parent::node()/cbc:DocumentTypeCode = 'FIYAT_FORMAT_STR']" />
  <xsl:variable name="fiyatFormatStr">
    <xsl:choose>
      <xsl:when test="$_fiyatFormatStr">
        <xsl:value-of select="$_fiyatFormatStr"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>###.##0,00000</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="_bedelFormatStr"
      select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType='PARAM' and parent::node()/cbc:DocumentTypeCode = 'BEDEL_FORMAT_STR']" />
  <xsl:variable name="bedelFormatStr">
    <xsl:choose>
      <xsl:when test="$_bedelFormatStr">
        <xsl:value-of select="$_bedelFormatStr"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>###.##0,00</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="_genelPunto"
            select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType='PARAM' and parent::node()/cbc:DocumentTypeCode = 'GENEL_PUNTO']"/>
  <xsl:variable name="genelPunto">
    <xsl:choose>
      <xsl:when test="$_genelPunto">
        <xsl:value-of select="$_genelPunto"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="9"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="belgeTipi">
    <xsl:choose>
      <xsl:when test="name($xroot) = 'DespatchAdvice'">
        <xsl:text>irsaliye</xsl:text>
      </xsl:when>
      <xsl:when test="name($xroot) = 'CreditNote'">
        <xsl:text>mustahsil</xsl:text>
      </xsl:when>
      <xsl:when test="$_belgeTipi = 'EARSIVFATURA'">
        <xsl:text>arsiv</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>fatura</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="belgeTipiText">
    <xsl:choose>
      <xsl:when test="$belgeTipi = 'irsaliye'">
        <xsl:text>e-İrsaliye</xsl:text>
      </xsl:when>
      <xsl:when test="$belgeTipi = 'mustahsil'">
        <xsl:text>e-Müstahsil</xsl:text>
      </xsl:when>
      <xsl:when test="$belgeTipi = 'arsiv'">
        <xsl:text>e-Arşiv Fatura</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>e-Fatura</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  
  <xsl:variable name="darDokummu"
      select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType='PARAM' and parent::node()/cbc:DocumentTypeCode = 'DAR_DOKUM']"/>

  <xsl:variable name="dovizlimi"
      select="not ($xroot/cbc:DocumentCurrencyCode = 'TRL' or $xroot/cbc:DocumentCurrencyCode = 'TRY')"/>

  <xsl:variable name="dovizGosterimKurali"
      select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType='PARAM' and parent::node()/cbc:DocumentTypeCode = 'DOVIZ_GOSTERIM_KURALI']"/>

  <xsl:variable name="fiyatGosterimKurali"
      select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType='PARAM' and parent::node()/cbc:DocumentTypeCode = 'FIYAT_GOSTERIM_KURALI']"/>

  <xsl:variable name="cokluKDVmi"
		select="count($xroot/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode [. = '0015']) &gt; 1" />

  <xsl:variable name="iskontoVeyaNakliyeVarmi"
    select="($xroot/cac:AllowanceCharge/cbc:Amount and $xroot/cac:AllowanceCharge/cbc:Amount != 0) or ($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'DIP_NAKBEDEL'])" />
  <!--<xsl:variable name="iskontoVeyaNakliyeVarmi"
    select="($xroot/cac:AllowanceCharge/cbc:Amount and $xroot/cac:AllowanceCharge/cbc:Amount != 0) or ($xroot/cac:InvoiceLine//cac:AllowanceCharge/cbc:MultiplierFactorNumeric != 0) or ($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'DIP_NAKBEDEL'])" />-->

  <xsl:variable name="vergilerDahilToplamTutarGosterilirmi"
      select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType='PARAM' and parent::node()/cbc:DocumentTypeCode = 'DIPTE_VERGILER_DAHIL_TOPLAM_TUTAR']"/>


  <xsl:template match="/">
    <html>
      <head>
        <title/>
        <style type="text/css">
          body {
          background-color: #FFFFFF;
          font-family: 'Verdana', "Times New Roman", Times, serif;
          font-size: <xsl:value-of select="$genelPunto"/>pt;
          color: #444444;
          <xsl:if test="$darDokummu">
            line-height: 14px;
          </xsl:if>
          }
          .faturaSonucu {
          font-size: <xsl:value-of select="$genelPunto + 1"/>pt;
          }
          h1, h2 {
          padding-bottom: 3px;
          padding-top: 3px;
          margin-bottom: 5px;
          text-transform: uppercase;
          font-family: Arial, Helvetica, sans-serif;
          }
          h1 {
          font-size: 1.2em;
          text-transform:none;
          }
          h2 {
          font-size: 1em;
          color: brown;
          }
          .malHizmetTablosu {
          margin-bottom: 10px
          }

          .iadeBorderLeft {
          border-left:1px solid #ccc !important;
          border-top:1px solid #ccc !important
          }

          #internetSatis {
          border: 1px solid #ccc;
          padding: 4px;
          width: 792px;
          margin-bottom: 10px;
          }

          .iadeBorderTop {
          border-top: 1px solid #ccc !important;
          }

          .intSatisBilgi tbody td {
          border: none;
          }

          .malHizmetTablosu > table {
            font-family: Verdana;
            background: #fff;
            width: 860px;
            border-collapse: collapse;
            text-align: left;
          }
          .malHizmetTablosu > table th {
          padding: 2px;
          min-width: 20px;
          border: 1px solid #ccc;
          text-align: center;
          vertical-align: middle;
          font-weight: bold;
          height: 35px;
          background-color: #5588CC;
          color: white;
          }

          .malHizmetTablosu > table th .alignLeft {
          text-align: left;
          }
          .malHizmetTablosu > table td {
          border: 1px solid #ccc;
          color: #000;
          <xsl:choose>
            <xsl:when test="$darDokummu">
              padding-top: 4px;
              padding-bottom: 4px;
            </xsl:when>
            <xsl:otherwise>
              padding-top: 6px;
              padding-bottom: 6px;
            </xsl:otherwise>
          </xsl:choose>
          padding-right: 3px;
          white-space: nowrap;
          /*text-align: right;*/
          }
          .malHizmetTablosu > table td .wrap {
            white-space: normal;
            text-align:left;
            padding-left:8px;
          }
          .malHizmetTablosu > table td:first-child,
          .malHizmetTablosu > table th:first-child {
            padding: 2px;
            border-left: 1px solid #ccc;
          }

          .malHizmetTablosu > table td:last-child,
          .malHizmetTablosu > table th:last-child {
            padding-right: 6px;
          }

          .malHizmetTablosu > table tbody tr:nth-child(even) td { background: #FFF; }
          .malHizmetTablosu > table tbody tr:nth-child(odd) td { background: #EEE; }

          table#budgetContainerTable { background: #FFF !important; border: none !important; }
          table#budgetContainerTable > tbody tr:nth-child(even) td,
          table#budgetContainerTable > tbody tr:nth-child(odd) td
          table#budgetContainerTable > tbody tr:hover td,
          table#budgetContainerTable > tbody tr td {
          background: #FFF !important;
          }

          .malHizmetTablosu > table tbody tr:last-child td {
          background: #FFF;
          }

          h3 {
          font-size: 1em;
          color: #333333;
          text-align: justify;
          margin: 0;
          padding: 0;
          }
          h4 {
          font-size: 1.0em;
          font-style: bold;
          font-family: Arial, Helvetica, sans-serif;
          color: #000000;
          margin: 0;
          padding: 0;
          }
          hr {
          height: 2px;
          color: #5588CC;
          background-color: #5588CC;
          /*border: none;*/
          }
          p, ul, ol {
          margin-top: 1.5em;
          }
          ul, ol {
          margin-left: 3em;
          }
          blockquote {
          margin-left: 3em;
          margin-right: 3em;
          font-style: italic;
          }
          a {
          text-decoration: none;
          color: #70A300;
          }
          a:hover {
          border: none;
          color: #70A300;
          }
          #despatchTable {
          border-collapse: collapse;
          /*border-color: #5588CC;*/
          }
          #ettnTable {
          border-collapse:collapse;
          font-size: 7pt;
          /*border-color: #5588CC;*/
          }
          #customerPartyTable, #supplierPartyTable {
          border-width: 0px;
          border-spacing:;
          border-style: inset;
          border-color: gray;
          border-collapse: collapse;
          }
          #customerIDTable {
          border-width: 2px;
          border-spacing:;
          border-style: inset;
          border-color: gray;
          border-collapse: collapse;
          }
          #customerIDTableTd {
          border-width: 2px;
          border-spacing:;
          border-style: inset;
          border-color: gray;
          border-collapse: collapse;
          }
          #lineTable {
          font-size: <xsl:value-of select="$genelPunto + 1"/>pt;
          border-width:2px;
          border-spacing:;
          border-color: #5588cc;
          border-collapse: collapse;
          }
          #lineTableTh {
          }
          #lineTableTr {
          border-width: 1px;
          padding: 0px;
          border-style: inset;
          border-color: #5588CC;
          background-color: white;
          font-size: 7pt;
          }
          #lineTable > tbody > tr > th {
            border: 1px solid #ccc;
          }

          #despatchTable > tbody tr td {
            padding: 4px;
            border: 1px solid #ccc;
          }

          #lineTableDummyTd {
          border-width: 1px;
          border-color: white;
          padding: 1px;
          border-style: inset;
          border-color: black;
          background-color: white;
          }
          #budgetContainerTable {
          border: 0px none;
          border-style: solid;
          border-color: white;
          }
          #lineTableBudgetTd {
          border-width: 1px;
          border-spacing:0px;
          padding: 4px;
          border-style: solid;
          /*border-color: #5588CC;*/
          border-color: #999999;
          background-color: white;
          -moz-border-radius:;
          }
          #notesTable {
            border: none;
          }
          #notesTableTd {
          border-width: 0px;
          border-spacing:;
          border-style: inset;
          border-color: black;
          border-collapse: collapse;
          margin: -10px 0 0 0;
          }
          table {
          border-spacing:0px;
          }
          td {
          }
          /*td:hover {
          background-color: #E4E4E4;
          }*/
        </style>
        <title>
          <xsl:value-of select="$belgeTipiText"/>
        </title>
      </head>
      <body style="margin-left=0.6in; margin-right=0.6in; margin-top=0.79in; margin-bottom=0.79in">
        <xsl:for-each select="$XML">
          <xsl:call-template name="Header"/>

          <div id="ustBilgiParent" align="left" cellspacing="0" cellpadding="0" style="width: 860px; margin-bottom: -.5em;">
            <table border="0" width="100%">
              <tbody>
                <tr valign="top">
                  <td id="belgeIlkBilgi" width="100%" align="left" colspan="2">
                    <!--$belgeIlkBilgi-->
                  </td>
                </tr>
                <tr>
                  <td colspan="2"/>
                </tr>
                <tr valign="top">
                  <td id="ustSolBilgi" width="50%" align="left">
                    <!--$ustSolBilgi-->
                  </td>
                  <td id="ustSagBilgi" align="right">
                    <!--$ustSagBilgi-->
                  </td>
                </tr>
                <tr>
                  <td id="ustGenisBilgi" colspan="2">
                    <!--$ustGenisBilgi-->
                  </td>
                </tr>
              </tbody>
            </table>
          </div>

          <table id="content" border="0" width="870" height="250" valign="top" cellspacing="0" cellpadding="0">
            <tbody>
              <tr>
                <td valign="top" width="350">
                  <hr/>
                  <!--$supplierPartyTable-begin-->
                  <table id="supplierPartyTable" border="0">
                    <tr>
                      <xsl:for-each select="n1:Invoice/cac:AccountingSupplierParty/cac:Party">
                        <xsl:call-template name="Party_Title">
                          <xsl:with-param name="PartyType">OTHER</xsl:with-param>
                          <xsl:with-param name="IsSupplier">true</xsl:with-param>
                        </xsl:call-template>
                      </xsl:for-each>
                    </tr>
                    <tr>
                      <xsl:for-each select="n1:Invoice/cac:AccountingSupplierParty/cac:Party">
                        <xsl:call-template name="Party_Adress">
                          <xsl:with-param name="PartyType">OTHER</xsl:with-param>
                        </xsl:call-template>
                      </xsl:for-each>
                    </tr>
                    <tr>
                      <xsl:for-each select="n1:Invoice/cac:AccountingSupplierParty/cac:Party">
                        <xsl:call-template name="Party_Other">
                          <xsl:with-param name="PartyType">OTHER</xsl:with-param>
                        </xsl:call-template>
                      </xsl:for-each>
                    </tr>
                  </table>
                  <!--$supplierPartyTable-end-->

                  <hr/>

                  <!--$customerPartyTable-begin-->
                  <table id="customerPartyTable" border="0">
                    <tr>
                      <xsl:choose>
                        <xsl:when test="n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeID='PARTYTYPE' and text()='TAXFREE']">
                          <xsl:for-each select="n1:Invoice/cac:BuyerCustomerParty/cac:Party">
                            <xsl:call-template name="Party_Title">
                              <xsl:with-param name="PartyType">TAXFREE</xsl:with-param>
                              <xsl:with-param name="IsSupplier">false</xsl:with-param>
                            </xsl:call-template>
                          </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:for-each select="n1:Invoice/cac:AccountingCustomerParty/cac:Party">
                            <xsl:call-template name="Party_Title">
                              <xsl:with-param name="PartyType">OTHER</xsl:with-param>
                              <xsl:with-param name="IsSupplier">false</xsl:with-param>
                            </xsl:call-template>
                          </xsl:for-each>
                        </xsl:otherwise>
                      </xsl:choose>
                    </tr>
                    <xsl:choose>
                      <xsl:when test="n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeID='PARTYTYPE' and text()='TAXFREE']">
                        <xsl:for-each select="n1:Invoice/cac:BuyerCustomerParty/cac:Party">
                          <tr>
                            <xsl:call-template name="Party_Adress">
                              <xsl:with-param name="PartyType">TAXFREE</xsl:with-param>
                            </xsl:call-template>
                          </tr>
                          <xsl:call-template name="Party_Other">
                            <xsl:with-param name="PartyType">TAXFREE</xsl:with-param>
                          </xsl:call-template>
                        </xsl:for-each>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:for-each select="n1:Invoice/cac:AccountingCustomerParty/cac:Party">
                          <tr>
                            <xsl:call-template name="Party_Adress">
                              <xsl:with-param name="PartyType">OTHER</xsl:with-param>
                            </xsl:call-template>
                          </tr>
                          <xsl:call-template name="Party_Other">
                            <xsl:with-param name="PartyType">OTHER</xsl:with-param>
                          </xsl:call-template>
                        </xsl:for-each>
                      </xsl:otherwise>
                    </xsl:choose>
                  </table>
                  <!--$customerPartyTable-end-->

                  <hr/>
                </td>

                <td align="center" valign="top" width="200">
                  <xsl:text>&#160;&#160;</xsl:text>
                  <table border="0" width="100%">
                    <tbody>
                      <tr>
                        <td colspan="2" align="center">
                          <img style="width: 91px; align: center; margin-top: 10px;" alt="e-Arşiv Logo"
                            src="data:image/jpeg;base64,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" />
                          
                          <h1 align="center" style="font-weight: bold;">
                            <xsl:value-of select="$belgeTipiText"/>
                          </h1>

                          <div id="firmaLogoParent" style="position: relative; vertical-align: middle; text-align: center;">
                            <!--$firmaLogo-->
                            <!--<span style="font-weight: bold;">
                              <img id="firmalogo" align="center" valign="middle" width="100%" alt="Firma Logosu"
                                   style="max-width: 220px; max-height: 160px; margin-top: 0;"
                                   src="https://localhost:90/skyerp/images/background-viologo.png" />
                              <br/>
                              <xsl:text>$firmaUnvan</xsl:text>
                            </span>-->
                          </div>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </td>

                <td valign="top" align="right" width="350">
                  <br/>
                  <table>
                    <tr>
                      <td>
                        <div id="islakImzaParent" style="float: left; position: relative; width: 180px; margin: 25px 0 0 0; vertical-align: middle; text-align: center;">
                          <!--$islakImzaImg-->
                          <!--<img id="islakimza" alt="Firma Yetkilisi Imza" align="center" valign="middle" width="100%"
                             style="max-width: 250px; max-height: 110px;"
                             src="https://localhost:90/skyerp/images/background-viologo.png" />-->
                        </div>
                        
                        <xsl:if test="$xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'KAREKOD_IMG']">
                          <div id="qrCodeParent" align="right" valign="top" style="float: right; position: relative; right: -20px; margin-bottom: 0px; margin-left: -40px;">
                            <!--<xsl:if test="$xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'KAREKOD_IMG']">-->
                            <div id="qrcode">
                              <!-- https://chart.apis.google.com/chart?cht=qr&amp;chs=300x300&amp;choe=UTF-8&amp;chld=L|1&amp;chl= {n1:DespatchAdvice/cbc:UUID}" -->
                              <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'KAREKOD_IMG']">
                                <xsl:choose>
                                  <xsl:when test="cac:Attachment/cbc:EmbeddedDocumentBinaryObject">
                                    <xsl:for-each select="cac:Attachment/cbc:EmbeddedDocumentBinaryObject">
                                      <div class="qrcodeImage-parent">
                                        <img class="qrcodeImage" src="data:{@mimeCode};base64,{.}"></img>
                                      </div>
                                    </xsl:for-each>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <div class="qrcodeImage-parent">
                                      <img class="qrcodeImage" src="{cbc:DocumentTypeCode}"></img>
                                    </div>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </xsl:for-each>
                            </div>
                            <!--</xsl:if>-->
                          </div>
                        </xsl:if>

                        <xsl:text>&#160;</xsl:text>
                        
                        <table id="despatchTable-parent" border="0" align="left" style="text-align: left;">
                          <tbody>
                            <tr>
                              <td>
                                <br/>
                                <!--$despatchTable-begin-->
                                <table id="despatchTable" border="1" style="margin-left: 50px;">
                                  <tbody>
                                    <tr>
                                      <td>
                                        <span style="font-weight:bold;">
                                          <xsl:text>Özelleştirme No:</xsl:text>
                                        </span>
                                      </td>
                                      <td>
                                        <xsl:for-each select="n1:Invoice/cbc:CustomizationID">
                                          <xsl:apply-templates/>
                                        </xsl:for-each>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <span style="font-weight:bold;">
                                          <xsl:text>Senaryo:</xsl:text>
                                        </span>
                                      </td>
                                      <td>
                                        <xsl:for-each select="n1:Invoice/cbc:ProfileID">
                                          <xsl:apply-templates/>
                                        </xsl:for-each>
                                      </td>
                                    </tr>
                                    <tr style="height: 13px;">
                                      <td>
                                        <span style="font-weight:bold; ">
                                          <xsl:text>Fatura Tipi:</xsl:text>
                                        </span>
                                      </td>
                                      <td>
                                        <xsl:for-each select="n1:Invoice/cbc:InvoiceTypeCode">
                                          <xsl:apply-templates/>
                                        </xsl:for-each>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <span style="font-weight:bold; ">
                                          <xsl:text>Fatura No:</xsl:text>
                                        </span>
                                      </td>
                                      <td>
                                        <xsl:for-each select="n1:Invoice/cbc:ID">
                                          <xsl:apply-templates/>
                                        </xsl:for-each>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <span style="font-weight:bold; ">
                                          <xsl:text>Fatura Tarihi:</xsl:text>
                                        </span>
                                      </td>
                                      <td>
                                        <xsl:for-each select="n1:Invoice/cbc:IssueDate">
                                          <xsl:value-of select="substring(.,9,2)"/>.<xsl:value-of select="substring(.,6,2)"/>.<xsl:value-of select="substring(.,1,4)"/>
                                        </xsl:for-each>
                                      </td>
                                    </tr>
                                    <xsl:for-each select="n1:Invoice/cbc:IssueTime">
                                      <tr>
                                        <td>
                                          <span style="font-weight:bold; ">
                                            <xsl:text>Düzenlenme Saati:</xsl:text>
                                          </span>
                                        </td>
                                        <td>
                                          <xsl:apply-templates select="."/>
                                        </td>
                                      </tr>
                                    </xsl:for-each>
                                    <xsl:for-each select="n1:Invoice/cac:AdditionalDocumentReference">
                                      <!-- Plasiyer bilgisi -->
                                      <!--<xsl:if test="cbc:DocumentType='PLASIYER'">
                                        <tr align="left">
                                          <td>
                                            <span style="font-weight:bold; ">
                                              <xsl:text>Plasiyer: </xsl:text>
                                            </span>
                                          </td>
                                          <td>
                                            <span style="">
                                              <xsl:value-of select="cbc:ID"/>
                                            </span>
                                          </td>
                                        </tr>
                                      </xsl:if>-->
                                      <!-- Tahsilat Şekli bilgisi -->
                                      <!--<xsl:if test="cbc:DocumentType='TAHSILSEKLI'">
                                        <tr align="left">
                                          <td>
                                            <span style="font-weight:bold;">
                                              <xsl:text>Tahsil Şekli: </xsl:text>
                                            </span>
                                          </td>
                                          <td>
                                            <span style="">
                                              <xsl:value-of select="cbc:ID"/>
                                            </span>
                                          </td>
                                        </tr>
                                      </xsl:if>-->
                                      <!-- Nakliye Şekli bilgisi -->
                                      <!--<xsl:if test="cbc:DocumentType='NAKLIYESEKLI'">
                                        <tr align="left">
                                          <td>
                                            <span style="font-weight:bold;">
                                              <xsl:text>Nakliye Şekli: </xsl:text>
                                            </span>
                                          </td>
                                          <td>
                                            <span>
                                              <xsl:value-of select="cbc:ID"/>
                                            </span>
                                          </td>
                                        </tr>
                                      </xsl:if>-->
                                      <!-- Fatura Tipi -->
                                      <!--<xsl:if test="cbc:DocumentType='FATTIPI'">
                                        <tr align="left">
                                          <td>
                                            <span style="font-weight:bold;">
                                              <xsl:text>Fatura Ek Tipi: </xsl:text>
                                            </span>
                                          </td>
                                          <td>
                                            <span>
                                              <xsl:value-of select="cbc:ID"/>
                                            </span>
                                          </td>
                                        </tr>
                                      </xsl:if>-->
                                      <!-- Ortalama Vade -->
                                      <!--<xsl:if test="cbc:DocumentType='ORTVADE'">
                                        <tr align="left">
                                          <td>
                                            <span style="font-weight:bold;">
                                              <xsl:text>Fatura Vadesi: </xsl:text>
                                            </span>
                                          </td>
                                          <td>
                                            <xsl:for-each select="cbc:ID">
                                              <span style="">
                                                <xsl:value-of select="substring(.,9,2)"/>.<xsl:value-of select="substring(.,6,2)"/>.<xsl:value-of select="substring(.,1,4)"/>
                                              </span>
                                            </xsl:for-each>
                                          </td>
                                        </tr>
                                      </xsl:if>-->
                                    </xsl:for-each>
                                    <xsl:for-each select="n1:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:District">
                                      <tr style="height:13px;">
                                        <td align="left">
                                          <span style="font-weight:bold; ">
                                            <xsl:text>Sevk Adresi:</xsl:text>
                                          </span>
                                          <span>
                                            <xsl:text>&#160;</xsl:text>
                                          </span>
                                        </td>
                                        <td align="left">
                                          <span>
                                            <xsl:value-of select="."/>
                                          </span>
                                        </td>
                                      </tr>
                                    </xsl:for-each>

                                    <!-- Irsaliye Ref No/Tarih -->
                                    <!--$irsNoVeTarih-->

                                    <!--<xsl:for-each select="n1:Invoice/cac:DespatchDocumentReference">
                                      <tr>
                                        <td>
                                          <span style="font-weight:bold; ">
                                            <xsl:text>İrsaliye No:</xsl:text>
                                          </span>
                                          <xsl:text>&#160;</xsl:text>
                                        </td>
                                        <td>
                                          <xsl:value-of select="cbc:ID"/>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td>
                                          <span style="font-weight:bold; ">
                                            <xsl:text>İrsaliye Tarihi:</xsl:text>
                                          </span>
                                        </td>
                                        <td>
                                          <xsl:for-each select="cbc:IssueDate">
                                            <xsl:value-of select="substring(.,9,2)"/>.<xsl:value-of select="substring(.,6,2)"/>.<xsl:value-of select="substring(.,1,4)"/>
                                          </xsl:for-each>
                                        </td>
                                      </tr>
                                    </xsl:for-each>-->
                                    <xsl:if test="//n1:Invoice/cac:OrderReference">
                                      <tr>
                                        <td>
                                          <span style="font-weight:bold;">
                                            <xsl:text>Sipariş No:</xsl:text>
                                          </span>
                                        </td>
                                        <td>
                                          <xsl:for-each select="n1:Invoice/cac:OrderReference/cbc:ID">
                                            <xsl:apply-templates/>
                                          </xsl:for-each>
                                        </td>
                                      </tr>
                                    </xsl:if>
                                    <xsl:if	test="//n1:Invoice/cac:OrderReference/cbc:IssueDate">
                                      <tr>
                                        <td>
                                          <span style="font-weight:bold;">
                                            <xsl:text>Sipariş Tarihi:</xsl:text>
                                          </span>
                                        </td>
                                        <td>
                                          <xsl:for-each select="n1:Invoice/cac:OrderReference/cbc:IssueDate">
                                            <xsl:value-of select="substring(.,9,2)"/>.<xsl:value-of select="substring(.,6,2)"/>.<xsl:value-of select="substring(.,1,4)"/>
                                          </xsl:for-each>
                                        </td>
                                      </tr>
                                    </xsl:if>
                                    <xsl:for-each select="n1:Invoice/cac:TaxRepresentativeParty/cac:PartyIdentification/cbc:ID[@schemeID='ARACIKURUMVKN']">
                                      <tr>
                                        <td>
                                          <span style="font-weight:bold;">
                                            <xsl:text>Aracı Kurum VKN:</xsl:text>
                                          </span>
                                        </td>
                                        <td>
                                          <xsl:value-of select="."/>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td>
                                          <span style="font-weight:bold;">
                                            <xsl:text>Aracı Kurum Unvan:</xsl:text>
                                          </span>
                                        </td>
                                        <td>
                                          <xsl:value-of select="../../cac:PartyName/cbc:Name"/>
                                        </td>
                                      </tr>
                                    </xsl:for-each>
                                    <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference [cbc:DocumentType = 'BASLIK_EKSAHA']">
                                      <tr align="left">
                                        <td>
                                          <span style="font-weight: bold;">
                                            <xsl:value-of select="cbc:DocumentTypeCode" />
                                            <xsl:text>: </xsl:text>
                                          </span>
                                        </td>
                                        <td>
                                          <span>
                                            <xsl:value-of select="cbc:ID" />
                                          </span>
                                        </td>
                                      </tr>
                                    </xsl:for-each>
                                    <xsl:for-each select="n1:Invoice/cac:PricingExchangeRate">
                                      <tr style="height:13px;">
                                        <td align="left">
                                          <span style="font-weight: bold;">
                                            <xsl:text>Döviz Kuru (</xsl:text>
                                            <xsl:value-of select="cbc:SourceCurrencyCode" />
                                            <xsl:text>/</xsl:text>
                                            <xsl:value-of select="cbc:TargetCurrencyCode" />
                                            <xsl:text>):</xsl:text>
                                          </span>
                                          <span>
                                            <xsl:text>&#160;</xsl:text>
                                          </span>
                                        </td>
                                        <td align="left">
                                          <xsl:value-of select="cbc:CalculationRate"/>
                                        </td>
                                      </tr>
                                    </xsl:for-each>
                                  </tbody>
                                </table>
                                <!--$despatchTable-end-->
                              </td>
                            </tr>
                          </tbody>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>

              <tr>
                <td>
                  <!--$ettnTable-begin-->
                  <table id="ettnTable">
                    <tbody>
                      <!--<tr>
                        <td>
                          <xsl:text>&#160;</xsl:text>
                        </td>
                      </tr>-->
                      <tr>
                        <td>
                          <span style="text-align: left;">
                            <xsl:text>ETTN: </xsl:text>
                          </span>
                          <span style="font-weight:bold;">
                            <xsl:for-each select="n1:Invoice/cbc:UUID">
                              <xsl:apply-templates/>
                            </xsl:for-each>
                          </span>

                        </td>
                      </tr>
                    </tbody>
                  </table>
                  <!--$ettnTable-end-->
                </td>
              </tr>

              <tr>
                <td align="left" valign="top">
                  <xsl:text>&#160;</xsl:text>
                </td>

                <td>
                  <xsl:text>&#160;</xsl:text>
                </td>

                <td align="right" valign="top">
                  <xsl:text>&#160;</xsl:text>
                </td>
              </tr>

            </tbody>
          </table>

          <!--<table border="0" width="870">
            <tr>
              <td width="250" align="left" valign="top">
                <xsl:text>&#160;</xsl:text>
                $ firmaLogo
              </td>
              <td width="50" align="left" valign="top">
                <xsl:text>&#160;</xsl:text>
              </td>
              <td align="left" valign="top">
                <xsl:text>&#160;</xsl:text>
                $ islakImzaImg
              </td>
            </tr>
          </table>-->

          <div id="lineTableAligner">
            <span>
              <xsl:text>&#160;</xsl:text>
            </span>
          </div>

          <div class="malHizmetTablosu">
            <!-- kalem basliklari-->
            <!-- malHizmetTablosu-->
            <table id="lineTable">
              <tbody>
                <tr>
                  <th id="lineTableTh" width="7">
                    <xsl:text>Sıra No</xsl:text>
                  </th>
                  <th id="lineTableTh" class="alignLeft">
                    <xsl:text>Mal-Hiz. Kod</xsl:text>
                  </th>
                  <!--$barkodBaslik-->
                  <th id="lineTableTh" class="alignLeft">
                    <xsl:text>Mal-Hiz. Adı</xsl:text>
                  </th>
                  <!--<xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:Item/cbc:Description">
                    <th id="lineTableTh" class="alignLeft">
                      <xsl:text>AÇIKLAMA</xsl:text>
                    </th>
                  </xsl:if>
                  <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:Item/cac:BuyersItemIdentification/cbc:ID">
                    <th id="lineTableTh" class="alignLeft">
                      <xsl:text>Alıcı Ürün Kodu</xsl:text>
                    </th>
                  </xsl:if>
                  <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:Item/cac:SellersItemIdentification/cbc:ID">
                    <th id="lineTableTh" class="alignLeft">
                      <xsl:text>Satıcı Ürün Kodu</xsl:text>
                    </th>
                  </xsl:if>-->
                  <xsl:if test="//node()/cac:InvoiceLine/cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID='KATDETAY']">
                    <th id="lineTableTh">
                      <xsl:text>Kat.Detayı</xsl:text>
                    </th>
                  </xsl:if>
                  <xsl:if test="//node()/cac:InvoiceLine/cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID='TAKIP_NO']">
                    <th id="lineTableTh">
                      <xsl:choose>
                        <xsl:when test="//node()/cac:InvoiceLine/cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID='TAKIP_NO_ETIKET']">
                          <xsl:value-of select="//node()/cac:InvoiceLine/cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID='TAKIP_NO_ETIKET']"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:text>Takip No</xsl:text>
                        </xsl:otherwise>
                      </xsl:choose>
                    </th>
                  </xsl:if>
                  <xsl:if test="$xroot/cac:InvoiceLine/cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID = 'KOLI_GORUNUM']">
                    <th id="lineTableTh">
                      <xsl:text>KOLİ</xsl:text>
                    </th>
                  </xsl:if>
                  <th id="lineTableTh">
                    <xsl:text>Miktar</xsl:text>
                  </th>
                  <!--$miktar2Baslik-->
                  <th id="lineTableTh">
                    <xsl:text>Fiyat</xsl:text>
                  </th>
                  <xsl:if test="$fiyatGosterimKurali = 'HP' and //node()/cac:InvoiceLine/cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID = 'NET_FIYAT']">
                    <th id="lineTableTh">
                      <xsl:text>Net Fiyat</xsl:text>
                    </th>
                  </xsl:if>
                  <xsl:if test="$dovizGosterimKurali = 'X' and /node()/cac:PricingExchangeRate/cbc:CalculationRate">
                    <th id="lineTableTh">
                      <xsl:text>Dv.Fiyat</xsl:text>
                    </th>
                  </xsl:if>
                  <!-- <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:AllowanceCharge/cbc:MultiplierFactorNumeric and //n1:Invoice/cac:InvoiceLine/cac:AllowanceCharge/cbc:MultiplierFactorNumeric !=0">
                    <th id="lineTableTh" width="30">
                      <xsl:text>İSKONTO ORANI</xsl:text>
                    </th>
                  </xsl:if>
                  <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:AllowanceCharge">
                    <th id="lineTableTh" width="40">
                      <xsl:text>İSKONTO TUTARI</xsl:text>
                    </th>
                  </xsl:if>-->
                  <!--$iskOranBaslik-->
                  <!--$iskBedelBaslik-->
                  <!--$arttirimOranBaslik-->
                  <!--$arttirimBedelBaslik-->
                  <!--$kdvOranVeBedelBaslik-->
                  <!--$digerVergilerBaslik-->
                  <th id="lineTableTh">
                    <xsl:text>BEDEL</xsl:text>
                  </th>
                </tr>
                <xsl:for-each select="//n1:Invoice/cac:InvoiceLine">
                  <xsl:apply-templates select="."/>
                </xsl:for-each>

                <tr>
                  <td colspan="100" width="100%">
                    <table id="budgetContainerTable" align="right">
                      <tbody>
                        <tr id="budgetContainerTr" align="right">
                          <td id="budgetContainerDummyTd" width="489" />
                          <td id="lineTableBudgetTd" align="right" width="220">
                            <span style="font-weight: bold;">
                              <xsl:text>Mal Hizmet Toplam Tutarı</xsl:text>
                            </span>
                          </td>
                          <td id="lineTableBudgetTd" align="right" width="130">
                            <xsl:for-each select="n1:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount">
                              <xsl:value-of select="format-number(., $bedelFormatStr, 'european')"/>
                              <xsl:call-template name="Curr_Type"/>
                            </xsl:for-each>
                          </td>
                        </tr>
                        <xsl:for-each select="n1:Invoice/cac:TaxTotal/cac:TaxSubtotal">
                          <xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode = '4171'">
                            <tr id="budgetContainerTr" align="right">
                              <td id="budgetContainerDummyTd" />
                              <td id="lineTableBudgetTd">
                                <span style="font-weight:bold;">
                                  <xsl:text>Teslim Bedeli</xsl:text>
                                </span>
                              </td>
                              <td id="lineTableBudgetTd" align="right">
                                <xsl:for-each select="//n1:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount">
                                  <xsl:value-of select="format-number(., $bedelFormatStr, 'european')"/>
                                  <xsl:call-template name="Curr_Type"/>
                                </xsl:for-each>
                              </td>
                            </tr>
                          </xsl:if>
                        </xsl:for-each>
                        <xsl:for-each select="//n1:Invoice/cac:AllowanceCharge">
                          <xsl:if test="./cbc:Amount and ./cbc:Amount != 0">
                            <tr id="budgetContainerTr" align="right">
                              <td id="budgetContainerDummyTd"/>
                              <td id="lineTableBudgetTd" align="right">
                                <span style="font-weight:bold; ">
                                  <xsl:choose>
                                    <xsl:when test="./cbc:ChargeIndicator = 'true'">
                                      <xsl:text>Dip Arttırım</xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <xsl:text>Dip İskonto</xsl:text>
                                    </xsl:otherwise>
                                  </xsl:choose>
                                  <xsl:for-each select="./cbc:MultiplierFactorNumeric">
                                    <xsl:if test=". != 0">
                                      <xsl:text> (%</xsl:text>
                                      <xsl:value-of select="format-number(. * 100, $bedelFormatStr, 'european')"/>
                                      <xsl:text>)</xsl:text>
                                    </xsl:if>
                                  </xsl:for-each>
                                </span>
                              </td>
                              <td id="lineTableBudgetTd" align="right">
                                <xsl:for-each select="./cbc:Amount">
                                  <div>
                                    <xsl:value-of select="format-number(., $bedelFormatStr, 'european')"/>
                                    <xsl:call-template name="dumpCurrency" />
                                  </div>
                                </xsl:for-each>
                              </td>
                            </tr>
                          </xsl:if>
                        </xsl:for-each>
                        <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentType = 'DIP_NAKBEDEL']">
                          <tr id="budgetContainerTr" align="right">
                            <td/>
                            <td id="lineTableBudgetTd">
                              <span style="font-weight:bold;">
                                <xsl:text>Nakliye Bedeli</xsl:text>
                              </span>
                            </td>
                            <td id="lineTableBudgetTd" align="right">
                              <xsl:value-of select="format-number(./cbc:ID, $bedelFormatStr, 'european')" />
                              <xsl:text>&#160;</xsl:text>
                              <xsl:if test="$xroot/cbc:DocumentCurrencyCode = 'TRL' or $xroot/cbc:DocumentCurrencyCode = 'TRY'">
                                <xsl:text>TL</xsl:text>
                              </xsl:if>
                              <xsl:if test="$xroot/cbc:DocumentCurrencyCode != 'TRL' and $xroot/cbc:DocumentCurrencyCode != 'TRY'">
                                <xsl:value-of select="$xroot/cbc:DocumentCurrencyCode"/>
                              </xsl:if>
                            </td>
                          </tr>
                        </xsl:for-each>
                        <xsl:for-each select="n1:Invoice/cac:TaxTotal/cac:TaxSubtotal">
                          <xsl:variable name="oran"><xsl:value-of select="number(cbc:Percent)"/></xsl:variable>
                          <!--<xsl:if test="$cokluKDVmi">-->
                          <xsl:if test="$iskontoVeyaNakliyeVarmi or ($cokluKDVmi and cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode = '0015')">
                            <tr id="budgetContainerTr" align="right">
                              <td id="budgetContainerDummyTd"/>
                              <td id="lineTableBudgetTd">
                                <span style="font-weight:bold;">
                                  <xsl:text>Hesaplanan </xsl:text>
                                  <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:Name"/>
                                  <xsl:text>(%</xsl:text>
                                  <xsl:value-of select="$oran"/>
                                  <xsl:text>) Matrah</xsl:text>
                                </span>
                              </td>
                              <td id="lineTableBudgetTd" align="right">
                                <xsl:for-each select="cac:TaxCategory/cac:TaxScheme">
                                  <xsl:text>&#160;</xsl:text>
                                  <xsl:value-of select="format-number(../../cbc:TaxableAmount, $bedelFormatStr, 'european')"/>
                                  <xsl:if test="../../cbc:TaxableAmount/@currencyID">
                                    <xsl:text>&#160;</xsl:text>
                                    <xsl:if test="../../cbc:TaxableAmount/@currencyID = 'TRL' or ../../cbc:TaxableAmount/@currencyID = 'TRY'">
                                      <xsl:text>TL</xsl:text>
                                    </xsl:if>
                                    <xsl:if test="../../cbc:TaxableAmount/@currencyID != 'TRL' and ../../cbc:TaxableAmountt/@currencyID != 'TRY'">
                                      <xsl:value-of select="../../cbc:TaxableAmount/@currencyID"/>
                                    </xsl:if>
                                  </xsl:if>
                                </xsl:for-each>
                              </td>
                            </tr>
                          </xsl:if>
                          <tr id="budgetContainerTr" align="right">
                            <td id="budgetContainerDummyTd"/>
                            <td id="lineTableBudgetTd">
                              <span style="font-weight:bold;">
                                <xsl:text>Hesaplanan </xsl:text>
                                <xsl:choose>
                                  <xsl:when test="cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode &gt;= 600 and cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode &lt; 700">
                                    <xsl:text>Tevkifat</xsl:text>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:Name"/>
                                  </xsl:otherwise>
                                </xsl:choose>
                                <xsl:text>(%</xsl:text>
                                <xsl:value-of select="$oran"/>
                                <xsl:text>)</xsl:text>
                                <xsl:for-each select="$xroot/cac:AdditionalDocumentReference[cbc:DocumentTypeCode = 'DIP_VERGIORAN_POSTFIX' and number(cbc:DocumentType) = $oran]">
                                  <span>
                                    <xsl:value-of select="cbc:ID"/>
                                    <!--iptal - disable-output-escaping="yes"-->
                                  </span>
                                </xsl:for-each>
                              </span>
                            </td>
                            <td id="lineTableBudgetTd" align="right">
                              <xsl:for-each select="cac:TaxCategory/cac:TaxScheme">
                                <xsl:text>&#160;</xsl:text>
                                <xsl:value-of select="format-number(../../cbc:TaxAmount, $bedelFormatStr, 'european')"/>
                                <xsl:if test="../../cbc:TaxAmount/@currencyID">
                                  <xsl:text>&#160;</xsl:text>
                                  <xsl:if test="../../cbc:TaxAmount/@currencyID = 'TRL' or ../../cbc:TaxAmount/@currencyID = 'TRY'">
                                    <xsl:text>TL</xsl:text>
                                  </xsl:if>
                                  <xsl:if test="../../cbc:TaxAmount/@currencyID != 'TRL' and ../../cbc:TaxAmount/@currencyID != 'TRY'">
                                    <xsl:value-of select="../../cbc:TaxAmount/@currencyID"/>
                                  </xsl:if>
                                </xsl:if>
                              </xsl:for-each>
                            </td>
                          </tr>
                        </xsl:for-each>
                        <xsl:for-each select="n1:Invoice/cac:TaxTotal/cac:TaxSubtotal">
                          <xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode = '4171'">
                            <tr id="budgetContainerTr" align="right">
                              <td id="budgetContainerDummyTd"/>
                              <td id="lineTableBudgetTd">
                                <span style="font-weight:bold; ">
                                  <xsl:text>KDV Matrahı</xsl:text>
                                </span>
                              </td>
                              <td id="lineTableBudgetTd" align="right">
                                <xsl:value-of select="format-number(sum(//n1:Invoice/cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=0015]/cbc:TaxableAmount), $bedelFormatStr, 'european')"/>
                                <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount/@currencyID">
                                  <xsl:text>&#160;</xsl:text>
                                  <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount/@currencyID = 'TRL' or //n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount/@currencyID = 'TRY'">
                                    <xsl:text>TL</xsl:text>
                                  </xsl:if>
                                  <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount/@currencyID != 'TRL' and //n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount/@currencyID != 'TRY'">
                                    <xsl:value-of select="//n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount/@currencyID"/>
                                  </xsl:if>
                                </xsl:if>
                              </td>
                            </tr>
                            <tr id="budgetContainerTr" align="right">
                              <td id="budgetContainerDummyTd"/>
                              <td id="lineTableBudgetTd">
                                <span style="font-weight:bold; ">
                                  <xsl:text>Tevkifat Dahil Toplam Tutar</xsl:text>
                                </span>
                              </td>
                              <td id="lineTableBudgetTd" align="right">
                                <xsl:for-each select="//n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount">
                                  <xsl:value-of select="format-number(., $bedelFormatStr, 'european')"/>
                                  <xsl:call-template name="Curr_Type"/>
                                </xsl:for-each>
                              </td>
                            </tr>
                            <tr id="budgetContainerTr" align="right">
                              <td id="budgetContainerDummyTd"/>
                              <td id="lineTableBudgetTd">
                                <span style="font-weight:bold; ">
                                  <xsl:text>Tevkifat Hariç Toplam Tutar</xsl:text>
                                </span>
                              </td>
                              <td id="lineTableBudgetTd" align="right">
                                <xsl:for-each select="//n1:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount">
                                  <xsl:value-of select="format-number(., $bedelFormatStr, 'european')"/>
                                  <xsl:call-template name="Curr_Type"/>
                                </xsl:for-each>
                              </td>
                            </tr>
                          </xsl:if>
                        </xsl:for-each>
                        <xsl:for-each select="n1:Invoice/cac:WithholdingTaxTotal/cac:TaxSubtotal">
                          <tr id="budgetContainerTr" align="right">
                            <td id="budgetContainerDummyTd"/>
                            <td id="lineTableBudgetTd">
                              <span style="font-weight:bold; ">
                                <xsl:text>Hesaplanan KDV Tevkifat</xsl:text>
                                <xsl:text>(%</xsl:text>
                                <xsl:value-of select="cbc:Percent"/>
                                <xsl:text>)</xsl:text>
                              </span>
                            </td>
                            <td id="lineTableBudgetTd" align="right">
                              <xsl:for-each select="cac:TaxCategory/cac:TaxScheme">
                                <xsl:text>&#160;</xsl:text>
                                <xsl:value-of select="format-number(../../cbc:TaxAmount, $bedelFormatStr, 'european')"/>
                                <xsl:if test="../../cbc:TaxAmount/@currencyID">
                                  <xsl:text>&#160;</xsl:text>
                                  <xsl:if test="../../cbc:TaxAmount/@currencyID = 'TRL' or ../../cbc:TaxAmount/@currencyID = 'TRY'">
                                    <xsl:text>TL</xsl:text>
                                  </xsl:if>
                                  <xsl:if test="../../cbc:TaxAmount/@currencyID != 'TRL' and ../../cbc:TaxAmount/@currencyID != 'TRY'">
                                    <xsl:value-of select="../../cbc:TaxAmount/@currencyID"/>
                                  </xsl:if>
                                </xsl:if>
                              </xsl:for-each>
                            </td>
                          </tr>
                        </xsl:for-each>
                        <xsl:if test="sum($xroot/cac:WithholdingTaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode &gt;= 600 and cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode &lt; 700]/cbc:TaxAmount) &gt; 0">
                          <tr id="budgetContainerTr" align="right">
                            <td id="budgetContainerDummyTd"/>
                            <td id="lineTableBudgetTf">
                              <span style="font-weight:bold; ">
                                <xsl:text>Beyan Edilen KDV</xsl:text>
                              </span>
                            </td>
                            <td id="lineTableBudgetTd" align="right">
                              <xsl:value-of select="format-number( (sum($xroot/cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode = '0015']/cbc:TaxAmount) - sum($xroot/cac:WithholdingTaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode &gt;= 600 and cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode &lt; 700]/cbc:TaxAmount) ), $bedelFormatStr, 'european')"/>
                              <xsl:text>&#160;</xsl:text>
                              <xsl:if test="$xroot/cbc:DocumentCurrencyCode = 'TRL' or $xroot/cbc:DocumentCurrencyCode = 'TRY'">
                                <xsl:text>TL</xsl:text>
                              </xsl:if>
                              <xsl:if test="$xroot/cbc:DocumentCurrencyCode != 'TRL' and $xroot/cbc:DocumentCurrencyCode != 'TRY'">
                                <xsl:value-of select="$xroot/cbc:DocumentCurrencyCode"/>
                              </xsl:if>
                            </td>
                          </tr>
                        </xsl:if>
                        <xsl:if test="$vergilerDahilToplamTutarGosterilirmi">
                          <tr id="budgetContainerTr" align="right">
                            <td id="budgetContainerDummyTd"/>
                            <td id="lineTableBudgetTd">
                              <span style="font-weight:bold;">
                                <xsl:text>Vergiler Dahil Toplam Tutar</xsl:text>
                              </span>
                            </td>
                            <td id="lineTableBudgetTd" align="right">
                              <xsl:for-each select="n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount">
                                <xsl:value-of select="format-number(., $bedelFormatStr, 'european')"/>
                                <xsl:call-template name="Curr_Type"/>
                              </xsl:for-each>
                            </td>
                          </tr>
                        </xsl:if>
                        <tr id="budgetContainerTr">
                          <td id="budgetContainerDummyTd"/>
                          <td id="lineTableBudgetTd" align="right" class="faturaSonucu" >
                            <span style="font-weight:bold; color: #5588CC;">
                              <xsl:text>Ödenecek Tutar</xsl:text>
                            </span>
                          </td>
                          <td id="lineTableBudgetTd" align="right" class="faturaSonucu" style="font-weight:bold; color: #5588CC;">
                            <xsl:for-each select="n1:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount">
                              <xsl:value-of select="format-number(., $bedelFormatStr, 'european')"/>
                              <xsl:call-template name="Curr_Type"/>
                            </xsl:for-each>
                          </td>
                        </tr>
                        <!-- ............... DIP TL BEDEL GOSTERIMLERI ............... -->
                        <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount/@currencyID != 'TRL' and //n1:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount/@currencyID != 'TRY'">
                          <tr>
                            <td/>
                            <td id="lineTableBudgetTd" align="right">
                              <span style="font-weight:bold; ">
                                <xsl:text>Mal Hizmet Toplam Tutarı(TL)</xsl:text>
                              </span>
                            </td>
                            <td id="lineTableBudgetTd" align="right">
                              <xsl:choose>
                                <xsl:when test="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentType = 'DIP_TL_BRUTBEDEL']">
                                  <xsl:value-of select="format-number(//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentType = 'DIP_TL_BRUTBEDEL']/cbc:ID, $bedelFormatStr, 'european')" />
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:value-of select="format-number(//n1:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount * //n1:Invoice/cac:PricingExchangeRate/cbc:CalculationRate, $bedelFormatStr, 'european')"/>
                                </xsl:otherwise>
                              </xsl:choose>
                              <xsl:text> TL</xsl:text>
                            </td>
                          </tr>
                          <xsl:choose>
                            <xsl:when test="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentType = 'DIP_TL_ISKBEDEL'] or //n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentType = 'DIP_TL_ARTBEDEL']">
                              <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentType = 'DIP_TL_ISKBEDEL']">
                                <xsl:if test="./cbc:ID != 0">
                                  <tr id="budgetContainerTr" align="right">
                                    <td id="budgetContainerDummyTd"/>
                                    <td id="lineTableBudgetTd" align="right">
                                      <span style="font-weight:bold; ">
                                        <xsl:text>Dip İskonto (TL)</xsl:text>
                                        <xsl:if test="./cbc:DocumentTypeCode and ./cbc:DocumentTypeCode != 0">
                                          <xsl:text> (%</xsl:text>
                                          <xsl:value-of select="format-number(./cbc:DocumentTypeCode * 100, $bedelFormatStr, 'european')"/>
                                          <xsl:text>)</xsl:text>
                                        </xsl:if>
                                      </span>
                                    </td>
                                    <td id="lineTableBudgetTd" align="right">
                                      <div>
                                        <xsl:value-of select="format-number(./cbc:ID, $bedelFormatStr, 'european')"/>
                                        <xsl:text> TL</xsl:text>
                                      </div>
                                    </td>
                                  </tr>
                                </xsl:if>
                              </xsl:for-each>
                              <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentType = 'DIP_TL_ARTBEDEL']">
                                <xsl:if test="./cbc:ID != 0">
                                  <tr id="budgetContainerTr" align="right">
                                    <td id="budgetContainerDummyTd"/>
                                    <td id="lineTableBudgetTd" align="right">
                                      <span style="font-weight:bold; ">
                                        <xsl:text>Dip Arttırım (TL)</xsl:text>
                                        <xsl:if test="./cbc:DocumentTypeCode and ./cbc:DocumentTypeCode != 0">
                                          <xsl:text> (%</xsl:text>
                                          <xsl:value-of select="format-number(./cbc:DocumentTypeCode * 100, $bedelFormatStr, 'european')"/>
                                          <xsl:text>)</xsl:text>
                                        </xsl:if>
                                      </span>
                                    </td>
                                    <td id="lineTableBudgetTd" align="right">
                                      <div>
                                        <xsl:value-of select="format-number(./cbc:ID, $bedelFormatStr, 'european')"/>
                                        <xsl:text> TL</xsl:text>
                                      </div>
                                    </td>
                                  </tr>
                                </xsl:if>
                              </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:for-each select="//n1:Invoice/cac:AllowanceCharge">
                                <xsl:if test="./cbc:Amount and ./cbc:Amount != 0">
                                  <tr id="budgetContainerTr" align="right">
                                    <td id="budgetContainerDummyTd"/>
                                    <td id="lineTableBudgetTd" align="right">
                                      <span style="font-weight:bold; ">
                                        <xsl:choose>
                                          <xsl:when test="./cbc:ChargeIndicator = 'true'">
                                            <xsl:text>Dip Arttırım</xsl:text>
                                          </xsl:when>
                                          <xsl:otherwise>
                                            <xsl:text>Dip İskonto</xsl:text>
                                          </xsl:otherwise>
                                        </xsl:choose>
                                        <xsl:text> (TL)</xsl:text>
                                        <xsl:for-each select="./cbc:MultiplierFactorNumeric">
                                          <xsl:if test=". != 0">
                                            <xsl:text> (%</xsl:text>
                                            <xsl:value-of select="format-number(. * 100, $bedelFormatStr, 'european')"/>
                                            <xsl:text>)</xsl:text>
                                          </xsl:if>
                                        </xsl:for-each>
                                      </span>
                                    </td>
                                    <td id="lineTableBudgetTd" align="right">
                                      <xsl:for-each select="./cbc:Amount">
                                        <div>
                                          <xsl:value-of select="format-number(., $bedelFormatStr, 'european')"/>
                                          <xsl:text> TL</xsl:text>
                                        </div>
                                      </xsl:for-each>
                                    </td>
                                  </tr>
                                </xsl:if>
                              </xsl:for-each>
                            </xsl:otherwise>
                          </xsl:choose>
                          <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentType = 'DIP_TL_NAKBEDEL']">
                            <tr id="budgetContainerTr" align="right">
                              <td/>
                              <td id="lineTableBudgetTd">
                                <span style="font-weight:bold;">
                                  <xsl:text>Nakliye Bedeli (TL)</xsl:text>
                                </span>
                              </td>
                              <td id="lineTableBudgetTd" align="right">
                                <xsl:value-of select="format-number(./cbc:ID, $bedelFormatStr, 'european')" />
                                <xsl:text> TL</xsl:text>
                              </td>
                            </tr>
                          </xsl:for-each>
                          <xsl:choose>
                            <xsl:when test="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentType = 'DIP_TL_VERGI']">
                              <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentType = 'DIP_TL_VERGI']">
                                <tr id="budgetContainerTr" align="right">
                                  <td id="budgetContainerDummyTd"/>
                                  <td id="lineTableBudgetTd">
                                    <span style="font-weight:bold;">
                                      <xsl:text>Hesaplanan </xsl:text>
                                      <xsl:value-of select="./cbc:DocumentTypeCode"/>
                                    </span>
                                  </td>
                                  <td id="lineTableBudgetTd" align="right">
                                    <span>
                                      <xsl:value-of select="format-number(./cbc:ID, $bedelFormatStr, 'european')"/>
                                      <xsl:text> TL</xsl:text>
                                    </span>
                                  </td>
                                </tr>
                              </xsl:for-each>
                            </xsl:when>
                            <xsl:when test="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentType = 'DIP_DVZ_VERGI']">
                              <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentType = 'DIP_DVZ_VERGI']">
                                <tr id="budgetContainerTr" align="right">
                                  <td id="budgetContainerDummyTd"/>
                                  <td id="lineTableBudgetTd">
                                    <span style="font-weight:bold;">
                                      <xsl:text>Hesaplanan </xsl:text>
                                      <xsl:value-of select="./cbc:DocumentTypeCode"/>
                                      <xsl:text>(</xsl:text>
                                      <xsl:value-of select="./cbc:DocumentDescription"/>
                                      <xsl:text>)</xsl:text>
                                    </span>
                                  </td>
                                  <td id="lineTableBudgetTd" align="right">
                                    <span>
                                      <xsl:value-of select="format-number(./cbc:ID, $bedelFormatStr, 'european')"/>
                                      <xsl:text> </xsl:text>
                                      <xsl:value-of select="./cbc:LocaleCode"/>
                                    </span>
                                  </td>
                                </tr>
                              </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:for-each select="n1:Invoice/cac:TaxTotal/cac:TaxSubtotal">
                                <tr id="budgetContainerTr" align="right">
                                  <td id="budgetContainerDummyTd"/>
                                  <td id="lineTableBudgetTd">
                                    <span style="font-weight:bold;">
                                      <xsl:text>Hesaplanan </xsl:text>
                                      <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:Name"/>
                                      <xsl:text>(%</xsl:text>
                                      <xsl:value-of select="cbc:Percent"/>
                                      <xsl:text>) (TL)</xsl:text>
                                    </span>
                                  </td>
                                  <td id="lineTableBudgetTd" align="right">
                                    <xsl:for-each select="cac:TaxCategory/cac:TaxScheme">
                                      <xsl:text>&#160;</xsl:text>
                                      <xsl:value-of select="format-number(../../cbc:TaxAmount * //n1:Invoice/cac:PricingExchangeRate/cbc:CalculationRate, $bedelFormatStr, 'european')"/>
                                      <xsl:text> TL</xsl:text>
                                    </xsl:for-each>
                                  </td>
                                </tr>
                              </xsl:for-each>
                            </xsl:otherwise>
                          </xsl:choose>
                          <xsl:if test="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentType = 'DIP_TL_TEVBEDEL']">
                            <tr id="budgetContainerTr" align="right">
                              <td/>
                              <td id="lineTableBudgetTd">
                                <span style="font-weight:bold;">
                                  <xsl:text>Tevkifat Bedeli (TL)</xsl:text>
                                </span>
                              </td>
                              <td id="lineTableBudgetTd" align="right">
                                <xsl:value-of select="format-number(//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentType = 'DIP_TL_TEVBEDEL']/cbc:ID, $bedelFormatStr, 'european')" />
                                <xsl:text> TL</xsl:text>
                              </td>
                            </tr>
                          </xsl:if>
                          <xsl:if test="not ($dovizlimi)">
                            <xsl:if test="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentType = 'DIP_TL_KLREYON']">
                              <tr id="budgetContainerTr" align="right">
                                <td/>
                                <td id="lineTableBudgetTd">
                                  <span style="font-weight:bold;">
                                    <xsl:text>Reyon Bedeli</xsl:text>
                                  </span>
                                </td>
                                <td id="lineTableBudgetTd" align="right">
                                  <xsl:value-of select="format-number(//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentType = 'DIP_TL_KLREYON']/cbc:ID, $bedelFormatStr, 'european')" />
                                  <xsl:text> TL</xsl:text>
                                </td>
                              </tr>
                            </xsl:if>
                            <xsl:if test="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentType = 'DIP_TL_KLDAMGA']">
                              <tr id="budgetContainerTr" align="right">
                                <td/>
                                <td id="lineTableBudgetTd">
                                  <span style="font-weight:bold;">
                                    <xsl:text>Damga Bedeli</xsl:text>
                                  </span>
                                </td>
                                <td id="lineTableBudgetTd" align="right">
                                  <xsl:value-of select="format-number(//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentType = 'DIP_TL_KLDAMGA']/cbc:ID, $bedelFormatStr, 'european')" />
                                  <xsl:text> TL</xsl:text>
                                </td>
                              </tr>
                            </xsl:if>
                          </xsl:if>
                          <xsl:if test="$vergilerDahilToplamTutarGosterilirmi">
                            <tr id="budgetContainerTr" align="right">
                              <td/>
                              <td id="lineTableBudgetTd">
                                <span style="font-weight:bold;">
                                  <xsl:text>Vergiler Dahil Toplam Tutar (TL)</xsl:text>
                                </span>
                              </td>
                              <td id="lineTableBudgetTd" align="right">
                                <xsl:choose>
                                  <xsl:when test="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentType = 'DIP_TL_VERGIDAHILBEDEL']">
                                    <xsl:value-of select="format-number(//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentType = 'DIP_TL_VERGIDAHILBEDEL']/cbc:ID, $bedelFormatStr, 'european')" />
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:value-of select="format-number(//n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount * //n1:Invoice/cac:PricingExchangeRate/cbc:CalculationRate, $bedelFormatStr, 'european')"/>
                                  </xsl:otherwise>
                                </xsl:choose>
                                <xsl:text> TL</xsl:text>
                              </td>
                            </tr>
                          </xsl:if>

                          <tr>
                            <td/>
                            <td id="lineTableBudgetTd" align="right">
                              <span style="font-weight:bold;">
                                <xsl:text>Fatura Sonucu (TL)</xsl:text>
                              </span>
                            </td>
                            <td id="lineTableBudgetTd" align="right">
                              <xsl:choose>
                                <xsl:when test="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentType = 'DIP_TL_SONUCBEDEL']">
                                  <xsl:value-of select="format-number(//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentType = 'DIP_TL_SONUCBEDEL']/cbc:ID, $bedelFormatStr, 'european')" />
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:value-of select="format-number(//n1:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount * //n1:Invoice/cac:PricingExchangeRate/cbc:CalculationRate, $bedelFormatStr, 'european')"/>
                                </xsl:otherwise>
                              </xsl:choose>
                              <xsl:text> TL</xsl:text>
                            </td>
                          </tr>
                        </xsl:if>
                        <!-- ............. x DIP TL BEDEL GOSTERIMLERI x ............. -->
                        <!--<xsl:if test="sum(n1:Invoice/cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=9015]/cbc:TaxableAmount)>0">
                          <tr id="budgetContainerTr" align="right">
                            <td id="budgetContainerDummyTd"/>
                            <td id="lineTableBudgetTd">
                              <span style="font-weight:bold; ">
                                <xsl:text>Tevkifata Tabi İşlem Tutarı</xsl:text>
                              </span>
                            </td>
                            <td id="lineTableBudgetTd" align="right">
                              <xsl:value-of
                                select="format-number(sum(n1:Invoice/cac:InvoiceLine[cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=9015]/cbc:LineExtensionAmount), $bedelFormatStr, 'european')"/>
                              <xsl:text>&#160;</xsl:text>
                              <xsl:if test="n1:Invoice/cbc:DocumentCurrencyCode = 'TRL' or n1:Invoice/cbc:DocumentCurrencyCode = 'TRY'">
                                <xsl:text>TL</xsl:text>
                              </xsl:if>
                              <xsl:if test="n1:Invoice/cbc:DocumentCurrencyCode != 'TRL' and n1:Invoice/cbc:DocumentCurrencyCode != 'TRY'">
                                <xsl:value-of select="n1:Invoice/cbc:DocumentCurrencyCode"/>
                              </xsl:if>
                            </td>
                          </tr>
                          <tr id="budgetContainerTr" align="right">
                            <td id="budgetContainerDummyTd"/>
                            <td id="lineTableBudgetTd">
                              <span style="font-weight:bold; ">
                                <xsl:text>Tevkifata Tabi İşlem Üzerinden Hes. KDV</xsl:text>
                              </span>
                            </td>
                            <td id="lineTableBudgetTd" align="right">
                              <xsl:value-of
                                select="format-number(sum(n1:Invoice/cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=9015]/cbc:TaxableAmount), $bedelFormatStr, 'european')"/>
                              <xsl:text>&#160;</xsl:text>
                              <xsl:if test="n1:Invoice/cbc:DocumentCurrencyCode = 'TRL' or n1:Invoice/cbc:DocumentCurrencyCode = 'TRY'">
                                <xsl:text>TL</xsl:text>
                              </xsl:if>
                              <xsl:if test="n1:Invoice/cbc:DocumentCurrencyCode != 'TRL' and n1:Invoice/cbc:DocumentCurrencyCode != 'TRY'">
                                <xsl:value-of select="n1:Invoice/cbc:DocumentCurrencyCode"/>
                              </xsl:if>
                            </td>
                          </tr>
                        </xsl:if>
                        <xsl:if test = "n1:Invoice/cac:InvoiceLine[cac:WithholdingTaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme]">
                          <tr id="budgetContainerTr" align="right">
                            <td id="budgetContainerDummyTd"/>
                            <td id="lineTableBudgetTd">
                              <span style="font-weight:bold; ">
                                <xsl:text>Tevkifata Tabi İşlem Tutarı</xsl:text>
                              </span>
                            </td>
                            <td id="lineTableBudgetTd" align="right">
                              <xsl:if test = "n1:Invoice/cac:InvoiceLine[cac:WithholdingTaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme]">
                                <xsl:value-of select="format-number(sum(n1:Invoice/cac:InvoiceLine[cac:WithholdingTaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme]/cbc:LineExtensionAmount), $bedelFormatStr, 'european')"/>
                              </xsl:if>
                              <xsl:if test = "//n1:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=&apos;9015&apos;">
                                <xsl:value-of select="format-number(sum(n1:Invoice/cac:InvoiceLine[cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=9015]/cbc:LineExtensionAmount), $bedelFormatStr, 'european')"/>
                              </xsl:if>
                              <xsl:text>&#160;</xsl:text>
                              <xsl:if test="n1:Invoice/cbc:DocumentCurrencyCode = 'TRL' or n1:Invoice/cbc:DocumentCurrencyCode = 'TRY'">
                                <xsl:text>TL</xsl:text>
                              </xsl:if>
                              <xsl:if test="n1:Invoice/cbc:DocumentCurrencyCode != 'TRL' and n1:Invoice/cbc:DocumentCurrencyCode != 'TRY'">
                                <xsl:value-of select="n1:Invoice/cbc:DocumentCurrencyCode"/>
                              </xsl:if>
                            </td>
                          </tr>
                          <tr id="budgetContainerTr" align="right">
                            <td id="budgetContainerDummyTd"/>
                            <td id="lineTableBudgetTd">
                              <span style="font-weight:bold; ">
                                <xsl:text>Tevkifata Tabi İşlem Üzerinden Hes. KDV</xsl:text>
                              </span>
                            </td>
                            <td id="lineTableBudgetTd" align="right">
                              <xsl:if test="n1:Invoice/cac:InvoiceLine[cac:WithholdingTaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme]">
                                <xsl:value-of select="format-number(sum(n1:Invoice/cac:WithholdingTaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme]/cbc:TaxableAmount), $bedelFormatStr, 'european')"/>
                              </xsl:if>
                              <xsl:if test="//n1:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=&apos;9015&apos;">
                                <xsl:value-of select="format-number(sum(n1:Invoice/cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=9015]/cbc:TaxableAmount), $bedelFormatStr, 'european')"/>
                              </xsl:if>
                              <xsl:text>&#160;</xsl:text>
                              <xsl:if test="n1:Invoice/cbc:DocumentCurrencyCode = 'TRL' or n1:Invoice/cbc:DocumentCurrencyCode = 'TRY'">
                                <xsl:text>TL</xsl:text>
                              </xsl:if>
                              <xsl:if test="n1:Invoice/cbc:DocumentCurrencyCode != 'TRL' and n1:Invoice/cbc:DocumentCurrencyCode != 'TRY'">
                                <xsl:value-of select="n1:Invoice/cbc:DocumentCurrencyCode"/>
                              </xsl:if>
                            </td>
                          </tr>
                        </xsl:if>-->
                      </tbody>
                    </table>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </xsl:for-each>

        <div style="margin-top: -2em;">
          <!--<xsl:value-of select="substring(//n1:Invoice/cbc:Note, 80, 60)" disable-output-escaping="yes"/>-->

          <!-- <xsl:for-each select="n1:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount">
            <div class="faturaSonucu">
              <xsl:text>İşbu fatura "</xsl:text>
              <span style="font-weight: bold; color: #5588CC;">
                <xsl:value-of select="format-number(., $bedelFormatStr, 'european')"/>
                <xsl:call-template name="Curr_Type"/>
              </span>
              <xsl:text>" ödenmelidir.</xsl:text>
            </div>
          </xsl:for-each> -->
          <!--__iptal__yalnizYazisi-->
          <xsl:for-each select="n1:Invoice/cac:AdditionalDocumentReference [cbc:DocumentType='YALNIZYAZISI']">
            <br/>
            <div class="faturaSonucu">
              <span style="font-weight: bold; color: #5588CC;">
                <xsl:value-of select="cbc:ID"/>
              </span>
            </div>
          </xsl:for-each>
        </div>

        <div style="width: 868px; margin-top: .1em;">
          <hr/>
        </div>

        <table border="0" width="870">
          <tbody>
            <tr>
              <td align="left" valign="top" width="595" />
              <td align="right" valign="top">
                <div style="color: #334433; font-weight: bold; font-size: 7pt;">
                  Bu e-Arşiv belgesi <a href="#" target="_blank" alt="POLEN YAZILIM">POLEN YAZILIM - VİO TİCARİ programı</a>
                  ile oluşturulmuştur.<br/>
                </div>
              </td>
            </tr>
          </tbody>
        </table>

        <table id="notesTable" align="left" width="870">
          <tbody>
            <tr>
              <td>
                <div id="eArsivAlan" style="margin-top: 2px;">
                  <xsl:if test="//n1:Invoice/cbc:IssueTime and not (//n1:Invoice/cac:DespatchDocumentReference)">
                    <div align="left" style="font-weight:bold; color: #5588CC;">
                      <br/>İrsaliye Yerine Geçer<br/>
                    </div>
                  </xsl:if>

                  <!--<xsl:if test="//n1:Invoice/cbc:IssueTime and not (//n1:Invoice/cac:DespatchDocumentReference)">
            <div align="left" style="font-weight:bold; color: #5588CC;">
              <br/>İrsaliye Yerine Geçer
            </div>
            <br/>
          </xsl:if>-->

                  <!--<div id="irsaliye" style="margin-bottom: 5px">
            <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentTypeCode = 'IS_DESPATCH']">
              <br/>İrsaliye yerine geçer
            </xsl:for-each>
          </div>-->

                  <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentTypeCode = 'IS_INTERNET']">
                    <br/>
                    <xsl:choose>
                        <xsl:when test="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentTypeCode = 'ETICARET_DIPNOT']">
                          <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentTypeCode = 'ETICARET_DIPNOT']">
                            <div><xsl:value-of select="cbc:ID" disable-output-escaping="yes"/></div>
                          </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                          <div>Bu satış internet üzerinden yapılmıştır</div>

                          <div id="internetSatis" style="margin-top: 5px">
                            <table class="intSatisBilgi"  style="border:1px solid #ccc; padding:4px; margin-top:10px" width="792" id="info">
                              <tbody>
                                <tr>
                                  <td style="font-weight: bold;">
                                    Web Adresi
                                  </td>
                                  <td>
                                    <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentTypeCode = 'INT_WEBSITE']">
                                      <xsl:value-of select="cbc:ID"/>
                                    </xsl:for-each>
                                  </td>
                                  <td style="font-weight: bold;">
                                    Ödeme Şekli
                                  </td>
                                  <td>
                                    <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentTypeCode = 'INT_PAYMENT_METHOD']">
                                      <xsl:value-of select="cbc:ID"/>
                                    </xsl:for-each>
                                  </td>
                                  <td style="font-weight: bold;">
                                    Ödeme Tarihi
                                  </td>
                                  <td>
                                    <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentTypeCode = 'INT_PAYMENTDATE']">
                                      <xsl:value-of select="substring(cbc:ID,9,2)"/>.<xsl:value-of select="substring(cbc:ID,6,2)"/>.<xsl:value-of select="substring(cbc:ID,1,4)"/>
                                    </xsl:for-each>
                                  </td>
                                </tr>
                                <tr>
                                  <td style="font-weight: bold;">
                                    Gönderiyi Taşıyan
                                  </td>
                                  <td>
                                    <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentTypeCode = 'INT_TRANSPORTER']">
                                      <xsl:value-of select="cbc:ID"/>
                                    </xsl:for-each>
                                  </td>
                                  <td style="font-weight: bold;">
                                    Taşıyıcı VKN/TCKN
                                  </td>
                                  <td>
                                    <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentTypeCode = 'INT_TRANSPORTER_REGISTER_NUMBER']">
                                      <xsl:value-of select="cbc:ID"/>
                                    </xsl:for-each>
                                  </td>
                                  <td style="font-weight: bold;">
                                    Gönderim Tarihi
                                  </td>
                                  <td>
                                    <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentTypeCode = 'INT_TRANSPORT_DATE']">
                                      <xsl:value-of select="substring(cbc:ID,9,2)"/>.<xsl:value-of select="substring(cbc:ID,6,2)"/>.<xsl:value-of select="substring(cbc:ID,1,4)"/>
                                    </xsl:for-each>
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                            <table id="info" class="intSatisBilgi"  style="border:1px solid #ccc;  margin-top:10px; margin-bottom:10px" height="50" width="792">
                              <tbody>
                                <tr style="text-align:center">
                                  <td colspan="5">İade Edilen Mal Bilgileri</td>
                                </tr>
                                <tr style="border:0px">
                                  <td class="iadeBorderTop" style="width:150px; text-align:center">Stok Kodu</td>
                                  <td class="iadeBorderTop" style="width:350px; text-align:center">Cinsi</td>
                                  <td class="iadeBorderTop" style="width:100px; text-align:center">Adet</td>
                                  <td class="iadeBorderTop" style="width:100px; text-align:center">
                                    <xsl:choose>
                                      <xsl:when test="$fiyatGosterimKurali = 'NT'">
                                        <xsl:text>Net Fiyat</xsl:text>
                                      </xsl:when>
                                      <xsl:otherwise>
                                        <xsl:text>Birim Fiyat</xsl:text>
                                      </xsl:otherwise>
                                    </xsl:choose>
                                  </td>
                                  <xsl:if test="$dovizGosterimKurali = 'X' and /node()/cac:PricingExchangeRate/cbc:CalculationRate">
                                    <td class="iadeBorderTop" style="width:100px; text-align:center">Birim Dv.Fiyatı</td>
                                  </xsl:if>
                                  <td class="iadeBorderTop" style="width:100px; text-align:center">Tutarı</td>
                                </tr>
                                <xsl:for-each select="//n1:Invoice/cac:InvoiceLine">
                                  <tr>
                                    <td class="iadeBorderTop" style="height:18px; border-bottom:0px"></td>
                                    <td class="iadeBorderLeft"></td>
                                    <td class="iadeBorderLeft"></td>
                                    <td class="iadeBorderLeft"></td>
                                    <td class="iadeBorderLeft"></td>
                                  </tr>
                                </xsl:for-each>
                              </tbody>
                            </table>
                            <span>İade Edenin Adı, Soyadı:</span>
                            <span style="margin-left: 250px">İmzası:</span>
                            <br/>
                            <span>Adresi: </span>
                          </div>
                        </xsl:otherwise>
                      </xsl:choose>
                  </xsl:for-each>

                  <div id="elektronikOrtam">
                    <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentTypeCode = 'SEND_TYPE']">
                      <xsl:if test="cbc:ID='ELEKTRONIK'">
                        <br/>e-Arşiv izni kapsamında elektronik ortamda iletilmiştir
                      </xsl:if>
                    </xsl:for-each>
                  </div>
                </div>
              </td>
            </tr>
            <tr>
              <td id="notesTableTd" align="left">
                <!--<xsl:for-each select="//n1:Invoice/cac:TaxTotal/cac:TaxSubtotal">
                  <xsl:if	test="cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode='0015' and cac:TaxCategory/cbc:TaxExemptionReason">
                    <b>*Vergi İstisna Muafiyet Sebebi: </b>
                    <xsl:value-of select="cac:TaxCategory/cbc:TaxExemptionReasonCode"/>
                    <xsl:text>-</xsl:text>
                    <xsl:value-of select="cac:TaxCategory/cbc:TaxExemptionReason"/>
                    <br/>
                  </xsl:if>
                </xsl:for-each>
                <xsl:for-each select="//n1:Invoice/cac:WithholdingTaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
                  <b>*Tevkifat Sebebi: </b>
                  <xsl:value-of select="cbc:TaxTypeCode"/>
                  <xsl:text>-</xsl:text>
                  <xsl:value-of select="cbc:Name"/>
                  <br/>
                </xsl:for-each>-->

                <!--<xsl:for-each select="//n1:Invoice/cbc:Note">
										<b>Not: </b>
										<xsl:value-of select="."/>	
										<br/>
									</xsl:for-each>-->

                <xsl:for-each select="//n1:Invoice/cbc:Note">
                  <div style="color: #444444; padding-bottom: 3px;">
                    <xsl:choose>
                      <xsl:when test="(substring(., 1, 5) = 'POL03') and (normalize-space(substring(., 350, 499)) != '')">
                        <xsl:value-of select="normalize-space(substring(., 350, 499))" disable-output-escaping="yes"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="." disable-output-escaping="yes"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </div>
                  <!--<br/>-->
                </xsl:for-each>
                <!--<xsl:for-each select="//n1:Invoice/cbc:Note">
                  <b>*</b>
                  <xsl:if test=".">
                    <xsl:if test="substring(., 1, 3) = 'POL'">
                      <b>&#160; Not: &#160;&#160;&#160;</b>
                      <span style="color: #444444">
                        <xsl:value-of
                          select="substring(., 2995, 3000)"
                          disable-output-escaping="yes"/>
                      </span>
                      <br/>
                    </xsl:if>
                  </xsl:if>
                </xsl:for-each>-->


                <xsl:if test="//n1:Invoice/cac:PaymentMeans/cbc:InstructionNote">
                  <b>*Ödeme Notu: </b>
                  <xsl:value-of
										select="//n1:Invoice/cac:PaymentMeans/cbc:InstructionNote"/>
                  <br/>
                </xsl:if>
                <xsl:if test="//n1:Invoice/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:PaymentNote">
                  <b>*Hesap Açıklaması: </b>
                  <xsl:value-of
										select="//n1:Invoice/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:PaymentNote"/>
                  <br/>
                </xsl:if>
                <xsl:if test="//n1:Invoice/cac:PaymentTerms/cbc:Note">
                  <b>*Ödeme Koşulu: </b>
                  <xsl:value-of select="//n1:Invoice/cac:PaymentTerms/cbc:Note"/>
                  <br/>
                </xsl:if>
              </td>
            </tr>
          </tbody>
        </table>

        <br/>

        <div id="altBilgiParent" align="left" cellspacing="0" cellpadding="0" style="width: 860px; margin-top: 0;">
          <table border="0" width="100%">
            <tbody>
              <tr valign="top">
                <td id="altSolBilgi" width="50%" align="left">
                  <!--$altSolBilgi-->
                </td>
                <td id="altSagBilgi" align="right">
                  <!--$altSagBilgi-->
                </td>
              </tr>
              <tr>
                <td id="altGenisBilgi" colspan="2">
                  <!--$altGenisBilgi-->
                </td>
              </tr>
              <tr>
                <td colspan="2"/>
              </tr>
              <tr valign="top">
                <td id="belgeSonBilgi" width="100%" align="left" colspan="2">
                  <!--$belgeSonBilgi-->
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="//n1:Invoice/cac:InvoiceLine">
    <xsl:if test="./cac:Item/cbc:BrandName != ''">
      <xsl:text>&#160;</xsl:text>
      <xsl:value-of select="./cac:Item/cbc:BrandName" disable-output-escaping="yes" />
    </xsl:if>
    <!-- kalem icerik-->
    <tr>
      <td>
        <span class="wrap">
          <xsl:text>&#160;</xsl:text>
          <xsl:value-of select="./cbc:ID"/>
        </span>
      </td>
      <td>
        <span class="wrap">
          <xsl:text>&#160;</xsl:text>
          <xsl:value-of select="./cac:Item/cac:SellersItemIdentification/cbc:ID"/>
        </span>
      </td>
      <!--$barkodDetay-->
      <td>
        <!--id="lineTableTd"-->
        <span class="wrap">
          <!--<xsl:text>&#160;</xsl:text>-->
          <xsl:value-of select="./cac:Item/cbc:Name"/>
        </span>
      </td>
      <!--<xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:Item/cbc:Description">
        <td class="wrap">
          <span>
            <xsl:value-of select="./cac:Item/cbc:Description"/>
          </span>
        </td>
      </xsl:if>
      <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:Item/cac:BuyersItemIdentification/cbc:ID">
        <td>
          <span>
            <xsl:value-of select="./cac:Item/cac:BuyersItemIdentification/cbc:ID"/>
          </span>
        </td>
      </xsl:if>
      <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:Item/cac:SellersItemIdentification/cbc:ID">
        <td>
          <span>
            <xsl:value-of select="./cac:Item/cac:SellersItemIdentification/cbc:ID"/>
          </span>
        </td>
      </xsl:if>-->
      <xsl:if test="//node()/cac:InvoiceLine/cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID='KATDETAY']">
        <td align="left">
          <xsl:for-each select="cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID='KATDETAY']">
            <div>
              <xsl:text>&#160;</xsl:text>
              <xsl:value-of select="."/>
            </div>
          </xsl:for-each>
        </td>
      </xsl:if>
      <xsl:if test="//node()/cac:InvoiceLine/cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID='TAKIP_NO']">
        <td align="left" width="120">
          <div>
            <xsl:for-each select="cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID='TAKIP_NO']">
              <xsl:text>&#160;</xsl:text>
              <xsl:value-of select="."/>
            </xsl:for-each>
            <xsl:for-each select="cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID='TAKIP_ADI']">
              <xsl:text>-</xsl:text>
              <xsl:value-of select="."/>
            </xsl:for-each>
          </div>
        </td>
      </xsl:if>
      <xsl:if test="$xroot/cac:InvoiceLine/cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID = 'KOLI_GORUNUM']">
        <td align="right">
          <span>
            <xsl:text>&#160;</xsl:text>
            <xsl:for-each select="./cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID = 'KOLI_GORUNUM']">
              <xsl:value-of select="."/>
            </xsl:for-each>
          </span>
        </td>
      </xsl:if>
      <td align="right">
        <span>
          <xsl:value-of select="format-number(./cbc:InvoicedQuantity, '#.###.##0,########', 'european')"/>
          <xsl:for-each select="./cbc:Note[substring(., 1, 5) = 'POL03' and normalize-space(substring(., 90, 9)) != '']">
            <xsl:text> + </xsl:text>
            <xsl:value-of select="normalize-space(substring(., 90, 9))" disable-output-escaping="yes"/>
          </xsl:for-each>
          <xsl:if test="./cbc:InvoicedQuantity/@unitCode">
            <xsl:for-each select="./cbc:InvoicedQuantity">
              <xsl:text>&#160;</xsl:text>
              <xsl:choose>
                <xsl:when test="@unitCode  = 'KGM'">
                  <span>
                    <xsl:text> Kilo</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'NIU'">
                  <span>
                    <xsl:text> Adet</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'MTR'">
                  <span>
                    <xsl:text> Metre</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'LTR'">
                  <span>
                    <xsl:text> Litre</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'PK'">
                  <span>
                    <xsl:text> Paket</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'NPL'">
                  <span>
                    <xsl:text> Paket</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'BX'">
                  <span>
                    <xsl:text> Kutu</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'ROLL'">
                  <span>
                    <xsl:text> Rulo</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'CMT'">
                  <span>
                    <xsl:text> Santim</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'MMT'">
                  <span>
                    <xsl:text> Milimetre</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'MTK'">
                  <span>
                    <xsl:text> Metrekare</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'MTQ'">
                  <span>
                    <xsl:text> Metreküp</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'GRM'">
                  <span>
                    <xsl:text> Gram</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'PF'">
                  <span>
                    <xsl:text> Palet</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'SET'">
                  <span>
                    <xsl:text> Set</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'BG'">
                  <span>
                    <xsl:text> Torba</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'NT'">
                  <span>
                    <xsl:text> Ton</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'PGL'">
                  <span>
                    <xsl:text> Galon</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'PR'">
                  <span>
                    <xsl:text> Çift</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'WW'">
                  <span>
                    <xsl:text> Mililitre</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = '4H'">
                  <span>
                    <xsl:text> Mikrometre</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'WTT'">
                  <span>
                    <xsl:text> Watt</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = '2I'">
                  <span>
                    <xsl:text> BTU</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'ANN'">
                  <span>
                    <xsl:text> Yıl</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'MON'">
                  <span>
                    <xsl:text> Ay</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'DAY'">
                  <span>
                    <xsl:text> Gün</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'HUR'">
                  <span>
                    <xsl:text> Saat</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'D61'">
                  <span>
                    <xsl:text> Dakika</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'D62'">
                  <span>
                    <xsl:text> Saniye</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'C26'">
                  <span>
                    <xsl:text> Milisaniye</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'KJO'">
                  <span>
                    <xsl:text> kJ</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'MGM'">
                  <span>
                    <xsl:text> MG</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'GT'">
                  <span>
                    <xsl:text> GT</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'KTM'">
                  <span>
                    <xsl:text> KM</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'MLT'">
                  <span>
                    <xsl:text> ML</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'MMQ'">
                  <span>
                    <xsl:text> MM3</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'CLT'">
                  <span>
                    <xsl:text> CL</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'CMK'">
                  <span>
                    <xsl:text> CM2</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'CMQ'">
                  <span>
                    <xsl:text> CM3</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'KWH'">
                  <span>
                    <xsl:text> KWH</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'ND'">
                  <span>
                    <xsl:text> Fıçı</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'TN'">
                  <span>
                    <xsl:text> Teneke</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'DR'">
                  <span>
                    <xsl:text> Bidon</xsl:text>
                  </span>
                </xsl:when>
                <xsl:when test="@unitCode  = 'RO'">
                  <span>
                    <xsl:text> Rulo</xsl:text>
                  </span>
                </xsl:when>
              </xsl:choose>
            </xsl:for-each>
          </xsl:if>
        </span>
      </td>
      <!--$miktar2Detay-->
      <td align="right">
        <span>
          <xsl:text>&#160;</xsl:text>
          <xsl:for-each select="./cac:Price/cbc:PriceAmount">
            <xsl:value-of select="format-number(., $fiyatFormatStr, 'european')"/>
            <xsl:call-template name="Curr_Type"/>
          </xsl:for-each>
        </span>
      </td>
      <xsl:if test="$fiyatGosterimKurali = 'HP'">
        <xsl:for-each select="cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID = 'NET_FIYAT']">
          <td align="right">
            <span>
              <xsl:text>&#160;</xsl:text>
              <xsl:value-of select="format-number(., $fiyatFormatStr, 'european')"/>
              <xsl:for-each select="parent::node()/parent::node()/parent::node()/cac:Price/cbc:PriceAmount">
                <xsl:call-template name="Curr_Type"/>
              </xsl:for-each>
            </span>
          </td>
        </xsl:for-each>
      </xsl:if>
      <xsl:if test="$dovizGosterimKurali = 'X' and /node()/cac:PricingExchangeRate/cbc:CalculationRate">
        <td align="right">
          <span>
            <xsl:text>&#160;</xsl:text>
            <xsl:for-each select="./cac:Price/cbc:PriceAmount">
              <xsl:value-of select="format-number(. div //n1:Invoice/cac:PricingExchangeRate/cbc:CalculationRate, $fiyatFormatStr, 'european')"/>
              <xsl:text>&#160;</xsl:text>
              <xsl:value-of select="//n1:Invoice/cac:PricingExchangeRate/cbc:SourceCurrencyCode"/>
            </xsl:for-each>
          </span>
        </td>
      </xsl:if>
      <!--<xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:AllowanceCharge/cbc:MultiplierFactorNumeric and //n1:Invoice/cac:InvoiceLine/cac:AllowanceCharge/cbc:MultiplierFactorNumeric !=0">
        <td align="right">
          <span>
            <xsl:text>&#160;</xsl:text>
            <xsl:if test="./cac:AllowanceCharge/cbc:MultiplierFactorNumeric">
              <xsl:text> %</xsl:text>
              <xsl:value-of select="format-number(./cac:AllowanceCharge/cbc:MultiplierFactorNumeric * 100, $bedelFormatStr, 'european')"/>
            </xsl:if>
          </span>
        </td>
      </xsl:if>
      <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:AllowanceCharge">
        <td>
          <span>
            <xsl:text>&#160;</xsl:text>
            <xsl:if test="./cac:AllowanceCharge">
              <xsl:for-each select="./cac:AllowanceCharge/cbc:Amount">
                <xsl:value-of select="format-number(., $bedelFormatStr, 'european')"/>
                <xsl:call-template name="Curr_Type"/>
              </xsl:for-each>
            </xsl:if>
          </span>
        </td>
      </xsl:if>-->
      <!--$iskOranDetay-->
      <!--$iskBedelDetay-->
      <!--$arttirimOranDetay-->
      <!--$arttirimBedelDetay-->
      <!--$kdvOranVeBedelDetay-->
      <!--$digerVergilerDetay-->
      <td align="right">
        <span>
          <xsl:text>&#160;</xsl:text>
          <xsl:for-each select="./cbc:LineExtensionAmount">
            <xsl:if test="(../cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID='VIO_SHTIP']) = 'H-I'">
              <xsl:text>(-) </xsl:text>
            </xsl:if>
            <xsl:value-of select="format-number(., $bedelFormatStr, 'european')"/>
            <xsl:call-template name="Curr_Type"/>
          </xsl:for-each>
        </span>
      </td>
    </tr>
    <!-- Açıklama Satırı -->
    <xsl:for-each select="./cbc:Note[substring(., 1, 5) != 'POL03']">
      <xsl:choose>
        <xsl:when test="substring(., 1, 1) = '&lt;'">
          <xsl:value-of select="." disable-output-escaping="yes" />
        </xsl:when>
        <xsl:otherwise>
          <tr>
            <td class="alignLeft" colspan="10" style="line-height: 13px; height: 15px;">
              <xsl:value-of select="." disable-output-escaping="yes" />
            </td>
          </tr>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
    <xsl:if test="./cac:Item/cbc:Description != ''">
      <xsl:for-each select="./cac:Item/cbc:Description">
        <xsl:choose>
          <xsl:when test="substring(., 1, 1) = '&lt;'">
            <xsl:value-of select="." disable-output-escaping="yes" />
          </xsl:when>
          <xsl:otherwise>
            <tr>
              <td class="alignLeft" colspan="10" style="line-height: 13px; height: 15px;">
                <xsl:value-of select="." disable-output-escaping="yes" />
              </td>
            </tr>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </xsl:if>

    <xsl:for-each select="./cbc:Note[substring(., 1, 5) = 'POL03' and normalize-space(substring(., 350, 499)) != '']">
      <tr>
        <td colspan="20" class="wrap" align="left">
          <xsl:value-of select="normalize-space(substring(., 350, 499))" disable-output-escaping="yes"/>
        </td>
      </tr>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="//cbc:IssueDate">
    <xsl:value-of select="substring(.,9,2)"/>-<xsl:value-of select="substring(.,6,2)"/>-<xsl:value-of select="substring(.,1,4)"/>
  </xsl:template>

  <xsl:template match="//n1:Invoice">
    <tr id="lineTableTr">
      <td id="lineTableTd">
        <xsl:text>&#160;</xsl:text>
      </td>
      <td id="lineTableTd">
        <xsl:text>&#160;</xsl:text>
      </td>
      <td id="lineTableTd" align="right">
        <xsl:text>&#160;</xsl:text>
      </td>
      <!--<td id="lineTableTd" align="right">
        <xsl:text>&#160;</xsl:text>
      </td>
      <td id="lineTableTd" align="right">
        <xsl:text>&#160;</xsl:text>
      </td>-->
      <!--$iskOranDetay-->
      <!--$iskBedelDetay-->
      <!--$arttirimOranDetay-->
      <!--$arttirimBedelDetay-->
      <td id="lineTableTd" align="right">
        <xsl:text>&#160;</xsl:text>
      </td>
      <td id="lineTableTd" align="right">
        <xsl:text>&#160;</xsl:text>
      </td>
      <td id="lineTableTd" align="right">
        <xsl:text>&#160;</xsl:text>
      </td>
      <td id="lineTableTd" align="right">
        <xsl:text>&#160;</xsl:text>
      </td>
      <td id="lineTableTd" align="right">
        <xsl:text>&#160;</xsl:text>
      </td>
    </tr>
  </xsl:template>

  <xsl:template name="Header">
  </xsl:template>
  <xsl:template name="Party_Title" >
    <xsl:param name="PartyType" />
    <xsl:param name="IsSupplier" />
    <td>
      <xsl:if test="$IsSupplier != 'true'">
        <div>
          <!--$aliciMustKodBilgi-->
        </div>
        <span id="sayinEtiket" style="font-weight: bold;">
          <xsl:text>SAYIN </xsl:text>
        </span>
      </xsl:if>
      <xsl:text>&#160;</xsl:text>
      <span style="font-weight: bold; color: #5588CC;">
        <xsl:if test="cac:PartyIdentification/cbc:ID/@schemeID='VKN'">
          <div style="font-weight: bold;">
            <xsl:value-of select="cac:PartyName/cbc:Name"/>
          </div>
          <br/>
        </xsl:if>
        <xsl:if test="cac:PartyIdentification/cbc:ID/@schemeID='TCKN' and (cac:Person and cac:Person/cbc:FirstName)">
          <xsl:for-each select="cac:Person">
            <xsl:for-each select="cbc:Title">
              <xsl:apply-templates/>
              <xsl:text>&#160;</xsl:text>
            </xsl:for-each>
            <xsl:for-each select="cbc:FirstName">
              <xsl:apply-templates/>
              <xsl:text>&#160;</xsl:text>
            </xsl:for-each>
            <xsl:for-each select="cbc:MiddleName">
              <xsl:apply-templates/>
              <xsl:text>&#160; </xsl:text>
            </xsl:for-each>
            <xsl:for-each select="cbc:FamilyName">
              <xsl:apply-templates/>
              <xsl:text>&#160;</xsl:text>
            </xsl:for-each>
            <xsl:for-each select="cbc:NameSuffix">
              <xsl:apply-templates/>
            </xsl:for-each>
            <xsl:if test="$PartyType='TAXFREE'">
              <br/>
              <xsl:text>Pasaport No: </xsl:text>
              <xsl:value-of select="cac:IdentityDocumentReference/cbc:ID"/>
              <br/>
              <xsl:text>Ülkesi: </xsl:text>
              <xsl:value-of select="cbc:NationalityID"/>
            </xsl:if>
            <br/>
          </xsl:for-each>
        </xsl:if>
      </span>
    </td>
  </xsl:template>
  <xsl:template name="Party_Adress" >
    <xsl:param name="PartyType" />
    <td>
      <xsl:for-each select="cac:PostalAddress">
        <xsl:for-each select="cbc:StreetName">
          <xsl:if test="not((. = '.') or (. = '0') or (normalize-space(.) = ''))">
            <xsl:apply-templates/>
            <xsl:text>&#160;</xsl:text>
          </xsl:if>
        </xsl:for-each>
        <xsl:for-each select="cbc:BuildingName">
          <xsl:if test="not((. = '.') or (. = '0') or (normalize-space(.) = ''))">
            <xsl:apply-templates/>
          </xsl:if>
        </xsl:for-each>
        <!--<xsl:for-each select="cbc:BuildingNumber">
          <xsl:if test="not((. = '.') or (. = '0') or (normalize-space(.) = ''))">
            <xsl:text> No:</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>&#160;</xsl:text>
            <br/>
          </xsl:if>
        </xsl:for-each>
        <xsl:for-each select="cbc:Room">
          <xsl:if test="not((. = '.') or (. = '0') or (normalize-space(.) = ''))">
            <xsl:text>Kapı No:</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>&#160;</xsl:text>
            <br/>
          </xsl:if>
        </xsl:for-each>-->
        <xsl:for-each select="cbc:PostalZone">
          <xsl:if test="not((. = '.') or (. = '0') or (normalize-space(.) = ''))">
            <xsl:apply-templates/>
            <xsl:text>&#160;</xsl:text>
          </xsl:if>
        </xsl:for-each>
        <xsl:for-each select="cbc:CitySubdivisionName">
          <xsl:if test="not((. = '.') or (. = '0') or (normalize-space(.) = ''))">
            <xsl:apply-templates/>
            <xsl:text>/</xsl:text>
          </xsl:if>
        </xsl:for-each>
        <xsl:for-each select="cbc:CityName">
          <xsl:if test="not((. = '.') or (. = '0') or (normalize-space(.) = ''))">
            <xsl:apply-templates/>
            <xsl:text>&#160;</xsl:text>
          </xsl:if>
        </xsl:for-each>
        <xsl:if test="$PartyType='TAXFREE'">
          <xsl:if test="not((. = '.') or (. = '0') or (normalize-space(.) = ''))">
            <xsl:value-of select="cac:Country/cbc:Name"/>
          </xsl:if>
        </xsl:if>
      </xsl:for-each>
    </td>
  </xsl:template>
  <xsl:template name='Party_Other'>
    <xsl:param name="PartyType" />
    <xsl:for-each select="cbc:WebsiteURI">
      <xsl:if test=". != ''">
        <tr>
          <td>
            <xsl:if test="not((. = '.') or (. = '0') or (normalize-space(.) = ''))">
              <xsl:text>Web Sitesi: </xsl:text>
              <xsl:value-of select="."/>
            </xsl:if>
          </td>
        </tr>
      </xsl:if>
    </xsl:for-each>
    <xsl:for-each select="cac:Contact/cbc:ElectronicMail">
      <tr>
        <td>
          <xsl:if test="not((. = '.') or (. = '0') or (normalize-space(.) = ''))">
            <xsl:text>E-Posta: </xsl:text>
            <xsl:choose>
              <xsl:when test="normalize-space(substring-before(., ';')) = ''">
                <xsl:value-of select="."/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="substring-before(., ';')"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:if>
        </td>
      </tr>
    </xsl:for-each>
    <xsl:for-each select="cac:Contact">
      <xsl:if test="cbc:Telephone != '' or cbc:Telefax != ''">
        <tr>
          <td>
            <xsl:for-each select="cbc:Telephone">
              <xsl:if test="not((. = '.') or (. = '0') or (normalize-space(.) = ''))">
                <xsl:text>Tel: </xsl:text>
                <xsl:apply-templates/>
              </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="cbc:Telefax">
              <xsl:if test="not((. = '.') or (. = '0') or (normalize-space(.) = ''))">
                <xsl:text> Fax: </xsl:text>
                <xsl:apply-templates/>
              </xsl:if>
            </xsl:for-each>
            <xsl:text>&#160;</xsl:text>
          </td>
        </tr>
      </xsl:if>
    </xsl:for-each>
    <xsl:if test="$PartyType != 'TAXFREE'">
      <xsl:for-each select="cac:PartyTaxScheme/cac:TaxScheme/cbc:Name">
        <tr>
          <td>
            <xsl:text>Vergi Dairesi: </xsl:text>
            <span style="font-weight: bold; color: #5588CC;">
              <xsl:apply-templates/>
            </span>
          </td>
        </tr>
      </xsl:for-each>
      <xsl:for-each select="cac:PartyIdentification">
        <tr>
          <td>
            <xsl:value-of select="cbc:ID/@schemeID"/>
            <xsl:text>: </xsl:text>
            <span style="font-weight: bold; color: #5588CC;">
              <xsl:value-of select="cbc:ID"/>
            </span>
          </td>
        </tr>
      </xsl:for-each>
    </xsl:if>
  </xsl:template>

  <xsl:template name="Curr_Type">
    <!--<xsl:value-of select="format-number(., $bedelFormatStr, 'european')"/>-->
    <xsl:if	test="@currencyID">
      <xsl:text>&#160;</xsl:text>
      <xsl:choose>
        <xsl:when test="@currencyID = 'TRL' or @currencyID = 'TRY'">
          <xsl:text>TL</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="@currencyID"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>

  <xsl:template name="dumpCurrency">
    <xsl:if test="./@currencyID">
      <xsl:text>&#160;</xsl:text>
      <xsl:choose>
        <xsl:when test="./@currencyID = 'TRY' or ./@currencyID = 'TRL'">
          <xsl:text>TL</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="./@currencyID" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
