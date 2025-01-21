<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
	xmlns:ccts="urn:un:unece:uncefact:documentation:2"
	xmlns:clm54217="urn:un:unece:uncefact:codelist:specification:54217:2001"
	xmlns:clm5639="urn:un:unece:uncefact:codelist:specification:5639:1988"
	xmlns:clm66411="urn:un:unece:uncefact:codelist:specification:66411:2001"
	xmlns:clmIANAMIMEMediaType="urn:un:unece:uncefact:codelist:specification:IANAMIMEMediaType:2003"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:link="http://www.xbrl.org/2003/linkbase"
	xmlns:n1="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2"
	xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
	xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2"
	xmlns:xbrldi="http://xbrl.org/2006/xbrldi"
	xmlns:xbrli="http://www.xbrl.org/2003/instance"
	xmlns:xdt="http://www.w3.org/2005/xpath-datatypes"
	xmlns:xlink="http://www.w3.org/1999/xlink"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xsd="http://www.w3.org/2001/XMLSchema"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	exclude-result-prefixes="cac cbc ccts clm54217 clm5639 clm66411 clmIANAMIMEMediaType fn link n1 qdt udt xbrldi xbrli xdt xlink xs xsd xsi">

  <!-- VIO VERSION 02 -->

  <xsl:character-map name="a">
    <xsl:output-character character="&#128;" string=""/>
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
		doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
		doctype-system="http://www.w3.org/TR/html4/loose.dtd" use-character-maps="a"/>
  <xsl:param name="SV_OutputFormat" select="'HTML'"/>
  <xsl:variable name="space" select="'&#160;'"/>
  <xsl:variable name="XML" select="/"/>
  <xsl:variable name="xroot" select="node()"/>


  <!--__iptal__fiyatFormatStr-->
  <!--__iptal__bedelFormatStr-->

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
        <xsl:value-of select="10"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="darDokummu"
      select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType='PARAM' and parent::node()/cbc:DocumentTypeCode = 'DAR_DOKUM']"/>

  <!--<xsl:variable name="dovizlimi"
      select="not ($xroot/cbc:DocumentCurrencyCode = 'TRL' or $xroot/cbc:DocumentCurrencyCode = 'TRY')"/>

  <xsl:variable name="dovizGosterimKurali"
      select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType='PARAM' and parent::node()/cbc:DocumentTypeCode = 'DOVIZ_GOSTERIM_KURALI']"/>
  -->

  <xsl:variable name="fiyatGosterimKurali"
      select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType='PARAM' and parent::node()/cbc:DocumentTypeCode = 'FIYAT_GOSTERIM_KURALI']"/>

  <xsl:variable name="fiyatBedelGosterilirmi"
      select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType='PARAM' and parent::node()/cbc:DocumentTypeCode = 'FIYATBEDEL_GOSTERILIR']"/>

  <xsl:variable name="satirdaBarkodGosterilirmi"
      select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType='PARAM' and parent::node()/cbc:DocumentTypeCode = 'SATIRDA_BARKOD']"/>

  <xsl:variable name="satirdaMiktar2Gosterilirmi"
      select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType='PARAM' and parent::node()/cbc:DocumentTypeCode = 'SATIRDA_MIKTAR2']"/>

  <xsl:variable name="vergilerDahilToplamTutarGosterilirmi"
        select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType='PARAM' and parent::node()/cbc:DocumentTypeCode = 'DIPTE_VERGILER_DAHIL_TOPLAM_TUTAR']"/>

  <xsl:variable name="mustKod"
      select="$xroot/cac:AdditionalDocumentReference/cbc:ID [parent::node()/cbc:DocumentType='PARAM' and parent::node()/cbc:DocumentTypeCode = 'MUSTERI_KOD']"/>


  <xsl:template match="/">
    <html>
      <head>
        <script type="text/javascript">
          <![CDATA[var QRCode;!function(){function a(a){this.mode=c.MODE_8BIT_BYTE,this.data=a,this.parsedData=[];for(var b=[],d=0,e=this.data.length;e>d;d++){var f=this.data.charCodeAt(d);f>65536?(b[0]=240|(1835008&f)>>>18,b[1]=128|(258048&f)>>>12,b[2]=128|(4032&f)>>>6,b[3]=128|63&f):f>2048?(b[0]=224|(61440&f)>>>12,b[1]=128|(4032&f)>>>6,b[2]=128|63&f):f>128?(b[0]=192|(1984&f)>>>6,b[1]=128|63&f):b[0]=f,this.parsedData=this.parsedData.concat(b)}this.parsedData.length!=this.data.length&&(this.parsedData.unshift(191),this.parsedData.unshift(187),this.parsedData.unshift(239))}function b(a,b){this.typeNumber=a,this.errorCorrectLevel=b,this.modules=null,this.moduleCount=0,this.dataCache=null,this.dataList=[]}function i(a,b){if(void 0==a.length)throw new Error(a.length+"/"+b);for(var c=0;c<a.length&&0==a[c];)c++;this.num=new Array(a.length-c+b);for(var d=0;d<a.length-c;d++)this.num[d]=a[d+c]}function j(a,b){this.totalCount=a,this.dataCount=b}function k(){this.buffer=[],this.length=0}function m(){return"undefined"!=typeof CanvasRenderingContext2D}function n(){var a=!1,b=navigator.userAgent;return/android/i.test(b)&&(a=!0,aMat=b.toString().match(/android ([0-9]\.[0-9])/i),aMat&&aMat[1]&&(a=parseFloat(aMat[1]))),a}function r(a,b){for(var c=1,e=s(a),f=0,g=l.length;g>=f;f++){var h=0;switch(b){case d.L:h=l[f][0];break;case d.M:h=l[f][1];break;case d.Q:h=l[f][2];break;case d.H:h=l[f][3]}if(h>=e)break;c++}if(c>l.length)throw new Error("Too long data");return c}function s(a){var b=encodeURI(a).toString().replace(/\%[0-9a-fA-F]{2}/g,"a");return b.length+(b.length!=a?3:0)}a.prototype={getLength:function(){return this.parsedData.length},write:function(a){for(var b=0,c=this.parsedData.length;c>b;b++)a.put(this.parsedData[b],8)}},b.prototype={addData:function(b){var c=new a(b);this.dataList.push(c),this.dataCache=null},isDark:function(a,b){if(0>a||this.moduleCount<=a||0>b||this.moduleCount<=b)throw new Error(a+","+b);return this.modules[a][b]},getModuleCount:function(){return this.moduleCount},make:function(){this.makeImpl(!1,this.getBestMaskPattern())},makeImpl:function(a,c){this.moduleCount=4*this.typeNumber+17,this.modules=new Array(this.moduleCount);for(var d=0;d<this.moduleCount;d++){this.modules[d]=new Array(this.moduleCount);for(var e=0;e<this.moduleCount;e++)this.modules[d][e]=null}this.setupPositionProbePattern(0,0),this.setupPositionProbePattern(this.moduleCount-7,0),this.setupPositionProbePattern(0,this.moduleCount-7),this.setupPositionAdjustPattern(),this.setupTimingPattern(),this.setupTypeInfo(a,c),this.typeNumber>=7&&this.setupTypeNumber(a),null==this.dataCache&&(this.dataCache=b.createData(this.typeNumber,this.errorCorrectLevel,this.dataList)),this.mapData(this.dataCache,c)},setupPositionProbePattern:function(a,b){for(var c=-1;7>=c;c++)if(!(-1>=a+c||this.moduleCount<=a+c))for(var d=-1;7>=d;d++)-1>=b+d||this.moduleCount<=b+d||(this.modules[a+c][b+d]=c>=0&&6>=c&&(0==d||6==d)||d>=0&&6>=d&&(0==c||6==c)||c>=2&&4>=c&&d>=2&&4>=d?!0:!1)},getBestMaskPattern:function(){for(var a=0,b=0,c=0;8>c;c++){this.makeImpl(!0,c);var d=f.getLostPoint(this);(0==c||a>d)&&(a=d,b=c)}return b},createMovieClip:function(a,b,c){var d=a.createEmptyMovieClip(b,c),e=1;this.make();for(var f=0;f<this.modules.length;f++)for(var g=f*e,h=0;h<this.modules[f].length;h++){var i=h*e,j=this.modules[f][h];j&&(d.beginFill(0,100),d.moveTo(i,g),d.lineTo(i+e,g),d.lineTo(i+e,g+e),d.lineTo(i,g+e),d.endFill())}return d},setupTimingPattern:function(){for(var a=8;a<this.moduleCount-8;a++)null==this.modules[a][6]&&(this.modules[a][6]=0==a%2);for(var b=8;b<this.moduleCount-8;b++)null==this.modules[6][b]&&(this.modules[6][b]=0==b%2)},setupPositionAdjustPattern:function(){for(var a=f.getPatternPosition(this.typeNumber),b=0;b<a.length;b++)for(var c=0;c<a.length;c++){var d=a[b],e=a[c];if(null==this.modules[d][e])for(var g=-2;2>=g;g++)for(var h=-2;2>=h;h++)this.modules[d+g][e+h]=-2==g||2==g||-2==h||2==h||0==g&&0==h?!0:!1}},setupTypeNumber:function(a){for(var b=f.getBCHTypeNumber(this.typeNumber),c=0;18>c;c++){var d=!a&&1==(1&b>>c);this.modules[Math.floor(c/3)][c%3+this.moduleCount-8-3]=d}for(var c=0;18>c;c++){var d=!a&&1==(1&b>>c);this.modules[c%3+this.moduleCount-8-3][Math.floor(c/3)]=d}},setupTypeInfo:function(a,b){for(var c=this.errorCorrectLevel<<3|b,d=f.getBCHTypeInfo(c),e=0;15>e;e++){var g=!a&&1==(1&d>>e);6>e?this.modules[e][8]=g:8>e?this.modules[e+1][8]=g:this.modules[this.moduleCount-15+e][8]=g}for(var e=0;15>e;e++){var g=!a&&1==(1&d>>e);8>e?this.modules[8][this.moduleCount-e-1]=g:9>e?this.modules[8][15-e-1+1]=g:this.modules[8][15-e-1]=g}this.modules[this.moduleCount-8][8]=!a},mapData:function(a,b){for(var c=-1,d=this.moduleCount-1,e=7,g=0,h=this.moduleCount-1;h>0;h-=2)for(6==h&&h--;;){for(var i=0;2>i;i++)if(null==this.modules[d][h-i]){var j=!1;g<a.length&&(j=1==(1&a[g]>>>e));var k=f.getMask(b,d,h-i);k&&(j=!j),this.modules[d][h-i]=j,e--,-1==e&&(g++,e=7)}if(d+=c,0>d||this.moduleCount<=d){d-=c,c=-c;break}}}},b.PAD0=236,b.PAD1=17,b.createData=function(a,c,d){for(var e=j.getRSBlocks(a,c),g=new k,h=0;h<d.length;h++){var i=d[h];g.put(i.mode,4),g.put(i.getLength(),f.getLengthInBits(i.mode,a)),i.write(g)}for(var l=0,h=0;h<e.length;h++)l+=e[h].dataCount;if(g.getLengthInBits()>8*l)throw new Error("code length overflow. ("+g.getLengthInBits()+">"+8*l+")");for(g.getLengthInBits()+4<=8*l&&g.put(0,4);0!=g.getLengthInBits()%8;)g.putBit(!1);for(;;){if(g.getLengthInBits()>=8*l)break;if(g.put(b.PAD0,8),g.getLengthInBits()>=8*l)break;g.put(b.PAD1,8)}return b.createBytes(g,e)},b.createBytes=function(a,b){for(var c=0,d=0,e=0,g=new Array(b.length),h=new Array(b.length),j=0;j<b.length;j++){var k=b[j].dataCount,l=b[j].totalCount-k;d=Math.max(d,k),e=Math.max(e,l),g[j]=new Array(k);for(var m=0;m<g[j].length;m++)g[j][m]=255&a.buffer[m+c];c+=k;var n=f.getErrorCorrectPolynomial(l),o=new i(g[j],n.getLength()-1),p=o.mod(n);h[j]=new Array(n.getLength()-1);for(var m=0;m<h[j].length;m++){var q=m+p.getLength()-h[j].length;h[j][m]=q>=0?p.get(q):0}}for(var r=0,m=0;m<b.length;m++)r+=b[m].totalCount;for(var s=new Array(r),t=0,m=0;d>m;m++)for(var j=0;j<b.length;j++)m<g[j].length&&(s[t++]=g[j][m]);for(var m=0;e>m;m++)for(var j=0;j<b.length;j++)m<h[j].length&&(s[t++]=h[j][m]);return s};for(var c={MODE_NUMBER:1,MODE_ALPHA_NUM:2,MODE_8BIT_BYTE:4,MODE_KANJI:8},d={L:1,M:0,Q:3,H:2},e={PATTERN000:0,PATTERN001:1,PATTERN010:2,PATTERN011:3,PATTERN100:4,PATTERN101:5,PATTERN110:6,PATTERN111:7},f={PATTERN_POSITION_TABLE:[[],[6,18],[6,22],[6,26],[6,30],[6,34],[6,22,38],[6,24,42],[6,26,46],[6,28,50],[6,30,54],[6,32,58],[6,34,62],[6,26,46,66],[6,26,48,70],[6,26,50,74],[6,30,54,78],[6,30,56,82],[6,30,58,86],[6,34,62,90],[6,28,50,72,94],[6,26,50,74,98],[6,30,54,78,102],[6,28,54,80,106],[6,32,58,84,110],[6,30,58,86,114],[6,34,62,90,118],[6,26,50,74,98,122],[6,30,54,78,102,126],[6,26,52,78,104,130],[6,30,56,82,108,134],[6,34,60,86,112,138],[6,30,58,86,114,142],[6,34,62,90,118,146],[6,30,54,78,102,126,150],[6,24,50,76,102,128,154],[6,28,54,80,106,132,158],[6,32,58,84,110,136,162],[6,26,54,82,110,138,166],[6,30,58,86,114,142,170]],G15:1335,G18:7973,G15_MASK:21522,getBCHTypeInfo:function(a){for(var b=a<<10;f.getBCHDigit(b)-f.getBCHDigit(f.G15)>=0;)b^=f.G15<<f.getBCHDigit(b)-f.getBCHDigit(f.G15);return(a<<10|b)^f.G15_MASK},getBCHTypeNumber:function(a){for(var b=a<<12;f.getBCHDigit(b)-f.getBCHDigit(f.G18)>=0;)b^=f.G18<<f.getBCHDigit(b)-f.getBCHDigit(f.G18);return a<<12|b},getBCHDigit:function(a){for(var b=0;0!=a;)b++,a>>>=1;return b},getPatternPosition:function(a){return f.PATTERN_POSITION_TABLE[a-1]},getMask:function(a,b,c){switch(a){case e.PATTERN000:return 0==(b+c)%2;case e.PATTERN001:return 0==b%2;case e.PATTERN010:return 0==c%3;case e.PATTERN011:return 0==(b+c)%3;case e.PATTERN100:return 0==(Math.floor(b/2)+Math.floor(c/3))%2;case e.PATTERN101:return 0==b*c%2+b*c%3;case e.PATTERN110:return 0==(b*c%2+b*c%3)%2;case e.PATTERN111:return 0==(b*c%3+(b+c)%2)%2;default:throw new Error("bad maskPattern:"+a)}},getErrorCorrectPolynomial:function(a){for(var b=new i([1],0),c=0;a>c;c++)b=b.multiply(new i([1,g.gexp(c)],0));return b},getLengthInBits:function(a,b){if(b>=1&&10>b)switch(a){case c.MODE_NUMBER:return 10;case c.MODE_ALPHA_NUM:return 9;case c.MODE_8BIT_BYTE:return 8;case c.MODE_KANJI:return 8;default:throw new Error("mode:"+a)}else if(27>b)switch(a){case c.MODE_NUMBER:return 12;case c.MODE_ALPHA_NUM:return 11;case c.MODE_8BIT_BYTE:return 16;case c.MODE_KANJI:return 10;default:throw new Error("mode:"+a)}else{if(!(41>b))throw new Error("type:"+b);switch(a){case c.MODE_NUMBER:return 14;case c.MODE_ALPHA_NUM:return 13;case c.MODE_8BIT_BYTE:return 16;case c.MODE_KANJI:return 12;default:throw new Error("mode:"+a)}}},getLostPoint:function(a){for(var b=a.getModuleCount(),c=0,d=0;b>d;d++)for(var e=0;b>e;e++){for(var f=0,g=a.isDark(d,e),h=-1;1>=h;h++)if(!(0>d+h||d+h>=b))for(var i=-1;1>=i;i++)0>e+i||e+i>=b||(0!=h||0!=i)&&g==a.isDark(d+h,e+i)&&f++;f>5&&(c+=3+f-5)}for(var d=0;b-1>d;d++)for(var e=0;b-1>e;e++){var j=0;a.isDark(d,e)&&j++,a.isDark(d+1,e)&&j++,a.isDark(d,e+1)&&j++,a.isDark(d+1,e+1)&&j++,(0==j||4==j)&&(c+=3)}for(var d=0;b>d;d++)for(var e=0;b-6>e;e++)a.isDark(d,e)&&!a.isDark(d,e+1)&&a.isDark(d,e+2)&&a.isDark(d,e+3)&&a.isDark(d,e+4)&&!a.isDark(d,e+5)&&a.isDark(d,e+6)&&(c+=40);for(var e=0;b>e;e++)for(var d=0;b-6>d;d++)a.isDark(d,e)&&!a.isDark(d+1,e)&&a.isDark(d+2,e)&&a.isDark(d+3,e)&&a.isDark(d+4,e)&&!a.isDark(d+5,e)&&a.isDark(d+6,e)&&(c+=40);for(var k=0,e=0;b>e;e++)for(var d=0;b>d;d++)a.isDark(d,e)&&k++;var l=Math.abs(100*k/b/b-50)/5;return c+=10*l}},g={glog:function(a){if(1>a)throw new Error("glog("+a+")");return g.LOG_TABLE[a]},gexp:function(a){for(;0>a;)a+=255;for(;a>=256;)a-=255;return g.EXP_TABLE[a]},EXP_TABLE:new Array(256),LOG_TABLE:new Array(256)},h=0;8>h;h++)g.EXP_TABLE[h]=1<<h;for(var h=8;256>h;h++)g.EXP_TABLE[h]=g.EXP_TABLE[h-4]^g.EXP_TABLE[h-5]^g.EXP_TABLE[h-6]^g.EXP_TABLE[h-8];for(var h=0;255>h;h++)g.LOG_TABLE[g.EXP_TABLE[h]]=h;i.prototype={get:function(a){return this.num[a]},getLength:function(){return this.num.length},multiply:function(a){for(var b=new Array(this.getLength()+a.getLength()-1),c=0;c<this.getLength();c++)for(var d=0;d<a.getLength();d++)b[c+d]^=g.gexp(g.glog(this.get(c))+g.glog(a.get(d)));return new i(b,0)},mod:function(a){if(this.getLength()-a.getLength()<0)return this;for(var b=g.glog(this.get(0))-g.glog(a.get(0)),c=new Array(this.getLength()),d=0;d<this.getLength();d++)c[d]=this.get(d);for(var d=0;d<a.getLength();d++)c[d]^=g.gexp(g.glog(a.get(d))+b);return new i(c,0).mod(a)}},j.RS_BLOCK_TABLE=[[1,26,19],[1,26,16],[1,26,13],[1,26,9],[1,44,34],[1,44,28],[1,44,22],[1,44,16],[1,70,55],[1,70,44],[2,35,17],[2,35,13],[1,100,80],[2,50,32],[2,50,24],[4,25,9],[1,134,108],[2,67,43],[2,33,15,2,34,16],[2,33,11,2,34,12],[2,86,68],[4,43,27],[4,43,19],[4,43,15],[2,98,78],[4,49,31],[2,32,14,4,33,15],[4,39,13,1,40,14],[2,121,97],[2,60,38,2,61,39],[4,40,18,2,41,19],[4,40,14,2,41,15],[2,146,116],[3,58,36,2,59,37],[4,36,16,4,37,17],[4,36,12,4,37,13],[2,86,68,2,87,69],[4,69,43,1,70,44],[6,43,19,2,44,20],[6,43,15,2,44,16],[4,101,81],[1,80,50,4,81,51],[4,50,22,4,51,23],[3,36,12,8,37,13],[2,116,92,2,117,93],[6,58,36,2,59,37],[4,46,20,6,47,21],[7,42,14,4,43,15],[4,133,107],[8,59,37,1,60,38],[8,44,20,4,45,21],[12,33,11,4,34,12],[3,145,115,1,146,116],[4,64,40,5,65,41],[11,36,16,5,37,17],[11,36,12,5,37,13],[5,109,87,1,110,88],[5,65,41,5,66,42],[5,54,24,7,55,25],[11,36,12],[5,122,98,1,123,99],[7,73,45,3,74,46],[15,43,19,2,44,20],[3,45,15,13,46,16],[1,135,107,5,136,108],[10,74,46,1,75,47],[1,50,22,15,51,23],[2,42,14,17,43,15],[5,150,120,1,151,121],[9,69,43,4,70,44],[17,50,22,1,51,23],[2,42,14,19,43,15],[3,141,113,4,142,114],[3,70,44,11,71,45],[17,47,21,4,48,22],[9,39,13,16,40,14],[3,135,107,5,136,108],[3,67,41,13,68,42],[15,54,24,5,55,25],[15,43,15,10,44,16],[4,144,116,4,145,117],[17,68,42],[17,50,22,6,51,23],[19,46,16,6,47,17],[2,139,111,7,140,112],[17,74,46],[7,54,24,16,55,25],[34,37,13],[4,151,121,5,152,122],[4,75,47,14,76,48],[11,54,24,14,55,25],[16,45,15,14,46,16],[6,147,117,4,148,118],[6,73,45,14,74,46],[11,54,24,16,55,25],[30,46,16,2,47,17],[8,132,106,4,133,107],[8,75,47,13,76,48],[7,54,24,22,55,25],[22,45,15,13,46,16],[10,142,114,2,143,115],[19,74,46,4,75,47],[28,50,22,6,51,23],[33,46,16,4,47,17],[8,152,122,4,153,123],[22,73,45,3,74,46],[8,53,23,26,54,24],[12,45,15,28,46,16],[3,147,117,10,148,118],[3,73,45,23,74,46],[4,54,24,31,55,25],[11,45,15,31,46,16],[7,146,116,7,147,117],[21,73,45,7,74,46],[1,53,23,37,54,24],[19,45,15,26,46,16],[5,145,115,10,146,116],[19,75,47,10,76,48],[15,54,24,25,55,25],[23,45,15,25,46,16],[13,145,115,3,146,116],[2,74,46,29,75,47],[42,54,24,1,55,25],[23,45,15,28,46,16],[17,145,115],[10,74,46,23,75,47],[10,54,24,35,55,25],[19,45,15,35,46,16],[17,145,115,1,146,116],[14,74,46,21,75,47],[29,54,24,19,55,25],[11,45,15,46,46,16],[13,145,115,6,146,116],[14,74,46,23,75,47],[44,54,24,7,55,25],[59,46,16,1,47,17],[12,151,121,7,152,122],[12,75,47,26,76,48],[39,54,24,14,55,25],[22,45,15,41,46,16],[6,151,121,14,152,122],[6,75,47,34,76,48],[46,54,24,10,55,25],[2,45,15,64,46,16],[17,152,122,4,153,123],[29,74,46,14,75,47],[49,54,24,10,55,25],[24,45,15,46,46,16],[4,152,122,18,153,123],[13,74,46,32,75,47],[48,54,24,14,55,25],[42,45,15,32,46,16],[20,147,117,4,148,118],[40,75,47,7,76,48],[43,54,24,22,55,25],[10,45,15,67,46,16],[19,148,118,6,149,119],[18,75,47,31,76,48],[34,54,24,34,55,25],[20,45,15,61,46,16]],j.getRSBlocks=function(a,b){var c=j.getRsBlockTable(a,b);if(void 0==c)throw new Error("bad rs block @ typeNumber:"+a+"/errorCorrectLevel:"+b);for(var d=c.length/3,e=[],f=0;d>f;f++)for(var g=c[3*f+0],h=c[3*f+1],i=c[3*f+2],k=0;g>k;k++)e.push(new j(h,i));return e},j.getRsBlockTable=function(a,b){switch(b){case d.L:return j.RS_BLOCK_TABLE[4*(a-1)+0];case d.M:return j.RS_BLOCK_TABLE[4*(a-1)+1];case d.Q:return j.RS_BLOCK_TABLE[4*(a-1)+2];case d.H:return j.RS_BLOCK_TABLE[4*(a-1)+3];default:return void 0}},k.prototype={get:function(a){var b=Math.floor(a/8);return 1==(1&this.buffer[b]>>>7-a%8)},put:function(a,b){for(var c=0;b>c;c++)this.putBit(1==(1&a>>>b-c-1))},getLengthInBits:function(){return this.length},putBit:function(a){var b=Math.floor(this.length/8);this.buffer.length<=b&&this.buffer.push(0),a&&(this.buffer[b]|=128>>>this.length%8),this.length++}};var l=[[17,14,11,7],[32,26,20,14],[53,42,32,24],[78,62,46,34],[106,84,60,44],[134,106,74,58],[154,122,86,64],[192,152,108,84],[230,180,130,98],[271,213,151,119],[321,251,177,137],[367,287,203,155],[425,331,241,177],[458,362,258,194],[520,412,292,220],[586,450,322,250],[644,504,364,280],[718,560,394,310],[792,624,442,338],[858,666,482,382],[929,711,509,403],[1003,779,565,439],[1091,857,611,461],[1171,911,661,511],[1273,997,715,535],[1367,1059,751,593],[1465,1125,805,625],[1528,1190,868,658],[1628,1264,908,698],[1732,1370,982,742],[1840,1452,1030,790],[1952,1538,1112,842],[2068,1628,1168,898],[2188,1722,1228,958],[2303,1809,1283,983],[2431,1911,1351,1051],[2563,1989,1423,1093],[2699,2099,1499,1139],[2809,2213,1579,1219],[2953,2331,1663,1273]],o=function(){var a=function(a,b){this._el=a,this._htOption=b};return a.prototype.draw=function(a){function g(a,b){var c=document.createElementNS("http://www.w3.org/2000/svg",a);for(var d in b)b.hasOwnProperty(d)&&c.setAttribute(d,b[d]);return c}var b=this._htOption,c=this._el,d=a.getModuleCount();Math.floor(b.width/d),Math.floor(b.height/d),this.clear();var h=g("svg",{viewBox:"0 0 "+String(d)+" "+String(d),width:"100%",height:"100%",fill:b.colorLight});h.setAttributeNS("http://www.w3.org/2000/xmlns/","xmlns:xlink","http://www.w3.org/1999/xlink"),c.appendChild(h),h.appendChild(g("rect",{fill:b.colorDark,width:"1",height:"1",id:"template"}));for(var i=0;d>i;i++)for(var j=0;d>j;j++)if(a.isDark(i,j)){var k=g("use",{x:String(i),y:String(j)});k.setAttributeNS("http://www.w3.org/1999/xlink","href","#template"),h.appendChild(k)}},a.prototype.clear=function(){for(;this._el.hasChildNodes();)this._el.removeChild(this._el.lastChild)},a}(),p="svg"===document.documentElement.tagName.toLowerCase(),q=p?o:m()?function(){function a(){this._elImage.src=this._elCanvas.toDataURL("image/png"),this._elImage.style.display="inline",this._elCanvas.style.display="none"}function d(a,b){var c=this;if(c._fFail=b,c._fSuccess=a,null===c._bSupportDataURI){var d=document.createElement("img"),e=function(){c._bSupportDataURI=!1,c._fFail&&_fFail.call(c)},f=function(){c._bSupportDataURI=!0,c._fSuccess&&c._fSuccess.call(c)};return d.onabort=e,d.onerror=e,d.onload=f,d.src="data:image/gif;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg==",void 0}c._bSupportDataURI===!0&&c._fSuccess?c._fSuccess.call(c):c._bSupportDataURI===!1&&c._fFail&&c._fFail.call(c)}if(this._android&&this._android<=2.1){var b=1/window.devicePixelRatio,c=CanvasRenderingContext2D.prototype.drawImage;CanvasRenderingContext2D.prototype.drawImage=function(a,d,e,f,g,h,i,j){if("nodeName"in a&&/img/i.test(a.nodeName))for(var l=arguments.length-1;l>=1;l--)arguments[l]=arguments[l]*b;else"undefined"==typeof j&&(arguments[1]*=b,arguments[2]*=b,arguments[3]*=b,arguments[4]*=b);c.apply(this,arguments)}}var e=function(a,b){this._bIsPainted=!1,this._android=n(),this._htOption=b,this._elCanvas=document.createElement("canvas"),this._elCanvas.width=b.width,this._elCanvas.height=b.height,a.appendChild(this._elCanvas),this._el=a,this._oContext=this._elCanvas.getContext("2d"),this._bIsPainted=!1,this._elImage=document.createElement("img"),this._elImage.style.display="none",this._el.appendChild(this._elImage),this._bSupportDataURI=null};return e.prototype.draw=function(a){var b=this._elImage,c=this._oContext,d=this._htOption,e=a.getModuleCount(),f=d.width/e,g=d.height/e,h=Math.round(f),i=Math.round(g);b.style.display="none",this.clear();for(var j=0;e>j;j++)for(var k=0;e>k;k++){var l=a.isDark(j,k),m=k*f,n=j*g;c.strokeStyle=l?d.colorDark:d.colorLight,c.lineWidth=1,c.fillStyle=l?d.colorDark:d.colorLight,c.fillRect(m,n,f,g),c.strokeRect(Math.floor(m)+.5,Math.floor(n)+.5,h,i),c.strokeRect(Math.ceil(m)-.5,Math.ceil(n)-.5,h,i)}this._bIsPainted=!0},e.prototype.makeImage=function(){this._bIsPainted&&d.call(this,a)},e.prototype.isPainted=function(){return this._bIsPainted},e.prototype.clear=function(){this._oContext.clearRect(0,0,this._elCanvas.width,this._elCanvas.height),this._bIsPainted=!1},e.prototype.round=function(a){return a?Math.floor(1e3*a)/1e3:a},e}():function(){var a=function(a,b){this._el=a,this._htOption=b};return a.prototype.draw=function(a){for(var b=this._htOption,c=this._el,d=a.getModuleCount(),e=Math.floor(b.width/d),f=Math.floor(b.height/d),g=['<table style="border:0;border-collapse:collapse;">'],h=0;d>h;h++){g.push("<tr>");for(var i=0;d>i;i++)g.push('<td style="border:0;border-collapse:collapse;padding:0;margin:0;width:'+e+"px;height:"+f+"px;background-color:"+(a.isDark(h,i)?b.colorDark:b.colorLight)+';"></td>');g.push("</tr>")}g.push("</table>"),c.innerHTML=g.join("");var j=c.childNodes[0],k=(b.width-j.offsetWidth)/2,l=(b.height-j.offsetHeight)/2;k>0&&l>0&&(j.style.margin=l+"px "+k+"px")},a.prototype.clear=function(){this._el.innerHTML=""},a}();QRCode=function(a,b){if(this._htOption={width:256,height:256,typeNumber:4,colorDark:"#000000",colorLight:"#ffffff",correctLevel:d.H},"string"==typeof b&&(b={text:b}),b)for(var c in b)this._htOption[c]=b[c];"string"==typeof a&&(a=document.getElementById(a)),this._android=n(),this._el=a,this._oQRCode=null,this._oDrawing=new q(this._el,this._htOption),this._htOption.text&&this.makeCode(this._htOption.text)},QRCode.prototype.makeCode=function(a){this._oQRCode=new b(r(a,this._htOption.correctLevel),this._htOption.correctLevel),this._oQRCode.addData(a),this._oQRCode.make(),this._el.title=a,this._oDrawing.draw(this._oQRCode),this.makeImage()},QRCode.prototype.makeImage=function(){"function"==typeof this._oDrawing.makeImage&&(!this._android||this._android>=3)&&this._oDrawing.makeImage()},QRCode.prototype.clear=function(){this._oDrawing.clear()},QRCode.CorrectLevel=d}();]]>
        </script>

        <style type="text/css">
          body {
          background-color: #FFFFFF;
          font-family: 'Tahoma', "Times New Roman", Times, serif;
          font-size: <xsl:value-of select="$genelPunto"/>pt;
          color: #666666;
          <xsl:if test="$darDokummu">
            line-height: 14px;
          </xsl:if>
          }
          h1, h2 {
          padding-bottom: 3px;
          padding-top: 3px;
          margin-bottom: 5px;
          text-transform: uppercase;
          font-family: Arial, Helvetica, sans-serif;
          }
          h1 {
          font-size: 1.4em;
          /* font-size: <xsl:value-of select="$genelPunto + 3"/>pt; */
          text-transform:none;
          }
          h2 {
          font-size: 1em;
          /* font-size: <xsl:value-of select="$genelPunto + 1"/>pt; */
          color: brown;
          }
          h3 {
          font-size: 1em;
          /* font-size: <xsl:value-of select="$genelPunto + 1"/>pt; */
          color: #333333;
          text-align: justify;
          margin: 0;
          padding: 0;
          }
          h4 {
          font-size: 1.1em;
          /* font-size: <xsl:value-of select="$genelPunto + 2"/>pt; */
          font-style: bold;
          font-family: Arial, Helvetica, sans-serif;
          color: #000000;
          margin: 0;
          padding: 0;
          }
          hr {
          height:2px;
          color: #000000;
          background-color: #000000;
          border-bottom: 1px solid #000000;
          }
          .hr{
          border-top:3px solid #ccc;
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
            font-size: 11px;
            width: 280px;
            float: right;
            border-color: gray;
          }
          #despatchTable > tbody tr td {
            padding: 4px;
            border: 1px solid #ccc;
            overflow-wrap: break-word !important;
	          text-wrap: balance !important;
          }
          #despatchTable > tbody tr td:nth-child(1) {
            max-width: 200px !important;
          }
          #despatchTable > tbody tr td:nth-child(2) {
            max-width: 180px !important;
          }
          #ettnTable {
            border-collapse: collapse;
            font-size: 11px;
            border-color: gray;
          }
          #customerPartyTable {
            border-width: 0px;
            border-spacing:;
            border-style: inset;
            border-color: gray;
            border-collapse: collapse;
            background-color:;
          }
          #customerIDTable {
          border-width: 2px;
          border-spacing:;
          border-style: inset;
          border-color: gray;
          border-collapse: collapse;
          background-color:;
          }
          #customerIDTableTd {
          border-width: 2px;
          border-spacing:;
          border-style: inset;
          border-color: gray;
          border-collapse: collapse;
          background-color:;
          }
          #notesTable {
          border-width: 2px;
          border-spacing:;
          border-style: inset;
          border-color: black;
          border-collapse: collapse;
          background-color:
          }
          #notesTableTd {
          border-width: 0px;
          border-spacing:;
          border-style: inset;
          border-color: black;
          border-collapse: collapse;
          margin: -10px 0 0 0;
          max-height: 150px;
          vertical-align: top;
          }
          table {
          border-spacing:0px;
          }
          #budgetContainerTable {
          border-width: 0px;
          border-spacing: 0px;
          float:right;
          border-style: inset;
          width: 320px;
          border-color: black;
          border-collapse: collapse;
          background-color:;
          margin-top: 10px;
          }
          #budgetContainerTable > tbody > tr > td:first-child {
            /*width: px;*/
          }

          #budgetContainerTable > tbody > tr:last-child {
          background-color:#dfdfdf;
          }

          #budgetContainerTable > tbody > tr > td{
            border: 1px solid #ccc;
            padding: 4px;
          }
          td {
            border-color:gray;
          }
          .malHizmetTablosu {
            margin-bottom: 10px;
          }
          .malHizmetTablosu > table {
            font-family:Verdana;
            background: #fff;
            width: 800px;
            border-collapse: collapse;
            text-align: left;
          }
          .malHizmetTablosu > table th
          {
            font-weight: normal;
            padding: 2px 5px 2px 8px;
            text-align:right;
            min-width: 30px;
            font-size: <xsl:value-of select="$genelPunto + 2"/>pt;
            color: black;
            background-color: #DFDFDF;
            border: 1px solid #ccc;
            vertical-align: middle;
            height: 35px;
          }
          .malHizmetTablosu > table th .thTopTitle {
            text-align: center;
            width: 90px;
          }
          .malHizmetTablosu > table th .thSubTitle {
            width: 47px;
            display: inline-block;
            text-align: right;
          }
          .malHizmetTablosu > table th .thSubTitle.HF {
            width: 36px;
          }
          .malHizmetTablosu > table th.alignLeft {
            text-align: left;
          }
          .malHizmetTablosu > table th.alignCenter {
            text-align: center;
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
            border-right: 1px solid #ccc;
            padding-right: 3px;
            white-space: nowrap;
            text-align: right;
          }
          .malHizmetTablosu > table td.wrap {
            white-space: normal;
            text-align: left;
            padding-left: 8px;
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

          .malHizmetTablosu > table tbody tr:hover td {
            background-color: #E4E4E4;
          }
          .malHizmetTablosu > table tbody tr:nth-child(even) td {
            background: #FFF;
          }
          .malHizmetTablosu > table tbody tr:nth-child(odd) td {
            background: #EEE;
          }
          .malHizmetTablosu > table th.alignLeft,
          .malHizmetTablosu > table td.alignLeft {
            text-align: left;
          }

          #lineTable {
            border-width: 2px;
            border-color: black;
            border-collapse: collapse;
            background-color:;
            font-size: <xsl:value-of select="$genelPunto - 1"/>pt;
          }
          td.lineTableTd {
            border-width: 1px;
            padding: 1px;
            border-style: inset;
            border-color: black;
            background-color: white;
          }
          tr.lineTableTr {
            border-width: 1px;
            padding: 0px;
            border-style: inset;
            border-color: black;
            background-color: white;
            -moz-border-radius:;
          }
          #lineTableDummyTd {
            border-width: 1px;
            border-color:white;
            padding: 1px;
            border-style: inset;
            border-color: black;
            background-color: white;
          }
          td.lineTableBudgetTd {
            border-width: 2px;
            border-spacing:0px;
            padding: 1px;
            border-style: inset;
            border-color: black;
            background-color: white;
            -moz-border-radius:;
          }

          #documanLines {
            border-collapse: collapse;
            border: 1px solid #ccc;
            padding: 3px;
          }
          #documanLines td, #documanLines th {
            text-align: left;
            border: 1px solid #ccc;
            padding: 3px;
          }
          #documanLines tr:first-child th {
          }
          #documanLines tr:last-child td {
          }
          #documanLines tr td:first-child,#documanLines tr th:first-child {
          }
          #documanLines tr td:last-child, #documanLines tr th:last-child {
          }

          #carrierInformation {
            border-collapse: collapse;
            border: 1px solid #ccc;
            padding: 3px;
            font-size: <xsl:value-of select="$genelPunto - 1"/>pt;
          }
          #carrierInformation td, #carrierInformation th {
            text-align: left;
          border: 1px solid #ccc;
          padding: 3px;
          font-size: <xsl:value-of select="$genelPunto - 1"/>pt;
          }

          #teslimEdenAlan {
          text-align: left;
          width: 788px;
          height: 65px;
          border: 1px solid #ccc;
          padding: 5px;
          margin-bottom: 8px;
          font-size: <xsl:value-of select="$genelPunto"/>pt;
          }

          #qrcode > image {
            margin: 0 auto;
          }

        </style>
        <title>e-İrsaliye</title>
      </head>
      <body style="margin-left=0.6in; margin-right=0.6in; margin-top=0.79in; margin-bottom=0.79in">
        <xsl:for-each select="$XML">
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

          <table id="content" style="border-color: blue;" border="0" cellspacing="0px" width="800" cellpadding="0px">
            <tbody>
              <tr valign="top">
                <td width="40%">
                  <div class="hr" style="margin-bottom:5px"></div>
                  <table align="center" border="0" width="100%">
                    <tbody>
                      <tr align="left">
                        <xsl:for-each select="n1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party">
                          <xsl:call-template name="Party_Title">
                            <xsl:with-param name="PartyType">SUPPLIER</xsl:with-param>
                          </xsl:call-template>
                        </xsl:for-each>
                      </tr>
                      <tr align="left">
                        <xsl:for-each select="n1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party">
                          <td align="left">
                            <xsl:for-each select="cac:PostalAddress">
                              <xsl:for-each select="cbc:StreetName">
                                <xsl:apply-templates/>
                                <xsl:text>&#160;</xsl:text>
                              </xsl:for-each>
                              <xsl:for-each select="cbc:BuildingName">
                                <xsl:apply-templates/>
                              </xsl:for-each>
                              <xsl:if test="cbc:BuildingNumber">
                                <xsl:text> No:</xsl:text>
                                <xsl:for-each select="cbc:BuildingNumber">
                                  <xsl:apply-templates/>
                                </xsl:for-each>
                                <xsl:text>&#160;</xsl:text>
                              </xsl:if>
                              <br/>
                              <xsl:for-each select="cbc:PostalZone">
                                <xsl:apply-templates/>
                                <xsl:text>&#160;</xsl:text>
                              </xsl:for-each>
                              <xsl:for-each select="cbc:CitySubdivisionName">
                                <xsl:apply-templates/>
                              </xsl:for-each>
                              <xsl:text>/ </xsl:text>
                              <xsl:for-each select="cbc:CityName">
                                <xsl:apply-templates/>
                                <xsl:text>&#160;</xsl:text>
                              </xsl:for-each>
                            </xsl:for-each>
                          </td>
                        </xsl:for-each>
                      </tr>
                      <xsl:if test="//n1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Telephone or //n1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Telefax">
                        <tr align="left">
                          <xsl:for-each select="n1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party">
                            <td align="left">
                              <xsl:for-each select="cac:Contact">
                                <xsl:if test="cbc:Telephone">
                                  <xsl:text>Tel: </xsl:text>
                                  <xsl:for-each select="cbc:Telephone">
                                    <xsl:apply-templates/>
                                  </xsl:for-each>
                                </xsl:if>
                                <xsl:if test="cbc:Telefax">
                                  <xsl:text> Fax: </xsl:text>
                                  <xsl:for-each select="cbc:Telefax">
                                    <xsl:apply-templates/>
                                  </xsl:for-each>
                                </xsl:if>
                                <xsl:text>&#160;</xsl:text>
                              </xsl:for-each>
                            </td>
                          </xsl:for-each>
                        </tr>
                      </xsl:if>
                      <xsl:for-each select="//n1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:WebsiteURI">
                        <tr align="left">
                          <td>
                            <xsl:text>Web Sitesi: </xsl:text>
                            <xsl:value-of select="."/>
                          </td>
                        </tr>
                      </xsl:for-each>
                      <xsl:for-each select="//n1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail">
                        <tr align="left">
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
                      <xsl:for-each select="n1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party">
                        <tr align="left">
                          <td align="left">
                            <xsl:text>Vergi Dairesi: </xsl:text>
                            <xsl:for-each select="cac:PartyTaxScheme">
                              <xsl:for-each select="cac:TaxScheme">
                                <xsl:for-each select="cbc:Name">
                                  <xsl:apply-templates/>
                                </xsl:for-each>
                              </xsl:for-each>
                              <xsl:text>&#160; </xsl:text>
                            </xsl:for-each>
                          </td>
                        </tr>
                      </xsl:for-each>
                      <xsl:for-each select="//n1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyIdentification">
                        <tr align="left">
                          <td>
                            <xsl:value-of select="cbc:ID/@schemeID"/>
                            <xsl:text>: </xsl:text>
                            <xsl:value-of select="cbc:ID"/>
                          </td>
                        </tr>
                      </xsl:for-each>
                    </tbody>
                  </table>
                  <div class="hr" style="margin-bottom: 5px; margin-top: 5px"></div>
                </td>
                <td width="20%" align="center" valign="middle">
                  <br/>
                  <br/>
                  <img id="eIslemLogo" style="width: 91px;" align="middle" alt="e-İrsaliye Logo"
										src="data:image/jpeg;base64,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" />
                  <h1 align="center" style="font-weight: bold;">
                      <xsl:text>e-İrsaliye</xsl:text>
                  </h1>
                </td>

                <td width="40%" rowspan="2" valign="top" align="center">
                    <xsl:choose>
                      <xsl:when test="$xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'KAREKOD_IMG']">
                        <div id="qrCodeParent" align="right" style="float: right; position: relative; right: 0; margin-bottom: 0px; margin-left: -40px;">
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
                      </xsl:when>
                      <xsl:otherwise>
                        <div id="qrvalue" style="display: none;">
                          <xsl:value-of select="n1:DespatchAdvice/cbc:UUID"/>
                        </div>
                        <div id="qrCodeParent" align="right" style="float: right; position: relative; right: -25px; margin-bottom: 0px; margin-left: -40px;">
                          <div id="qrcode"></div>
                        </div>
                        <script type="text/javascript">
                          var qrCode = new QRCode(document.getElementById("qrcode"), {
                          width: 120,
                          height: 120
                          });
                          qrCode.makeCode(document.getElementById("qrvalue").innerHTML);
                        </script>
                      </xsl:otherwise>
                    </xsl:choose>
                  
                    <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'OZEL_KAREKOD' or cbc:DocumentType = 'OZEL_KAREKOD_BASE64']">
                      <tr>
                        <td valign="top">
                          <xsl:for-each select="cbc:DocumentTypeCode">
                            <h3 id="qrtitle_ek" style="margin-botom: 8px;">
                              <xsl:value-of select="." />
                            </h3>
                          </xsl:for-each>
                          <div id="qrvalue_ek" style="display: none;">
                            <xsl:value-of select="cbc:ID"/>
                          </div>
                          <xsl:if test="cbc:ID and cbc:DocumentType = 'OZEL_KAREKOD_BASE64'">
                            <script type="text/javascript">
                              <![CDATA[
                              (function() {
                                var divQRValue = document.getElementById('qrvalue_ek');
                                divQRValue.innerHTML = atob(divQRValue.innerHTML);
                                // debugger;
                                // alert(divQRValue.innerHTML);
                              })();
                            ]]>
                            </script>
                          </xsl:if>
                          <div id="qrcode_ek"></div>
                          <script type="text/javascript">
                            var qrCode = new QRCode(document.getElementById("qrcode_ek"), {
                            width: 120,
                            height: 120
                            });
                            qrCode.makeCode(document.getElementById("qrvalue_ek").innerHTML);
                          </script>
                        </td>
                      </tr>
                    </xsl:for-each>

                  <div style="float: left; margin-top: 30px;">
                    <table id="despatchTable">
                      <tbody>
                        <tr>
                          <td style="width: 105px;" align="left">
                            <span style="font-weight: bold;">
                              <xsl:text>Özelleştirme No:</xsl:text>
                            </span>
                          </td>
                          <td style="width:110px;" align="left">
                            <xsl:for-each select="n1:DespatchAdvice/cbc:CustomizationID">
                              <xsl:apply-templates/>
                            </xsl:for-each>
                          </td>
                        </tr>
                        <tr style="height:13px; ">
                          <td align="left">
                            <span style="font-weight: bold;">
                              <xsl:text>Senaryo:</xsl:text>
                            </span>
                          </td>
                          <td align="left">
                            <xsl:for-each select="n1:DespatchAdvice/cbc:ProfileID">
                              <xsl:apply-templates/>
                            </xsl:for-each>
                          </td>
                        </tr>
                        <tr style="height:13px; ">
                          <td align="left">
                            <span style="font-weight: bold;">
                              <xsl:text>İrsaliye Tipi:</xsl:text>
                            </span>
                          </td>
                          <td align="left">
                            <xsl:for-each select="n1:DespatchAdvice/cbc:DespatchAdviceTypeCode">
                              <xsl:apply-templates/>
                            </xsl:for-each>
                          </td>
                        </tr>
                        <tr style="height:13px; ">
                          <td align="left">
                            <span style="font-weight: bold;">
                              <xsl:text>İrsaliye No:</xsl:text>
                            </span>
                          </td>
                          <td align="left">
                            <xsl:for-each select="n1:DespatchAdvice/cbc:ID">
                              <xsl:apply-templates/>
                            </xsl:for-each>
                          </td>
                        </tr>
                        <tr style="height: 13px;">
                          <td align="left">
                            <span style="font-weight: bold;">
                              <xsl:text>İrsaliye Tarihi / Zamanı:</xsl:text>
                            </span>
                          </td>
                          <td align="left">
                            <xsl:for-each select="n1:DespatchAdvice/cbc:IssueDate">
                              <xsl:value-of select="substring(.,9,2)"/>.<xsl:value-of select="substring(.,6,2)"/>.<xsl:value-of select="substring(.,1,4)"/>
                            </xsl:for-each>
                            <xsl:text> / </xsl:text>
                            <xsl:for-each select="n1:DespatchAdvice/cbc:IssueTime">
                              <xsl:apply-templates select="."/>
                            </xsl:for-each>
                          </td>
                        </tr>
                        <tr style="height: 13px;">
                          <td align="left">
                            <span style="font-weight: bold;">
                              <xsl:text>Sevk Tarihi / Zamanı:</xsl:text>
                            </span>
                          </td>
                          <td align="left">
                            <xsl:for-each select="n1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:ActualDespatchDate">
                              <xsl:value-of select="substring(.,9,2)"/>.<xsl:value-of select="substring(.,6,2)"/>.<xsl:value-of select="substring(.,1,4)"/>
                            </xsl:for-each>
                            <xsl:text> / </xsl:text>
                            <xsl:for-each select="n1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:ActualDespatchTime">
                              <xsl:apply-templates select="."/>
                            </xsl:for-each>
                          </td>
                        </tr>
                        <!--<xsl:for-each select="$xroot/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:District">
                        <tr style="height: 13px;">
                          <td align="left">
                            <span style="font-weight: bold;">
                              <xsl:text>Sevk Adresi: </xsl:text>
                            </span>
                          </td>
                          <td align="left">
                            <xsl:value-of select="." />
                          </td>
                        </tr>
                      </xsl:for-each>-->
                        <xsl:if test="n1:DespatchAdvice/cac:OrderReference">
                          <tr style="height: 13px;">
                            <td align="left">
                              <span style="font-weight: bold;">
                                <xsl:text>Sipariş No:</xsl:text>
                              </span>
                            </td>
                            <td align="left">
                              <xsl:for-each select="n1:DespatchAdvice/cac:OrderReference/cbc:ID">
                                <xsl:apply-templates/>
                              </xsl:for-each>
                            </td>
                          </tr>
                        </xsl:if>
                        <xsl:if	test="n1:DespatchAdvice/cac:OrderReference/cbc:IssueDate">
                          <tr style="height: 13px;">
                            <td align="left">
                              <span style="font-weight: bold;">
                                <xsl:text>Sipariş Tarihi:</xsl:text>
                              </span>
                            </td>
                            <td align="left">
                              <xsl:for-each select="n1:DespatchAdvice/cac:OrderReference/cbc:IssueDate">
                                <xsl:value-of select="substring(.,9,2)"/>.<xsl:value-of select="substring(.,6,2)"/>.<xsl:value-of select="substring(.,1,4)"/>
                              </xsl:for-each>
                            </td>
                          </tr>
                        </xsl:if>
                        <xsl:for-each select="$xroot/cac:AdditionalDocumentReference">
                          <!--<xsl:if test="cbc:DocumentType='PLASIYER'">
                            <tr style="height: 13px;">
                              <td align="left">
                                <span style="font-weight: bold;">
                                  <xsl:text>Plasiyer:</xsl:text>
                                </span>
                              </td>
                              <td align="left">
                                <xsl:value-of select="cbc:ID"/>
                              </td>
                            </tr>
                          </xsl:if>-->
                          <!-- Nakliye Şekli bilgisi -->
                          <!--<xsl:if test="cbc:DocumentType='NAKLIYESEKLI'">
                            <tr align="left">
                              <td>
                                <span>
                                  <xsl:text>Nakliye Şekli: </xsl:text>
                                </span>
                              </td>
                              <td>
                                <span style="font-weight:bold; ">
                                  <xsl:value-of select="cbc:ID"/>
                                </span>
                              </td>
                            </tr>
                          </xsl:if>-->
                        </xsl:for-each>
                        <xsl:if	test="$xroot/cac:ReceiptDocumentReference">
                          <tr style="height: 13px;">
                            <td align="left">
                              <span style="font-weight: bold;">
                                <xsl:text>Mal Kabul No:</xsl:text>
                              </span>
                            </td>
                            <td align="left">
                              <xsl:value-of select="cbc:ID"/>
                            </td>
                          </tr>
                        </xsl:if>
                        <xsl:for-each select="$xroot/cac:DeliveryCustomerParty/cac:Party/cac:AgentParty/cac:PartyIdentification">
                          <xsl:if	test="(./cbc:ID != '' or ./cbc:Name != '')">
                            <tr style="height: 13px;">
                              <td align="left">
                                <span style="font-weight: bold;">
                                  <xsl:text>Şube:</xsl:text>
                                </span>
                              </td>
                              <td align="left">
                                <xsl:if test="./cbc:ID">
                                  (<xsl:value-of select="./cbc:ID"/>)
                                  <xsl:text>&#160;</xsl:text>
                                </xsl:if>
                                <xsl:if test="./cbc:Name">
                                  <xsl:value-of select="./cbc:Name"/>
                                </xsl:if>
                              </td>
                            </tr>
                          </xsl:if>
                        </xsl:for-each>
                        <xsl:for-each select="$xroot/cac:AdditionalDocumentReference">
                          <xsl:choose>
                            <!--<xsl:when test="cbc:DocumentType = 'FATTIPI'">
                              <tr style="height: 13px;">
                                <td align="left">
                                  <span style="font-weight: bold;">
                                    <xsl:text>İrsaliye Ek Tipi:</xsl:text>
                                  </span>
                                </td>
                                <td align="left">
                                  <xsl:value-of select="cbc:ID"/>
                                </td>
                              </tr>
                            </xsl:when>-->
                            <xsl:when test="cbc:DocumentType = 'BAYINO'">
                              <tr style="height: 13px;">
                                <td align="left">
                                  <span style="font-weight: bold;">
                                    <xsl:text>Bayi No:</xsl:text>
                                  </span>
                                </td>
                                <td align="left">
                                  <xsl:value-of select="cbc:ID"/>
                                </td>
                              </tr>
                            </xsl:when>
                            <xsl:when test="cbc:DocumentType = 'IRSALIYEKODLIST'">
                              <tr style="height: 13px;">
                                <td align="left">
                                  <span style="font-weight: bold;">
                                    <xsl:text>İrsaliye Kodu:</xsl:text>
                                  </span>
                                </td>
                                <td align="left">
                                  <xsl:value-of select="cbc:ID"/>
                                </td>
                              </tr>
                            </xsl:when>
                            <xsl:when test="cbc:DocumentType = 'KUNYE'">
                              <tr style="height: 13px;">
                                <td align="left">
                                  <span style="font-weight: bold;">
                                    <xsl:text>Künye:</xsl:text>
                                  </span>
                                </td>
                                <td align="left">
                                  <xsl:value-of select="cbc:ID"/>
                                </td>
                              </tr>
                            </xsl:when>
                            <xsl:when test="cbc:DocumentType = 'BORSATESCIL'">
                              <tr style="height: 13px;">
                                <td align="left">
                                  <span style="font-weight: bold;">
                                    <xsl:text>Borsa Tescil:</xsl:text>
                                  </span>
                                </td>
                                <td align="left">
                                  <xsl:value-of select="cbc:ID"/>
                                </td>
                              </tr>
                            </xsl:when>
                            <xsl:when test="cbc:DocumentType = 'BASLIK_EKSAHA'">
                              <tr style="height: 13px;">
                                <td align="left">
                                  <span style="font-weight: bold;">
                                    <xsl:value-of select="cbc:DocumentTypeCode"/>
                                    <xsl:text>: </xsl:text>
                                  </span>
                                </td>
                                <td align="left">
                                  <xsl:value-of select="cbc:ID"/>
                                </td>
                              </tr>
                            </xsl:when>
                          </xsl:choose>
                        </xsl:for-each>
                      </tbody>
                    </table>
                  </div>
                </td>
              </tr>
              <tr style="height: 118px;" valign="top">
                <td width="40%" align="right" valign="top">
                  <table id="customerPartyTable" align="left" border="0">
                    <tbody>
                      <tr style="height:71px; ">
                        <td>
                          <div class="hr" style="margin-top:0px;margin-bottom:5px"></div>
                          <table align="center" border="0">
                            <tbody>
                              <tr>
                                <xsl:for-each select="n1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party">
                                  <td style="width: 470px;" align="left">
                                    <xsl:if test="$mustKod">
                                      <div>
                                        <span style="color: #909090;">
                                          <xsl:text>(</xsl:text>
                                          <xsl:value-of select="$mustKod" />
                                          <xsl:text>)</xsl:text>
                                        </span>
                                      </div>
                                    </xsl:if>
                                    <span id="sayinEtiket" style="font-weight: bold;">
                                      <xsl:text>SAYIN</xsl:text>
                                    </span>
                                  </td>
                                </xsl:for-each>
                              </tr>
                              <tr>
                                <xsl:choose>
                                  <xsl:when test="n1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeID='PARTYTYPE' and text()='TAXFREE']">
                                    <xsl:for-each select="n1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party">
                                      <xsl:call-template name="Party_Title">
                                        <xsl:with-param name="PartyType">TAXFREE</xsl:with-param>
                                      </xsl:call-template>
                                    </xsl:for-each>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:for-each select="n1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party">
                                      <xsl:call-template name="Party_Title">
                                        <xsl:with-param name="PartyType">OTHER</xsl:with-param>
                                      </xsl:call-template>
                                    </xsl:for-each>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </tr>
                              <xsl:choose>
                                <xsl:when test="n1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeID='PARTYTYPE' and text()='TAXFREE']">
                                  <xsl:for-each select="n1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party">
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
                                  <xsl:for-each select="n1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party">
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
                            </tbody>
                          </table>
                          <div class="hr" style="margin-top: 5px;"></div>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                  <br/>
                </td>

                <td width="30%" valign="top" align="center">
                  <div id="firmaLogoParent" style="position: relative; margin-top: 0; vertical-align: middle; text-align: center;">
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

                <td width="40%" align="right" valign="top" colspan="2" style="padding-top: 1em;">
                  
                </td>
              </tr>
              <tr align="left">
                <td align="left" valign="top" id="ettnTable">
                  <span style="font-weight: bold;">
                    <xsl:text>ETTN:&#160;</xsl:text>
                  </span>
                  <xsl:for-each select="n1:DespatchAdvice/cbc:UUID">
                    <xsl:apply-templates/>
                  </xsl:for-each>
                </td>

                <td>
                  &#160;
                </td>

                <td>
                  &#160;
                </td>
              </tr>
            </tbody>
          </table>
          <div id="lineTableAligner">
            <span>
              <xsl:text>&#160;</xsl:text>
            </span>
          </div>
          <div class="malHizmetTablosu">
            <table id="lineTable">
              <tbody>
                <tr>
                  <th style="width: 50px;">
                    <span>
                      <xsl:text>Sıra No</xsl:text>
                    </span>
                  </th>
                  <xsl:if test="$satirdaBarkodGosterilirmi and $xroot/cac:DespatchLine/cac:Item/cac:ManufacturersItemIdentification/cbc:ID">
                    <th class="alignLeft" style="width: 100px; max-width: 120px;">
                      <span>
                        <xsl:text>Barkod</xsl:text>
                      </span>
                    </th>
                  </xsl:if>
                  <xsl:if test="$xroot/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ID">
                    <th class="alignLeft" style="width: 80px; max-width: 150px;">
                      <span>
                        <xsl:text>Mal Hizmet Kod</xsl:text>
                      </span>
                    </th>
                  </xsl:if>
                  <th class="alignLeft" style="min-width: 300px; width: 300px; max-width: 400px;">
                    <span>
                      <xsl:text>Mal Hizmet Adı</xsl:text>
                    </span>
                  </th>
                  <!-- Kategori Detayı -->
                  <xsl:if test="$xroot/cac:DespatchLine/cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID = 'KATDETAY']">
                    <th class="alignLeft" style="width: 120px;">
                      <xsl:text>Kategori Detayı</xsl:text>
                    </th>
                  </xsl:if>
                  <!-- Takip No -->
                  <xsl:if test="$xroot/cac:DespatchLine/cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID = 'TAKIP_NO']">
                    <th class="alignLeft" style="width: 50px; max-width: 120px;">
                      <xsl:choose>
                        <xsl:when test="$xroot/cac:DespatchLine/cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID = 'TAKIP_NO_ETIKET']">
                          <xsl:value-of select="($xroot/cac:DespatchLine/cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID = 'TAKIP_NO_ETIKET'])[1]"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:text>Takip No</xsl:text>
                        </xsl:otherwise>
                      </xsl:choose>
                    </th>
                  </xsl:if>
                  <xsl:if test="$xroot/cac:DespatchLine/cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID = 'KOLI_GORUNUM']">
                    <th style="width: 80px;">
                      <span>
                        <xsl:text>KOLİ</xsl:text>
                      </span>
                    </th>
                  </xsl:if>
                  <th style="width: 70px; max-width: 80px;">
                    <span>
                      <xsl:text>Miktar</xsl:text>
                    </span>
                  </th>
                  <xsl:if test="$satirdaMiktar2Gosterilirmi and $xroot/cac:DespatchLine/cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID = 'MIKTAR2GORUNUM']">
                    <th style="width: 70px; max-width: 80px;">
                      <span>
                        <xsl:text>Miktar 2</xsl:text>
                      </span>
                    </th>
                  </xsl:if>
                  <xsl:if test="$fiyatBedelGosterilirmi">
                    <th style="width: 90px;">
                      <span>
                        <xsl:text>Birim Fiyat</xsl:text>
                      </span>
                    </th>
                    <xsl:if test="not($fiyatGosterimKurali = 'NT')">
                      <xsl:if test="$xroot/cac:DespatchLine/cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID = 'ISKORANLARGORUNUM']">
                        <th style="width: 80px; max-width: 90px;">
                          <span>
                            <xsl:text>İsk. Oranları</xsl:text>
                          </span>
                        </th>
                      </xsl:if>
                      <xsl:if test="$xroot/cac:DespatchLine/cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID = 'ISKTOPBEDELGORUNUM']">
                        <th style="width: 80px; max-width: 90px;">
                          <span>
                            <xsl:text>İsk. Bedeli</xsl:text>
                          </span>
                        </th>
                      </xsl:if>
                    </xsl:if>
                  </xsl:if>
                  <xsl:if test="$xroot/cac:DespatchLine/cbc:OutstandingQuantity">
                    <th style="width: 80px;">
                      <span>
                        <xsl:text>Sonra Gönder. Miktar</xsl:text>
                      </span>
                    </th>
                  </xsl:if>
                  <xsl:if test="$fiyatBedelGosterilirmi">
                    <th style="width: 100px;">
                      <span>
                        <xsl:text>Tutar</xsl:text>
                      </span>
                    </th>
                  </xsl:if>
                </tr>
                <xsl:for-each select="//n1:DespatchAdvice/cac:DespatchLine">
                  <xsl:apply-templates select="."/>
                </xsl:for-each>
                <tr>
                  <td colspan="100" width="100%">
                    <table id="budgetContainerTable" align="right">
                      <xsl:if test="$fiyatBedelGosterilirmi">
                        <xsl:choose>
                          <xsl:when test="$xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'DIP_BRUT']">
                            <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'DIP_BRUT']">
                              <xsl:if test="./cbc:ID != 0">
                                <tr align="right">
                                  <td align="right" width="156px">
                                    <span style="font-weight: bold;">
                                      <xsl:text>Brüt Bedel</xsl:text>
                                    </span>
                                  </td>
                                  <td style="width: 156px; " align="right">
                                    <xsl:value-of select="format-number(./cbc:ID, $bedelFormatStr, 'european')" />
                                    <xsl:for-each select="$xroot/cac:Shipment/cac:GoodsItem/cbc:ValueAmount">
                                      <xsl:call-template name="dumpCurrency"/>
                                    </xsl:for-each>
                                  </td>
                                </tr>
                              </xsl:if>
                            </xsl:for-each>
                            <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'DIP_KDV_18']">
                              <xsl:call-template name="dipKdvSatirlariYaz">
                                <xsl:with-param name="oran">18</xsl:with-param>
                              </xsl:call-template>
                            </xsl:for-each>
                            <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'DIP_KDV_8']">
                              <xsl:call-template name="dipKdvSatirlariYaz">
                                <xsl:with-param name="oran">8</xsl:with-param>
                              </xsl:call-template>
                            </xsl:for-each>
                            <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'DIP_KDV_1']">
                              <xsl:call-template name="dipKdvSatirlariYaz">
                                <xsl:with-param name="oran">1</xsl:with-param>
                              </xsl:call-template>
                            </xsl:for-each>
                            <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentType = 'DIP_SONUC']">
                              <tr align="right">
                                <td align="right" width="156px">
                                  <span style="font-weight: bold;">
                                    <xsl:text>Ödenecek Tutar</xsl:text>
                                  </span>
                                </td>
                                <td style="width: 156px; " align="right">
                                  <xsl:value-of select="format-number(./cbc:ID, $bedelFormatStr, 'european')" />
                                  <xsl:for-each select="$xroot/cac:Shipment/cac:GoodsItem/cbc:ValueAmount">
                                    <xsl:call-template name="dumpCurrency"/>
                                  </xsl:for-each>
                                </td>
                              </tr>
                            </xsl:for-each>
                          </xsl:when>
                          <xsl:otherwise>
                            <tr align="right">
                              <td align="right" width="156px">
                                <span style="font-weight: bold;">
                                  <xsl:text>Toplam Tutar</xsl:text>
                                </span>
                              </td>
                              <td style="width: 156px; " align="right">
                                <xsl:for-each select="$xroot/cac:Shipment/cac:GoodsItem/cbc:ValueAmount">
                                  <xsl:value-of select="format-number(., $bedelFormatStr, 'european')" />
                                  <xsl:call-template name="dumpCurrency"/>
                                </xsl:for-each>
                              </td>
                            </tr>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:if>
                    </table>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </xsl:for-each>

        <br/>

        <xsl:if test="//n1:DespatchAdvice/cac:AdditionalDocumentReference [cbc:DocumentTypeCode = 'EK_DOKUMAN']">
          <table id="documanLines" style="width:800px; margin-top:20px">
            <thead>
              <tr>
                <th colspan="4" style="text-align: center;">İlgili Dökümanlar</th>
              </tr>
              <tr>
                <th>Doküman No</th>
                <th>Tarih</th>
                <th>Doküman Tipi</th>
                <th>Açıklama</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="//n1:DespatchAdvice/cac:AdditionalDocumentReference [cbc:DocumentTypeCode = 'EK_DOKUMAN']">
                <tr>
                  <td>
                    <xsl:value-of select="./cbc:ID"/>
                  </td>
                  <td>
                    <xsl:for-each select="./cbc:IssueDate">
                      <xsl:apply-templates select="."/>
                    </xsl:for-each>
                  </td>
                  <td>
                    <xsl:value-of select="./cbc:DocumentType"/>
                  </td>
                  <td>
                    <xsl:value-of select="./cbc:DocumentDescription"/>
                  </td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
        </xsl:if>

        <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentTypeCode = 'SEVK_ADRESI']">
          <div id="sevkAdresAlani" style="vertical-align: top; text-align: left; /* width: 800px; border: 1px solid black; */">
            <!--<h1 style="color: #777777; font-decoration: underline; margin: 0;">Sevk Adresi</h1>-->
            <div>
              <!-- Sevk Adres Adı -->
              <span style="font-weight: bold; color: #777777;">
                <xsl:text>Sevk: </xsl:text>
              </span>
              <span style="font-weight: bold; color: #444444;">
                <xsl:value-of select="./cbc:ID" />
              </span>
            </div>

            <div>
              <!-- Sevk Adres İçerik -->
              <xsl:for-each select="$xroot/cac:AdditionalDocumentReference [cbc:DocumentTypeCode = 'SEVK_ADRESI_ICERIK' and cbc:DocumentType = ./cbc:DocumentType]">
                <xsl:value-of select="./cbc:ID" />
                <br/>
              </xsl:for-each>
            </div>
          </div>

          <br/>
          <br/>
        </xsl:for-each>

        <!-- <xsl:for-each select="$xroot/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress">
          <div id="sevkAdresAlani" style="vertical-align: top; text-align: left; margin-top: 2em; border: 1px solid black;">
            <h1 style="color: #777777; font-decoration: underline; margin: 0;">Sevk Adresi</h1>
            <xsl:for-each select="cbc:ID">
              <div>
                <span style="font-weight: bold;">
                  <xsl:value-of select="." />
                </span>
              </div>
            </xsl:for-each>
            <xsl:call-template name = "Adres"/>
          </div>
        </xsl:for-each> -->

        <div id="teslimEdenAlan" align="left">
          <table width="100%">
            <tr align="left">
              <td id="notesTableTd1">
                <b>&#160;&#160;&#160;&#160;&#160; Teslim Eden</b>
                <br/>
                <b>&#160;&#160;&#160;&#160;&#160; İmza </b>
                <br/>
                <br/>
              </td>
              <td id="notesTableTd1">
                <b>&#160;&#160;&#160;&#160;&#160; Teslim Alan </b>
                <br/>
                <b>&#160;&#160;&#160;&#160;&#160; İmza </b>
                <br/>
                <br/>
              </td>
            </tr>
          </table>
        </div>

        <table id="carrierInformation" width="800" align="left">
          <tr>
            <th align="left">
              <span style="font-weight:bold;" align="center">&#160;&#160;&#160;&#160;&#160;Açıklamalar</span>
            </th>
            <th align="left">
              <span style="font-weight:bold;" align="center">&#160;&#160;&#160;&#160;&#160;Taşıyıcı Bilgileri</span>
            </th>
          </tr>
          <tr align="left">
            <td id="notesTableTd">
              <xsl:for-each select="$xroot/cbc:Note">
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
              </xsl:for-each>
              <xsl:for-each select="//cac:SellerSupplierParty">
                <b>&#160;&#160;&#160;&#160;&#160;&#160;Asıl Satıcı VKN: </b>
                <xsl:value-of select="cac:Party/cac:PartyIdentification/cbc:ID"/>
                <br/>
                <b>&#160;&#160;&#160;&#160;&#160;&#160;Asıl Satıcı Ünvan: </b>
                <xsl:value-of select="cac:Party/cac:PartyName/cbc:Name"/>
                <br/>
              </xsl:for-each>
              <xsl:for-each select="//cac:BuyerCustomerParty">
                <b>&#160;&#160;&#160;&#160;&#160;&#160;Asıl Alıcı VKN: </b>
                <xsl:value-of select="cac:Party/cac:PartyIdentification/cbc:ID"/>
                <br/>
                <b>&#160;&#160;&#160;&#160;&#160;&#160;Asıl Alıcı Ünvan: </b>
                <xsl:value-of select="cac:Party/cac:PartyName/cbc:Name"/>
                <br/>
              </xsl:for-each>
              <xsl:for-each select="//cac:OriginatorCustomerParty">
                <b>&#160;&#160;&#160;&#160;&#160;&#160;İşlemleri Başlatan Alıcı VKN: </b>
                <xsl:value-of select="cac:Party/cac:PartyIdentification/cbc:ID"/>
                <br/>
                <b>&#160;&#160;&#160;&#160;&#160;&#160;İşlemleri Başlatan Alıcı Ünvan: </b>
                <xsl:value-of select="cac:Party/cac:PartyName/cbc:Name"/>
                <br/>
              </xsl:for-each>
              <xsl:for-each select="//cac:DespatchSupplierParty/cac:Party/cac:Person">
                <xsl:if	test="cbc:FirstName">
                  <b>&#160;&#160;&#160;&#160;&#160; Teslim Eden: </b>
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
                    <xsl:text>&#160;</xsl:text>
                  </xsl:for-each>
                  <xsl:for-each select="cbc:FamilyName">
                    <xsl:apply-templates/>
                    <xsl:text>&#160;</xsl:text>
                  </xsl:for-each>
                  <xsl:for-each select="cbc:NameSuffix">
                    <xsl:apply-templates/>
                  </xsl:for-each>
                  <br/>
                </xsl:if>
              </xsl:for-each>
            </td>
            <td id="notesTableTd">
              <xsl:for-each select="//cac:CarrierParty">
                <b>&#160;&#160;&#160;&#160;&#160;&#160; Taşıyıcı Firma: </b>
                VKN: <xsl:value-of select="./cac:PartyIdentification/cbc:ID"/>, <xsl:value-of select="./cac:PartyName/cbc:Name"/>
                <br/>
              </xsl:for-each>
              <xsl:for-each select="//cac:ShipmentStage/cac:TransportMeans/cac:RoadTransport/cbc:LicensePlateID">
                <b>&#160;&#160;&#160;&#160;&#160;&#160; Araç plaka numarası: </b>
                <xsl:value-of select="."/>
                <br/>
              </xsl:for-each>
              <xsl:for-each select="//cac:TransportHandlingUnit/cac:TransportEquipment/cbc:ID[@schemeID = 'DORSEPLAKA']">
                <b>&#160;&#160;&#160;&#160;&#160;&#160; Dorse plaka numarası: </b>
                <xsl:value-of select="."/>
                <br/>
              </xsl:for-each>
              <xsl:for-each select="//cac:ShipmentStage/cac:DriverPerson">
                <xsl:if	test="cbc:FirstName">
                  <b>&#160;&#160;&#160;&#160;&#160;&#160; Şoför: </b>
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
                    <xsl:text>&#160;</xsl:text>
                  </xsl:for-each>
                  <xsl:for-each select="cbc:FamilyName">
                    <xsl:apply-templates/>
                    <xsl:text>&#160;</xsl:text>
                  </xsl:for-each>, TCKN:
                  <xsl:for-each select="cbc:NationalityID">
                    <xsl:apply-templates/>
                  </xsl:for-each>
                  <br/>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>

        <div id="altBilgiParent" align="left" cellspacing="0" cellpadding="0" style="width: 800px; margin-top: 0;">
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

  <xsl:template match="//n1:DespatchAdvice/cac:DespatchLine">
    <tr>
      <td>
        <xsl:text>&#160;</xsl:text>
        <xsl:value-of select="./cbc:ID"/>
      </td>
      <!-- Barkod -->
      <xsl:if test="$satirdaBarkodGosterilirmi and $xroot/cac:DespatchLine/cac:Item/cac:ManufacturersItemIdentification/cbc:ID">
        <td class="alignLeft">
          <xsl:text>&#160;</xsl:text>
          <xsl:value-of select="./cac:Item/cac:ManufacturersItemIdentification/cbc:ID"/>
        </td>
      </xsl:if>
      <!-- Mal Hizmet Kod -->
      <xsl:if test="$xroot/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ID">
        <td class="alignLeft">
          <xsl:text>&#160;</xsl:text>
          <xsl:value-of select="./cac:Item/cac:SellersItemIdentification/cbc:ID"/>
        </td>
      </xsl:if>
      <!-- Mal Hizmet Adı -->
      <td class="wrap">
        <xsl:text>&#160;</xsl:text>
        <xsl:value-of select="./cac:Item/cbc:Name"/>
      </td>
      <!-- Kategori Detayı -->
      <xsl:if test="$xroot/cac:DespatchLine/cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID = 'KATDETAY']">
        <td class="wrap">
          <xsl:text>&#160;</xsl:text>
          <xsl:value-of select="./cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID = 'KATDETAY']"/>
        </td>
      </xsl:if>
      <!-- Takip No -->
      <xsl:if test="$xroot/cac:DespatchLine/cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID = 'TAKIP_NO']">
        <td class="wrap">
          <xsl:text>&#160;</xsl:text>
          <xsl:value-of select="./cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID = 'TAKIP_NO']"/>
        </td>
      </xsl:if>
      <xsl:if test="$xroot/cac:DespatchLine/cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID = 'KOLI_GORUNUM']">
        <td align="right">
          <span>
            <xsl:text>&#160;</xsl:text>
            <xsl:for-each select="./cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID = 'KOLI_GORUNUM']">
              <xsl:value-of select="."/>
            </xsl:for-each>
          </span>
        </td>
      </xsl:if>
      <!-- Miktar -->
      <td>
        <xsl:text>&#160;</xsl:text>
        <xsl:value-of select="format-number(./cbc:DeliveredQuantity, '#.###.###,########', 'european')"/>
        <xsl:if test="./cbc:DeliveredQuantity/@unitCode">
          <xsl:for-each select="./cbc:DeliveredQuantity">
            <xsl:text> </xsl:text>
            <xsl:choose>
              <xsl:when test="@unitCode  = '26'">
                <xsl:text>ton</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'BX'">
                <xsl:text>Kutu</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'LTR'">
                <xsl:text>lt</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'C62'">
                <xsl:text>Adet</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'NIU'">
                <xsl:text>Adet</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'KGM'">
                <xsl:text>kg</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'KJO'">
                <xsl:text>kJ</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'GRM'">
                <xsl:text>g</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'MGM'">
                <xsl:text>mg</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'NT'">
                <xsl:text>Net Ton</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'GT'">
                <xsl:text>Gross Ton</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'MTR'">
                <xsl:text>m</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'MMT'">
                <xsl:text>mm</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'KTM'">
                <xsl:text>km</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'MLT'">
                <xsl:text>ml</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'MMQ'">
                <xsl:text>mm3</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'PR'">
                <xsl:text> Çift</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'CLT'">
                <xsl:text>cl</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'CMK'">
                <xsl:text>cm2</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'CMQ'">
                <xsl:text>cm3</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'CMT'">
                <xsl:text>cm</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'MTK'">
                <xsl:text>m2</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'MTQ'">
                <xsl:text>m3</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'DAY'">
                <xsl:text> Gün</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'MON'">
                <xsl:text> Ay</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'PA'">
                <xsl:text> Paket</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'KWH'">
                <xsl:text> KWH</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'ANN'">
                <xsl:text> Yıl</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'HUR'">
                <xsl:text> Saat</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'D61'">
                <xsl:text> Dakika</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'D62'">
                <xsl:text> Saniye</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'CCT'">
                <xsl:text> Ton baş.taşıma kap.</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'D30'">
                <xsl:text> Brüt kalori</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'D40'">
                <xsl:text> 1000 lt</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'LPA'">
                <xsl:text> saf alkol lt</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'B32'">
                <xsl:text> kg.m2</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'NCL'">
                <xsl:text> hücre adet</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'PR'">
                <xsl:text> Çift</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'R9'">
                <xsl:text> 1000 m3</xsl:text>
              </xsl:when>
              <xsl:when test="@unitCode  = 'SET'">
                <xsl:text> Set</xsl:text>
              </xsl:when>
			<xsl:when test="@unitCode  = 'BG'">
			  <span>
				<xsl:text> Torba</xsl:text>
			  </span>
			</xsl:when>
              <xsl:when test="@unitCode  = 'T3'">
                <xsl:text> 1000 adet</xsl:text>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
        </xsl:if>
      </td>
      <xsl:if test="$satirdaMiktar2Gosterilirmi and $xroot/cac:DespatchLine/cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID = 'MIKTAR2GORUNUM']">
        <!-- Miktar 2-->
        <td>
          <xsl:text>&#160;</xsl:text>
          <xsl:value-of select="format-number(./cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID = 'MIKTAR2GORUNUM'], '###.###,####', 'european')"/>
          <xsl:if test="./cbc:DeliveredQuantity/@unitCode">
            <xsl:for-each select="./cbc:DeliveredQuantity">
              <xsl:text> </xsl:text>
              <xsl:choose>
                <xsl:when test="@unitCode  = '26'">
                  <xsl:text>ton</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'BX'">
                  <xsl:text>Kutu</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'LTR'">
                  <xsl:text>lt</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'C62'">
                  <xsl:text>Adet</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'NIU'">
                  <xsl:text>Adet</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'KGM'">
                  <xsl:text>kg</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'KJO'">
                  <xsl:text>kJ</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'GRM'">
                  <xsl:text>g</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'MGM'">
                  <xsl:text>mg</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'NT'">
                  <xsl:text>Net Ton</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'GT'">
                  <xsl:text>Gross Ton</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'MTR'">
                  <xsl:text>m</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'MMT'">
                  <xsl:text>mm</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'KTM'">
                  <xsl:text>km</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'MLT'">
                  <xsl:text>ml</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'MMQ'">
                  <xsl:text>mm3</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'CLT'">
                  <xsl:text>cl</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'CMK'">
                  <xsl:text>cm2</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'CMQ'">
                  <xsl:text>cm3</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'CMT'">
                  <xsl:text>cm</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'MTK'">
                  <xsl:text>m2</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'MTQ'">
                  <xsl:text>m3</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'DAY'">
                  <xsl:text> Gün</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'MON'">
                  <xsl:text> Ay</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'PA'">
                  <xsl:text> Paket</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'KWH'">
                  <xsl:text> KWH</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'ANN'">
                  <xsl:text> Yıl</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'HUR'">
                  <xsl:text> Saat</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'D61'">
                  <xsl:text> Dakika</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'D62'">
                  <xsl:text> Saniye</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'CCT'">
                  <xsl:text> Ton baş.taşıma kap.</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'D30'">
                  <xsl:text> Brüt kalori</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'D40'">
                  <xsl:text> 1000 lt</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'LPA'">
                  <xsl:text> saf alkol lt</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'B32'">
                  <xsl:text> kg.m2</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'NCL'">
                  <xsl:text> hücre adet</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'PR'">
                  <xsl:text> Çift</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'R9'">
                  <xsl:text> 1000 m3</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'SET'">
                  <xsl:text> Set</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'T3'">
                  <xsl:text> 1000 adet</xsl:text>
                </xsl:when>
              </xsl:choose>
            </xsl:for-each>
          </xsl:if>
        </td>
      </xsl:if>
      <xsl:if test="$fiyatBedelGosterilirmi">
        <!-- Fiyat -->
        <td align="right">
          <xsl:text>&#160;</xsl:text>
          <xsl:value-of select="format-number(./cac:Shipment/cac:GoodsItem/cac:InvoiceLine/cac:Price/cbc:PriceAmount, $fiyatFormatStr, 'european')"/>
          <xsl:if test="./cac:Shipment/cac:GoodsItem/cac:InvoiceLine/cac:Price/cbc:PriceAmount/@currencyID">
            <xsl:text>&#160;</xsl:text>
            <xsl:if test="./cac:Shipment/cac:GoodsItem/cac:InvoiceLine/cac:Price/cbc:PriceAmount/@currencyID = &quot;TRL&quot; or ./cac:Shipment/cac:GoodsItem/cac:InvoiceLine/cac:Price/cbc:PriceAmount/@currencyID = &quot;TRY&quot;">
              <xsl:text>TL</xsl:text>
            </xsl:if>
            <xsl:if test="./cac:Shipment/cac:GoodsItem/cac:InvoiceLine/cac:Price/cbc:PriceAmount/@currencyID != &quot;TRL&quot; and ./cac:Shipment/cac:GoodsItem/cac:InvoiceLine/cac:Price/cbc:PriceAmount/@currencyID != &quot;TRY&quot;">
              <xsl:value-of select="./cac:Shipment/cac:GoodsItem/cac:InvoiceLine/cac:Price/cbc:PriceAmount/@currencyID"/>
            </xsl:if>
          </xsl:if>
        </td>
        <xsl:if test="not($fiyatGosterimKurali = 'NT')">
          <xsl:for-each select="cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID = 'ISKORANLARGORUNUM']">
            <td class="wrap">
              <xsl:text>&#160;</xsl:text>
              <xsl:value-of select="."/>
              <xsl:value-of select="$space"/>
            </td>
          </xsl:for-each>
          <xsl:for-each select="cac:Item/cac:AdditionalItemIdentification/cbc:ID [@schemeID = 'ISKTOPBEDELGORUNUM']">
            <td align="right">
              <xsl:text>&#160;</xsl:text>
              <xsl:value-of select="."/>
              <xsl:value-of select="$space"/>
            </td>
          </xsl:for-each>
        </xsl:if>
      </xsl:if>
      <xsl:if test="$xroot/cac:DespatchLine/cbc:OutstandingQuantity">
        <!-- Sonra Gönderilecek Miktar -->
        <td align="right">
          <xsl:text>&#160;</xsl:text>
          <xsl:value-of select="format-number(./cbc:OutstandingQuantity, '###.###,####', 'european')"/>
          <xsl:if test="./cbc:OutstandingQuantity/@unitCode">
            <xsl:for-each select="./cbc:OutstandingQuantity">
              <xsl:text> </xsl:text>
              <xsl:choose>
                <xsl:when test="@unitCode  = '26'">
                  <xsl:text>ton</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'BX'">
                  <xsl:text>Kutu</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'LTR'">
                  <xsl:text>lt</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'C62'">
                  <xsl:text>Adet</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'NIU'">
                  <xsl:text>Adet</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'KGM'">
                  <xsl:text>kg</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'KJO'">
                  <xsl:text>kJ</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'GRM'">
                  <xsl:text>g</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'MGM'">
                  <xsl:text>mg</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'NT'">
                  <xsl:text>Net Ton</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'GT'">
                  <xsl:text>Gross Ton</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'MTR'">
                  <xsl:text>m</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'MMT'">
                  <xsl:text>mm</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'KTM'">
                  <xsl:text>km</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'MLT'">
                  <xsl:text>ml</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'MMQ'">
                  <xsl:text>mm3</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'CLT'">
                  <xsl:text>cl</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'CMK'">
                  <xsl:text>cm2</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'CMQ'">
                  <xsl:text>cm3</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'CMT'">
                  <xsl:text>cm</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'MTK'">
                  <xsl:text>m2</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'MTQ'">
                  <xsl:text>m3</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'DAY'">
                  <xsl:text> Gün</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'MON'">
                  <xsl:text> Ay</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'PA'">
                  <xsl:text> Paket</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'KWH'">
                  <xsl:text> KWH</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'ANN'">
                  <xsl:text> Yıl</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'HUR'">
                  <xsl:text> Saat</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'D61'">
                  <xsl:text> Dakika</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'D62'">
                  <xsl:text> Saniye</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'CCT'">
                  <xsl:text> Ton baş.taşıma kap.</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'D30'">
                  <xsl:text> Brüt kalori</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'D40'">
                  <xsl:text> 1000 lt</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'LPA'">
                  <xsl:text> saf alkol lt</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'B32'">
                  <xsl:text> kg.m2</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'NCL'">
                  <xsl:text> hücre adet</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'PR'">
                  <xsl:text> Çift</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'R9'">
                  <xsl:text> 1000 m3</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'SET'">
                  <xsl:text> Set</xsl:text>
                </xsl:when>
                <xsl:when test="@unitCode  = 'T3'">
                  <xsl:text> 1000 adet</xsl:text>
                </xsl:when>
              </xsl:choose>
            </xsl:for-each>
          </xsl:if>
        </td>
      </xsl:if>
      <xsl:if test="$fiyatBedelGosterilirmi">
        <!-- Bedel (Tutar) -->
        <td align="right">
          <xsl:text>&#160;</xsl:text>
          <xsl:value-of select="format-number(./cac:Shipment/cac:GoodsItem/cac:InvoiceLine/cbc:LineExtensionAmount, $bedelFormatStr, 'european')"/>
          <xsl:if test="./cac:Shipment/cac:GoodsItem/cac:InvoiceLine/cbc:LineExtensionAmount/@currencyID">
            <xsl:text>&#160;</xsl:text>
            <xsl:if test="./cac:Shipment/cac:GoodsItem/cac:InvoiceLine/cbc:LineExtensionAmount/@currencyID = &quot;TRL&quot; or ./cac:Shipment/cac:GoodsItem/cac:InvoiceLine/cbc:LineExtensionAmount/@currencyID = &quot;TRY&quot;">
              <xsl:text>TL</xsl:text>
            </xsl:if>
            <xsl:if test="./cac:Shipment/cac:GoodsItem/cac:InvoiceLine/cbc:LineExtensionAmount/@currencyID != &quot;TRL&quot; and ./cac:Shipment/cac:GoodsItem/cac:InvoiceLine/cbc:LineExtensionAmount/@currencyID != &quot;TRY&quot;">
              <xsl:value-of select="./cac:Shipment/cac:GoodsItem/cac:InvoiceLine/cbc:LineExtensionAmount/@currencyID"/>
            </xsl:if>
          </xsl:if>
        </td>
      </xsl:if>
    </tr>
    <!-- Açıklama Satırı -->
    <xsl:for-each select="./cbc:Note[substring(., 1, 5) != 'POL03']">
      <xsl:choose>
        <xsl:when test="substring(., 1, 1) = '&lt;'">
          <xsl:value-of select="." disable-output-escaping="yes" />
        </xsl:when>
        <xsl:otherwise>
          <tr>
            <td class="alignLeft" colspan="10" style="height: 20px;">
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
  </xsl:template>

  <xsl:template match="//cbc:IssueDate">
    <xsl:value-of select="substring(.,9,2)"/>.<xsl:value-of select="substring(.,6,2)"/>.<xsl:value-of select="substring(.,1,4)"/>
  </xsl:template>
  <xsl:template match="//cbc:ActualDespatchDate">
    <xsl:value-of select="substring(.,9,2)"/>.<xsl:value-of select="substring(.,6,2)"/>.<xsl:value-of select="substring(.,1,4)"/>
  </xsl:template>

  <!--<xsl:template match="//n1:DespatchAdvice">
		<tr class="lineTableTr">
			<td class="lineTableTd">
				<xsl:text>&#160;</xsl:text>
			</td>
			<td class="lineTableTd">
				<xsl:text>&#160;</xsl:text>
			</td>
			<td class="lineTableTd" align="right">
				<xsl:text>&#160;</xsl:text>
			</td>
			<td class="lineTableTd" align="right">
				<xsl:text>&#160;</xsl:text>
			</td>
			<td class="lineTableTd" align="right">
				<xsl:text>&#160;</xsl:text>
			</td>
			<td class="lineTableTd" align="right">
				<xsl:text>&#160;</xsl:text>
			</td>
		</tr>
	</xsl:template>-->

  <xsl:template name="Party_Title" >
    <xsl:param name="PartyType" />
    <td style="width: 470px;" align="left">
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
        </xsl:for-each>
        <br/>
      </xsl:if>
    </td>
  </xsl:template>

  <xsl:template name="Party_Adress" >
    <xsl:param name="PartyType" />
    <td style="width: 469px;" align="left">
      <xsl:for-each select="cac:PostalAddress">
        <xsl:for-each select="cbc:StreetName">
          <xsl:if test="not((. = '.') or (. = '0') or (normalize-space(.) = ''))">
            <xsl:apply-templates/>
          </xsl:if>
          <xsl:text>&#160;</xsl:text>
        </xsl:for-each>
        <xsl:for-each select="cbc:BuildingName">
          <xsl:if test="not((. = '.') or (. = '0') or (normalize-space(.) = ''))">
            <xsl:apply-templates/>
          </xsl:if>
        </xsl:for-each>
        <xsl:for-each select="cbc:BuildingNumber">
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
        </xsl:for-each>
        <xsl:for-each select="cbc:PostalZone">
          <xsl:if test="not((. = '.') or (. = '0') or (normalize-space(.) = ''))">
            <xsl:apply-templates/>
            <xsl:text>&#160;</xsl:text>
          </xsl:if>
        </xsl:for-each>
        <xsl:for-each select="cbc:CitySubdivisionName">
          <xsl:if test="not((. = '.') or (. = '0') or (normalize-space(.) = ''))">
            <xsl:apply-templates/>
            <xsl:text> / </xsl:text>
          </xsl:if>
        </xsl:for-each>
        <xsl:for-each select="cbc:CityName">
          <xsl:if test="not((. = '.') or (. = '0') or (normalize-space(.) = ''))">
            <xsl:apply-templates/>
            <xsl:text>&#160;</xsl:text>
          </xsl:if>
        </xsl:for-each>
        <xsl:if test="$PartyType='TAXFREE'">
          <xsl:for-each select="cac:Country/cbc:Name">
            <xsl:if test="not((. = '.') or (. = '0') or (normalize-space(.) = ''))">
              <xsl:text> / </xsl:text>
              <xsl:apply-templates/>
              <xsl:text>&#160;</xsl:text>
            </xsl:if>
          </xsl:for-each>
        </xsl:if>
        <xsl:for-each select="cbc:AddressLine/cbc:Line">
          <xsl:if test="not((. = '.') or (. = '0') or (normalize-space(.) = ''))">
            <xsl:apply-templates/>
            <xsl:text>&#160;</xsl:text>
          </xsl:if>
          <br/>
        </xsl:for-each>
      </xsl:for-each>
    </td>
  </xsl:template>

  <xsl:template name='Party_Other'>
    <xsl:param name="PartyType" />
    <xsl:for-each select="cbc:WebsiteURI">
      <tr align="left">
        <td>
          <xsl:text>Web Sitesi: </xsl:text>
          <xsl:value-of select="."/>
        </td>
      </tr>
    </xsl:for-each>
    <xsl:for-each select="cac:Contact/cbc:ElectronicMail">
      <tr align="left">
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
      <xsl:if test="cbc:Telephone or cbc:Telefax">
        <tr align="left">
          <td style="width: 470px;" align="left">
            <xsl:for-each select="cbc:Telephone">
              <xsl:text>Tel: </xsl:text>
              <xsl:apply-templates/>
            </xsl:for-each>
            <xsl:for-each select="cbc:Telefax">
              <xsl:text> Fax: </xsl:text>
              <xsl:apply-templates/>
            </xsl:for-each>
            <xsl:text>&#160;</xsl:text>
          </td>
        </tr>
      </xsl:if>
    </xsl:for-each>
    <xsl:if test="$PartyType!='TAXFREE'">
      <xsl:for-each select="cac:PartyTaxScheme/cac:TaxScheme/cbc:Name">
        <tr align="left">
          <td>
            <xsl:text>Vergi Dairesi: </xsl:text>
            <xsl:apply-templates/>
          </td>
        </tr>
      </xsl:for-each>
      <xsl:for-each select="cac:PartyIdentification">
        <tr align="left">
          <td>
            <xsl:value-of select="cbc:ID/@schemeID"/>
            <xsl:text>: </xsl:text>
            <xsl:value-of select="cbc:ID"/>
          </td>
        </tr>
      </xsl:for-each>
    </xsl:if>
  </xsl:template>

  <xsl:template name="Adres" >
    <xsl:for-each select="cbc:StreetName">
      <xsl:apply-templates/>
      <xsl:text>&#160;</xsl:text>
    </xsl:for-each>
    <xsl:for-each select="cbc:BuildingName">
      <xsl:apply-templates/>
    </xsl:for-each>
    <xsl:for-each select="cbc:BuildingNumber">
      <xsl:text> No:</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>&#160;</xsl:text>
    </xsl:for-each>
    <br/>
    <xsl:for-each select="cbc:Room">
      <xsl:text>Kapı No:</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>&#160;</xsl:text>
      <br/>
    </xsl:for-each>
    <xsl:for-each select="cbc:PostalZone">
      <xsl:apply-templates/>
      <xsl:text>&#160;</xsl:text>
    </xsl:for-each>
    <xsl:for-each select="cbc:CitySubdivisionName">
      <xsl:apply-templates/>
      <xsl:text> / </xsl:text>
    </xsl:for-each>
    <xsl:for-each select="cbc:CityName">
      <xsl:apply-templates/>
      <xsl:text>&#160;</xsl:text>
    </xsl:for-each>
    <xsl:for-each select="cac:Country/cbc:Name">
      <xsl:text> / </xsl:text>
      <xsl:apply-templates/>
      <xsl:text>&#160;</xsl:text>
    </xsl:for-each>

    <xsl:for-each select="cac:AddressLine/cbc:Line">
      <br/>
      <!-- HTML Bilgi gelecek -->
      <xsl:value-of select="." disable-output-escaping="yes" />
    </xsl:for-each>
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

  <xsl:template name="string-replace-all">
    <xsl:param name="text" />
    <xsl:param name="replace" />
    <xsl:param name="by" />
    <xsl:choose>
      <xsl:when test="contains($text, $replace)">
        <xsl:value-of select="substring-before($text,$replace)" />
        <xsl:value-of select="$by" />
        <xsl:call-template name="string-replace-all">
          <xsl:with-param name="text" select="substring-after($text,$replace)" />
          <xsl:with-param name="replace" select="$replace" />
          <xsl:with-param name="by" select="$by" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="dipKdvSatirlariYaz">
    <xsl:param name="oran" />
    <tr align="right">
      <td align="right" width="156px">
        <span style="font-weight: bold;">
          <xsl:text>KDV Matrahı (%</xsl:text>
          <xsl:value-of select="$oran" />
          <xsl:text>)</xsl:text>
        </span>
      </td>
      <td style="width: 156px; " align="right">
        <xsl:value-of select="format-number(./cbc:DocumentTypeCode, $bedelFormatStr, 'european')" />
        <xsl:for-each select="$xroot/cac:Shipment/cac:GoodsItem/cbc:ValueAmount">
          <xsl:call-template name="dumpCurrency"/>
        </xsl:for-each>
      </td>
    </tr>
    <tr align="right">
      <td align="right" width="156px">
        <span style="font-weight: bold;">
          <xsl:text>KDV (%</xsl:text>
          <xsl:value-of select="$oran" />
          <xsl:text>)</xsl:text>
        </span>
      </td>
      <td style="width: 156px; " align="right">
        <xsl:value-of select="format-number(./cbc:ID, $bedelFormatStr, 'european')" />
        <xsl:for-each select="$xroot/cac:Shipment/cac:GoodsItem/cbc:ValueAmount">
          <xsl:call-template name="dumpCurrency"/>
        </xsl:for-each>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
