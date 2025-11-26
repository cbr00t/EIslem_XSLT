<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:msxsl="urn:schemas-microsoft-com:xslt"
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

  <!-- VIO VERSION 03 -->

  <!--<xsl:character-map name="charmap">
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
  </xsl:character-map>-->

  <xsl:decimal-format name="tr" decimal-separator="," grouping-separator="." NaN=""/>
  <xsl:output version="4.0" method="html" indent="no" encoding="UTF-8"
    doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
    doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>
  <!--use-character-maps="charmap"-->

  <xsl:param name="SV_OutputFormat" select="'HTML'"/>
  <xsl:param name="space" select="'&#160;'"/>
  <xsl:param name="xroot" select="node()"/>

  <xsl:param name="numLocale"
      select="'tr'"/>
  <xsl:param name="_fiyatFormatStr" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'FIYAT_FORMAT_STR']" />
  <xsl:param name="_bedelFormatStr" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'BEDEL_FORMAT_STR']" />
  <xsl:param name="_belgeTipi" select="$xroot/cbc:ProfileID"/>
  <xsl:param name="_darDokummu" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'DAR_DOKUM']" />
  <xsl:param name="_koyuDizaynmi" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'KOYU_DIZAYN']" />
  <xsl:param name="_genelPunto" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'GENEL_PUNTO']"/>
  <xsl:param name="_zemin-renk" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'ZEMIN_RENK']"/>
  <xsl:param name="_yazi-renk-light" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'YAZI_RENK_LIGHT']"/>
  <xsl:param name="_yazi-renk-light-2" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'YAZI_RENK_LIGHT_2']"/>
  <xsl:param name="_yazi-renk-blue" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'YAZI_RENK_BLUE']"/>
  <xsl:param name="_border-renk" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'BORDER_RENK']"/>
  <xsl:param name="_bedel-kolon-width" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'BEDEL_KOLON_GENISLIK']"/>
  <xsl:param name="_aliciSagdami" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'ALICI_SAGDA']" />
  <xsl:param name="_firmaLogoUsttemi" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'FIRMA_LOGO_USTTE']" />
  <xsl:param name="_dovizGosterimKurali" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'DOVIZ_GOSTERIM_KURALI']"/>
  <xsl:param name="_fiyatGosterimKurali" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'FIYAT_GOSTERIM_KURALI']"/>
  <xsl:param name="_aliciMustKod" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'MUSTERI_KOD']"/>
  <xsl:param name="_satirGosterimKurali" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'SATIR_GOSTERIM']" />
  <xsl:param name="_fiyatBedelGosterilirmi" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'FIYATBEDEL_GOSTERILIR']"/>
  <xsl:param name="_satirdaStokKodmu" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'SATIRDA_STOKKOD']"/>
  <xsl:param name="_satirdaBarkodmu" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'SATIRDA_BARKOD']"/>
  <xsl:param name="_satirdaMiktar2mi" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'SATIRDA_MIKTAR2']"/>
  <xsl:param name="_satirdaIskBedelmi" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'SATIRDA_ISKONTO_BEDELI']"/>
  <xsl:param name="_satirdaKdvmi" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'SATIRDA_KDV']"/>
  <xsl:param name="_satirdaDigerVergilermi" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'SATIRDA_DIGER_VERGILER']"/>
  <xsl:param name="_kodYerineSiraNomu" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'KOD_YERINE_SIRANO']"/>
  <!--<xsl:param name="_dipteVergilerDahilToplamTutarmi" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'DIPTE_VERGILER_DAHIL_TOPLAM_TUTAR']"/>-->
  <xsl:param name="_iskontoVeyaNakliyeVarmi" select="($xroot/cac:AllowanceCharge/cbc:Amount and $xroot/cac:AllowanceCharge/cbc:Amount != 0) or ($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'DIP_NAKBEDEL'])" />
  <xsl:param name="_vergilerDahilToplamTutarGosterilirmi" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'DIPTE_VERGILER_DAHIL_TOPLAM_TUTAR']"/>
  <xsl:param name="cokluKDVmi" select="count($xroot/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode [. = '0015']) &gt; 1"/>
  <xsl:param name="tevkifatlimi" select="count($xroot//cac:WithholdingTaxTotal/cac:TaxSubtotal [cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode &gt;= 600 and cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode &lt;= 700]) != 0" />
  <xsl:param name="_sipRefGosterimKurali" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'SIPREF_GOSTERIM_KURALI']" />
  <xsl:param name="_kdvSifirGosterilirmi" select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType = 'PARAM' and parent::node()/cbc:DocumentTypeCode = 'KDV_SIFIR_GOSTERILIR']"/>

  <xsl:variable name="dovizlimi"
        select="normalize-space($xroot/cac:PricingExchangeRate/cbc:CalculationRate) and not($xroot/cbc:DocumentCurrencyCode = 'TRL' or $xroot/cbc:DocumentCurrencyCode = 'TRY')"/>
  <xsl:variable name="dvKod">
    <xsl:choose>
      <xsl:when test="$dovizlimi">
        <xsl:value-of select="$xroot/cbc:DocumentCurrencyCode"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>TL</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="dvKur">
    <xsl:choose>
      <xsl:when test="$dovizlimi">
        <xsl:value-of select="number($xroot/cac:PricingExchangeRate/cbc:CalculationRate)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="1"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
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
  <xsl:variable name="miktarFormatStr">
    <xsl:text>#.###.##0,########</xsl:text>
  </xsl:variable>
  <xsl:variable name="darDokummu">
    <xsl:choose>
      <xsl:when test="$_darDokummu">
        <xsl:value-of select="$_darDokummu"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>false</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="koyuDizaynmi">
    <xsl:choose>
      <xsl:when test="$_koyuDizaynmi">
        <xsl:value-of select="$_koyuDizaynmi"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>false</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="genelPunto">
    <xsl:choose>
      <xsl:when test="$_genelPunto and $_genelPunto != 0">
        <xsl:value-of select="$_genelPunto"/>
      </xsl:when>
      <xsl:otherwise>
        <!--<xsl:text>0</xsl:text>-->
        <xsl:text>9</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="zemin-renk">
    <xsl:choose>
      <xsl:when test="$_zemin-renk">
        <xsl:value-of select="$_zemin-renk"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>white</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="border-renk">
    <xsl:choose>
      <xsl:when test="$_border-renk">
        <xsl:value-of select="$_border-renk"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>#e7e7e7</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="yazi-renk-light">
    <xsl:choose>
      <xsl:when test="$_yazi-renk-light">
        <xsl:value-of select="$_yazi-renk-light"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="$koyuDizaynmi = 'true'">
            <xsl:text>#272727</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>#777</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="yazi-renk-light-2">
    <xsl:choose>
      <xsl:when test="$_yazi-renk-light-2">
        <xsl:value-of select="$_yazi-renk-light-2"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="$koyuDizaynmi = 'true'">
            <xsl:text>#555</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>#999</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="yazi-renk-blue">
    <xsl:choose>
      <xsl:when test="$_yazi-renk-blue">
        <xsl:value-of select="$_yazi-renk-blue"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="$koyuDizaynmi = 'true'">
            <xsl:text>#272727</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>royalblue</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="bedel-kolon-width">
    <xsl:choose>
      <xsl:when test="$_bedel-kolon-width">
        <xsl:value-of select="$_bedel-kolon-width"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>120</xsl:text>
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
      <xsl:when test="name($xroot) = 'Invoice'">
        <xsl:choose>
          <xsl:when test="$_belgeTipi = 'EARSIVFATURA'">
            <xsl:text>arsiv</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>fatura</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
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
  <xsl:variable name="invoiceTypeCode">
    <xsl:choose>
      <xsl:when test="$belgeTipi = 'irsaliye'">
        <xsl:value-of select="$xroot/cbc:DespatchAdviceTypeCode"/>
      </xsl:when>
      <xsl:when test="$belgeTipi = 'mustahsil'">
        <xsl:value-of select="$xroot/cbc:CreditNoteTypeCode"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$xroot/cbc:InvoiceTypeCode"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="efami" select="$belgeTipi = 'fatura' or $belgeTipi = 'arsiv'"/>
  <xsl:variable name="eIrsaliyemi" select="$belgeTipi = 'irsaliye'"/>
  <xsl:variable name="eMustahsilmi" select="$belgeTipi = 'mustahsil'"/>
  <xsl:variable name="eIhracatmi" select="$efami and $xroot/cbc:ProfileID = 'IHRACAT'"/>
  <xsl:variable name="aliciSagdami">
    <xsl:choose>
      <xsl:when test="$_aliciSagdami">
        <xsl:value-of select="$_aliciSagdami"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>false</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="belgeEtiket">
    <xsl:choose>
      <xsl:when test="$efami">Fatura</xsl:when>
      <xsl:when test="$eIrsaliyemi">İrsaliye</xsl:when>
      <xsl:otherwise>Belge</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="firmaLogoUsttemi">
    <xsl:choose>
      <xsl:when test="$_firmaLogoUsttemi">
        <xsl:value-of select="$_firmaLogoUsttemi"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>false</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="dovizGosterimKurali">
    <xsl:choose>
      <xsl:when test="$_dovizGosterimKurali">
        <xsl:value-of select="$_dovizGosterimKurali"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text></xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="fiyatGosterimKurali">
    <xsl:choose>
      <xsl:when test="$_fiyatGosterimKurali">
        <xsl:value-of select="$_fiyatGosterimKurali"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text></xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="satirGosterimKurali">
    <xsl:choose>
      <xsl:when test="$_satirGosterimKurali">
        <xsl:value-of select="$_satirGosterimKurali"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>C</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="aliciMustKod">
    <xsl:choose>
      <xsl:when test="$_aliciMustKod">
        <xsl:value-of select="$_aliciMustKod"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text></xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="fiyatBedelGosterilirmi">
    <xsl:choose>
      <xsl:when test="$_fiyatBedelGosterilirmi">
        <xsl:value-of select="$_fiyatBedelGosterilirmi"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="$eIrsaliyemi">false</xsl:when>
          <xsl:otherwise>true</xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="satirdaStokKodmu">
    <xsl:choose>
      <xsl:when test="$_satirdaStokKodmu">
        <xsl:value-of select="$_satirdaStokKodmu"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>true</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="satirdaBarkodmu">
    <xsl:choose>
      <xsl:when test="$_satirdaBarkodmu">
        <xsl:value-of select="$_satirdaBarkodmu"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>false</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="satirdaMiktar2mi">
    <xsl:choose>
      <xsl:when test="$_satirdaMiktar2mi">
        <xsl:value-of select="$_satirdaMiktar2mi"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>false</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="satirdaIskBedelmi">
    <xsl:choose>
      <xsl:when test="$_satirdaIskBedelmi">
        <xsl:value-of select="$_satirdaIskBedelmi"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>false</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="satirdaKdvmi">
    <xsl:choose>
      <xsl:when test="$_satirdaKdvmi">
        <xsl:value-of select="$_satirdaKdvmi"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>false</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="satirdaDigerVergilermi">
    <xsl:choose>
      <xsl:when test="$_satirdaDigerVergilermi">
        <xsl:value-of select="$_satirdaDigerVergilermi"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>false</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="kodYerineSiraNomu">
    <xsl:choose>
      <xsl:when test="$_kodYerineSiraNomu">
        <xsl:value-of select="$_kodYerineSiraNomu"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>false</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <!--<xsl:variable name="dipteVergilerDahilToplamTutarmi">
    <xsl:choose>
      <xsl:when test="$_dipteVergilerDahilToplamTutarmi">
        <xsl:value-of select="$_dipteVergilerDahilToplamTutarmi"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>false</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>-->
  <xsl:variable name="iskontoVeyaNakliyeVarmi">
    <xsl:choose>
      <xsl:when test="$_iskontoVeyaNakliyeVarmi">
        <xsl:value-of select="$_iskontoVeyaNakliyeVarmi"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>false</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="vergilerDahilToplamTutarGosterilirmi">
    <xsl:choose>
      <xsl:when test="$_vergilerDahilToplamTutarGosterilirmi">
        <xsl:value-of select="$_vergilerDahilToplamTutarGosterilirmi"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>false</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="kdvSifirGosterilirmi">
    <xsl:choose>
      <xsl:when test="$_kdvSifirGosterilirmi">
        <xsl:value-of select="$_kdvSifirGosterilirmi"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>false</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="ciftSatirmi"
      select="$satirGosterimKurali = 'C'"/>
  <xsl:variable name="sipRefGosterimKurali">
    <xsl:choose>
      <xsl:when test="$_sipRefGosterimKurali">
        <xsl:value-of select="$_sipRefGosterimKurali"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text></xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>


  <xsl:template match="/">
    <html lang="tr">
      <head>
        <title>e-İşlem Belgesi</title>
        <style type="text/css">
          .full-width { width: 100% } .full-height { height: 100% } .full-wh { width: 100%; height: 100% }
          .grid { display: grid }
          .flex-row { display: flex; flex-direction: row }
          .flex-wrap { flex-wrap: wrap }
          body, .paper, table { background-color: white !important }
          body, table { <xsl:if test="$genelPunto &gt; 0">
            font-size: <xsl:value-of select="$genelPunto"/>pt;
          </xsl:if> }
          body { font-family: "Verdana", "Times New Roman", Times, serif; margin: 0px; padding: 0px; }
          table { position: relative; z-index: 1; /* border: 1px solid #e7e7e7; */ border-collapse: collapse }
          table tr td { border: 1px solid #e7e7e7 }
          .ustalt-bilgi { width: calc(100% - 8px * 2); padding: 3px 8px }
          .ustalt-bilgi .sol, .ustalt-bilgi .sag { width: 50% }
          .ustalt-bilgi .sag { text-align: right }
          .paper { position: relative; width: 26.5cm; padding: 0.3cm 0.5cm /*; border: 1px solid #e7e7e7*/ }
          .paper > * { width: 100%; height: max-content }
          .paper > *, .paper > * > *, .paper > * > * > * { position: relative }
          .paper .party, .paper .invoiceInfoTable {
          border: none !important; border-radius: 10px !important;
          <xsl:choose>
            <xsl:when test="$koyuDizaynmi = 'true'">box-shadow: 0px 0px 6px #333 !important;</xsl:when>
            <xsl:otherwise>box-shadow: 0px 0px 6px #2596be !important;</xsl:otherwise>
          </xsl:choose>
          }
          .paper .top { }
          .paper .top > * > * { background-color: <xsl:value-of select="$zemin-renk"/> }
          .paper > * > .parent, .paper > * table > * tr td { border: none !important }
          .paper .top .left { width: auto; padding-right: 30px }
          .paper .top .center { width: 200px }
          .paper .top .right { width: 300px; padding-left: 10px }
          .paper .gibLogo { width: 110px; <xsl:if test="$firmaLogoUsttemi = 'true'">margin-top: 8px;</xsl:if> }
          .paper div.belgeTipi { font-size: <xsl:value-of select="$genelPunto + 4"/>pt !important; text-align: center; width: 100%; margin: 10px 0px; background-color: <xsl:value-of select="$zemin-renk"/> }
          .paper .firmaLogo,
          .paper .islakImza,
          .paper .kase { position: relative; width: 95%; max-height: 110px; margin: 0; padding: 0; z-index: 1 }
          .paper .firmaLogo { } .paper .islakImza { } .paper .kase { }
          .paper .qrcodeImage-parent { text-align: right; position: relative; width: 200px; height: 200px; margin: -10px 0 0 0; padding: 10px; z-index: 0 }
          .paper .qrcodeImage { width: 100%; height: 100% }
          .paper .qrcodeImage_alt-parent { position: relative; width: 200px; height: 200px; margin: 3px 0 0 0; padding: 10px; z-index: 0 }
          .paper .qrcodeImage_alt { width: 100%; height: 100% }
          .paper .right .firmaLogo,
          .paper .right .islakImza,
          .paper .right .kase { max-height: 100px; padding: 8px }
          .paper .party { font-size: <xsl:value-of select="$genelPunto"/>pt; background-color: white !important; margin: 0 !important; padding: 4px 8px !important }
          .paper .sender.party { margin-bottom: 0.75cm !important } .paper .customer.party { margin-top: 0.75cm !important }
          .paper .party .item { padding: 2px 0px }
          .paper .party .item > .sub-item { width: 100%}
          .paper .party .item > .sub-item:not(:last-child) { width: 100%; margin-right: 8px }
          .paper .party .item .etiket { color: <xsl:value-of select="$yazi-renk-light"/> }
          .paper .party .item .veri { font-weight: bold }
          .paper .party .item .mustKod-parent { font-weight: normal; color: <xsl:value-of select="$yazi-renk-light"/>; margin-right: 3px }
          .paper .party .item .mustKod-parent > .mustKod { font-weight: bold; color: #999 }
          .paper .party .item .unvan { font-size: <xsl:value-of select="$genelPunto + 1.5"/>pt; font-weight: bold }
          .paper .invoiceInfoTable {
          width: fit-content; max-width: 100%; height: 100%; block-size: fit-content; margin: 0 2px 5px 5px !important; padding: 8px !important;
          border-collapse: collapse; border-radius: 5px; box-shadow: 0px 0px 10px <xsl:value-of select="$border-renk"/>; border: 1px solid #f1f1f1;
          overflow: hidden; z-index: 1; <xsl:if test="$aliciSagdami = 'true'">max-width: 90%;</xsl:if>
          }
          .paper .invoiceInfoTable tr { background-color: white; overflow-wrap: break-word }
          .paper .invoiceInfoTable tr:nth-child(2n) { background-color: #fafafa }
          .paper .invoiceInfoTable tr td { border: 1px solid #e7e7e7; padding: 3px 4px; line-height: 13px; vertical-align: top }
          .paper .invoiceInfoTable tr td.etiket { text-align: right }
          .paper .invoiceInfoTable tr td.veri { font-weight: bold; text-align: left }
          .paper .invoiceInfoTable tr td .kod { color: <xsl:value-of select="$yazi-renk-light"/> }
          .paper .invoiceInfoTable tr td .ek-bilgi { color: <xsl:value-of select="$yazi-renk-light-2"/> }
          .paper .invoiceInfoTable .dvKur .dvKod { font-weight: bold }
          .paper .invoiceInfoTable .mukellef.sgk .kod { color: #888 !important }
          .paper .uuidBilgi-parent { position: relative; width: 400px; color: <xsl:value-of select="$yazi-renk-blue"/>; background-color: <xsl:value-of select="$zemin-renk"/>; margin: 10px 0 8px 8px; z-index: 10 }
          .paper .uuid :nth-child(2) { color: #57e }
          .paper .invoiceTableDetail, .paper .invoiceTableDetail .sub-table { box-sizing: border-box; border: 1px solid #f1f1f1; border-radius: 5px; overflow: hidden }
          .paper .invoiceTableDetail { /* font-size: <xsl:value-of select="$genelPunto + 1"/>pt; */ width: 99.7% !important; margin: 0 2px; box-shadow: 0px 0px 10px <xsl:value-of select="$border-renk"/> }
          .paper .invoiceTableDetail .sub-table { margin: 0; margin-top: -5px; padding: 0; line-height: 11px }
          .paper .invoiceTableDetail .satir2 td.separator { width: 20px }
          .paper .invoiceTableDetail thead tr {
          background: #0096c6; background-image: radial-gradient(circle farthest-corner at 10% 20%, #0096c6 0%, #00bdf9 90%);
          <xsl:if test="$koyuDizaynmi = 'true'">
            background-image: none; background: <xsl:value-of select="$yazi-renk-light-2"/>
          </xsl:if>
          }
          .paper .invoiceTableDetail > thead tr { }
          .paper .invoiceTableDetail .sub-table thead tr { background-image: unset; background: #bbb }
          .paper .invoiceTableDetail .sub-table thead tr > td { color: #555 }
          .paper .invoiceTableDetail thead tr td { font-weight: bold; text-align: center; color: white; border: 1px solid <xsl:value-of select="$border-renk"/>; padding: 5px }
          .paper .invoiceTableDetail tbody tr { background-color: <xsl:value-of select="$zemin-renk"/> }
          .paper .invoiceTableDetail tbody tr:nth-child(2n) { background-color: #fafafa }
          .paper .invoiceTableDetail tbody tr td { color: #333; text-align: center; border: 1px solid <xsl:value-of select="$border-renk"/>; padding: 5px; /*white-space: pre-line; text-wrap: balance;*/ text-wrap: pretty; }
          <xsl:if test="$eIhracatmi and $ciftSatirmi">
            .paper .invoiceTableDetail tr.detay.satir1 { font-weight: bold; background: #f5f5f5; border: 2px solid #ececec }
            .paper .invoiceTableDetail tr.detay.satir1 td { padding-top: 10px }
          </xsl:if>
          /*.paper .invoiceTableDetail tbody tr td > * { min-width: max-content }*/
          .paper .invoiceTableDetail tbody tr td:not(.numeric) {
          white-space: normal;         /* IE'nin wrap yapabilmesi için şart */
          word-wrap: break-word;       /* IE destekler */
          overflow-wrap: break-word    /* Modern tarayıcılar için */
          }
          .paper .invoiceTableDetail tbody tr td.numeric { text-align: right }
          .paper .invoiceTableDetail tr td { max-width: 130px; padding: 5px }
          .paper .invoiceTableDetail tr td.rowNumber { width: 13px }
          .paper .invoiceTableDetail tr td.barkod,
          .paper .invoiceTableDetail tr td.shKod { width: 100px; overflow-wrap: anywhere !important }
          .paper .invoiceTableDetail tr td.shAdi { min-width: 150px; max-width: unset; width: -webkit-fill-available }
          .paper .invoiceTableDetail tr td.miktar { min-width: 60px; max-width: 100px }
          .paper .invoiceTableDetail tr td.fiyat,
          .paper .invoiceTableDetail tr td.netFiyat,
          .paper .invoiceTableDetail tr td.dvFiyat { min-width: 60px; max-width: 100px }
          .paper .invoiceTableDetail tr td.iskonto { text-align: center !important; width: 80px; max-width: 100px }
          .paper .invoiceTableDetail tr td.iskonto > .item .sub-item:not(:first-child) { margin-left: 5px }
          .paper .invoiceTableDetail tr td.kdvText { width: 80px; <xsl:if test="$tevkifatlimi">width: 150px</xsl:if> }
          .paper .invoiceTableDetail tr td.kdvText.tevkifatli { width: 130px }
          .paper .invoiceTableDetail tr td.kdvText > .asil.item > .kdvOrani { }
          .paper .invoiceTableDetail tr td.kdvText > .tevkifat.item { font-size: 80% }
          .paper .invoiceTableDetail tr td.kdvText > .tevkifat.item > .etiket { font-weight: bold }
          .paper .invoiceTableDetail tr td.kdvText .ek-bilgi { color: <xsl:value-of select="$yazi-renk-light"/> }
          .paper .invoiceTableDetail tr td.kdvText .kod { font-weight: bold }
          .paper .invoiceTableDetail tr td.kdvText .neden { font-size: 90%; margin-top: 3px } 
          .paper .invoiceTableDetail tr td.kdvText .neden > .veri { color: orangered }
          .paper .invoiceTableDetail tr td.digerVergiler { }
          .paper .invoiceTableDetail tr td.bedel { min-width: 120px; max-width: unset; width: <xsl:value-of select="$bedel-kolon-width"/>px }
          .paper .invoiceTableDetail tr.aciklamaSatiri td { font-size: <xsl:value-of select="$genelPunto - 0.5"/>pt; color: #999; padding: 5px 13px; text-align: left; border-radius: 10px; }
          .paper .invoiceTableTotal-parent { width: 99.9% }
          .paper .invoiceTableTotal-parent .invoiceTableTotal-parent { width: 330px; border-top: 3px solid #888 !important }
          .paper .banka, .paper #bankaBilgiler #tblBankaBilgiler {
          font-size: <xsl:value-of select="$genelPunto - 1"/>pt; width: 100%; /*width: calc(100% - (330px + 3px));*/ margin: 2px; border-radius: 5px;
          border: 1px solid #f1f1f1; box-shadow: 0px 0px 10px <xsl:value-of select="$border-renk"/>; overflow: hidden
          }
          .paper .banka tr td, .paper #bankaBilgiler #tblBankaBilgiler tr td { font-weight: bold; color: #000; text-align: left; padding: 5px; border: 1px solid <xsl:value-of select="$border-renk"/> }
          .paper .banka thead tr, .paper .banka thead tr td, .paper #bankaBilgiler #tblBankaBilgiler tr:first-child {
          color: whitef; background: #0096c6; background-image: radial-gradient(circle farthest-corner at 10% 20%, #0096c6 0%, #00bdf9 90%);
          <xsl:if test="$koyuDizaynmi = 'true'">
            background-image: none; background: <xsl:value-of select="$yazi-renk-light-2"/>
          </xsl:if>
          }
          .paper .banka thead tr td, .paper #bankaBilgiler #tblBankaBilgiler tr th { font-weight: bold; text-align: center; color: white }
          .paper .banka tbody tr td, .paper #bankaBilgiler #tblBankaBilgiler tr:not(:first-child) td { color: #000 }
          .paper .banka tbody tr, .paper #bankaBilgiler #tblBankaBilgiler tr { background-color: <xsl:value-of select="$zemin-renk"/> }
          .paper .banka tbody tr:nth-child(even), .paper #bankaBilgiler #tblBankaBilgiler tr:not(:first-child):nth-child(odd) { background-color: #fafafa }
          .paper .banka tr td.bankaAdi { max-width: 120px } .paper .banka tr td.sube { max-width: 120px }
          {   }
          .paper .invoiceTableTotal { width: 100%; margin: 2px; border-radius: 10px; overflow: hidden; border: 1px solid #f1f1f1 }
          .paper .invoiceTableTotal tr { background-color: <xsl:value-of select="$zemin-renk"/> }
          .paper .invoiceTableTotal tr:nth-child(2n) { background-color: #fafafa }
          .paper .invoiceTableTotal tr td { border: 1px solid <xsl:value-of select="$border-renk"/>; color: #000; padding: 4px }
          .paper .invoiceTableTotal tr td:first-child { text-align: left }
          .paper .invoiceTableTotal tr td:last-child { font-weight: bold; text-align: right; width: <xsl:value-of select="$bedel-kolon-width"/>px }
          .paper .invoiceTableTotal tr:last-child td, .paper .yalnizYazisi { color: <xsl:value-of select="$yazi-renk-blue"/>; }
          .paper .invoiceTableTotal tr:last-child td { font-weight: bolder; font-size: <xsl:value-of select="$genelPunto + 1"/>pt }
          .paper .invoiceTableTotal tr:last-child td:last-child { }
          .paper .invoiceTableTotal tbody.tlGosterim { border-top: 2px solid #aaa }
          .paper .invoiceTableTotal tbody.tlGosterim .item > .etiket .ek-bilgi { font-weight: bold }
          .paper .yalnizYazisi {
          /*width: 750px;*/ font-weight: bold; text-align: right; width: auto; right: 3px; margin: 2px 0px 0px 0;
          padding: 5px 5px; border: 1px solid #e6e6e6; border-radius: 5px; background-color: #f1f1f1; box-shadow: 0px 0px 10px <xsl:value-of select="$border-renk"/>
          }
          .paper .bakiye { font-size: 110%; color: <xsl:value-of select="$yazi-renk-light"/>; margin: 0; padding: 3px 5px; line-height: 20px }
          .paper .bakiye .veri { font-weight: bold; color: royalblue }
          .paper .notes { width: 99%; color: <xsl:value-of select="$yazi-renk-light"/>; border: 1px solid #e6e6e6; border-radius: 5px; margin: 0; padding: 5px }
          .paper .notes .note { width: 100%; margin: 0; padding: 2px 5px }
          .paper .notes .note.note-ek, .paper .notes .note .etiket { font-weight: bold }
          .paper .notes .note .veri { font-weight: normal }
          .paper .bottom { }
          .paper .bottom .vioInfo {
          /* font-size: <xsl:value-of select="$genelPunto"/>pt; */ font-size: <xsl:value-of select="$genelPunto - .5"/>pt; text-align: right;
          width: 99%; color: #a3a3d0; margin-top: -6px; padding: 5px
          }
          .paper .ekFooter { display: grid; width: 98.7%; /*border: 1px solid #e6e6e6; border-radius: 5px;*/ margin: 3px; padding: 10px }
          .paper .sevkAdres { max-height: 80px }
          .paper .sevkAdres > .item.adi { margin-bottom: 5px }
          .paper .sevkAdres > .item .veri { font-weight: bold }
          .paper .sevkAdres > icerik.item > .sub-item { line-height: 20px }
          .paper .ekFooter .teslimEdenAlan { width: 99.9%; max-height: 110px; margin-bottom: 5px; border: 1px solid #e6e6e6; border-radius: 5px }
          .paper .ekFooter .teslimEdenAlan .teslimEden,
          .paper .ekFooter .teslimEdenAlan .teslimAlan { width: 90px; min-height: 60px; max-height: 200px; padding: 5px }
          .paper .ekFooter .teslimEdenAlan > * .etiket { font-weight: normal }
          .paper .ekFooter .teslimEdenAlan > * .veri { font-weight: bold; min-width: 350px !important }
          .paper .ekFooter .teslimEdenAlan > * .item { margin-block-end: 0px }
          .paper .ekFooter .teslimEdenAlan .teslimEdenDetay,
          .paper .ekFooter .teslimEdenAlan .teslimAlanDetay { width: 275px; height: 100px; padding: 5px }
          .paper .ekFooter .teslimEdenAlan .teslimEdenDetay { border-right: 4px solid #e6e6e6 }
          .paper .ekFooter .teslimEdenAlan .teslimAlan { width: 80px }
          .paper .ekFooter .teslimEdenAlan .teslimAlanDetay { }
          .paper .ekFooter .teslimEdenAlan .teslimEden.long, .paper .ekFooter .teslimEdenAlan .teslimAlan.long { width: 130px; margin-inline-end: 250px }
          .paper .irsaliyeIcinEkFooter > .tasiyiciBilgileri { }
          .paper .irsaliyeIcinEkFooter > .tasiyiciBilgileri .etiket { font-weight: bold }
          .paper .irsaliyeIcinEkFooter > .tasiyiciBilgileri .veri { }
          .paper .irsaliyeIcinEkFooter > .tasiyiciBilgileri .vkn { font-weight: bold; color: #888 }
          .paper .irsaliyeIcinEkFooter .tasiyiciBilgileri { border-radius: 5px; box-shadow: 0px 0px 10px #e7e7e7; overflow: hidden }
          .paper .irsaliyeIcinEkFooter .tasiyiciBilgileri thead .baslik {
          color: whitef; background: #0096c6; background-image: radial-gradient(circle farthest-corner at 10% 20%, #0096c6 0%, #00bdf9 90%);
          <xsl:if test="$koyuDizaynmi = 'true'">
            background-image: none; background: <xsl:value-of select="$yazi-renk-light-2"/>
          </xsl:if>
          }
          .paper .irsaliyeIcinEkFooter .tasiyiciBilgileri thead .baslik td { padding: 10px; color: white; font-weight: bold; border: 1px solid #e7e7e7 }
          .paper .irsaliyeIcinEkFooter .tasiyiciBilgileri tbody .detay td { padding: 5px 10px }
          .paper .irsaliyeIcinEkFooter > .tasiyiciBilgileri > tbody > .detay table,
          .paper .irsaliyeIcinEkFooter > .tasiyiciBilgileri > tbody > .detay table tr,
          .paper .irsaliyeIcinEkFooter > .tasiyiciBilgileri > tbody > .detay table tr td { border: none }
          .paper .irsaliyeIcinEkFooter > .tasiyiciBilgileri > tbody > .detay { }
          .paper .irsaliyeIcinEkFooter > .tasiyiciBilgileri > tbody > .detay .tasiyici-bilgi { }
          .paper .irsaliyeIcinEkFooter > .tasiyiciBilgileri > tbody > .detay .tasiyici-aciklamalar { }
          .paper .irsaliyeIcinEkFooter > .tasiyiciBilgileri > tbody > .detay .tasiyici-notlar { }
          .paper .irsaliyeIcinEkFooter > .tasiyiciBilgileri > tbody > .detay .tasiyici-bilgi .subTable { }
          .paper .irsaliyeIcinEkFooter > .tasiyiciBilgileri > tbody > .detay .tasiyici-bilgi .subTable >.detay { }
          .paper .irsaliyeIcinEkFooter > .tasiyiciBilgileri > tbody > .detay .tasiyici-aciklamalar .subTable { }
          .paper .irsaliyeIcinEkFooter > .tasiyiciBilgileri > tbody > .detay .tasiyici-notlar .subTable { }
          .paper .ek-bilgi { color: <xsl:value-of select="$yazi-renk-light"/> }
          .intSatis { width: 99% !important; margin: 1px !important }
          .intSatis .font_Size_12, .intSatis .font_Size_14 { font-family: inherit !important }
          .intSatis .font_Size_12 { font-size: <xsl:value-of select="$genelPunto + 1"/>pt !important } .intSatis .font_Size_14 { font-size: <xsl:value-of select="$genelPunto + 2"/>pt !important }
          .intSatis .alt_eIslem_Bilgi_Border { width: 99% !important; margin: 5px 0 !important } .intSatis .etiket { width: 100px !important }
          .intSatis .table_bottom, .intSatis .table_bottom tr, .intSatis .table_bottom td { min-height: 20px !important }
          .intSatis .td_height { min-height: 13px !important }
          .bold { font-weight: bold }
          .align-left { text-align: left !important }
          .align-center { text-align: center !important }
          .align-right { text-align: right !important }
        </style>
        <xsl:for-each select="$xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'HTML_HEAD']">
          <xsl:call-template name="htmlBilgi"/>
        </xsl:for-each>
        <style>
          <xsl:for-each select="$xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'CSS']">
            <xsl:call-template name="htmlBilgi"/>
          </xsl:for-each>
        </style>
        <script><![CDATA[!function(t,n){var r,e;"object"==typeof exports&&"undefined"!=typeof module?module.exports=n():"function"==typeof define&&define.amd?define(n):(r=t.Base64,(e=n()).noConflict=function(){return t.Base64=r,e},t.Meteor&&(Base64=e),t.Base64=e)}("undefined"!=typeof self?self:"undefined"!=typeof window?window:"undefined"!=typeof global?global:this,(function(){"use strict";var t,n="3.7.5",r=n,e="function"==typeof atob,o="function"==typeof btoa,u="function"==typeof Buffer,i="function"==typeof TextDecoder?new TextDecoder:undefined,f="function"==typeof TextEncoder?new TextEncoder:undefined,c=Array.prototype.slice.call("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="),a=(t={},c?.forEach((function(n,r){return t[n]=r})),t),d=/^(?:[A-Za-z\d+\/]{4})*?(?:[A-Za-z\d+\/]{2}(?:==)?|[A-Za-z\d+\/]{3}=?)?$/,s=String.fromCharCode.bind(String),l="function"==typeof Uint8Array.from?Uint8Array.from.bind(Uint8Array):function(t){return new Uint8Array(Array.prototype.slice.call(t,0))},h=function(t){return t.replace(/=/g,"").replace(/[+\/]/g,(function(t){return"+"==t?"-":"_"}))},p=function(t){return t.replace(/[^A-Za-z0-9\+\/]/g,"")},y=function(t){for(var n,r,e,o,u="",i=t.length%3,f=0;f<t.length;){if((r=t.charCodeAt(f++))>255||(e=t.charCodeAt(f++))>255||(o=t.charCodeAt(f++))>255)throw new TypeError("invalid character found");u+=c[(n=r<<16|e<<8|o)>>18&63]+c[n>>12&63]+c[n>>6&63]+c[63&n]}return i?u.slice(0,i-3)+"===".substring(i):u},A=o?function(t){return btoa(t)}:u?function(t){return Buffer.from(t,"binary").toString("base64")}:y,b=u?function(t){return Buffer.from(t).toString("base64")}:function(t){for(var n=[],r=0,e=t.length;r<e;r+=4096)n.push(s.apply(null,t.subarray(r,r+4096)));return A(n.join(""))},g=function(t,n){return void 0===n&&(n=!1),n?h(b(t)):b(t)},B=function(t){if(t.length<2)return(n=t.charCodeAt(0))<128?t:n<2048?s(192|n>>>6)+s(128|63&n):s(224|n>>>12&15)+s(128|n>>>6&63)+s(128|63&n);var n=65536+1024*(t.charCodeAt(0)-55296)+(t.charCodeAt(1)-56320);return s(240|n>>>18&7)+s(128|n>>>12&63)+s(128|n>>>6&63)+s(128|63&n)},x=/[\uD800-\uDBFF][\uDC00-\uDFFFF]|[^\x00-\x7F]/g,C=function(t){return t.replace(x,B)},m=u?function(t){return Buffer.from(t,"utf8").toString("base64")}:f?function(t){return b(f.encode(t))}:function(t){return A(C(t))},v=function(t,n){return void 0===n&&(n=!1),n?h(m(t)):m(t)},U=function(t){return v(t,!0)},F=/[\xC0-\xDF][\x80-\xBF]|[\xE0-\xEF][\x80-\xBF]{2}|[\xF0-\xF7][\x80-\xBF]{3}/g,w=function(t){switch(t.length){case 4:var n=((7&t.charCodeAt(0))<<18|(63&t.charCodeAt(1))<<12|(63&t.charCodeAt(2))<<6|63&t.charCodeAt(3))-65536;return s(55296+(n>>>10))+s(56320+(1023&n));case 3:return s((15&t.charCodeAt(0))<<12|(63&t.charCodeAt(1))<<6|63&t.charCodeAt(2));default:return s((31&t.charCodeAt(0))<<6|63&t.charCodeAt(1))}},S=function(t){return t.replace(F,w)},E=function(t){if(t=t.replace(/\s+/g,""),!d.test(t))throw new TypeError("malformed base64.");t+="==".slice(2-(3&t.length));for(var n,r,e,o="",u=0;u<t.length;)n=a[t.charAt(u++)]<<18|a[t.charAt(u++)]<<12|(r=a[t.charAt(u++)])<<6|(e=a[t.charAt(u++)]),o+=64===r?s(n>>16&255):64===e?s(n>>16&255,n>>8&255):s(n>>16&255,n>>8&255,255&n);return o},D=e?function(t){return atob(p(t))}:u?function(t){return Buffer.from(t,"base64").toString("binary")}:E,R=u?function(t){return l(Buffer.from(t,"base64"))}:function(t){return l(D(t).split("").map((function(t){return t.charCodeAt(0)})))},z=function(t){return R(Z(t))},T=u?function(t){return Buffer.from(t,"base64").toString("utf8")}:i?function(t){return i.decode(R(t))}:function(t){return S(D(t))},Z=function(t){return p(t.replace(/[-_]/g,(function(t){return"-"==t?"+":"/"})))},j=function(t){return T(Z(t))},I=function(t){return{value:t,enumerable:!1,writable:!0,configurable:!0}},O=function(){var t=function(t,n){return Object.defineProperty(String.prototype,t,I(n))};t("fromBase64",(function(){return j(this)})),t("toBase64",(function(t){return v(this,t)})),t("toBase64URI",(function(){return v(this,!0)})),t("toBase64URL",(function(){return v(this,!0)})),t("toUint8Array",(function(){return z(this)}))},P=function(){var t=function(t,n){return Object.defineProperty(Uint8Array.prototype,t,I(n))};t("toBase64",(function(t){return g(this,t)})),t("toBase64URI",(function(){return g(this,!0)})),t("toBase64URL",(function(){return g(this,!0)}))},L={version:n,VERSION:r,atob:D,atobPolyfill:E,btoa:A,btoaPolyfill:y,fromBase64:j,toBase64:v,encode:v,encodeURI:U,encodeURL:U,utob:C,btou:S,decode:j,isValid:function(t){if("string"!=typeof t)return!1;var n=t.replace(/\s+/g,"").replace(/={0,2}$/,"");return!/[^\s0-9a-zA-Z\+/]/.test(n)||!/[^\s0-9a-zA-Z\-_]/.test(n)},fromUint8Array:g,toUint8Array:z,extendString:O,extendUint8Array:P,extendBuiltins:function(){O(),P()},Base64:{}};return Object.keys(L)?.forEach((function(t){return L.Base64[t]=L[t]})),L}))]]></script>
        <script><![CDATA[var QRCode;!function(){function t(t){this.mode=s.MODE_8BIT_BYTE,this.data=t,this.parsedData=[];for(var e=[],r=0,o=this.data.length;o>r;r++){var i=this.data.charCodeAt(r);i>65536?(e[0]=240|(1835008&i)>>>18,e[1]=128|(258048&i)>>>12,e[2]=128|(4032&i)>>>6,e[3]=128|63&i):i>2048?(e[0]=224|(61440&i)>>>12,e[1]=128|(4032&i)>>>6,e[2]=128|63&i):i>128?(e[0]=192|(1984&i)>>>6,e[1]=128|63&i):e[0]=i,this.parsedData=this.parsedData.concat(e)}this.parsedData.length!=this.data.length&&(this.parsedData.unshift(191),this.parsedData.unshift(187),this.parsedData.unshift(239))}function e(t,e){this.typeNumber=t,this.errorCorrectLevel=e,this.modules=null,this.moduleCount=0,this.dataCache=null,this.dataList=[]}function r(t,e){if(null==t.length)throw new Error(t.length+"/"+e);for(var r=0;r<t.length&&0==t[r];)r++;this.num=new Array(t.length-r+e);for(var o=0;o<t.length-r;o++)this.num[o]=t[o+r]}function o(t,e){this.totalCount=t,this.dataCount=e}function i(){this.buffer=[],this.length=0}function n(){var t=!1,e=navigator.userAgent;return/android/i.test(e)&&(t=!0,aMat=e.toString().match(/android ([0-9]\.[0-9])/i),aMat&&aMat[1]&&(t=parseFloat(aMat[1]))),t}function a(t,e){for(var r=1,o=function(t){var e=encodeURI(t).toString().replace(/\%[0-9a-fA-F]{2}/g,"a");return e.length+(e.length!=t?3:0)}(t),i=0,n=d.length;n>=i;i++){var a=0;switch(e){case h.L:a=d[i][0];break;case h.M:a=d[i][1];break;case h.Q:a=d[i][2];break;case h.H:a=d[i][3]}if(a>=o)break;r++}if(r>d.length)throw new Error("Too long data");return r}t.prototype={getLength:function(){return this.parsedData.length},write:function(t){for(var e=0,r=this.parsedData.length;r>e;e++)t.put(this.parsedData[e],8)}},e.prototype={addData:function(e){var r=new t(e);this.dataList.push(r),this.dataCache=null},isDark:function(t,e){if(0>t||this.moduleCount<=t||0>e||this.moduleCount<=e)throw new Error(t+","+e);return this.modules[t][e]},getModuleCount:function(){return this.moduleCount},make:function(){this.makeImpl(!1,this.getBestMaskPattern())},makeImpl:function(t,r){this.moduleCount=4*this.typeNumber+17,this.modules=new Array(this.moduleCount);for(var o=0;o<this.moduleCount;o++){this.modules[o]=new Array(this.moduleCount);for(var i=0;i<this.moduleCount;i++)this.modules[o][i]=null}this.setupPositionProbePattern(0,0),this.setupPositionProbePattern(this.moduleCount-7,0),this.setupPositionProbePattern(0,this.moduleCount-7),this.setupPositionAdjustPattern(),this.setupTimingPattern(),this.setupTypeInfo(t,r),this.typeNumber>=7&&this.setupTypeNumber(t),null==this.dataCache&&(this.dataCache=e.createData(this.typeNumber,this.errorCorrectLevel,this.dataList)),this.mapData(this.dataCache,r)},setupPositionProbePattern:function(t,e){for(var r=-1;7>=r;r++)if(!(-1>=t+r||this.moduleCount<=t+r))for(var o=-1;7>=o;o++)-1>=e+o||this.moduleCount<=e+o||(this.modules[t+r][e+o]=r>=0&&6>=r&&(0==o||6==o)||o>=0&&6>=o&&(0==r||6==r)||r>=2&&4>=r&&o>=2&&4>=o)},getBestMaskPattern:function(){for(var t=0,e=0,r=0;8>r;r++){this.makeImpl(!0,r);var o=u.getLostPoint(this);(0==r||t>o)&&(t=o,e=r)}return e},createMovieClip:function(t,e,r){var o=t.createEmptyMovieClip(e,r);this.make();for(var i=0;i<this.modules.length;i++)for(var n=1*i,a=0;a<this.modules[i].length;a++){var s=1*a;this.modules[i][a]&&(o.beginFill(0,100),o.moveTo(s,n),o.lineTo(s+1,n),o.lineTo(s+1,n+1),o.lineTo(s,n+1),o.endFill())}return o},setupTimingPattern:function(){for(var t=8;t<this.moduleCount-8;t++)null==this.modules[t][6]&&(this.modules[t][6]=0==t%2);for(var e=8;e<this.moduleCount-8;e++)null==this.modules[6][e]&&(this.modules[6][e]=0==e%2)},setupPositionAdjustPattern:function(){for(var t=u.getPatternPosition(this.typeNumber),e=0;e<t.length;e++)for(var r=0;r<t.length;r++){var o=t[e],i=t[r];if(null==this.modules[o][i])for(var n=-2;2>=n;n++)for(var a=-2;2>=a;a++)this.modules[o+n][i+a]=-2==n||2==n||-2==a||2==a||0==n&&0==a}},setupTypeNumber:function(t){for(var e=u.getBCHTypeNumber(this.typeNumber),r=0;18>r;r++){var o=!t&&1==(1&e>>r);this.modules[Math.floor(r/3)][r%3+this.moduleCount-8-3]=o}for(r=0;18>r;r++){o=!t&&1==(1&e>>r);this.modules[r%3+this.moduleCount-8-3][Math.floor(r/3)]=o}},setupTypeInfo:function(t,e){for(var r=this.errorCorrectLevel<<3|e,o=u.getBCHTypeInfo(r),i=0;15>i;i++){var n=!t&&1==(1&o>>i);6>i?this.modules[i][8]=n:8>i?this.modules[i+1][8]=n:this.modules[this.moduleCount-15+i][8]=n}for(i=0;15>i;i++){n=!t&&1==(1&o>>i);8>i?this.modules[8][this.moduleCount-i-1]=n:9>i?this.modules[8][15-i-1+1]=n:this.modules[8][15-i-1]=n}this.modules[this.moduleCount-8][8]=!t},mapData:function(t,e){for(var r=-1,o=this.moduleCount-1,i=7,n=0,a=this.moduleCount-1;a>0;a-=2)for(6==a&&a--;;){for(var s=0;2>s;s++)if(null==this.modules[o][a-s]){var h=!1;n<t.length&&(h=1==(1&t[n]>>>i)),u.getMask(e,o,a-s)&&(h=!h),this.modules[o][a-s]=h,-1==--i&&(n++,i=7)}if(0>(o+=r)||this.moduleCount<=o){o-=r,r=-r;break}}}},e.PAD0=236,e.PAD1=17,e.createData=function(t,r,n){for(var a=o.getRSBlocks(t,r),s=new i,h=0;h<n.length;h++){var l=n[h];s.put(l.mode,4),s.put(l.getLength(),u.getLengthInBits(l.mode,t)),l.write(s)}var g=0;for(h=0;h<a.length;h++)g+=a[h].dataCount;if(s.getLengthInBits()>8*g)throw new Error("code length overflow. ("+s.getLengthInBits()+">"+8*g+")");for(s.getLengthInBits()+4<=8*g&&s.put(0,4);0!=s.getLengthInBits()%8;)s.putBit(!1);for(;!(s.getLengthInBits()>=8*g)&&(s.put(e.PAD0,8),!(s.getLengthInBits()>=8*g));)s.put(e.PAD1,8);return e.createBytes(s,a)},e.createBytes=function(t,e){for(var o=0,i=0,n=0,a=new Array(e.length),s=new Array(e.length),h=0;h<e.length;h++){var l=e[h].dataCount,g=e[h].totalCount-l;i=Math.max(i,l),n=Math.max(n,g),a[h]=new Array(l);for(var f=0;f<a[h].length;f++)a[h][f]=255&t.buffer[f+o];o+=l;var d=u.getErrorCorrectPolynomial(g),c=new r(a[h],d.getLength()-1).mod(d);s[h]=new Array(d.getLength()-1);for(f=0;f<s[h].length;f++){var p=f+c.getLength()-s[h].length;s[h][f]=p>=0?c.get(p):0}}var m=0;for(f=0;f<e.length;f++)m+=e[f].totalCount;var _=new Array(m),v=0;for(f=0;i>f;f++)for(h=0;h<e.length;h++)f<a[h].length&&(_[v++]=a[h][f]);for(f=0;n>f;f++)for(h=0;h<e.length;h++)f<s[h].length&&(_[v++]=s[h][f]);return _};for(var s={MODE_NUMBER:1,MODE_ALPHA_NUM:2,MODE_8BIT_BYTE:4,MODE_KANJI:8},h={L:1,M:0,Q:3,H:2},l={PATTERN000:0,PATTERN001:1,PATTERN010:2,PATTERN011:3,PATTERN100:4,PATTERN101:5,PATTERN110:6,PATTERN111:7},u={PATTERN_POSITION_TABLE:[[],[6,18],[6,22],[6,26],[6,30],[6,34],[6,22,38],[6,24,42],[6,26,46],[6,28,50],[6,30,54],[6,32,58],[6,34,62],[6,26,46,66],[6,26,48,70],[6,26,50,74],[6,30,54,78],[6,30,56,82],[6,30,58,86],[6,34,62,90],[6,28,50,72,94],[6,26,50,74,98],[6,30,54,78,102],[6,28,54,80,106],[6,32,58,84,110],[6,30,58,86,114],[6,34,62,90,118],[6,26,50,74,98,122],[6,30,54,78,102,126],[6,26,52,78,104,130],[6,30,56,82,108,134],[6,34,60,86,112,138],[6,30,58,86,114,142],[6,34,62,90,118,146],[6,30,54,78,102,126,150],[6,24,50,76,102,128,154],[6,28,54,80,106,132,158],[6,32,58,84,110,136,162],[6,26,54,82,110,138,166],[6,30,58,86,114,142,170]],G15:1335,G18:7973,G15_MASK:21522,getBCHTypeInfo:function(t){for(var e=t<<10;u.getBCHDigit(e)-u.getBCHDigit(u.G15)>=0;)e^=u.G15<<u.getBCHDigit(e)-u.getBCHDigit(u.G15);return(t<<10|e)^u.G15_MASK},getBCHTypeNumber:function(t){for(var e=t<<12;u.getBCHDigit(e)-u.getBCHDigit(u.G18)>=0;)e^=u.G18<<u.getBCHDigit(e)-u.getBCHDigit(u.G18);return t<<12|e},getBCHDigit:function(t){for(var e=0;0!=t;)e++,t>>>=1;return e},getPatternPosition:function(t){return u.PATTERN_POSITION_TABLE[t-1]},getMask:function(t,e,r){switch(t){case l.PATTERN000:return 0==(e+r)%2;case l.PATTERN001:return 0==e%2;case l.PATTERN010:return 0==r%3;case l.PATTERN011:return 0==(e+r)%3;case l.PATTERN100:return 0==(Math.floor(e/2)+Math.floor(r/3))%2;case l.PATTERN101:return 0==e*r%2+e*r%3;case l.PATTERN110:return 0==(e*r%2+e*r%3)%2;case l.PATTERN111:return 0==(e*r%3+(e+r)%2)%2;default:throw new Error("bad maskPattern:"+t)}},getErrorCorrectPolynomial:function(t){for(var e=new r([1],0),o=0;t>o;o++)e=e.multiply(new r([1,g.gexp(o)],0));return e},getLengthInBits:function(t,e){if(e>=1&&10>e)switch(t){case s.MODE_NUMBER:return 10;case s.MODE_ALPHA_NUM:return 9;case s.MODE_8BIT_BYTE:case s.MODE_KANJI:return 8;default:throw new Error("mode:"+t)}else if(27>e)switch(t){case s.MODE_NUMBER:return 12;case s.MODE_ALPHA_NUM:return 11;case s.MODE_8BIT_BYTE:return 16;case s.MODE_KANJI:return 10;default:throw new Error("mode:"+t)}else{if(!(41>e))throw new Error("type:"+e);switch(t){case s.MODE_NUMBER:return 14;case s.MODE_ALPHA_NUM:return 13;case s.MODE_8BIT_BYTE:return 16;case s.MODE_KANJI:return 12;default:throw new Error("mode:"+t)}}},getLostPoint:function(t){for(var e=t.getModuleCount(),r=0,o=0;e>o;o++)for(var i=0;e>i;i++){for(var n=0,a=t.isDark(o,i),s=-1;1>=s;s++)if(!(0>o+s||o+s>=e))for(var h=-1;1>=h;h++)0>i+h||i+h>=e||(0!=s||0!=h)&&a==t.isDark(o+s,i+h)&&n++;n>5&&(r+=3+n-5)}for(o=0;e-1>o;o++)for(i=0;e-1>i;i++){var l=0;t.isDark(o,i)&&l++,t.isDark(o+1,i)&&l++,t.isDark(o,i+1)&&l++,t.isDark(o+1,i+1)&&l++,(0==l||4==l)&&(r+=3)}for(o=0;e>o;o++)for(i=0;e-6>i;i++)t.isDark(o,i)&&!t.isDark(o,i+1)&&t.isDark(o,i+2)&&t.isDark(o,i+3)&&t.isDark(o,i+4)&&!t.isDark(o,i+5)&&t.isDark(o,i+6)&&(r+=40);for(i=0;e>i;i++)for(o=0;e-6>o;o++)t.isDark(o,i)&&!t.isDark(o+1,i)&&t.isDark(o+2,i)&&t.isDark(o+3,i)&&t.isDark(o+4,i)&&!t.isDark(o+5,i)&&t.isDark(o+6,i)&&(r+=40);var u=0;for(i=0;e>i;i++)for(o=0;e>o;o++)t.isDark(o,i)&&u++;return r+10*(Math.abs(100*u/e/e-50)/5)}},g={glog:function(t){if(1>t)throw new Error("glog("+t+")");return g.LOG_TABLE[t]},gexp:function(t){for(;0>t;)t+=255;for(;t>=256;)t-=255;return g.EXP_TABLE[t]},EXP_TABLE:new Array(256),LOG_TABLE:new Array(256)},f=0;8>f;f++)g.EXP_TABLE[f]=1<<f;for(f=8;256>f;f++)g.EXP_TABLE[f]=g.EXP_TABLE[f-4]^g.EXP_TABLE[f-5]^g.EXP_TABLE[f-6]^g.EXP_TABLE[f-8];for(f=0;255>f;f++)g.LOG_TABLE[g.EXP_TABLE[f]]=f;r.prototype={get:function(t){return this.num[t]},getLength:function(){return this.num.length},multiply:function(t){for(var e=new Array(this.getLength()+t.getLength()-1),o=0;o<this.getLength();o++)for(var i=0;i<t.getLength();i++)e[o+i]^=g.gexp(g.glog(this.get(o))+g.glog(t.get(i)));return new r(e,0)},mod:function(t){if(this.getLength()-t.getLength()<0)return this;for(var e=g.glog(this.get(0))-g.glog(t.get(0)),o=new Array(this.getLength()),i=0;i<this.getLength();i++)o[i]=this.get(i);for(i=0;i<t.getLength();i++)o[i]^=g.gexp(g.glog(t.get(i))+e);return new r(o,0).mod(t)}},o.RS_BLOCK_TABLE=[[1,26,19],[1,26,16],[1,26,13],[1,26,9],[1,44,34],[1,44,28],[1,44,22],[1,44,16],[1,70,55],[1,70,44],[2,35,17],[2,35,13],[1,100,80],[2,50,32],[2,50,24],[4,25,9],[1,134,108],[2,67,43],[2,33,15,2,34,16],[2,33,11,2,34,12],[2,86,68],[4,43,27],[4,43,19],[4,43,15],[2,98,78],[4,49,31],[2,32,14,4,33,15],[4,39,13,1,40,14],[2,121,97],[2,60,38,2,61,39],[4,40,18,2,41,19],[4,40,14,2,41,15],[2,146,116],[3,58,36,2,59,37],[4,36,16,4,37,17],[4,36,12,4,37,13],[2,86,68,2,87,69],[4,69,43,1,70,44],[6,43,19,2,44,20],[6,43,15,2,44,16],[4,101,81],[1,80,50,4,81,51],[4,50,22,4,51,23],[3,36,12,8,37,13],[2,116,92,2,117,93],[6,58,36,2,59,37],[4,46,20,6,47,21],[7,42,14,4,43,15],[4,133,107],[8,59,37,1,60,38],[8,44,20,4,45,21],[12,33,11,4,34,12],[3,145,115,1,146,116],[4,64,40,5,65,41],[11,36,16,5,37,17],[11,36,12,5,37,13],[5,109,87,1,110,88],[5,65,41,5,66,42],[5,54,24,7,55,25],[11,36,12],[5,122,98,1,123,99],[7,73,45,3,74,46],[15,43,19,2,44,20],[3,45,15,13,46,16],[1,135,107,5,136,108],[10,74,46,1,75,47],[1,50,22,15,51,23],[2,42,14,17,43,15],[5,150,120,1,151,121],[9,69,43,4,70,44],[17,50,22,1,51,23],[2,42,14,19,43,15],[3,141,113,4,142,114],[3,70,44,11,71,45],[17,47,21,4,48,22],[9,39,13,16,40,14],[3,135,107,5,136,108],[3,67,41,13,68,42],[15,54,24,5,55,25],[15,43,15,10,44,16],[4,144,116,4,145,117],[17,68,42],[17,50,22,6,51,23],[19,46,16,6,47,17],[2,139,111,7,140,112],[17,74,46],[7,54,24,16,55,25],[34,37,13],[4,151,121,5,152,122],[4,75,47,14,76,48],[11,54,24,14,55,25],[16,45,15,14,46,16],[6,147,117,4,148,118],[6,73,45,14,74,46],[11,54,24,16,55,25],[30,46,16,2,47,17],[8,132,106,4,133,107],[8,75,47,13,76,48],[7,54,24,22,55,25],[22,45,15,13,46,16],[10,142,114,2,143,115],[19,74,46,4,75,47],[28,50,22,6,51,23],[33,46,16,4,47,17],[8,152,122,4,153,123],[22,73,45,3,74,46],[8,53,23,26,54,24],[12,45,15,28,46,16],[3,147,117,10,148,118],[3,73,45,23,74,46],[4,54,24,31,55,25],[11,45,15,31,46,16],[7,146,116,7,147,117],[21,73,45,7,74,46],[1,53,23,37,54,24],[19,45,15,26,46,16],[5,145,115,10,146,116],[19,75,47,10,76,48],[15,54,24,25,55,25],[23,45,15,25,46,16],[13,145,115,3,146,116],[2,74,46,29,75,47],[42,54,24,1,55,25],[23,45,15,28,46,16],[17,145,115],[10,74,46,23,75,47],[10,54,24,35,55,25],[19,45,15,35,46,16],[17,145,115,1,146,116],[14,74,46,21,75,47],[29,54,24,19,55,25],[11,45,15,46,46,16],[13,145,115,6,146,116],[14,74,46,23,75,47],[44,54,24,7,55,25],[59,46,16,1,47,17],[12,151,121,7,152,122],[12,75,47,26,76,48],[39,54,24,14,55,25],[22,45,15,41,46,16],[6,151,121,14,152,122],[6,75,47,34,76,48],[46,54,24,10,55,25],[2,45,15,64,46,16],[17,152,122,4,153,123],[29,74,46,14,75,47],[49,54,24,10,55,25],[24,45,15,46,46,16],[4,152,122,18,153,123],[13,74,46,32,75,47],[48,54,24,14,55,25],[42,45,15,32,46,16],[20,147,117,4,148,118],[40,75,47,7,76,48],[43,54,24,22,55,25],[10,45,15,67,46,16],[19,148,118,6,149,119],[18,75,47,31,76,48],[34,54,24,34,55,25],[20,45,15,61,46,16]],o.getRSBlocks=function(t,e){var r=o.getRsBlockTable(t,e);if(null==r)throw new Error("bad rs block @ typeNumber:"+t+"/errorCorrectLevel:"+e);for(var i=r.length/3,n=[],a=0;i>a;a++)for(var s=r[3*a+0],h=r[3*a+1],l=r[3*a+2],u=0;s>u;u++)n.push(new o(h,l));return n},o.getRsBlockTable=function(t,e){switch(e){case h.L:return o.RS_BLOCK_TABLE[4*(t-1)+0];case h.M:return o.RS_BLOCK_TABLE[4*(t-1)+1];case h.Q:return o.RS_BLOCK_TABLE[4*(t-1)+2];case h.H:return o.RS_BLOCK_TABLE[4*(t-1)+3];default:return}},i.prototype={get:function(t){var e=Math.floor(t/8);return 1==(1&this.buffer[e]>>>7-t%8)},put:function(t,e){for(var r=0;e>r;r++)this.putBit(1==(1&t>>>e-r-1))},getLengthInBits:function(){return this.length},putBit:function(t){var e=Math.floor(this.length/8);this.buffer.length<=e&&this.buffer.push(0),t&&(this.buffer[e]|=128>>>this.length%8),this.length++}};var d=[[17,14,11,7],[32,26,20,14],[53,42,32,24],[78,62,46,34],[106,84,60,44],[134,106,74,58],[154,122,86,64],[192,152,108,84],[230,180,130,98],[271,213,151,119],[321,251,177,137],[367,287,203,155],[425,331,241,177],[458,362,258,194],[520,412,292,220],[586,450,322,250],[644,504,364,280],[718,560,394,310],[792,624,442,338],[858,666,482,382],[929,711,509,403],[1003,779,565,439],[1091,857,611,461],[1171,911,661,511],[1273,997,715,535],[1367,1059,751,593],[1465,1125,805,625],[1528,1190,868,658],[1628,1264,908,698],[1732,1370,982,742],[1840,1452,1030,790],[1952,1538,1112,842],[2068,1628,1168,898],[2188,1722,1228,958],[2303,1809,1283,983],[2431,1911,1351,1051],[2563,1989,1423,1093],[2699,2099,1499,1139],[2809,2213,1579,1219],[2953,2331,1663,1273]],c=function(){var t=function(t,e){this._el=t,this._htOption=e};return t.prototype.draw=function(t){function e(t,e){var r=document.createElementNS("http://www.w3.org/2000/svg",t);for(var o in e)e.hasOwnProperty(o)&&r.setAttribute(o,e[o]);return r}var r=this._htOption,o=this._el,i=t.getModuleCount();Math.floor(r.width/i),Math.floor(r.height/i),this.clear();var n=e("svg",{viewBox:"0 0 "+String(i)+" "+String(i),width:"100%",height:"100%",fill:r.colorLight});n.setAttributeNS("http://www.w3.org/2000/xmlns/","xmlns:xlink","http://www.w3.org/1999/xlink"),o.appendChild(n),n.appendChild(e("rect",{fill:r.colorDark,width:"1",height:"1",id:"template"}));for(var a=0;i>a;a++)for(var s=0;i>s;s++)if(t.isDark(a,s)){var h=e("use",{x:String(a),y:String(s)});h.setAttributeNS("http://www.w3.org/1999/xlink","href","#template"),n.appendChild(h)}},t.prototype.clear=function(){for(;this._el.hasChildNodes();)this._el.removeChild(this._el.lastChild)},t}(),p="svg"===document.documentElement.tagName.toLowerCase()?c:"undefined"!=typeof CanvasRenderingContext2D?function(){function t(){this._elImage.src=this._elCanvas.toDataURL("image/png"),this._elImage.style.display="block",this._elCanvas.style.display="none"}function e(t,e){var r=this;if(r._fFail=e,r._fSuccess=t,null===r._bSupportDataURI){var o=document.createElement("img"),i=function(){r._bSupportDataURI=!1,r._fFail&&_fFail.call(r)};return o.onabort=i,o.onerror=i,o.onload=function(){r._bSupportDataURI=!0,r._fSuccess&&r._fSuccess.call(r)},void(o.src="data:image/gif;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg==")}!0===r._bSupportDataURI&&r._fSuccess?r._fSuccess.call(r):!1===r._bSupportDataURI&&r._fFail&&r._fFail.call(r)}if(this._android&&this._android<=2.1){var r=1/window.devicePixelRatio,o=CanvasRenderingContext2D.prototype.drawImage;CanvasRenderingContext2D.prototype.drawImage=function(t,e,i,n,a,s,h,l){if("nodeName"in t&&/img/i.test(t.nodeName))for(var u=arguments.length-1;u>=1;u--)arguments[u]=arguments[u]*r;else void 0===l&&(arguments[1]*=r,arguments[2]*=r,arguments[3]*=r,arguments[4]*=r);o.apply(this,arguments)}}var i=function(t,e){this._bIsPainted=!1,this._android=n(),this._htOption=e,this._elCanvas=document.createElement("canvas"),this._elCanvas.width=e.width,this._elCanvas.height=e.height,t.appendChild(this._elCanvas),this._el=t,this._oContext=this._elCanvas.getContext("2d"),this._bIsPainted=!1,this._elImage=document.createElement("img"),this._elImage.style.width="100%",this._elImage.style.display="none",this._el.appendChild(this._elImage),this._bSupportDataURI=null};return i.prototype.draw=function(t){var e=this._elImage,r=this._oContext,o=this._htOption,i=t.getModuleCount(),n=o.width/i,a=o.height/i,s=Math.round(n),h=Math.round(a);e.style.display="none",this.clear();for(var l=0;i>l;l++)for(var u=0;i>u;u++){var g=t.isDark(l,u),f=u*n,d=l*a;r.strokeStyle=g?o.colorDark:o.colorLight,r.lineWidth=1,r.fillStyle=g?o.colorDark:o.colorLight,r.fillRect(f,d,n,a),r.strokeRect(Math.floor(f)+.5,Math.floor(d)+.5,s,h),r.strokeRect(Math.ceil(f)-.5,Math.ceil(d)-.5,s,h)}this._bIsPainted=!0},i.prototype.makeImage=function(){this._bIsPainted&&e.call(this,t)},i.prototype.isPainted=function(){return this._bIsPainted},i.prototype.clear=function(){this._oContext.clearRect(0,0,this._elCanvas.width,this._elCanvas.height),this._bIsPainted=!1},i.prototype.round=function(t){return t?Math.floor(1e3*t)/1e3:t},i}():function(){var t=function(t,e){this._el=t,this._htOption=e};return t.prototype.draw=function(t){for(var e=this._htOption,r=this._el,o=t.getModuleCount(),i=Math.floor(e.width/o),n=Math.floor(e.height/o),a=['<table style="border:0;border-collapse:collapse;">'],s=0;o>s;s++){a.push("<tr>");for(var h=0;o>h;h++)a.push('<td style="border:0;border-collapse:collapse;padding:0;margin:0;width:'+i+"px;height:"+n+"px;background-color:"+(t.isDark(s,h)?e.colorDark:e.colorLight)+';"></td>');a.push("</tr>")}a.push("</table>"),r.innerHTML=a.join("");var l=r.childNodes[0],u=(e.width-l.offsetWidth)/2,g=(e.height-l.offsetHeight)/2;u>0&&g>0&&(l.style.margin=g+"px "+u+"px")},t.prototype.clear=function(){this._el.innerHTML=""},t}();QRCode=function(t,e){if(this._htOption={width:256,height:256,typeNumber:4,colorDark:"#000000",colorLight:"white",correctLevel:h.H},"string"==typeof e&&(e={text:e}),e)for(var r in e)this._htOption[r]=e[r];"string"==typeof t&&(t=document.getElementById(t)),this._android=n(),this._el=t,this._oQRCode=null,this._oDrawing=new p(this._el,this._htOption),this._htOption.text&&this.makeCode(this._htOption.text)},QRCode.prototype.makeCode=function(t){this._oQRCode=new e(a(t,this._htOption.correctLevel),this._htOption.correctLevel),this._oQRCode.addData(t),this._oQRCode.make(),this._el.title=t,this._oDrawing.draw(this._oQRCode),this.makeImage()},QRCode.prototype.makeImage=function(){"function"==typeof this._oDrawing.makeImage&&(!this._android||this._android>=3)&&this._oDrawing.makeImage()},QRCode.prototype.clear=function(){this._oDrawing.clear()},QRCode.CorrectLevel=h}()]]></script>
        <script><![CDATA[function swapElements(elm1, elm2) { let prev1 = elm1.previousSibling, prev2 = elm2.previousSibling; prev1.after(elm2); prev2.after(elm1) }]]></script>
      </head>
      <body>
        <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'BODY_BAS']">
          <xsl:call-template name="htmlBilgi"/>
        </xsl:for-each>
        <xsl:for-each select="$xroot">
          <div class="paper">
            <div class="ust-bilgi ustalt-bilgi">
              <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'UST_BILGI']">
                <xsl:call-template name="htmlBilgi"/>
              </xsl:for-each>
            </div>
            <div class="top">
              <table class="parent" border="0" cellpadding="0" cellspacing="0">
                <tbody>
                  <tr>
                    <td class="left" align="left" valign="top">
                      <div class="party sender">
                        <xsl:choose>
                          <xsl:when test="$eIrsaliyemi">
                            <xsl:for-each select="cac:DespatchSupplierParty">
                              <xsl:call-template name="party">
                                <xsl:with-param name="isSender" select="'true'"/>
                              </xsl:call-template>
                            </xsl:for-each>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:for-each select="cac:AccountingSupplierParty">
                              <xsl:call-template name="party">
                                <xsl:with-param name="isSender" select="'true'"/>
                              </xsl:call-template>
                            </xsl:for-each>
                          </xsl:otherwise>
                        </xsl:choose>
                      </div>
                      <xsl:if test="$aliciSagdami != 'true'">
                        <div class="party customer">
                          <xsl:choose>
                            <xsl:when test="$eIrsaliyemi">
                              <xsl:for-each select="cac:DeliveryCustomerParty">
                                <xsl:call-template name="party">
                                  <xsl:with-param name="isSender" select="'false'"/>
                                </xsl:call-template>
                              </xsl:for-each>
                            </xsl:when>
                            <xsl:when test="$eIhracatmi">
                              <xsl:for-each select="cac:BuyerCustomerParty">
                                <xsl:call-template name="party">
                                  <xsl:with-param name="isSender" select="'false'"/>
                                </xsl:call-template>
                              </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:for-each select="cac:AccountingCustomerParty">
                                <xsl:call-template name="party">
                                  <xsl:with-param name="isSender" select="'false'"/>
                                </xsl:call-template>
                              </xsl:for-each>
                            </xsl:otherwise>
                          </xsl:choose>
                        </div>
                      </xsl:if>
                      <xsl:if test="$aliciSagdami = 'true'">
                        <xsl:call-template name="invoiceInfoTable"/>
                      </xsl:if>
                    </td>
                    <td class="center" align="center" valign="top">
                      <xsl:if test="$firmaLogoUsttemi = 'true'">
                        <xsl:call-template name="firmaLogo"/>
                      </xsl:if>
                      <xsl:call-template name="gibLogoVeBelgeTipi"/>
                      <xsl:if test="$firmaLogoUsttemi != 'true'">
                        <xsl:call-template name="firmaLogo"/>
                      </xsl:if>
                      <xsl:call-template name="islakImza"/>
                    </td>
                    <td class="right" align="right" valign="top">
                      <xsl:if test="$aliciSagdami = 'true'">
                        <div align="right" class="party customer">
                          <xsl:choose>
                            <xsl:when test="$eIrsaliyemi">
                              <xsl:for-each select="cac:DeliveryCustomerParty">
                                <xsl:call-template name="party">
                                  <xsl:with-param name="isSender" select="false()"/>
                                </xsl:call-template>
                              </xsl:for-each>
                            </xsl:when>
                            <xsl:when test="$eIhracatmi">
                              <xsl:for-each select="cac:BuyerCustomerParty">
                                <xsl:call-template name="party">
                                  <xsl:with-param name="isSender" select="false()"/>
                                </xsl:call-template>
                              </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:for-each select="cac:AccountingCustomerParty">
                                <xsl:call-template name="party">
                                  <xsl:with-param name="isSender" select="false()"/>
                                </xsl:call-template>
                              </xsl:for-each>
                            </xsl:otherwise>
                          </xsl:choose>
                        </div>
                      </xsl:if>
                      <xsl:call-template name="qrCode"/>
                      <xsl:if test="$aliciSagdami != 'true'">
                        <xsl:call-template name="invoiceInfoTable"/>
                      </xsl:if>
                    </td>
                  </tr>
                </tbody>
              </table>
              <div class="uuidBilgi-parent parent">
                <xsl:call-template name="uuidBilgi"/>
              </div>
            </div>
            <div class="center">
              <xsl:call-template name="invoiceTable"/>
              <table class="invoiceTableTotal-parent">
                <tbody>
                  <tr>
                    <td valign="top" class="notes-parent parent">
                      <xsl:call-template name="notes"/>
                    </td>
                    <td valign="top" align="right" class="invoiceTableTotal-parent parent">
                      <xsl:call-template name="invoiceTableTotal"/>
                    </td>
                  </tr>
                </tbody>
              </table>
              <xsl:if test="not($xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'BANKA_HTML_BILGI'])">
                <xsl:call-template name="bankaTable"/>
              </xsl:if>
              <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'BANKA_HTML_BILGI']">
                <div class="banka-htmlBilgi">
                  <xsl:call-template name="htmlBilgi"/>
                </div>
              </xsl:for-each>
            </div>
            <div class="bottom">
              <xsl:call-template name="sevkAdres"/>
              <xsl:choose>
                <xsl:when test="$eIrsaliyemi">
                  <xsl:call-template name="irsaliyeIcinEkFooter"/>
                </xsl:when>
                <xsl:when test="$eMustahsilmi">
                  <xsl:call-template name="mustahsilIcinEkFooter"/>
                </xsl:when>
              </xsl:choose>
              <xsl:call-template name="vioBilgiFooter"/>
            </div>
            <div class="alt-bilgi ustalt-bilgi">
              <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'ALT_BILGI']">
                <xsl:call-template name="htmlBilgi"/>
              </xsl:for-each>
            </div>
            <xsl:call-template name="qrCode_alt"/>
          </div>
        </xsl:for-each>
        <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'BODY_SON']">
          <xsl:call-template name="htmlBilgi"/>
        </xsl:for-each>
        <!--<script>
            let e1 = document.getElementsByClassName('invoiceInfoTable')[0], e2 = document.getElementsByClassName('islakImza')[0];
            swapElements(e1, e2)
        </script>-->
      </body>
    </html>
  </xsl:template>
  <xsl:template name="html-escape">
    <xsl:param name="text"/>

    <!-- [lt] veya [gt] olup olmadığını kontrol et -->
    <xsl:variable name="hasLt" select="contains($text, '[lt]')" />
    <xsl:variable name="hasGt" select="contains($text, '[gt]')" />
    <xsl:variable name="hasMore" select="$hasLt or $hasGt" />

    <!-- Eğer [lt] varsa, ilkini değiştir -->
    <xsl:variable name="step1">
      <xsl:choose>
        <xsl:when test="$hasLt">
          <xsl:value-of select="concat(substring-before($text, '[lt]'), '&lt;', substring-after($text, '[lt]'))" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$text"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <!-- Eğer [gt] varsa, ilkini değiştir -->
    <xsl:variable name="step2">
      <xsl:choose>
        <xsl:when test="$hasGt">
          <xsl:value-of select="concat(substring-before($step1, '[gt]'), '&gt;', substring-after($step1, '[gt]'))" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$step1"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <!-- Eğer hala [lt] veya [gt] varsa, recursive olarak tekrar çağır -->
    <xsl:choose>
      <xsl:when test="$hasMore">
        <xsl:call-template name="html-escape">
          <xsl:with-param name="text" select="$step2"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$step2" disable-output-escaping="yes"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="date">
    <xsl:value-of select="substring(.,9,2)"/>.<xsl:value-of select="substring(.,6,2)"/>.<xsl:value-of select="substring(.,1,4)"/>
  </xsl:template>
  <xsl:template name="currency">
    <xsl:text> </xsl:text>
    <xsl:choose>
      <xsl:when test="./@currencyID">
        <xsl:choose>
          <xsl:when test="./@currencyID = 'TRY' or ./@currencyID = 'TRL'">
            <xsl:text>TL</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="./@currencyID" />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$dvKod and $dvKod != ''">
        <xsl:value-of select="$dvKod"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>TL</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="ulsBrm">
    <xsl:if test="@unitCode">
      <xsl:text> </xsl:text>
      <xsl:choose>
        <xsl:when test="@unitCode = 'KGM'">
          <span>
            <xsl:text> Kilo</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'NIU'">
          <span>
            <xsl:text> Adet</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'MTR'">
          <span>
            <xsl:text> Metre</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'LTR'">
          <span>
            <xsl:text> Litre</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'PK'">
          <span>
            <xsl:text> Paket</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'NPL'">
          <span>
            <xsl:text> Paket</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'BX'">
          <span>
            <xsl:text> Kutu</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'ROLL'">
          <span>
            <xsl:text> Rulo</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'CMT'">
          <span>
            <xsl:text> Santim</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'MMT'">
          <span>
            <xsl:text> Milimetre</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'MTK'">
          <span>
            <xsl:text> Metrekare</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'MTQ'">
          <span>
            <xsl:text> Metreküp</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'GRM'">
          <span>
            <xsl:text> Gram</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'PF'">
          <span>
            <xsl:text> Palet</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'SET'">
          <span>
            <xsl:text> Set</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'BG'">
          <span>
            <xsl:text> Torba</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'NT'">
          <span>
            <xsl:text> Ton</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'PGL'">
          <span>
            <xsl:text> Galon</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode  = 'PR'">
          <span>
            <xsl:text> Çift</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'WW'">
          <span>
            <xsl:text> Mililitre</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = '4H'">
          <span>
            <xsl:text> Mikrometre</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'WTT'">
          <span>
            <xsl:text> Watt</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = '2I'">
          <span>
            <xsl:text> BTU</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'ANN'">
          <span>
            <xsl:text> Yıl</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'MON'">
          <span>
            <xsl:text> Ay</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'DAY'">
          <span>
            <xsl:text> Gün</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'HUR'">
          <span>
            <xsl:text> Saat</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'D61'">
          <span>
            <xsl:text> Dakika</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'D62'">
          <span>
            <xsl:text> Saniye</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'C26'">
          <span>
            <xsl:text> Milisaniye</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'KJO'">
          <span>
            <xsl:text> kJ</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'MGM'">
          <span>
            <xsl:text> MG</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'GT'">
          <span>
            <xsl:text> GT</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'KTM'">
          <span>
            <xsl:text> KM</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'MLT'">
          <span>
            <xsl:text> ML</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'MMQ'">
          <span>
            <xsl:text> MM3</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'CLT'">
          <span>
            <xsl:text> CL</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'CMK'">
          <span>
            <xsl:text> CM2</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'CMQ'">
          <span>
            <xsl:text> CM3</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'KWH'">
          <span>
            <xsl:text> KWH</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'ND'">
          <span>
            <xsl:text> Fıçı</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'TN'">
          <span>
            <xsl:text> Teneke</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'DR'">
          <span>
            <xsl:text> Bidon</xsl:text>
          </span>
        </xsl:when>
        <xsl:when test="@unitCode = 'RO'">
          <span>
            <xsl:text> Rulo</xsl:text>
          </span>
        </xsl:when>
      </xsl:choose>
    </xsl:if>
  </xsl:template>
  <xsl:template name="invoiceInfoTable">
    <table class="invoiceInfoTable">
      <tbody>
        <tr class="ozellestirmeNo">
          <td class="etiket">Özelleştirme No:</td>
          <td class="veri">
            <xsl:value-of select="$xroot/cbc:CustomizationID"/>
          </td>
        </tr>
        <tr class="senaryo">
          <td class="etiket">Senaryo:</td>
          <td class="veri">
            <xsl:value-of select="$xroot/cbc:ProfileID"/>
          </td>
        </tr>
        <tr class="belgeTipi">
          <td class="etiket">
            <xsl:value-of select="$belgeEtiket"/> Tipi:
          </td>
          <td class="veri">
            <xsl:value-of select="$invoiceTypeCode"/>
          </td>
        </tr>
        <tr class="belgeNo">
          <td class="etiket">
            <xsl:value-of select="$belgeEtiket"/> No:
          </td>
          <td class="veri">
            <xsl:value-of select="$xroot/cbc:ID"/>
          </td>
        </tr>
        <tr class="belgeTarih">
          <td class="etiket">
            <xsl:value-of select="$belgeEtiket"/> Tarihi:
          </td>
          <td class="veri">
            <span class="tarih">
              <xsl:for-each select="$xroot/cbc:IssueDate">
                <xsl:call-template name="date"/>
              </xsl:for-each>
            </span>
          </td>
        </tr>
        <xsl:choose>
          <xsl:when test="$eIrsaliyemi">
            <xsl:for-each select="$xroot/cac:Shipment/cac:Delivery/cac:Despatch/cbc:ActualDespatchDate">
              <tr class="sevkTS">
                <td class="etiket">Sevk Tarih / Saat:</td>
                <td class="veri">
                  <span class="tarih">
                    <xsl:call-template name="date"/>
                  </span>
                  <xsl:for-each select="parent::node()/cbc:ActualDespatchTime">
                    <span class="saat">
                      <xsl:text> </xsl:text>
                      <xsl:value-of select="."/>
                    </span>
                  </xsl:for-each>
                </td>
              </tr>
            </xsl:for-each>
          </xsl:when>
          <xsl:when test="($efami) and ($xroot/cbc:IssueTime and not($xroot/cac:DespatchDocumentReference))">
            <tr class="sevkTS">
              <td class="etiket">Düzenlenme Saati:</td>
              <td class="veri">
                <!--<xsl:choose>
                  <xsl:when test="$xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'SEVK_TARIH']">
                    <xsl:for-each select="$xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'SEVK_TARIH']/cbc:IssueDate">
                      <span class="tarih">
                        <xsl:call-template name="date"/>
                      </span>
                    </xsl:for-each>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:for-each select="$xroot/cbc:IssueDate">
                      <span class="tarih">
                        <xsl:call-template name="date"/>
                      </span>
                    </xsl:for-each>
                  </xsl:otherwise>
                </xsl:choose>-->
                <xsl:for-each select="$xroot/cbc:IssueTime">
                  <span class="saat">
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="."/>
                  </span>
                </xsl:for-each>
              </td>
            </tr>
          </xsl:when>
        </xsl:choose>
        <xsl:for-each select="$xroot/cac:OrderReference">
          <xsl:choose>
            <xsl:when test="$sipRefGosterimKurali = 'UA'">
              <tr class="siparis-tarihVeNox-ortak siparis-tarih">
                <td class="etiket">Sipariş Tarih:</td>
                <td class="veri">
                  <xsl:for-each select="cbc:IssueDate">
                    <span class="tarih">
                      <xsl:call-template name="date"/>
                    </span>
                  </xsl:for-each>
                </td>
              </tr>
              <tr class="siparis-tarihVeNox-ortak siparis-tarih">
                <td class="etiket">Sipariş No:</td>
                <td class="veri">
                  <xsl:for-each select="cbc:IssueDate">
                    <span class="nox">
                      <xsl:value-of select="cbc:ID"/>
                    </span>
                  </xsl:for-each>
                </td>
              </tr>
            </xsl:when>
            <xsl:otherwise>
              <tr class="siparis-tarihVeNox-ortak siparis-tarihVeNox">
                <td class="etiket">
                  <xsl:choose>
                    <xsl:when test="$sipRefGosterimKurali = 'SN'">
                      <xsl:text>Sipariş No:</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:text>Sipariş Tarih/No:</xsl:text>
                    </xsl:otherwise>
                  </xsl:choose>
                </td>
                <td class="veri">
                  <xsl:if test="not($sipRefGosterimKurali = 'SN')">
                    <xsl:for-each select="cbc:IssueDate">
                      <span class="tarih">
                        <xsl:call-template name="date"/>
                      </span>
                      <span class="separator">: </span>
                    </xsl:for-each>
                  </xsl:if>
                  <span class="nox">
                    <xsl:value-of select="cbc:ID"/>
                  </span>
                </td>
              </tr>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
        <xsl:for-each select="$xroot/cac:DespatchDocumentReference">
          <tr class="irsaliye-tarihVeNox">
            <td class="etiket">İrsaliye Tarih/No:</td>
            <td class="veri">
              <xsl:for-each select="cbc:IssueDate">
                <span class="tarih">
                  <xsl:call-template name="date"/>
                </span>
                <span class="separator">: </span>
              </xsl:for-each>
              <span class="nox">
                <xsl:value-of select="cbc:ID"/>
              </span>
            </td>
          </tr>
        </xsl:for-each>
        <xsl:for-each select="$xroot/cac:ReceiptDocumentReference">
          <tr class="malKabulNo">
            <td class="etiket">Mal Kabul No:</td>
            <td class="veri">
              <xsl:value-of select="cbc:ID"/>
            </td>
          </tr>
        </xsl:for-each>
        <xsl:choose>
          <xsl:when test="$efami">
            <xsl:for-each select="$xroot/cac:AccountingCustomerParty">
              <xsl:call-template name="baslik-sube"/>
            </xsl:for-each>
          </xsl:when>
          <xsl:when test="$eIrsaliyemi">
            <xsl:for-each select="$xroot/cac:DeliveryCustomerParty">
              <xsl:call-template name="baslik-sube"/>
            </xsl:for-each>
          </xsl:when>
        </xsl:choose>
        <xsl:for-each select="$xroot/cac:AdditionalDocumentReference">
          <xsl:if test="cbc:DocumentType = 'PLASIYER'">
            <tr>
              <td class="etiket">Plasiyer:</td>
              <td class="veri">
                <xsl:value-of select="cbc:ID"/>
              </td>
            </tr>
          </xsl:if>
          <xsl:if test="cbc:DocumentType = 'ORTVADE'">
            <tr>
              <td class="etiket">Ortalama Vade:</td>
              <td class="veri">
                <xsl:value-of select="cbc:ID"/>
              </td>
            </tr>
          </xsl:if>
          <xsl:if test="cbc:DocumentType = 'TAHSILSEKLI'">
            <tr>
              <td class="etiket">Tahsil Şekli:</td>
              <td class="veri">
                <xsl:value-of select="cbc:ID"/>
              </td>
            </tr>
          </xsl:if>
          <xsl:if test="cbc:DocumentType = 'NAKLIYESEKLI'">
            <tr>
              <td class="etiket">Nakliye Şekli:</td>
              <td class="veri">
                <xsl:value-of select="cbc:ID"/>
              </td>
            </tr>
          </xsl:if>
        </xsl:for-each>
        <xsl:choose>
          <xsl:when test="$efami">
            <xsl:for-each select="$xroot/cac:AccountingCustomerParty">
              <xsl:call-template name="baslik-sevkAdres"/>
            </xsl:for-each>
          </xsl:when>
          <xsl:when test="$eIrsaliyemi">
            <xsl:for-each select="$xroot/cac:DeliveryCustomerParty">
              <xsl:call-template name="baslik-sevkAdres"/>
            </xsl:for-each>
          </xsl:when>
        </xsl:choose>
        <xsl:for-each select="$xroot/cac:AdditionalDocumentReference">
          <xsl:if test="cbc:DocumentType = 'BAYINO'">
            <tr>
              <td class="etiket">Bayi No:</td>
              <td class="veri">
                <xsl:value-of select="cbc:ID"/>
              </td>
            </tr>
          </xsl:if>
          <xsl:if test="cbc:DocumentType = 'FATURAKODLIST'">
            <tr>
              <td class="etiket">Fatura Kodu:</td>
              <td class="veri">
                <xsl:value-of select="cbc:ID"/>
              </td>
            </tr>
          </xsl:if>
          <xsl:if test="cbc:DocumentType = 'KUNYENO'">
            <tr>
              <td class="etiket">Künye:</td>
              <td class="veri">
                <xsl:value-of select="cbc:ID"/>
              </td>
            </tr>
          </xsl:if>
          <xsl:if test="cbc:DocumentType = 'BORSATESCIL'">
            <tr>
              <td class="etiket">Borsa Tescil:</td>
              <td class="veri">
                <xsl:value-of select="cbc:ID"/>
              </td>
            </tr>
          </xsl:if>
          <xsl:if test="cbc:DocumentType = 'BASLIK_EKSAHA'">
            <!--
              strEkleyiciExt := [ :attr :ekBilgi :ekKod |
                attr      cbc:DocumentTypeCode
                ekBilgi   cbc:ID
                ekKod     cbc:DocumentType
             ].
             - strEkleyiciExt callWith: 'Süt Onay' with: sutOnay with: 'BASLIK_EKSAHA' -
            -->
            <tr>
              <td class="etiket">
                <xsl:value-of select="cbc:DocumentTypeCode"/>
              </td>
              <td class="veri">
                <xsl:value-of select="cbc:ID"/>
              </td>
            </tr>
          </xsl:if>
        </xsl:for-each>
        <xsl:for-each select="$xroot/cac:PricingExchangeRate">
          <tr class="dvKur">
            <td class="etiket">
              <span class="ek-bilgi">Döviz Kuru (</span>
              <span class="dvKod source">
                <xsl:value-of select="cbc:SourceCurrencyCode"/>
              </span>
              <span class="ek-bilgi">/</span>
              <span class="dvKod target">
                <xsl:value-of select="cbc:TargetCurrencyCode"/>
              </span>
              <span class="ek-bilgi">):</span>
            </td>
            <td class="veri">
              <xsl:value-of select="$dvKur"/>
            </td>
          </tr>
        </xsl:for-each>
        <xsl:if test="$efami and $xroot/cbc:InvoiceTypeCode = 'SGK'">
          <xsl:for-each select="$xroot/cbc:AccountingCost">
            <tr class="sgk">
              <td class="etiket">Sağlık Fatura Tipi:</td>
              <td class="veri">
                <xsl:value-of select="."/>
              </td>
            </tr>
          </xsl:for-each>
          <xsl:if test="$xroot/cac:AdditionalDocumentReference [cbc:DocumentTypeCode = 'MUKELLEF_KODU'] or $xroot/cac:AdditionalDocumentReference [cbc:DocumentTypeCode = 'MUKELLEF_ADI']">
            <tr class="sgk mukellef">
              <td class="etiket">Mükellef Kodu ve Adı:</td>
              <td class="veri">
                <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentTypeCode = 'MUKELLEF_KODU']">
                  <span class="kod">
                    <xsl:text>(</xsl:text>
                    <xsl:value-of select="cbc:DocumentType"/>
                    <xsl:text>) </xsl:text>
                  </span>
                </xsl:for-each>
                <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentTypeCode = 'MUKELLEF_ADI']">
                  <span class="aciklama">
                    <xsl:value-of select="cbc:DocumentType"/>
                  </span>
                </xsl:for-each>
              </td>
            </tr>
          </xsl:if>
          <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentTypeCode = 'DOSYA_NO']">
            <tr class="sgk">
              <td class="etiket">Dosya No:</td>
              <td class="veri">
                <xsl:value-of select="cbc:DocumentType"/>
              </td>
            </tr>
          </xsl:for-each>
          <xsl:for-each select="$xroot/cac:InvoicePeriod">
            <tr class="sgk">
              <td class="etiket">Dönem:</td>
              <td class="veri">
                <xsl:for-each select="cbc:StartDate">
                  <xsl:call-template name="date"/>
                </xsl:for-each>
                <xsl:text> - </xsl:text>
                <xsl:for-each select="cbc:EndDate">
                  <xsl:call-template name="date"/>
                </xsl:for-each>
              </td>
            </tr>
          </xsl:for-each>
        </xsl:if>
      </tbody>
    </table>
  </xsl:template>
  <xsl:template name="invoiceTable">
    <table class="invoiceTableDetail">
      <thead>
        <xsl:call-template name="invoiceTable-baslik">
          <xsl:with-param name="satir2mi" select="false()"/>
        </xsl:call-template>
      </thead>
      <xsl:choose>
        <xsl:when test="$eIrsaliyemi">
          <xsl:for-each select="$xroot/cac:DespatchLine">
            <xsl:call-template name="invoiceTable-detay-satir"/>
          </xsl:for-each>
        </xsl:when>
        <xsl:when test="$eMustahsilmi">
          <xsl:for-each select="$xroot/cac:CreditNoteLine">
            <xsl:call-template name="invoiceTable-detay-satir"/>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
          <xsl:for-each select="$xroot/cac:InvoiceLine">
            <xsl:call-template name="invoiceTable-detay-satir"/>
          </xsl:for-each>
        </xsl:otherwise>
      </xsl:choose>
    </table>
  </xsl:template>
  <xsl:template name="invoiceTable-baslik">
    <xsl:param name="satir2mi" select="false()"/>
    <xsl:if test="not($satir2mi)">
      <tr class="baslik baslik1 satir1">
        <xsl:if test="$kodYerineSiraNomu != 'true'">
          <td colspan="1" class="numeric rowNumber">Sıra No</td>
        </xsl:if>
        <xsl:if test="$satirdaBarkodmu = 'true' and not($eIhracatmi)">
          <td class="text barkod">Barkod</td>
        </xsl:if>
        <xsl:if test="$satirdaStokKodmu = 'true' and not($eIhracatmi)">
          <td class="text shKod">Kod</td>
        </xsl:if>
        <td class="text shAdi">Mal-Hiz. Adı</td>
        <xsl:if test="$eIhracatmi">
          <xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'AUK']) and $xroot//cac:Item/cac:BuyersItemIdentification/cbc:ID">
            <td class="text aliciUrunKodu">Alıcı Ürün Kodu</td>
          </xsl:if>
          <xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'SUK']) and $xroot//cac:Item/cac:SellersItemIdentification/cbc:ID">
            <td class="text saticiUrunKodu">Satır Kodu</td>
          </xsl:if>
          <xsl:if test="not($ciftSatirmi)">
            <xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'GTP']) and $xroot//cac:Delivery/cac:Shipment/cac:GoodsItem/cbc:RequiredCustomsID">
              <td class="text gTip">GTIP</td>
            </xsl:if>
            <xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'TSR']) and $xroot//cac:Delivery/cac:DeliveryTerms/cbc:ID [@schemeID = 'INCOTERMS']">
              <td class="text teslimSarti">Teslim Şartı</td>
            </xsl:if>
            <xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'KC']) and $xroot//cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:PackagingTypeCode">
              <td class="text kapCinsi">Eşya Kap Cinsi</td>
            </xsl:if>
            <!--<xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'KN']) and $xroot//cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:PackagingTypeCode">
                <td class="text kapNo">Kap No</td>
              </xsl:if>-->
            <xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'KA']) and $xroot//cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:Quantity">
              <td class="text kapNo">Kap Adet</td>
            </xsl:if>
            <xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'TOY']) and $xroot//cac:Delivery/cac:DeliveryAddress">
              <td class="text teslim-bedelOdemeYeri">Teslim/Bedel Ödeme Yeri</td>
            </xsl:if>
            <xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'GS']) and $xroot//cac:Delivery/cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode">
              <td class="text gonderimSekli">Gönderilme Şekli</td>
            </xsl:if>
          </xsl:if>
        </xsl:if>
        <xsl:variable name="katDetay">
          <xsl:call-template name="getKeyValue">
            <xsl:with-param name="key" select="'KATDETAY'"/>
            <xsl:with-param name="inside" select="false()"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:if test="normalize-space($katDetay)">
          <td class="text katDetay">Kat. Detay</td>
        </xsl:if>
        <xsl:variable name="takipNo">
          <xsl:call-template name="getKeyValue">
            <xsl:with-param name="key" select="'TAKIPNO'"/>
            <xsl:with-param name="inside" select="false()"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="takipNo_etiket">
          <xsl:call-template name="getKeyValue">
            <xsl:with-param name="key" select="'TAKIPNO_ETIKET'"/>
            <xsl:with-param name="inside" select="false()"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:if test="normalize-space($takipNo)">
          <td class="text takipNo">
            <xsl:choose>
              <xsl:when test="$takipNo_etiket and normalize-space($takipNo_etiket) = ''">
                <xsl:text>Takip No</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$takipNo_etiket"/>
              </xsl:otherwise>
            </xsl:choose>
          </td>
          <xsl:text> </xsl:text>
        </xsl:if>
        <xsl:variable name="koliGorunum">
          <xsl:call-template name="getKeyValue">
            <xsl:with-param name="key" select="'KOLI_GORUNUM'"/>
            <xsl:with-param name="inside" select="false()"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:if test="normalize-space($koliGorunum)">
          <td class="text koli">KOLİ</td>
        </xsl:if>
        <td class="numeric miktar">Miktar</td>
        <xsl:variable name="miktar2Gorunum">
          <xsl:call-template name="getKeyValue">
            <xsl:with-param name="key" select="'MIKTAR2GORUNUM'"/>
            <xsl:with-param name="inside" select="false()"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:if test="$satirdaMiktar2mi = 'true' and normalize-space($miktar2Gorunum)">
          <td class="numeric miktar2">Miktar2</td>
        </xsl:if>
        <xsl:if test="$fiyatBedelGosterilirmi = 'true'">
          <xsl:if test="not ($dovizlimi) or $dovizGosterimKurali != ''">
            <td class="numeric fiyat">
              <xsl:if test="$dovizlimi">
                <xsl:text>Dv.</xsl:text>
              </xsl:if>
              <xsl:choose>
                <xsl:when test="$fiyatGosterimKurali = 'NT'"><xsl:text>Net Fiyat</xsl:text></xsl:when>
                <xsl:otherwise><xsl:text>Brm Fiyat</xsl:text></xsl:otherwise>
              </xsl:choose>
            </td>
          </xsl:if>
          <xsl:if test="$fiyatBedelGosterilirmi = 'true' and (not ($dovizlimi) or $dovizGosterimKurali != '')">
            <xsl:variable name="netFiyat">
              <xsl:call-template name="getKeyValue">
                <xsl:with-param name="key" select="'NET_FIYAT'"/>
                <xsl:with-param name="inside" select="false()"/>
              </xsl:call-template>
            </xsl:variable>
            <xsl:if test="$fiyatGosterimKurali = 'HP' and normalize-space($netFiyat)">
              <td class="text netFiyat">
                <xsl:text>Net Fiyat</xsl:text>
              </td>
              <xsl:text> </xsl:text>
            </xsl:if>
          </xsl:if>
          <xsl:if test="$fiyatBedelGosterilirmi = 'true' and $dovizlimi and ($dovizGosterimKurali = '' or $dovizGosterimKurali != 'D')">
            <td class="numeric tlFiyat">TL Fiyat</td>
          </xsl:if>
          <xsl:variable name="iskOranlarGorunum">
            <xsl:call-template name="getKeyValue">
              <xsl:with-param name="key" select="'ISKORANLARGORUNUM'"/>
              <xsl:with-param name="inside" select="false()"/>
            </xsl:call-template>
          </xsl:variable>
          <xsl:variable name="artOranlarGorunum">
            <xsl:call-template name="getKeyValue">
              <xsl:with-param name="key" select="'ARTORANLARGORUNUM'"/>
              <xsl:with-param name="inside" select="false()"/>
            </xsl:call-template>
          </xsl:variable>
          <xsl:variable name="iskTopBedelGorunum">
            <xsl:call-template name="getKeyValue">
              <xsl:with-param name="key" select="'ISKTOPBEDELGORUNUM'"/>
              <xsl:with-param name="inside" select="false()"/>
            </xsl:call-template>
          </xsl:variable>
          <xsl:if test="normalize-space($iskOranlarGorunum) or normalize-space($artOranlarGorunum) or ($satirdaIskBedelmi = 'true' and normalize-space($iskTopBedelGorunum))">
            <td class="numeric iskonto">İskonto</td>
          </xsl:if>
          <xsl:variable name="satirKdvOran">
            <xsl:call-template name="getKeyValue">
              <xsl:with-param name="key" select="'SATIR_KDV_ORAN'"/>
              <xsl:with-param name="inside" select="false()"/>
            </xsl:call-template>
          </xsl:variable>
          <xsl:variable name="satirKdvBedel">
            <xsl:call-template name="getKeyValue">
              <xsl:with-param name="key" select="'SATIR_KDV_BEDEL'"/>
              <xsl:with-param name="inside" select="false()"/>
            </xsl:call-template>
          </xsl:variable>
          <xsl:if test="$fiyatBedelGosterilirmi = 'true' and $satirdaKdvmi = 'true' and (not($eIrsaliyemi) or $fiyatBedelGosterilirmi = 'true') and not($eIhracatmi or $eMustahsilmi)">
            <td class="numeric kdvText">KDV</td>
          </xsl:if>
          <xsl:if test="$satirdaDigerVergilermi = 'true' and $xroot//cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme[cbc:TaxTypeCode != '0015']">
            <td class="numeric digerVergiler">Diğer Vergiler</td>
          </xsl:if>
          <xsl:if test="$fiyatBedelGosterilirmi = 'true' and not ($dovizlimi) or $dovizGosterimKurali != ''">
            <td class="numeric bedel">
              <xsl:if test="$dovizlimi">
                <xsl:text>Dv.</xsl:text>
              </xsl:if>
              <xsl:text>Bedel</xsl:text>
            </td>
          </xsl:if>
          <xsl:if test="$fiyatBedelGosterilirmi = 'true' and $dovizlimi and $dovizGosterimKurali != 'D'">
            <td class="numeric tlBedel">TL Bedel</td>
          </xsl:if>
        </xsl:if>
      </tr>
    </xsl:if>
    <xsl:if test="$eIhracatmi and $ciftSatirmi and $satir2mi">
      <tr class="baslik baslik2 satir2">
        <td class="separator" colspan="1"> </td>
        <xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'TSR']) and $xroot//cac:Delivery/cac:DeliveryTerms/cbc:ID [@schemeID = 'INCOTERMS']">
          <td class="text teslimSarti">Teslim Şartı</td>
        </xsl:if>
        <xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'KC']) and $xroot//cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:PackagingTypeCode">
          <td class="text kapCinsi">Eşya Kap Cinsi</td>
        </xsl:if>
        <!--<xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'KN']) and $xroot//cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:PackagingTypeCode">
            <td class="text kapNo">Kap No</td>
          </xsl:if>-->
        <xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'KA']) and $xroot//cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:Quantity">
          <td class="text kapNo">Kap Adet</td>
        </xsl:if>
        <xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'TOY']) and $xroot//cac:Delivery/cac:DeliveryAddress">
          <td class="text teslim-bedelOdemeYeri">Teslim/Bedel Ödeme Yeri</td>
        </xsl:if>
        <xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'GS']) and $xroot//cac:Delivery/cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode">
          <td class="text gonderimSekli">Gönderilme Şekli</td>
        </xsl:if>
        <xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'GTP']) and $xroot//cac:Delivery/cac:Shipment/cac:GoodsItem/cbc:RequiredCustomsID">
          <td class="text gTip">GTIP</td>
        </xsl:if>
      </tr>
    </xsl:if>
    <!--
      <xsl:if test="$xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'AUK']">
        MBKAYapi {'AUK'} {'Alıcı Ürün Kodu'}
        MBKAYapi {'SUK'} {'Satıcı Ürün Kodu'}
        MBKAYapi {'TSR'} {'Teslim Şartı'}
        MBKAYapi {'KC'} {'Kap Cinsi'}
        MBKAYapi {'KA'} {'Kap Adedi'}
        MBKAYapi {'TOY'} {'Teslim Bedel Ödeme Yeri'}
        MBKAYapi {'GS'} {'Gönderim Şekli'}
      </xsl:if>
    -->
  </xsl:template>
  <xsl:template name="invoiceTable-detay-satir">
    <xsl:param name="xtevNode" select="cac:WithholdingTaxTotal/cac:TaxSubtotal" />
    <!-- [cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode &gt;= 600 and cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode &lt;= 700] -->
    <tr class="detay satir1">
      <xsl:if test="$kodYerineSiraNomu != 'true'">
        <td colspan="1" class="numeric rowNumber">
          <xsl:value-of select="cbc:ID"/>
          <xsl:text> </xsl:text>
        </td>
      </xsl:if>
      <xsl:if test="$satirdaBarkodmu = 'true' and not($eIhracatmi)">
        <td class="text align-left barkod">
          <xsl:if test="not (normalize-space(cac:Item/cac:ManufacturersItemIdentification/cbc:ID) = normalize-space(cac:Item/cac:SellersItemIdentification/cbc:ID))">
            <xsl:value-of select="cac:Item/cac:ManufacturersItemIdentification/cbc:ID"/>
            <xsl:text> </xsl:text>
          </xsl:if>
        </td>
      </xsl:if>
      <xsl:if test="$satirdaStokKodmu = 'true' and not($eIhracatmi)">
        <td class="text align-left shKod">
          <xsl:choose>
            <xsl:when test="normalize-space(cac:Item/cac:SellersItemIdentification/cbc:ID)">
              <xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
            </xsl:when>
            <xsl:when test="normalize-space(cac:Item/cac:BuyersItemIdentification/cbc:ID)">
              <xsl:value-of select="cac:Item/cac:BuyersItemIdentification/cbc:ID"/>
            </xsl:when>
          </xsl:choose>
          <xsl:text> </xsl:text>
        </td>
      </xsl:if>
      <td class="text align-left shAdi">
        <xsl:value-of select="cac:Item/cbc:Name"/>
        <xsl:text> </xsl:text>
      </td>
      <xsl:if test="$eIhracatmi">
        <xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'AUK']) and $xroot//cac:Item/cac:BuyersItemIdentification/cbc:ID">
          <td class="text align-left aliciUrunKodu">
            <xsl:value-of select="cac:Item/cac:BuyersItemIdentification/cbc:ID"/>
            <xsl:text> </xsl:text>
          </td>
        </xsl:if>
        <xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'SUK']) and $xroot//cac:Item/cac:SellersItemIdentification/cbc:ID">
          <td class="text align-left saticiUrunKodu">
            <xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
            <xsl:text> </xsl:text>
          </td>
        </xsl:if>
        <xsl:if test="not($ciftSatirmi)">
          <xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'GTP']) and $xroot//cac:Delivery/cac:Shipment/cac:GoodsItem/cbc:RequiredCustomsID">
            <td class="text gTip">
              <xsl:value-of select="cac:Delivery/cac:Shipment/cac:GoodsItem/cbc:RequiredCustomsID"/>
              <xsl:text> </xsl:text>
            </td>
          </xsl:if>
          <xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'TSR']) and $xroot//cac:Delivery/cac:DeliveryTerms/cbc:ID [@schemeID = 'INCOTERMS']">
            <td class="text teslimSarti">
              <xsl:value-of select="cac:Delivery/cac:DeliveryTerms/cbc:ID [@schemeID = 'INCOTERMS']"/>
              <xsl:text> </xsl:text>
            </td>
          </xsl:if>
          <xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'KC']) and $xroot//cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:PackagingTypeCode">
            <td class="text kapCinsi">
              <xsl:value-of select="cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:PackagingTypeCode"/>
              <xsl:text> </xsl:text>
            </td>
          </xsl:if>
          <!--<xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'KN']) and $xroot//cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:PackagingTypeCode">
                <xsl:value-of select="cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:??"/>
                <xsl:text> </xsl:text>
            </xsl:if>-->
          <xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'KA']) and $xroot//cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:Quantity">
            <td class="text kapNo">
              <xsl:value-of select="format-number(cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:Quantity, $miktarFormatStr, $numLocale)"/>
              <xsl:text> </xsl:text>
            </td>
          </xsl:if>
          <xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'TOY']) and $xroot//cac:Delivery/cac:DeliveryAddress">
            <td class="text teslim-bedelOdemeYeri">
              <xsl:for-each select="cac:Delivery/cac:DeliveryAddress">
                <xsl:call-template name="adres"/>
              </xsl:for-each>
            </td>
          </xsl:if>
          <xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'GS']) and $xroot//cac:Delivery/cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode">
            <td class="text gonderimSekli">
              <xsl:for-each select="cac:Delivery/cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode">
                <xsl:call-template name="transportMode"/>
              </xsl:for-each>
            </td>
          </xsl:if>
        </xsl:if>
      </xsl:if>
      <xsl:variable name="katDetay">
        <xsl:call-template name="getKeyValue">
          <xsl:with-param name="key" select="'KATDETAY'"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:if test="normalize-space($katDetay)">
        <td class="text katDetay">
          <xsl:value-of select="$katDetay"/>
        </td>
        <xsl:text> </xsl:text>
      </xsl:if>
      <xsl:variable name="takipNo">
        <xsl:call-template name="getKeyValue">
          <xsl:with-param name="key" select="'TAKIPNO'"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:if test="normalize-space($takipNo)">
        <td class="text takipNo">
          <xsl:value-of select="$takipNo"/>
        </td>
        <xsl:text> </xsl:text>
      </xsl:if>
      <xsl:variable name="koliGorunum">
        <xsl:call-template name="getKeyValue">
          <xsl:with-param name="key" select="'KOLI_GORUNUM'"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:if test="normalize-space($koliGorunum)">
        <td class="text koliGorunum">
          <xsl:value-of select="$koliGorunum"/>
        </td>
      </xsl:if>
      <td class="numeric miktar">
        <xsl:choose>
          <xsl:when test="$eIrsaliyemi">
            <xsl:for-each select="cbc:DeliveredQuantity">
              <xsl:value-of select="format-number(., $miktarFormatStr, $numLocale)"/>
              <xsl:call-template name="ulsBrm"/>
            </xsl:for-each>
          </xsl:when>
          <xsl:when test="$eMustahsilmi">
            <xsl:for-each select="cbc:CreditedQuantity">
              <xsl:value-of select="format-number(., $miktarFormatStr, $numLocale)"/>
              <xsl:call-template name="ulsBrm"/>
            </xsl:for-each>
          </xsl:when>
          <xsl:otherwise>
            <xsl:for-each select="cbc:InvoicedQuantity">
              <xsl:value-of select="format-number(., $miktarFormatStr, $numLocale)"/>
              <xsl:call-template name="ulsBrm"/>
            </xsl:for-each>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:text> </xsl:text>
      </td>
      <xsl:variable name="miktar2Gorunum">
        <xsl:call-template name="getKeyValue">
          <xsl:with-param name="key" select="'MIKTAR2GORUNUM'"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:if test="$satirdaMiktar2mi = 'true' and $miktar2Gorunum">
        <td class="numeric miktar2Gorunum">
          <xsl:value-of select="$miktar2Gorunum"/>
        </td>
      </xsl:if>
      <xsl:if test="$fiyatBedelGosterilirmi = 'true'">
        <xsl:if test="not ($dovizlimi) or $dovizGosterimKurali != ''">
          <td class="numeric fiyat">
            <xsl:for-each select="cac:Price/cbc:PriceAmount">
              <xsl:value-of select="format-number(., $fiyatFormatStr, $numLocale)"/>
            </xsl:for-each>
            <xsl:for-each select="cac:Shipment/cac:GoodsItem/cac:InvoiceLine/cac:Price/cbc:PriceAmount">
              <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
              <!--<xsl:call-template name="currency"/>-->
            </xsl:for-each>
            <xsl:text> </xsl:text>
          </td>
        </xsl:if>
        <xsl:if test="$fiyatBedelGosterilirmi = 'true' and (not ($dovizlimi) or $dovizGosterimKurali != '')">
          <xsl:variable name="netFiyat">
            <xsl:call-template name="getKeyValue">
              <xsl:with-param name="key" select="'NET_FIYAT'"/>
            </xsl:call-template>
          </xsl:variable>
          <xsl:if test="$fiyatGosterimKurali = 'HP' and $netFiyat">
            <td class="numeric netFiyat">
              <xsl:value-of select="format-number(number($netFiyat), $fiyatFormatStr, $numLocale)"/>
            </td>
            <xsl:text> </xsl:text>
          </xsl:if>
        </xsl:if>
        <xsl:if test="$fiyatBedelGosterilirmi = 'true' and $dovizlimi and $dovizGosterimKurali != 'D'">
          <td class="numeric tlFiyat">
            <xsl:value-of select="format-number(cac:Price/cbc:PriceAmount * $dvKur, $fiyatFormatStr, $numLocale)"/>
            <!--<xsl:value-of select="format-number(cac:Shipment/cac:GoodsItem/cac:InvoiceLine/cac:Price/cbc:PriceAmount, $fiyatFormatStr, $numLocale)"/>-->
            <xsl:text> </xsl:text>
          </td>
          <xsl:text> </xsl:text>
        </xsl:if>
        <xsl:variable name="any_iskOranlarGorunum">
          <xsl:call-template name="getKeyValue">
            <xsl:with-param name="key" select="'ISKORANLARGORUNUM'"/>
            <xsl:with-param name="inside" select="false()"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="any_artOranlarGorunum">
          <xsl:call-template name="getKeyValue">
            <xsl:with-param name="key" select="'ARTORANLARGORUNUM'"/>
            <xsl:with-param name="inside" select="false()"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="any_iskTopBedelGorunum">
          <xsl:call-template name="getKeyValue">
            <xsl:with-param name="key" select="'ISKTOPBEDELGORUNUM'"/>
            <xsl:with-param name="inside" select="false()"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="iskOranlarGorunum">
          <xsl:call-template name="getKeyValue">
            <xsl:with-param name="key" select="'ISKORANLARGORUNUM'"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="artOranlarGorunum">
          <xsl:call-template name="getKeyValue">
            <xsl:with-param name="key" select="'ARTORANLARGORUNUM'"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="iskTopBedelGorunum">
          <xsl:call-template name="getKeyValue">
            <xsl:with-param name="key" select="'ISKTOPBEDELGORUNUM'"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:if test="normalize-space($any_iskOranlarGorunum) or normalize-space($any_artOranlarGorunum) or ($satirdaIskBedelmi = 'true' and normalize-space($any_iskTopBedelGorunum))">
          <td class="numeric iskonto">
            <div class="oran">
              <xsl:if test="normalize-space($iskOranlarGorunum)">
                <span class="iskOran sub-item">
                  <span class="veri">
                    <xsl:value-of select="$iskOranlarGorunum"/>
                  </span>
                </span>
              </xsl:if>
              <xsl:if test="normalize-space($artOranlarGorunum)">
                <span class="artOran sub-item">
                  <span class="veri">
                    <xsl:value-of select="$artOranlarGorunum"/>
                  </span>
                </span>
              </xsl:if>
            </div>
            <xsl:if test="$satirdaIskBedelmi = 'true' and normalize-space($iskTopBedelGorunum)">
              <div class="bedel item">
                <span class="iskBedel sub-item">
                  <span class="veri">
                    <xsl:value-of select="$iskTopBedelGorunum"/>
                    <xsl:call-template name="currency"/>
                  </span>
                </span>
              </div>
            </xsl:if>
            <xsl:text></xsl:text>
          </td>
        </xsl:if>
        <xsl:variable name="satirKdvOran">
          <xsl:call-template name="getKeyValue">
            <xsl:with-param name="key" select="'SATIR_KDV_ORAN'"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="satirKdvBedel">
          <xsl:call-template name="getKeyValue">
            <xsl:with-param name="key" select="'SATIR_KDV_BEDEL'"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:if test="$fiyatBedelGosterilirmi = 'true' and $satirdaKdvmi = 'true' and (not($eIrsaliyemi) or $fiyatBedelGosterilirmi = 'true') and not($eIhracatmi or $eMustahsilmi)">
          <td class="numeric kdvText">
            <xsl:choose>
              <xsl:when test="normalize-space($satirKdvOran) or normalize-space($satirKdvBedel)">
                <div class="asil item">
                  <xsl:if test="normalize-space($satirKdvOran)">
                    <span class="ek-bilgi">
                      <xsl:text>(</xsl:text>
                    </span>
                    <span class="kdvOrani">
                      <xsl:text>%</xsl:text>
                      <xsl:value-of select="format-number(number($satirKdvOran), '##0,####', $numLocale)"/>
                    </span>
                    <span class="ek-bilgi">
                      <xsl:text>) </xsl:text>
                    </span>
                  </xsl:if>
                  <xsl:if test="normalize-space($satirKdvBedel)">
                    <span class="kdv">
                      <xsl:value-of select="format-number(number($satirKdvBedel), $bedelFormatStr, $numLocale)"/>
                    </span>
                  </xsl:if>
                </div>
              </xsl:when>
              <xsl:otherwise>
                <xsl:for-each select="cac:TaxTotal/cac:TaxSubtotal [cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode = '0015']">
                  <div class="asil item">
                    <span class="ek-bilgi">
                      <xsl:text>(</xsl:text>
                    </span>
                    <span class="kdvOrani">
                      <xsl:text>%</xsl:text>
                      <xsl:for-each select="cbc:Percent">
                        <xsl:value-of select="format-number(., '##0,####', $numLocale)"/>
                      </xsl:for-each>
                    </span>
                    <span class="ek-bilgi">
                      <xsl:text>) </xsl:text>
                    </span>
                    <span class="kdv">
                      <xsl:for-each select="cbc:TaxAmount">
                        <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
                      </xsl:for-each>
                    </span>
                  </div>
                  <xsl:for-each select="cac:TaxCategory">
                    <xsl:if test="cbc:TaxExemptionReasonCode">
                      <div class="neden item">
                        <span class="kod ek-bilgi">
                          <xsl:text>İst.: </xsl:text>
                          <!--<xsl:text>(</xsl:text>
                          <xsl:value-of select="cbc:TaxExemptionReasonCode"/>
                          <xsl:text>) </xsl:text>-->
                        </span>
                        <span class="veri">
                          <xsl:value-of select="cbc:TaxExemptionReasonCode"/>
                          <!--<xsl:value-of select="cbc:TaxExemptionReason"/>-->
                        </span>
                      </div>
                    </xsl:if>
                  </xsl:for-each>
                </xsl:for-each>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="$xtevNode [cbc:TaxAmount != 0]">
              <div class="tevkifat item">
                <xsl:for-each select="$xtevNode [cbc:TaxAmount != 0]">
                  <span class="etiket">
                    <u class="ek-bilgi">Tev</u>
                    <xsl:text>: </xsl:text>
                    <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode"/>
                    <xsl:text> </xsl:text>
                    (%<xsl:value-of select="cbc:Percent"/>)
                    <!--<span class="item ek-bilgi">: </span>-->
                  </span>
                  <span class="veri">
                    <xsl:value-of select="cbc:TaxAmount"/>
                    <xsl:call-template name="currency"/>
                  </span>
                </xsl:for-each>
              </div>
            </xsl:if>
            <xsl:text> </xsl:text>
          </td>
        </xsl:if>
        <xsl:if test="$satirdaDigerVergilermi = 'true' and $xroot//cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme[cbc:TaxTypeCode != '0015']">
          <td class="numeric digerVergiler">
            <xsl:for-each select="cac:TaxTotal/cac:TaxSubtotal [cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode != '0015']">
              <b class="digerVergiAdi">
                <xsl:value-of select="substring(cac:TaxCategory/cac:TaxScheme/cbc:Name, 1, 3)"/>
                <xsl:text>: </xsl:text>
              </b>
              <span class="digerVergiOrani">
                <xsl:text>%</xsl:text>
                <xsl:for-each select="cbc:Percent">
                  <xsl:value-of select="format-number(., '##0,##', $numLocale)"/>
                </xsl:for-each>
              </span>
              <xsl:text> = </xsl:text>
              <span class="digerVergi">
                <xsl:for-each select="cbc:TaxAmount">
                  <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
                </xsl:for-each>
              </span>
              <!--<br/>
              muafiyet nedeni-->
            </xsl:for-each>
            <xsl:text> </xsl:text>
          </td>
        </xsl:if>
        <xsl:if test="$fiyatBedelGosterilirmi = 'true' and not ($dovizlimi) or $dovizGosterimKurali != ''">
          <td class="numeric bedel">
            <xsl:for-each select="cbc:LineExtensionAmount">
              <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
              <xsl:call-template name="currency"/>
            </xsl:for-each>
            <xsl:for-each select="cac:Shipment/cac:GoodsItem/cac:InvoiceLine/cbc:LineExtensionAmount">
              <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
              <xsl:call-template name="currency"/>
            </xsl:for-each>
            <xsl:text> </xsl:text>
          </td>
        </xsl:if>
        <xsl:if test="$fiyatBedelGosterilirmi = 'true' and $dovizlimi and $dovizGosterimKurali != 'D'">
          <td class="numeric tlBedel">
            <xsl:for-each select="cbc:LineExtensionAmount">
              <xsl:value-of select="format-number(. * $dvKur, $bedelFormatStr, $numLocale)"/>
              <xsl:text> TL</xsl:text>
            </xsl:for-each>
            <xsl:for-each select="cac:Shipment/cac:GoodsItem/cac:InvoiceLine/cbc:LineExtensionAmount">
              <xsl:value-of select="format-number(. * $dvKur, $bedelFormatStr, $numLocale)"/>
              <xsl:text> TL</xsl:text>
            </xsl:for-each>
          </td>
        </xsl:if>
      </xsl:if>
    </tr>
    <xsl:if test="$eIhracatmi and $ciftSatirmi">
      <tr class="detay detay2 satir2 full-width">
        <td colspan="1000">
          <table class="sub-table full-width">
            <thead>
              <xsl:call-template name="invoiceTable-baslik">
                <xsl:with-param name="satir2mi" select="true()"/>
              </xsl:call-template>
            </thead>
            <tbody>
              <tr class="detay detay2 satir2">
                <td class="separator" colspan="1"> </td>
                <xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'TSR']) and $xroot//cac:Delivery/cac:DeliveryTerms/cbc:ID [@schemeID = 'INCOTERMS']">
                  <td class="text teslimSarti">
                    <xsl:value-of select="cac:Delivery/cac:DeliveryTerms/cbc:ID [@schemeID = 'INCOTERMS']"/>
                    <xsl:text> </xsl:text>
                  </td>
                </xsl:if>
                <xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'KC']) and $xroot//cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:PackagingTypeCode">
                  <td class="text kapCinsi">
                    <xsl:value-of select="cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:PackagingTypeCode"/>
                    <xsl:text> </xsl:text>
                  </td>
                </xsl:if>
                <!--<xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'KN']) and $xroot//cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:PackagingTypeCode">
              <xsl:value-of select="cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:??"/>
              <xsl:text> </xsl:text>
          </xsl:if>-->
                <xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'KA']) and $xroot//cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:Quantity">
                  <td class="text kapNo">
                    <xsl:value-of select="format-number(cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:Quantity, $miktarFormatStr, $numLocale)"/>
                    <xsl:text> </xsl:text>
                  </td>
                </xsl:if>
                <xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'TOY']) and $xroot//cac:Delivery/cac:DeliveryAddress">
                  <td class="text teslim-bedelOdemeYeri">
                    <xsl:for-each select="cac:Delivery/cac:DeliveryAddress">
                      <xsl:for-each select="cbc:CitySubdivisionName">
                        <xsl:if test="not(normalize-space(.) = '' or normalize-space(.) = '.')">
                          <xsl:value-of select="." />
                          <xsl:text> / </xsl:text>
                        </xsl:if>
                      </xsl:for-each>
                      <xsl:for-each select="cbc:CityName">
                        <xsl:if test="not(normalize-space(.) = '' or normalize-space(.) = '.')">
                          <xsl:value-of select="." />
                        </xsl:if>
                      </xsl:for-each>
                      <xsl:for-each select="cbc:CountryName">
                        <xsl:if test="not(normalize-space(.) = '' or normalize-space(.) = '.')">
                          <xsl:text> / </xsl:text>
                          <xsl:value-of select="." />
                        </xsl:if>
                      </xsl:for-each>
                    </xsl:for-each>
                  </td>
                </xsl:if>
                <xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'GS']) and $xroot//cac:Delivery/cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode">
                  <td class="text gonderimSekli">
                    <xsl:for-each select="cac:Delivery/cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode">
                      <xsl:call-template name="transportMode"/>
                    </xsl:for-each>
                  </td>
                </xsl:if>
                <xsl:if test="not($xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KOLON_GIZLE' and cbc:DocumentTypeCode = 'GTP']) and $xroot//cac:Delivery/cac:Shipment/cac:GoodsItem/cbc:RequiredCustomsID">
                  <td class="text gTip">
                    <xsl:value-of select="cac:Delivery/cac:Shipment/cac:GoodsItem/cbc:RequiredCustomsID"/>
                    <xsl:text> </xsl:text>
                  </td>
                </xsl:if>
              </tr>
            </tbody>
          </table>
        </td>
      </tr>
    </xsl:if>
    <xsl:call-template name="detayAciklamalar"/>
  </xsl:template>
  <xsl:template name="bankaTable">
    <!--<xsl:if test="($efami) and $xroot/cac:PaymentMeans/cac:PayeeFinancialAccount [normalize-space(cbc:PaymentNote) != '']">-->
    <table class="banka">
      <xsl:if test="($efami) and $xroot/cac:PaymentMeans/cac:PayeeFinancialAccount [normalize-space(cbc:PaymentNote) != '']">
        <thead>
          <tr class="baslik">
            <td class="bankaAdi">Banka Adı</td>
            <xsl:if test="$xroot/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:Name and $xroot/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:Name != ''">
              <td class="sube">Şube</td>
            </xsl:if>
            <td class="iban">IBAN</td>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="$xroot/cac:PaymentMeans/cac:PayeeFinancialAccount [normalize-space(cbc:PaymentNote) != '']">
            <tr class="detay">
              <td class="bankaAdi">
                <xsl:value-of select="cbc:PaymentNote"/>
                <xsl:text> </xsl:text>
              </td>
              <xsl:if test="$xroot/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:Name and $xroot/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:Name != ''">
                <td class="sube">
                  <xsl:value-of select="cac:FinancialInstitutionBranch/cbc:Name"/>
                  <xsl:text> </xsl:text>
                </td>
              </xsl:if>
              <td class="iban">
                <xsl:for-each select="cbc:ID">
                  <xsl:call-template name="group-text">
                    <xsl:with-param name="text" select="normalize-space(.)"/>
                  </xsl:call-template>
                </xsl:for-each>
                <xsl:text> </xsl:text>
              </td>
            </tr>
          </xsl:for-each>
        </tbody>
      </xsl:if>
    </table>
    <!--</xsl:if>-->
  </xsl:template>
  <xsl:template name="invoiceTableTotal">
    <xsl:param name="xkdvNodes" select="cac:TaxTotal/cac:TaxSubtotal [cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode = '0015']" />
    <xsl:param name="xtevNodes" select="cac:WithholdingTaxTotal/cac:TaxSubtotal" />
    <!-- [cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode &gt;= 600 and cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode &lt;= 700] -->
    <xsl:variable name="topKdvBedel" select="sum($xkdvNodes/cbc:TaxAmount [. != 0])" />
    <xsl:variable name="topTevBedel" select="sum($xtevNodes/cbc:TaxAmount [. != 0])" />
    <table class="invoiceTableTotal">
      <xsl:choose>
        <xsl:when test="$xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'OZEL_DIP']">
          <tbody class="normal">
            <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'OZEL_DIP']">
              <tr class="item">
                <td class="etiket">
                  <xsl:value-of select="cbc:DocumentDescription" disable-output-escaping="yes"/>
                </td>
                <td class="veri">
                  <xsl:value-of select="format-number(cbc:ID, $bedelFormatStr, $numLocale)"/>
                  <xsl:call-template name="currency"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </xsl:when>
        <xsl:otherwise>
          <xsl:if test="not ($dovizlimi) or $dovizGosterimKurali = 'D'">
            <tbody class="normal">
              <xsl:for-each select="cac:LegalMonetaryTotal/cbc:LineExtensionAmount">
                <tr class="item">
                  <td class="etiket">Mal Hizmet Toplam Tutarı</td>
                  <td class="veri">
                    <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
                    <xsl:call-template name="currency"/>
                  </td>
                </tr>
              </xsl:for-each>
              <xsl:for-each select="cac:AdditionalDocumentReference [cbc:DocumentType = 'DIP_BRUT']/cbc:ID [. != 0]">
                <tr class="item">
                  <td class="etiket">Mal Hizmet Toplam Tutarı</td>
                  <td class="veri">
                    <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
                    <xsl:call-template name="currency"/>
                  </td>
                </tr>
              </xsl:for-each>
              <xsl:for-each select="cac:AllowanceCharge [cbc:Amount and cbc:Amount != 0]">
                <tr class="item">
                  <td class="etiket">
                    <xsl:choose>
                      <xsl:when test="cbc:ChargeIndicator = 'true'">
                        <xsl:text>Dip Arttırım</xsl:text>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>Dip İskonto</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="cbc:MultiplierFactorNumeric and cbc:MultiplierFactorNumeric != 0">
                      <xsl:text> (%</xsl:text>
                      <xsl:value-of select="format-number(cbc:MultiplierFactorNumeric * 100, '###.##0,00', $numLocale)"/>
                      <xsl:text>)</xsl:text>
                    </xsl:if>
                  </td>
                  <td class="veri">
                    <xsl:for-each select="cbc:Amount">
                      <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
                      <xsl:call-template name="currency"/>
                    </xsl:for-each>
                  </td>
                </tr>
              </xsl:for-each>
              <xsl:for-each select="cac:AdditionalDocumentReference [cbc:DocumentType = 'DIP_ISK']/cbc:ID [. != 0]">
                <tr class="item">
                  <td class="etiket">Dip İskonto</td>
                  <td class="veri">
                    <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
                    <xsl:call-template name="currency"/>
                  </td>
                </tr>
              </xsl:for-each>
              <xsl:for-each select="cac:AdditionalDocumentReference [cbc:DocumentType = 'DIP_ART']/cbc:ID [. != 0]">
                <tr class="item">
                  <td class="etiket">Dip Arttırım</td>
                  <td class="veri">
                    <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
                    <xsl:call-template name="currency"/>
                  </td>
                </tr>
              </xsl:for-each>
              <xsl:for-each select="cac:AdditionalDocumentReference [cbc:DocumentType = 'DIP_GEKAP']/cbc:ID [. != 0]">
                <tr class="item">
                  <td class="etiket">Gekap Yans. Bedeli</td>
                  <td class="veri">
                    <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
                    <xsl:call-template name="currency"/>
                  </td>
                </tr>
              </xsl:for-each>
              <xsl:for-each select="cac:TaxTotal/cac:TaxSubtotal [$kdvSifirGosterilirmi or cbc:TaxAmount != 0]">
                <xsl:if test="($iskontoVeyaNakliyeVarmi = 'true' or $cokluKDVmi) and cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode = '0015' and cbc:TaxAmount != 0">
                  <tr class="item">
                    <td class="etiket">
                      Hesaplanan <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:Name"/> (%<xsl:value-of select="cbc:Percent"/>) Matrah
                    </td>
                    <xsl:for-each select="cbc:TaxableAmount">
                      <td class="veri">
                        <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
                        <xsl:call-template name="currency"/>
                      </td>
                    </xsl:for-each>
                  </tr>
                </xsl:if>
                <tr class="item">
                  <td class="etiket">
                    Hesaplanan <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:Name"/> (%<xsl:value-of select="cbc:Percent"/>)
                    <!--<p>vergi tipi = <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode"/></p>-->
                    <xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode = '0015'">
                      <xsl:variable name="oran" select="number(cbc:Percent)"/>
                      <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentTypeCode = 'DIP_VERGIORAN_POSTFIX' and number(cbc:DocumentType) = $oran]">
                        <br/>
                        <span>
                          <xsl:value-of select="cbc:ID"/>
                        </span>
                      </xsl:for-each>
                    </xsl:if>
                  </td>
                  <xsl:for-each select="cbc:TaxAmount">
                    <td class="veri">
                      <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
                      <xsl:call-template name="currency"/>
                    </td>
                  </xsl:for-each>
                </tr>
              </xsl:for-each>
              <xsl:for-each select="cac:AdditionalDocumentReference [cbc:DocumentType = 'DIP_KDV_20']/cbc:ID [. != 0]">
                <xsl:call-template name="dipKdvSatirlariYaz">
                  <xsl:with-param name="oran" select="20"/>
                </xsl:call-template>
              </xsl:for-each>
              <xsl:for-each select="cac:AdditionalDocumentReference [cbc:DocumentType = 'DIP_KDV_18']/cbc:ID [. != 0]">
                <xsl:call-template name="dipKdvSatirlariYaz">
                  <xsl:with-param name="oran" select="18"/>
                </xsl:call-template>
              </xsl:for-each>
              <xsl:for-each select="cac:AdditionalDocumentReference [cbc:DocumentType = 'DIP_KDV_10']/cbc:ID [. != 0]">
                <xsl:call-template name="dipKdvSatirlariYaz">
                  <xsl:with-param name="oran" select="10"/>
                </xsl:call-template>
              </xsl:for-each>
              <xsl:for-each select="cac:AdditionalDocumentReference [cbc:DocumentType = 'DIP_KDV_8']/cbc:ID [. != 0]">
                <xsl:call-template name="dipKdvSatirlariYaz">
                  <xsl:with-param name="oran" select="8"/>
                </xsl:call-template>
              </xsl:for-each>
              <xsl:for-each select="cac:AdditionalDocumentReference [cbc:DocumentType = 'DIP_KDV_1']/cbc:ID [. != 0]">
                <xsl:call-template name="dipKdvSatirlariYaz">
                  <xsl:with-param name="oran" select="1"/>
                </xsl:call-template>
              </xsl:for-each>
              <xsl:if test="$xtevNodes [cbc:TaxAmount != 0]">
                <xsl:for-each select="$xtevNodes [cbc:TaxAmount != 0]">
                  <tr class="item">
                    <td class="etiket">
                      Hesaplanan KDV Tevkifat (%<xsl:value-of select="cbc:Percent"/>)
                    </td>
                    <td class="veri">
                      <xsl:value-of select="format-number(cbc:TaxAmount, $bedelFormatStr, $numLocale)"/>
                      <xsl:call-template name="currency"/>
                    </td>
                  </tr>
                </xsl:for-each>
                <tr class="item">
                  <td class="etiket">Beyan Edilen KDV</td>
                  <td class="veri">
                    <xsl:value-of select="format-number(number($topKdvBedel) - number($topTevBedel), $bedelFormatStr, $numLocale)"/>
                    <xsl:call-template name="currency"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:for-each select="cac:LegalMonetaryTotal">
                <xsl:for-each select="cbc:TaxInclusiveAmount">
                  <tr class="item">
                    <td class="etiket">Vergiler Dahil Toplam</td>
                    <td class="veri">
                      <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
                      <xsl:call-template name="currency"/>
                    </td>
                  </tr>
                </xsl:for-each>
                <xsl:for-each select="cbc:PayableAmount">
                  <tr class="item">
                    <td class="etiket">Ödenecek Tutar</td>
                    <td class="veri">
                      <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
                      <xsl:call-template name="currency"/>
                    </td>
                  </tr>
                </xsl:for-each>
              </xsl:for-each>
              <xsl:for-each select="cac:AdditionalDocumentReference [cbc:DocumentType = 'DIP_SONUC']/cbc:ID [. != 0]">
                <tr class="item">
                  <td class="etiket">Ödenecek Tutar</td>
                  <td class="veri">
                    <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
                    <xsl:call-template name="currency"/>
                  </td>
                </tr>
              </xsl:for-each>
            </tbody>
          </xsl:if>
          <xsl:if test="$dovizlimi">
            <tbody class="tlGosterim">
              <xsl:for-each select="$xroot/cac:AdditionalDocumentReference/cbc:ID [normalize-space(.) != '']">
                <xsl:choose>
                  <xsl:when test="parent::node()/cbc:DocumentType = 'DIP_TL_BRUTBEDEL'">
                    <tr class="item">
                      <td class="etiket">
                        Mal Hizmet Toplam Tutarı (<span class="ek-bilgi">TL</span>)
                      </td>
                      <td class="veri">
                        <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
                        <xsl:text> TL</xsl:text>
                      </td>
                    </tr>
                  </xsl:when>
                  <xsl:when test="parent::node()/cbc:DocumentType = 'DIP_TL_ISKBEDEL'">
                    <tr class="item">
                      <td class="etiket">
                        Dip İskonto (<span class="ek-bilgi">TL</span>)
                      </td>
                      <td class="veri">
                        <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
                        <xsl:text> TL</xsl:text>
                      </td>
                    </tr>
                  </xsl:when>
                  <xsl:when test="parent::node()/cbc:DocumentType = 'DIP_TL_ARTBEDEL'">
                    <tr class="item">
                      <td class="etiket">
                        Dip Arttırım (<span class="ek-bilgi">TL</span>)
                      </td>
                      <td class="veri">
                        <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
                        <xsl:text> TL</xsl:text>
                      </td>
                    </tr>
                  </xsl:when>
                  <xsl:when test="parent::node()/cbc:DocumentType = 'DIP_TL_NAKBEDEL'">
                    <tr class="item">
                      <td class="etiket">
                        Nakliye Bedeli (<span class="ek-bilgi">TL</span>)
                      </td>
                      <td class="veri">
                        <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
                        <xsl:text> TL</xsl:text>
                      </td>
                    </tr>
                  </xsl:when>
                  <xsl:when test="parent::node()/cbc:DocumentType = 'DIP_TL_GEKAP'">
                    <tr class="item">
                      <td class="etiket">
                        Gekap Yans. Bedeli (<span class="ek-bilgi">TL</span>)
                      </td>
                      <td class="veri">
                        <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
                        <xsl:call-template name="currency"/>
                      </td>
                    </tr>
                  </xsl:when>
                  <xsl:when test="parent::node()/cbc:DocumentType = 'DIP_TL_VERGI'">
                    <tr class="item">
                      <td class="etiket">
                        Hesaplanan <xsl:value-of select="parent::node()/cbc:DocumentTypeCode"/>
                        (<span class="ek-bilgi">TL</span>)
                      </td>
                      <td class="veri">
                        <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
                        <xsl:text> TL</xsl:text>
                      </td>
                    </tr>
                  </xsl:when>
                  <!--<xsl:when test="parent::node()/cbc:DocumentType = 'DIP_DVZ_VERGI'">
                  <tr class="item">
                    <td class="etiket">
                      <span class="asil">
                        Hesaplanan <xsl:value-of select="parent::node()/cbc:DocumentTypeCode"/>
                      </span>
                      <span class="diger">
                        (<span class="ek-bilgi">
                          <xsl:value-of select="parent::node()/cbc:DocumentDescription"/>
                        </span>)
                      </span>
                    </td>
                    <td class="veri">
                      <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
                      <xsl:value-of select="parent::node()/cbc:LocaleCode"/>
                    </td>
                  </tr>
                </xsl:when>-->
                  <xsl:when test="parent::node()/cbc:DocumentType = 'DIP_TL_TEVBEDEL'">
                    <tr class="item">
                      <td class="etiket">
                        Tevkifat Bedeli (<span class="ek-bilgi">TL</span>)
                      </td>
                      <td class="veri">
                        <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
                        <xsl:text> TL</xsl:text>
                      </td>
                    </tr>
                  </xsl:when>
                  <xsl:when test="parent::node()/cbc:DocumentType = 'DIP_TL_KLREYON'">
                    <tr class="item">
                      <td class="etiket">
                        Reyon Bedeli (<span class="ek-bilgi">TL</span>)
                      </td>
                      <td class="veri">
                        <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
                        <xsl:text> TL</xsl:text>
                      </td>
                    </tr>
                  </xsl:when>
                  <xsl:when test="parent::node()/cbc:DocumentType = 'DIP_TL_KLDAMGA'">
                    <tr class="item">
                      <td class="etiket">
                        Damga Bedeli (<span class="ek-bilgi">TL</span>)
                      </td>
                      <td class="veri">
                        <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
                        <xsl:text> TL</xsl:text>
                      </td>
                    </tr>
                  </xsl:when>
                  <xsl:when test="$vergilerDahilToplamTutarGosterilirmi and parent::node()/cbc:DocumentType = 'DIP_TL_VERGIDAHILBEDEL'">
                    <tr class="item">
                      <td class="etiket">
                        Vergiler Dahil Toplam (<span class="ek-bilgi">TL</span>)
                      </td>
                      <td class="veri">
                        <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
                        <xsl:text> TL</xsl:text>
                      </td>
                    </tr>
                  </xsl:when>
                  <xsl:when test="parent::node()/cbc:DocumentType = 'DIP_TL_SONUCBEDEL'">
                    <tr class="item">
                      <td class="etiket">
                        Ödenecek Tutar (<span class="ek-bilgi">TL</span>)
                      </td>
                      <td class="veri">
                        <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
                        <xsl:text> TL</xsl:text>
                      </td>
                    </tr>
                  </xsl:when>
                  <xsl:otherwise></xsl:otherwise>
                </xsl:choose>
              </xsl:for-each>
            </tbody>
          </xsl:if>
        </xsl:otherwise>
      </xsl:choose>
    </table>
  </xsl:template>
  <xsl:template name="party">
    <xsl:param name="isSender"/>
    <xsl:variable name="unvanBilgiVarmi" select="not(not(cac:Party/cac:PartyName/cbc:Name [not(. = '' or . = '.')]))"/>
    <xsl:variable name="sahisBilgiVarmi" select="not(not(cac:Party/cac:Person/cbc:FirstName [not(. = '' or . = '.')]))"/>
    <xsl:variable name="sahisVeyaUnvanBilgiVarmi" select="$unvanBilgiVarmi or $sahisBilgiVarmi"/>
    <xsl:for-each select="cac:Party">
      <div class="item">
        <span class="sub-item">
          <xsl:if test="$isSender != 'true' and $sahisVeyaUnvanBilgiVarmi">
            <span class="ek-bilgi hitap-text">Sayın </span>
            <xsl:if test="$aliciMustKod and normalize-space($aliciMustKod) != ''">
              <span class="mustKod-parent">
                <xsl:text>(</xsl:text>
                <span class="veri mustKod">
                  <xsl:value-of select="$aliciMustKod"/>
                </span>
                <xsl:text>)</xsl:text>
              </span>
            </xsl:if>
          </xsl:if>
          <span class="unvan veri">
            <xsl:choose>
              <xsl:when test="$sahisBilgiVarmi">
                <xsl:for-each select="cac:Person [not(. = '' or . = '.')]">
                  <xsl:call-template name="person"/>
                </xsl:for-each>
              </xsl:when>
              <xsl:otherwise>
                <xsl:for-each select="cac:PartyName/cbc:Name [not(. = '' or . = '.')]">
                  <xsl:value-of select="."/>
                </xsl:for-each>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="$eMustahsilmi">
              <xsl:for-each select="cac:PartyIdentification/cbc:ID [@schemeID = 'TCKN' and not(. = '' or . = '.')]">
                <span class="etiket" style="font-weight: normal"> (T.C: </span>
                <span class="veri">
                  <xsl:value-of select="."/>)
                </span>
              </xsl:for-each>
            </xsl:if>
          </span>
          <!--<xsl:if test="$isSender != 'true' and $sahisVeyaUnvanBilgiVarmi">
            <span class="ek-bilgi hitap-text">,</span>
          </xsl:if>-->
        </span>
      </div>
      <div class="item">
        <xsl:for-each select="cac:PostalAddress">
          <span class="etiket">Adres: </span>
          <span class="veri">
            <xsl:call-template name="adres"/>
          </span>
        </xsl:for-each>
      </div>
      <xsl:for-each select="cac:Contact">
        <div class="item">
          <xsl:for-each select="cbc:Telephone [not(. = '' or . = '.')]">
            <span class="sub-item">
              <span class="etiket">Tel: </span>
              <span class="veri">
                <xsl:value-of select="."/>
              </span>
            </span>
          </xsl:for-each>
          <xsl:for-each select="cbc:Telefax [not(. = '' or . = '.')]">
            <span class="sub-item">
              <span class="etiket">Fax: </span>
              <span class="veri">
                <xsl:value-of select="."/>
              </span>
            </span>
          </xsl:for-each>
          <xsl:for-each select="cbc:ElectronicMail [not(. = '' or . = '.')]">
            <span class="sub-item">
              <span class="etiket">e-Mail: </span>
              <span class="veri">
                <xsl:value-of select="."/>
              </span>
            </span>
          </xsl:for-each>
        </div>
      </xsl:for-each>
      <xsl:for-each select="cbc:WebsiteURI [not(. = '' or . = '.')]">
        <div class="sub-item">
          <span class="etiket">Web Sitesi: </span>
          <span class="veri">
            <xsl:value-of select="."/>
          </span>
        </div>
      </xsl:for-each>
      <div class="item">
        <xsl:choose>
          <xsl:when test="$eIhracatmi">
            <xsl:for-each select="cac:PartyIdentification/cbc:ID [@schemeID = 'VDAIRE' and not(. = '' or . = '.')]">
              <span class="sub-item">
                <span class="etiket">Vergi Dairesi: </span>
                <span class="veri">
                  <xsl:value-of select="."/>
                </span>
              </span>
            </xsl:for-each>
          </xsl:when>
          <xsl:otherwise>
            <xsl:for-each select="cac:PartyTaxScheme/cac:TaxScheme/cbc:Name [not(. = '' or . = '.')]">
              <span class="sub-item">
                <span class="etiket">Vergi Dairesi: </span>
                <span class="veri">
                  <xsl:value-of select="."/>
                </span>
              </span>
            </xsl:for-each>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:for-each select="cac:PartyIdentification/cbc:ID [@schemeID = 'VKN' and not(. = '' or . = '.')]">
          <span class="sub-item">
            <span class="etiket">VKN: </span>
            <span class="veri">
              <xsl:value-of select="."/>
            </span>
          </span>
        </xsl:for-each>
        <xsl:for-each select="cac:PartyIdentification/cbc:ID [@schemeID = 'TCKN' and not(. = '' or . = '.')]">
          <span class="sub-item">
            <span class="etiket">TC Kimlik: </span>
            <span class="veri">
              <xsl:value-of select="."/>
            </span>
          </span>
        </xsl:for-each>
      </div>
      <div class="item">
        <xsl:for-each select="cac:PartyIdentification/cbc:ID [@schemeID = 'TICARETSICILNO' and not(. = '' or . = '.')]">
          <span class="sub-item">
            <span class="etiket">TICARET SICIL NO: </span>
            <span class="veri">
              <xsl:value-of select="."/>
            </span>
          </span>
        </xsl:for-each>
        <xsl:for-each select="cac:PartyIdentification/cbc:ID [@schemeID = 'MERSISNO' and not(. = '' or . = '.')]">
          <span class="sub-item">
            <span class="etiket">MERSIS NO: </span>
            <span class="veri">
              <xsl:value-of select="."/>
            </span>
          </span>
        </xsl:for-each>
      </div>
      <xsl:choose>
        <xsl:when test="$isSender = 'true'">
          <div class="item">
            <xsl:for-each select="cac:PartyIdentification/cbc:ID [@schemeID = 'KEP' and not(. = '' or . = '.')]">
              <span class="sub-item">
                <span class="etiket">KEP Adresi: </span>
                <span class="veri">
                  <xsl:value-of select="."/>
                </span>
              </span>
            </xsl:for-each>
            <xsl:for-each select="$xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'KEP']/cbc:ID">
              <span class="sub-item">
                <span class="etiket">KEP Adresi: </span>
                <span class="veri">
                  <xsl:value-of select="."/>
                </span>
              </span>
            </xsl:for-each>
          </div>
        </xsl:when>
        <xsl:otherwise>
          <xsl:for-each select="$xroot/cac:AdditionalDocumentReference[cbc:DocumentType = 'ALICIKEP']/cbc:ID">
            <span class="sub-item">
              <span class="etiket">KEP Adresi: </span>
              <span class="veri">
                <xsl:value-of select="."/>
              </span>
            </span>
          </xsl:for-each>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'MUSTAHSIL_BILGI']">
        <div class="item mustahsilBilgi">
          <span class="sub-item">
            <span class="etiket">
              <xsl:choose>
                <xsl:when test = "cbc:DocumentTypeCode = 'BABA_ADI'">
                  <xsl:text>Baba Adı: </xsl:text>
                </xsl:when>
                <xsl:when test = "cbc:DocumentTypeCode = 'DOGUM_TARIHI_GOSTERIM'">
                  <xsl:text>Doğum: </xsl:text>
                </xsl:when>
                <xsl:when test = "cbc:DocumentTypeCode = 'DOGUM_YERI'">
                  <xsl:text> / </xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="cbc:DocumentType"/>
                </xsl:otherwise>
              </xsl:choose>
            </span>
            <span class="veri">
              <xsl:value-of select="cbc:ID"/>
            </span>
          </span>
        </div>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="person">
    <xsl:for-each select="cbc:Title">
      <xsl:value-of select="."/>
      <xsl:text> </xsl:text>
    </xsl:for-each>
    <xsl:for-each select="cbc:FirstName">
      <xsl:value-of select="."/>
      <xsl:text> </xsl:text>
    </xsl:for-each>
    <xsl:for-each select="cbc:MiddleName">
      <xsl:value-of select="."/>
      <xsl:text> </xsl:text>
    </xsl:for-each>
    <xsl:for-each select="cbc:FamilyName">
      <xsl:value-of select="."/>
      <xsl:text> </xsl:text>
    </xsl:for-each>
    <xsl:for-each select="cbc:NameSuffix">
      <xsl:value-of select="."/>
    </xsl:for-each>
    <xsl:for-each select="cbc:NationalityID">
      <xsl:text>, TCKN: </xsl:text>
      <xsl:value-of select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="uuidBilgi">
    <div class="uuid">
      <span>ETTN:</span>
      <b>
        <xsl:value-of select="$xroot/cbc:UUID"/>
      </b>
    </div>
  </xsl:template>
  <xsl:template name="gibLogoVeBelgeTipi">
    <img class="gibLogo" src="data:image/jpeg;base64,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"></img>
    <div class="belgeTipi">
      <xsl:value-of select="$belgeTipiText"/>
    </div>
  </xsl:template>
  <xsl:template name="firmaLogo">
    <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'FIRMALOGO_IMG']">
      <xsl:choose>
        <xsl:when test="cbc:DocumentTypeCode = 'dynamic'">
          <img class="firmaLogo" src="[FIRMALOGO_IMG]"></img>
        </xsl:when>
        <xsl:when test="cac:Attachment/cbc:EmbeddedDocumentBinaryObject">
          <xsl:for-each select="cac:Attachment/cbc:EmbeddedDocumentBinaryObject">
            <img class="firmaLogo" src="data:{@mimeCode};base64,{.}"></img>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
          <img class="firmaLogo" src="{cbc:DocumentTypeCode}"></img>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="islakImza">
    <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'ISLAKIMZA_IMG']">
      <xsl:choose>
        <xsl:when test="cbc:DocumentTypeCode = 'dynamic'">
          <img class="islakImza" src="[ISLAKIMZA_IMG]"></img>
        </xsl:when>
        <xsl:when test="cac:Attachment/cbc:EmbeddedDocumentBinaryObject">
          <xsl:for-each select="cac:Attachment/cbc:EmbeddedDocumentBinaryObject">
            <img class="islakImza" src="data:{@mimeCode};base64,{.}"></img>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
          <img class="islakImza" src="{cbc:DocumentTypeCode}"></img>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="kase">
    <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'KASE_IMG']">
      <xsl:choose>
        <xsl:when test="cbc:DocumentTypeCode = 'dynamic'">
          <img class="kase" src="[KASE_IMG]"></img>
        </xsl:when>
        <xsl:when test="cac:Attachment/cbc:EmbeddedDocumentBinaryObject">
          <xsl:for-each select="cac:Attachment/cbc:EmbeddedDocumentBinaryObject">
            <img class="kase" src="data:{@mimeCode};base64,{.}"></img>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
          <img class="kase" src="{cbc:DocumentTypeCode}"></img>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="qrCode">
    <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'KAREKOD_IMG']">
      <xsl:choose>
        <xsl:when test="cbc:DocumentTypeCode = 'dynamic'">
          <div class="qrcodeImage-parent">
            <img class="qrcodeImage" align="center" src="[KAREKOD_IMG]"></img>
          </div>
        </xsl:when>
        <xsl:when test="cac:Attachment/cbc:EmbeddedDocumentBinaryObject">
          <xsl:for-each select="cac:Attachment/cbc:EmbeddedDocumentBinaryObject">
            <div class="qrcodeImage-parent">
              <img class="qrcodeImage" align="center" src="data:{@mimeCode};base64,{.}"></img>
            </div>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
          <div class="qrcodeImage-parent">
            <img class="qrcodeImage" align="center" src="{cbc:DocumentTypeCode}"></img>
          </div>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
    <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'KAREKOD_DATA']">
      <xsl:choose>
        <xsl:when test="cac:Attachment/cbc:EmbeddedDocumentBinaryObject">
          <xsl:for-each select="cac:Attachment/cbc:EmbeddedDocumentBinaryObject">
            <div class="qrcodeImage-parent">
              <div class="qrcodeImage" align="center"/>
            </div>
            <script>
              <![CDATA[
              const text = Base64.decode(`{.}`);
              new QRCode(document.getElementsByClassName("qrcodeImage")[0], { width: 150, height: 150, correctLevel : QRCode.CorrectLevel.L, colorDark : "#000000", colorLight : "white" }).makeCode(text);
            ]]>
            </script>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
          <div class="qrcodeImage-parent">
            <div class="qrcodeImage" align="center"/>
          </div>
          <script>
            <![CDATA[
              const text = `{cbc:DocumentTypeCode}`;
              new QRCode(document.getElementsByClassName("qrcodeImage")[0], { width: 150, height: 150, correctLevel : QRCode.CorrectLevel.L, colorDark : "#000000", colorLight : "white" }).makeCode(text);
          ]]>
          </script>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="qrCode_alt">
    <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'KAREKOD_IMG_ALT']">
      <xsl:choose>
        <xsl:when test="cbc:DocumentTypeCode = 'dynamic'">
          <div class="qrcodeImage_alt-parent">
            <img class="qrcodeImage_alt" align="center" src="[KAREKOD_IMG_ALT]"></img>
          </div>
        </xsl:when>
        <xsl:when test="cac:Attachment/cbc:EmbeddedDocumentBinaryObject">
          <xsl:for-each select="cac:Attachment/cbc:EmbeddedDocumentBinaryObject">
            <div class="qrcodeImage_alt-parent">
              <img class="qrcodeImage_alt" align="center" src="data:{@mimeCode};base64,{.}"></img>
            </div>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
          <div class="qrcodeImage_alt-parent">
            <img class="qrcodeImage_alt" align="center" src="{cbc:DocumentTypeCode}"></img>
          </div>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
    <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'KAREKOD_DATA_ALT']">
      <xsl:choose>
        <xsl:when test="cac:Attachment/cbc:EmbeddedDocumentBinaryObject">
          <xsl:for-each select="cac:Attachment/cbc:EmbeddedDocumentBinaryObject">
            <div class="qrcodeImage_alt-parent">
              <div class="qrcodeImage_alt" align="center"/>
            </div>
            <script>
              <![CDATA[
              const text = Base64.decode(`{.}`);
              new QRCode(document.getElementsByClassName("qrcodeImage_alt")[0], { width: 150, height: 150, correctLevel : QRCode.CorrectLevel.L, colorDark : "#000000", colorLight : "white" }).makeCode(text);
            ]]>
            </script>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
          <div class="qrcodeImage_alt-parent">
            <div class="qrcodeImage_alt" align="center"/>
          </div>
          <script>
            <![CDATA[
              const text = `{cbc:DocumentTypeCode}`;
              new QRCode(document.getElementsByClassName("qrcodeImage_alt")[0], { width: 150, height: 150, correctLevel : QRCode.CorrectLevel.L, colorDark : "#000000", colorLight : "white" }).makeCode(text);
          ]]>
          </script>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="baslik-sube">
    <xsl:for-each select="cac:Party/cac:AgentParty">
      <xsl:if test="not(cac:PartyIdentification/cbc:ID [not(@schemeID = 'VKN' or @schemeID = 'TCKN' or @schemeID = 'VKN_TCKN' or @schemeID = 'BAYINO')] = '') or not(cac:PartyName = '')">
        <tr class="sube">
          <td class="etiket">Şube:</td>
          <td class="veri">
            <span class="kod">
              <xsl:value-of select="cac:PartyIdentification/cbc:ID [not(@schemeID = 'VKN' or @schemeID = 'TCKN' or @schemeID = 'VKN_TCKN' or @schemeID = 'BAYINO')]"/>
            </span>
            <span class="ek-bilgi">-</span>
            <span class="adi">
              <xsl:value-of select="cac:PartyName/cbc:Name"/>
            </span>
          </td>
        </tr>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="baslik-sevkAdres">
    <xsl:for-each select="cac:Party/cac:PostalAddress/cbc:District [not(. = '' or . = '.')]">
      <tr class="sevkAdres">
        <td class="etiket">Sevk Adresi:</td>
        <td class="veri">
          <xsl:value-of select="."/>
        </td>
      </tr>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="vioBilgiFooter">
    <div class="vioInfo">Bu belge SKYLOG YAZILIM - SkyERP programı ile oluşturulmuştur.</div>
  </xsl:template>
  <xsl:template name="notes">
    <div class="notes">
      <xsl:call-template name="yalnizYazisi"/>
      <xsl:call-template name="vergiNotlar"/>
      <xsl:if test="not($eIrsaliyemi)">
        <xsl:for-each select="$xroot/cbc:Note">
          <xsl:call-template name="noteLine"/>
        </xsl:for-each>
      </xsl:if>
      <xsl:if test="($efami) and ($xroot/cbc:IssueTime and not($xroot/cac:DespatchDocumentReference))">
        <xsl:call-template name="irsYerineGecerYazisi"/>
      </xsl:if>
      <xsl:if test="$xroot/cac:AdditionalDocumentReference[cbc:DocumentTypeCode = 'IS_INTERNET']">
        <xsl:call-template name="intSatisBilgi"/>
      </xsl:if>
      <xsl:for-each select="$xroot/cac:AdditionalDocumentReference[cbc:DocumentTypeCode = 'ONCEKI_BAKIYE']/cbc:DocumentDescription">
        <xsl:call-template name="bakiye">
          <xsl:with-param name="cssPrefix" select="'oncekiBakiye'"/>
          <xsl:with-param name="etiketPrefix" select="'Öncesi'"/>
        </xsl:call-template>
      </xsl:for-each>
      <xsl:for-each select="$xroot/cac:AdditionalDocumentReference[cbc:DocumentTypeCode = 'SONRAKI_BAKIYE']/cbc:DocumentDescription">
        <xsl:call-template name="bakiye">
          <xsl:with-param name="cssPrefix" select="'sonrakiBakiye'"/>
          <xsl:with-param name="etiketPrefix" select="'Sonrası'"/>
        </xsl:call-template>
      </xsl:for-each>
    </div>
  </xsl:template>
  <xsl:template name="noteLine">
    <xsl:if test=". != 'İrsaliye yerine geçer.'">
      <div class="note">
        <xsl:call-template name="html-escape">
          <xsl:with-param name="text" select="."/>
        </xsl:call-template>
      </div>
    </xsl:if>
  </xsl:template>
  <xsl:template name="bakiye">
    <xsl:param name="cssPrefix"/>
    <xsl:param name="etiketPrefix"/>
    <div class="$cssPrefix bakiye">
      <span class="etiket">
        Bu Fatura <xsl:value-of select="$etiketPrefix"/> Bakiye:
      </span>
      <span class="veri">
        <xsl:call-template name="html-escape">
          <xsl:with-param name="text" select="."/>
        </xsl:call-template>
      </span>
    </div>
  </xsl:template>
  <xsl:template name="yalnizYazisi">
    <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'YALNIZYAZISI']">
      <div class="yalnizYazisi">
        <xsl:call-template name="htmlBilgi"/>
      </div>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="vergiNotlar">
    <xsl:for-each select="$xroot/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory [cbc:TaxExemptionReason and cac:TaxScheme/cbc:TaxTypeCode = '0015']">
      <div class="note note-ek vergi">
        <span class="etiket">*Vergi İstisna Muafiyet:</span>
        <span class="veri">
          <xsl:value-of select="cbc:TaxExemptionReasonCode"/>
          <xsl:text>-</xsl:text>
          <xsl:value-of select="cbc:TaxExemptionReason"/>
        </span>
      </div>
    </xsl:for-each>
    <xsl:for-each select="$xroot/cac:WithholdingTaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
      <div class="note note-ek vergi">
        <span class="etiket">*Tevkifat:</span>
        <span class="veri">
          <xsl:value-of select="cbc:TaxTypeCode"/>
          <xsl:text>-</xsl:text>
          <xsl:value-of select="cbc:Name"/>
        </span>
      </div>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="detayAciklamalar">
    <xsl:for-each select="cac:Item/cbc:Description [substring(., 1, 2) != '!#']">
      <xsl:call-template name="detayAciklama"/>
    </xsl:for-each>
    <xsl:for-each select="cbc:Note [substring(., 1, 2) != '!#']">
      <xsl:call-template name="detayAciklama"/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="detayAciklama">
    <xsl:variable name="rowNumber" select="parent::node()/cbc:ID"/>
    <xsl:if test="substring(., 1, 3) != 'POL'">
      <tr class="aciklamaSatiri" data-rowindex="{$rowNumber}">
        <td class="aciklamaText" colspan="1000">
          <xsl:call-template name="html-escape">
            <xsl:with-param name="text" select="."/>
          </xsl:call-template>
        </td>
      </tr>
    </xsl:if>
  </xsl:template>
  <xsl:template name="irsYerineGecerYazisi">
    <div class="note note-ek"/>
    <div class="note note-ek"/>
    <div class="note note-ek">İrsaliye Yerine Geçer</div>
  </xsl:template>
  <xsl:template name="intSatisBilgi">
    <div class="note note-ek"/>
    <div class="note note-ek"/>
    <xsl:choose>
      <xsl:when test="$xroot/cac:AdditionalDocumentReference[cbc:DocumentTypeCode = 'ETICARET_DIPNOT']">
        <xsl:for-each select="$xroot/cac:AdditionalDocumentReference[cbc:DocumentTypeCode = 'ETICARET_DIPNOT']">
          <div class="note note-ek">
            <xsl:call-template name="html-escape">
              <xsl:with-param name="text" select="cbc:ID"/>
            </xsl:call-template>
          </div>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <div class="note note-ek">Bu satış internet üzerinden yapılmıştır.</div>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="sevkAdres">
    <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentTypeCode = 'SEVK_ADRESI']">
      <div class="sevkAdres">
        <div class="adi item">
          <span class="etiket">Sevk:</span>
          <span class="veri">
            <xsl:value-of select="./cbc:ID" />
          </span>
        </div>
        <div class="icerik item">
          <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentTypeCode = 'SEVK_ADRESI_ICERIK' and cbc:DocumentType = ./cbc:DocumentType]">
            <div class="sub-item">
              <div class="ek-bilgi">
                <xsl:value-of select="./cbc:ID" />
              </div>
            </div>
          </xsl:for-each>
        </div>
      </div>
      <br/>
      <br/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="irsaliyeIcinEkFooter">
    <div class="irsaliyeIcinEkFooter ekFooter">
      <table class="teslimEdenAlan">
        <tbody>
          <tr>
            <td class="teslimEden">
              <div class="item">Teslim Eden</div>
            </td>
            <td class="teslimAlan">
              <div class="item">Teslim Alan</div>
            </td>
          </tr>
          <tr>
            <td class="teslimEdenDetay"></td>
            <td class="teslimAlanDetay"></td>
          </tr>
        </tbody>
      </table>
      <table class="tasiyiciBilgileri">
        <thead>
          <tr class="baslik">
            <td class="aciklamalar">Açıklamalar</td>
            <td class="bilgiler">Taşıyıcı Bilgileri</td>
          </tr>
        </thead>
        <tbody>
          <tr class="detay">
            <td class="tasiyici-aciklamalar tasiyici-bilgi">
              <xsl:for-each select="$xroot/cbc:Note">
                <xsl:call-template name="noteLine"/>
              </xsl:for-each>
              <table class="subTable">
                <tbody>
                  <xsl:for-each select="$xroot/cac:SellerSupplierParty/cac:Party">
                    <tr class="detay">
                      <td class="etiket">Asıl Satıcı VKN ve Ünvan:</td>
                      <td class="veri">
                        <span class="vkn sub-item">
                          (<xsl:value-of select="cac:PartyIdentification/cbc:ID"/>)
                        </span>
                        <span class="name sub-item">
                          <xsl:value-of select="cac:PartyName/cbc:Name"/>
                        </span>
                      </td>
                    </tr>
                  </xsl:for-each>
                  <xsl:for-each select="$xroot/cac:BuyerCustomerParty/cac:Party">
                    <tr class="detay">
                      <td class="etiket">Asıl Alıcı VKN ve Ünvan:</td>
                      <td class="veri">
                        <span class="vkn sub-item">
                          (<xsl:value-of select="cac:PartyIdentification/cbc:ID"/>)
                        </span>
                        <span class="name sub-item">
                          <xsl:value-of select="cac:PartyName/cbc:Name"/>
                        </span>
                      </td>
                    </tr>
                  </xsl:for-each>
                  <xsl:for-each select="$xroot/cac:OriginatorParty/cac:Party">
                    <tr class="detay">
                      <td class="etiket">İşlemleri Başlatan VKN ve Ünvan:</td>
                      <td class="veri">
                        <span class="vkn sub-item">
                          (<xsl:value-of select="cac:PartyIdentification/cbc:ID"/>)
                        </span>
                        <span class="name sub-item">
                          <xsl:value-of select="cac:PartyName/cbc:Name"/>
                        </span>
                      </td>
                    </tr>
                  </xsl:for-each>
                  <xsl:for-each select="$xroot/cac:DespatchSupplierParty/cac:Party/cac:Person">
                    <tr class="detay">
                      <td class="etiket">Teslim Eden:</td>
                      <td class="veri">
                        <xsl:call-template name="person"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </td>
            <td class="tasiyici-notlar tasiyici-bilgi">
              <table class="subTable">
                <tbody>
                  <xsl:for-each select="$xroot/cac:Shipment">
                    <xsl:for-each select="cac:Delivery/cac:CarrierParty">
                      <tr class="detay">
                        <td class="etiket">Taşıyıcı Firma:</td>
                        <td class="veri">
                          <span class="vkn sub-item">
                            (<xsl:value-of select="cac:PartyIdentification/cbc:ID"/>)
                          </span>
                          <span class="name sub-item">
                            <xsl:value-of select="cac:PartyName/cbc:Name"/>
                          </span>
                        </td>
                      </tr>
                    </xsl:for-each>
                    <xsl:for-each select="cac:ShipmentStage/cac:TransportMeans/cac:RoadTransport/cbc:LicensePlateID">
                      <tr class="detay">
                        <td class="etiket">Araç plaka Numarası:</td>
                        <td class="veri">
                          <span class="sub-item">
                            <xsl:value-of select="."/>
                          </span>
                        </td>
                      </tr>
                    </xsl:for-each>
                    <xsl:for-each select="cac:TransportHandlingUnit/cac:TransportEquipment/cbc:ID[@schemeID = 'DORSEPLAKA']">
                      <tr class="detay">
                        <td class="etiket">Dorse Plaka Numarası:</td>
                        <td class="veri">
                          <span class="sub-item">
                            <xsl:value-of select="."/>
                          </span>
                        </td>
                      </tr>
                    </xsl:for-each>
                    <xsl:for-each select="cac:ShipmentStage/cac:DriverPerson">
                      <tr class="detay">
                        <td class="etiket">Taşıyıcı:</td>
                        <td class="veri">
                          <xsl:call-template name="person"/>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </xsl:for-each>
                </tbody>
              </table>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </xsl:template>
  <xsl:template name="mustahsilIcinEkFooter">
    <div class="mustahsilIcinEkFooter ekFooter">
      <table class="teslimEdenAlan">
        <tbody>
          <tr>
            <td class="teslimEden etiket long">
              <div class="item">Malı Satan</div>
              <div class="item">Ad-Soyad / TCKN</div>
              <div class="item">İmza</div>
            </td>
            <td class="teslimEden veri long">
              <div class="item">
                <xsl:value-of select="$space"/>
              </div>
              <div class="item">
                <span>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="$xroot/cac:AccountingCustomerParty/cac:Party/cac:PartyName/cbc:Name"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="$xroot/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID [(@schemeID = 'TCKN' or @schemeID = 'VKN') and not(. = '' or . = '.')]"/>
                </span>
              </div>
            </td>
            <td class="teslimAlan etiket long">
              <div class="item">Teslim Alan</div>
              <div class="item">Ad-Soyad / TCKN</div>
              <div class="item">İmza</div>
              <div class="item">
                <xsl:call-template name="kase"/>
              </div>
            </td>
            <td class="teslimEden veri long">
              <div class="item">
                <xsl:value-of select="$space"/>
              </div>
              <div class="item">
                <xsl:value-of select="$space"/>
              </div>
              <div class="item">
                <xsl:value-of select="$space"/>
              </div>
              <div class="item">
                <xsl:value-of select="$space"/>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </xsl:template>
  <xsl:template name="adres">
    <xsl:for-each select="cbc:StreetName [not(. = '' or . = '.')]">
      <span>
        <xsl:value-of select="."/>
        <xsl:value-of select="$space"/>
      </span>
    </xsl:for-each>
    <xsl:for-each select="cbc:BuildingName [not(. = '' or . = '.')]">
      <span>
        <xsl:value-of select="."/>
        <xsl:value-of select="$space"/>
      </span>
    </xsl:for-each>
    <xsl:for-each select="cbc:PostalZone [not(. = '.' or . = '0' or . = '00000')]">
      <span>
        <xsl:value-of select="."/>
        <xsl:value-of select="$space"/>
      </span>
    </xsl:for-each>
    <xsl:for-each select="cbc:CitySubdivisionName [not(. = '' or . = '.')]">
      <span>
        <xsl:value-of select="."/>
      </span>
      <span class="separator"> / </span>
    </xsl:for-each>
    <xsl:for-each select="cbc:CityName [not(. = '' or . = '.')]">
      <span>
        <xsl:value-of select="."/>
        <xsl:value-of select="$space"/>
      </span>
    </xsl:for-each>
    <xsl:for-each select="cac:Country/cbc:Name">
      <xsl:if test="not(. = '.' or . = 'Türkiye')">
        <span>
          <xsl:value-of select="."/>
        </span>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="transportMode">
    <xsl:choose>
      <xsl:when test=". = 1">Denizyolu</xsl:when>
      <xsl:when test=". = 2">Demiryolu</xsl:when>
      <xsl:when test=". = 3">Karayolu</xsl:when>
      <xsl:when test=". = 4">Havayolu</xsl:when>
      <xsl:when test=". = 5">Posta</xsl:when>
      <xsl:when test=". = 6">Çok araçlı</xsl:when>
      <xsl:when test=". = 7">Sabit taşıma tesisleri</xsl:when>
      <xsl:when test=". = 8">İç su taşımacılığı</xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="."/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="group-text">
    <xsl:param name="text" />
    <xsl:if test="string-length($text) &gt; 0">
      <!-- İlk 4 karakteri al ve sonuna boşluk ekleyin. -->
      <xsl:value-of select="substring($text, 1, 4)" />
      <xsl:text> </xsl:text>
      <!-- Kalan kısmı işlemek için recursive olarak kendini çağırın. -->
      <xsl:call-template name="group-text">
        <xsl:with-param name="text" select="substring($text, 5)" />
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <xsl:template name="dipVergiSatirlariYaz">
    <xsl:param name="name"/>
    <xsl:param name="oran"/>
    <xsl:if test="$iskontoVeyaNakliyeVarmi = 'true' or $cokluKDVmi">
      <tr class="item">
        <td class="etiket">
          Hesaplanan <xsl:value-of select="$name"/> (%<xsl:value-of select="$oran"/>) Matrah
        </td>
        <xsl:for-each select="parent::node()/cbc:DocumentTypeCode">
          <td class="veri">
            <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
            <xsl:call-template name="currency"/>
          </td>
        </xsl:for-each>
      </tr>
    </xsl:if>
    <tr class="item">
      <td class="etiket">
        Hesaplanan <xsl:value-of select="$name"/> (%<xsl:value-of select="$oran"/>)
      </td>
      <td class="veri">
        <xsl:value-of select="format-number(., $bedelFormatStr, $numLocale)"/>
        <xsl:call-template name="currency"/>
      </td>
    </tr>
  </xsl:template>
  <xsl:template name="dipKdvSatirlariYaz">
    <xsl:param name="oran"/>
    <xsl:call-template name="dipVergiSatirlariYaz">
      <xsl:with-param name="name" select="'KDV'"/>
      <xsl:with-param name="oran" select="$oran"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="htmlBilgi">
    <xsl:choose>
      <xsl:when test="cac:Attachment/cbc:EmbeddedDocumentBinaryObject">
        <xsl:call-template name="html-escape">
          <xsl:with-param name="text" select="cac:Attachment/cbc:EmbeddedDocumentBinaryObject"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="cbc:DocumentDescription and cbc:DocumentDescription != ''">
            <xsl:call-template name="html-escape">
              <xsl:with-param name="text" select="cbc:DocumentDescription"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="html-escape">
              <xsl:with-param name="text" select="cbc:DocumentTypeCode"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="getKeyValue">
    <xsl:param name="key"/>
    <xsl:param name="inside" select="true()"/>
    <xsl:choose>
      <xsl:when test="$inside">   
        <xsl:call-template name="getKeyValueInternal">
          <xsl:with-param name="key" select="$key"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="$eIrsaliyemi">
            <xsl:for-each select="$xroot/cac:DespatchLine">
              <xsl:call-template name="getKeyValueInternal">
                <xsl:with-param name="key" select="$key"/>
              </xsl:call-template>
            </xsl:for-each>
          </xsl:when>
          <xsl:when test="$eMustahsilmi">
            <xsl:for-each select="$xroot/cac:CreditNoteLine">
              <xsl:call-template name="getKeyValueInternal">
                <xsl:with-param name="key" select="$key"/>
              </xsl:call-template>
            </xsl:for-each>
          </xsl:when>
          <xsl:otherwise>
            <xsl:for-each select="$xroot/cac:InvoiceLine">
              <xsl:call-template name="getKeyValueInternal">
                <xsl:with-param name="key" select="$key"/>
              </xsl:call-template>
            </xsl:for-each>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="getKeyValueInternal">
    <xsl:param name="key"/>
    <!-- concat yerine gövde + value-of -->
    <xsl:variable name="prefix">
      <xsl:text>!#</xsl:text>
      <xsl:value-of select="$key"/>
      <xsl:text>=</xsl:text>
    </xsl:variable>
    <xsl:for-each select="cbc:Note">
      <xsl:variable name="plen" select="string-length($prefix)"/>
      <!-- starts-with yerine substring karşılaştırması -->
      <xsl:if test="substring(., 1, $plen) = $prefix">
        <!--<xsl:value-of select="substring(., $plen + 1)" disable-output-escaping="no"/>-->
        <xsl:variable name="raw" select="substring(., $plen + 1)"/>
        <xsl:call-template name="decodeEntities">
          <xsl:with-param name="text" select="$raw"/>
        </xsl:call-template>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="decodeEntities">
  <xsl:param name="text"/>
  <xsl:choose>
    <!-- numeric entity varsa -->
    <xsl:when test="contains($text, '&amp;#')">
      <xsl:variable name="before" select="substring-before($text, '&amp;#')"/>
      <xsl:variable name="after"  select="substring-after($text, '&amp;#')"/>
      <xsl:variable name="num" select="substring-before($after, ';')"/>
      <xsl:variable name="rest" select="substring-after($after, ';')"/>
      <!-- önceki kısım -->
      <xsl:value-of select="$before"/>
      <!-- numeric mapping -->
      <xsl:choose>
        <xsl:when test="$num='37'">%</xsl:when>
        <xsl:when test="$num='43'">+</xsl:when>
        <xsl:when test="$num='40'">(</xsl:when>
        <xsl:when test="$num='41'">)</xsl:when>
        <!-- başka gerekiyorsa buraya ekle -->
        <xsl:otherwise>
          <xsl:text>?</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
      <!-- kalan kısmı recursive işle -->
      <xsl:call-template name="decodeEntities">
        <xsl:with-param name="text" select="$rest"/>
      </xsl:call-template>
    </xsl:when>
    <!-- başka entity yoksa -->
    <xsl:otherwise>
      <xsl:value-of select="$text"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
</xsl:stylesheet>
