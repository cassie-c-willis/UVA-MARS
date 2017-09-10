<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="7.6.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="50" name="dxf" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="53" name="tGND_GNDA" color="7" fill="9" visible="no" active="no"/>
<layer number="54" name="bGND_GNDA" color="1" fill="9" visible="no" active="no"/>
<layer number="56" name="wert" color="7" fill="1" visible="no" active="no"/>
<layer number="57" name="tCAD" color="7" fill="1" visible="no" active="no"/>
<layer number="59" name="tCarbon" color="7" fill="1" visible="no" active="no"/>
<layer number="60" name="bCarbon" color="7" fill="1" visible="no" active="no"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="99" name="SpiceOrder" color="7" fill="1" visible="no" active="no"/>
<layer number="100" name="Muster" color="7" fill="1" visible="no" active="yes"/>
<layer number="101" name="Patch_Top" color="12" fill="4" visible="no" active="yes"/>
<layer number="102" name="Mittellin" color="7" fill="1" visible="no" active="yes"/>
<layer number="103" name="Stiffner" color="7" fill="1" visible="no" active="yes"/>
<layer number="104" name="Name" color="7" fill="1" visible="yes" active="yes"/>
<layer number="105" name="Beschreib" color="7" fill="1" visible="no" active="yes"/>
<layer number="106" name="BGA-Top" color="7" fill="1" visible="no" active="yes"/>
<layer number="107" name="BD-Top" color="7" fill="1" visible="no" active="yes"/>
<layer number="108" name="tBridges" color="7" fill="1" visible="no" active="yes"/>
<layer number="109" name="tBPL" color="7" fill="1" visible="no" active="yes"/>
<layer number="110" name="bBPL" color="7" fill="1" visible="no" active="yes"/>
<layer number="111" name="MPL" color="7" fill="1" visible="no" active="yes"/>
<layer number="112" name="tSilk" color="7" fill="1" visible="no" active="yes"/>
<layer number="113" name="IDFDebug" color="4" fill="1" visible="yes" active="yes"/>
<layer number="114" name="Badge_Outline" color="7" fill="1" visible="yes" active="yes"/>
<layer number="115" name="ReferenceISLANDS" color="7" fill="1" visible="yes" active="yes"/>
<layer number="116" name="Patch_BOT" color="9" fill="4" visible="no" active="yes"/>
<layer number="118" name="Rect_Pads" color="7" fill="1" visible="yes" active="yes"/>
<layer number="121" name="sName" color="7" fill="1" visible="no" active="yes"/>
<layer number="122" name="_bPlace" color="7" fill="1" visible="no" active="yes"/>
<layer number="123" name="tTestmark" color="7" fill="1" visible="no" active="yes"/>
<layer number="124" name="bTestmark" color="7" fill="1" visible="no" active="yes"/>
<layer number="125" name="_tNames" color="7" fill="1" visible="no" active="yes"/>
<layer number="126" name="_bNames" color="7" fill="1" visible="no" active="yes"/>
<layer number="127" name="_tValues" color="7" fill="1" visible="no" active="yes"/>
<layer number="128" name="_bValues" color="7" fill="1" visible="no" active="yes"/>
<layer number="129" name="Mask" color="7" fill="1" visible="yes" active="yes"/>
<layer number="131" name="tAdjust" color="7" fill="1" visible="no" active="yes"/>
<layer number="132" name="bAdjust" color="7" fill="1" visible="no" active="yes"/>
<layer number="144" name="Drill_legend" color="7" fill="1" visible="no" active="yes"/>
<layer number="150" name="Notes" color="7" fill="1" visible="no" active="yes"/>
<layer number="151" name="HeatSink" color="7" fill="1" visible="no" active="yes"/>
<layer number="152" name="_bDocu" color="7" fill="1" visible="no" active="yes"/>
<layer number="153" name="FabDoc1" color="6" fill="1" visible="no" active="no"/>
<layer number="154" name="FabDoc2" color="2" fill="1" visible="no" active="no"/>
<layer number="155" name="FabDoc3" color="7" fill="15" visible="no" active="no"/>
<layer number="199" name="Contour" color="7" fill="1" visible="no" active="yes"/>
<layer number="200" name="200bmp" color="1" fill="10" visible="no" active="yes"/>
<layer number="201" name="201bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="202" name="202bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="203" name="203bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="204" name="204bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="205" name="205bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="206" name="206bmp" color="7" fill="10" visible="no" active="yes"/>
<layer number="207" name="207bmp" color="8" fill="10" visible="no" active="yes"/>
<layer number="208" name="208bmp" color="9" fill="10" visible="no" active="yes"/>
<layer number="209" name="209bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="210" name="210bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="211" name="211bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="212" name="212bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="213" name="213bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="214" name="214bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="215" name="215bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="216" name="216bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="217" name="217bmp" color="18" fill="1" visible="no" active="no"/>
<layer number="218" name="218bmp" color="19" fill="1" visible="no" active="no"/>
<layer number="219" name="219bmp" color="20" fill="1" visible="no" active="no"/>
<layer number="220" name="220bmp" color="21" fill="1" visible="no" active="no"/>
<layer number="221" name="221bmp" color="22" fill="1" visible="no" active="no"/>
<layer number="222" name="222bmp" color="23" fill="1" visible="no" active="no"/>
<layer number="223" name="223bmp" color="24" fill="1" visible="no" active="no"/>
<layer number="224" name="224bmp" color="25" fill="1" visible="no" active="no"/>
<layer number="225" name="225bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="226" name="226bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="227" name="227bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="228" name="228bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="229" name="229bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="230" name="230bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="231" name="231bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="248" name="Housing" color="7" fill="1" visible="no" active="yes"/>
<layer number="249" name="Edge" color="7" fill="1" visible="no" active="yes"/>
<layer number="250" name="Descript" color="7" fill="1" visible="no" active="yes"/>
<layer number="251" name="SMDround" color="7" fill="1" visible="no" active="yes"/>
<layer number="254" name="cooling" color="7" fill="1" visible="no" active="yes"/>
<layer number="255" name="routoute" color="7" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="Microcontrollers">
<packages>
<package name="PROP-MINI">
<pad name="P16" x="-8.89" y="13.97" drill="1.016" shape="square"/>
<pad name="P17" x="-8.89" y="11.43" drill="1.016"/>
<pad name="P18" x="-8.89" y="8.89" drill="1.016"/>
<pad name="3.3V" x="-8.89" y="6.35" drill="1.016"/>
<pad name="P0" x="-8.89" y="3.81" drill="1.016"/>
<pad name="P1" x="-8.89" y="1.27" drill="1.016" rot="R90"/>
<pad name="P2" x="-8.89" y="-1.27" drill="1.016"/>
<pad name="P3" x="-8.89" y="-3.81" drill="1.016"/>
<pad name="P4" x="-8.89" y="-6.35" drill="1.016"/>
<pad name="P5" x="-8.89" y="-8.89" drill="1.016"/>
<pad name="P6" x="-8.89" y="-11.43" drill="1.016"/>
<pad name="P7" x="-8.89" y="-13.97" drill="1.016"/>
<pad name="GND" x="8.89" y="11.43" drill="1.016"/>
<pad name="RST" x="8.89" y="8.89" drill="1.016"/>
<pad name="5V" x="8.89" y="6.35" drill="1.016"/>
<pad name="P15" x="8.89" y="3.81" drill="1.016"/>
<pad name="P14" x="8.89" y="1.27" drill="1.016"/>
<pad name="P13" x="8.89" y="-1.27" drill="1.016"/>
<pad name="P12" x="8.89" y="-3.81" drill="1.016"/>
<pad name="P11" x="8.89" y="-6.35" drill="1.016"/>
<pad name="P10" x="8.89" y="-8.89" drill="1.016"/>
<pad name="P9" x="8.89" y="-11.43" drill="1.016"/>
<pad name="P8" x="8.89" y="-13.97" drill="1.016"/>
<pad name="VIN" x="8.89" y="13.97" drill="1.016"/>
<wire x1="-11.43" y1="-16.51" x2="11.43" y2="-16.51" width="0.127" layer="21"/>
<wire x1="11.43" y1="-16.51" x2="11.43" y2="26.67" width="0.127" layer="21"/>
<wire x1="-11.43" y1="-16.51" x2="-11.43" y2="26.67" width="0.127" layer="21"/>
<wire x1="-11.43" y1="26.67" x2="11.43" y2="26.67" width="0.127" layer="21"/>
<text x="-3.81" y="24.13" size="1.27" layer="21">Prop-Mini</text>
<text x="-3.81" y="21.59" size="1.27" layer="21">&gt;NAME</text>
<text x="-10.16" y="15.24" size="1.27" layer="21">P16</text>
<text x="7.62" y="15.24" size="1.27" layer="21">VIN</text>
</package>
</packages>
<symbols>
<symbol name="PROP-MINI">
<pin name="P2" x="-15.24" y="0" visible="pin" length="middle"/>
<pin name="P1" x="-15.24" y="2.54" visible="pin" length="middle"/>
<pin name="P0" x="-15.24" y="5.08" visible="pin" length="middle"/>
<pin name="3.3V" x="-15.24" y="7.62" visible="pin" length="middle"/>
<pin name="P18" x="-15.24" y="10.16" visible="pin" length="middle"/>
<pin name="P17" x="-15.24" y="12.7" visible="pin" length="middle"/>
<pin name="P16" x="-15.24" y="15.24" visible="pin" length="middle"/>
<pin name="VIN" x="15.24" y="15.24" visible="pin" length="middle" rot="R180"/>
<pin name="GND" x="15.24" y="12.7" visible="pin" length="middle" rot="R180"/>
<pin name="RST" x="15.24" y="10.16" visible="pin" length="middle" rot="R180"/>
<pin name="5V" x="15.24" y="7.62" visible="pin" length="middle" rot="R180"/>
<pin name="P15" x="15.24" y="5.08" visible="pin" length="middle" rot="R180"/>
<pin name="P14" x="15.24" y="2.54" visible="pin" length="middle" rot="R180"/>
<pin name="P13" x="15.24" y="0" visible="pin" length="middle" rot="R180"/>
<pin name="P12" x="15.24" y="-2.54" visible="pin" length="middle" rot="R180"/>
<pin name="P11" x="15.24" y="-5.08" visible="pin" length="middle" rot="R180"/>
<pin name="P10" x="15.24" y="-7.62" visible="pin" length="middle" rot="R180"/>
<pin name="P9" x="15.24" y="-10.16" visible="pin" length="middle" rot="R180"/>
<pin name="P8" x="15.24" y="-12.7" visible="pin" length="middle" rot="R180"/>
<pin name="P7" x="-15.24" y="-12.7" visible="pin" length="middle"/>
<pin name="P6" x="-15.24" y="-10.16" visible="pin" length="middle"/>
<pin name="P5" x="-15.24" y="-7.62" visible="pin" length="middle"/>
<pin name="P4" x="-15.24" y="-5.08" visible="pin" length="middle"/>
<pin name="P3" x="-15.24" y="-2.54" visible="pin" length="middle"/>
<wire x1="-10.16" y1="20.32" x2="-10.16" y2="-17.78" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-17.78" x2="10.16" y2="-17.78" width="0.254" layer="94"/>
<wire x1="10.16" y1="-17.78" x2="10.16" y2="20.32" width="0.254" layer="94"/>
<wire x1="10.16" y1="20.32" x2="-10.16" y2="20.32" width="0.254" layer="94"/>
<text x="0" y="-5.08" size="1.778" layer="94" rot="R90">Prop Mini</text>
<text x="-5.08" y="17.78" size="1.778" layer="95">&gt;NAME</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="PROP-MINI" prefix="P">
<gates>
<gate name="G$1" symbol="PROP-MINI" x="0" y="0"/>
</gates>
<devices>
<device name="" package="PROP-MINI">
<connects>
<connect gate="G$1" pin="3.3V" pad="3.3V"/>
<connect gate="G$1" pin="5V" pad="5V"/>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="P0" pad="P0"/>
<connect gate="G$1" pin="P1" pad="P1"/>
<connect gate="G$1" pin="P10" pad="P10"/>
<connect gate="G$1" pin="P11" pad="P11"/>
<connect gate="G$1" pin="P12" pad="P12"/>
<connect gate="G$1" pin="P13" pad="P13"/>
<connect gate="G$1" pin="P14" pad="P14"/>
<connect gate="G$1" pin="P15" pad="P15"/>
<connect gate="G$1" pin="P16" pad="P16"/>
<connect gate="G$1" pin="P17" pad="P17"/>
<connect gate="G$1" pin="P18" pad="P18"/>
<connect gate="G$1" pin="P2" pad="P2"/>
<connect gate="G$1" pin="P3" pad="P3"/>
<connect gate="G$1" pin="P4" pad="P4"/>
<connect gate="G$1" pin="P5" pad="P5"/>
<connect gate="G$1" pin="P6" pad="P6"/>
<connect gate="G$1" pin="P7" pad="P7"/>
<connect gate="G$1" pin="P8" pad="P8"/>
<connect gate="G$1" pin="P9" pad="P9"/>
<connect gate="G$1" pin="RST" pad="RST"/>
<connect gate="G$1" pin="VIN" pad="VIN"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="RCL">
<packages>
<package name="0402">
<wire x1="-0.245" y1="0.224" x2="0.245" y2="0.224" width="0.1524" layer="51"/>
<wire x1="0.245" y1="-0.224" x2="-0.245" y2="-0.224" width="0.1524" layer="51"/>
<wire x1="-1.473" y1="0.483" x2="1.473" y2="0.483" width="0.0508" layer="25"/>
<wire x1="1.473" y1="0.483" x2="1.473" y2="-0.483" width="0.0508" layer="25"/>
<wire x1="1.473" y1="-0.483" x2="-1.473" y2="-0.483" width="0.0508" layer="25"/>
<wire x1="-1.473" y1="-0.483" x2="-1.473" y2="0.483" width="0.0508" layer="25"/>
<smd name="1" x="-0.65" y="0" dx="0.7" dy="0.9" layer="1"/>
<smd name="2" x="0.65" y="0" dx="0.7" dy="0.9" layer="1"/>
<text x="-0.762" y="0.508" size="0.3048" layer="25">&gt;NAME</text>
<text x="-0.762" y="-0.889" size="0.3048" layer="27">&gt;VALUE</text>
<rectangle x1="-0.554" y1="-0.3048" x2="-0.254" y2="0.2951" layer="51"/>
<rectangle x1="0.2588" y1="-0.3048" x2="0.5588" y2="0.2951" layer="51"/>
</package>
<package name="0603">
<wire x1="-1.473" y1="0.983" x2="1.473" y2="0.983" width="0.0508" layer="25"/>
<wire x1="1.473" y1="0.983" x2="1.473" y2="-0.983" width="0.0508" layer="25"/>
<wire x1="1.473" y1="-0.983" x2="-1.473" y2="-0.983" width="0.0508" layer="25"/>
<wire x1="-1.473" y1="-0.983" x2="-1.473" y2="0.983" width="0.0508" layer="25"/>
<wire x1="-0.356" y1="0.432" x2="0.356" y2="0.432" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.419" x2="0.356" y2="-0.419" width="0.1016" layer="51"/>
<smd name="1" x="-0.85" y="0" dx="1.1" dy="1" layer="1"/>
<smd name="2" x="0.85" y="0" dx="1.1" dy="1" layer="1"/>
<text x="-0.635" y="0.635" size="0.762" layer="25">&gt;NAME</text>
<text x="-0.635" y="-1.905" size="0.762" layer="27">&gt;VALUE</text>
<rectangle x1="-0.8382" y1="-0.4699" x2="-0.3381" y2="0.4801" layer="51"/>
<rectangle x1="0.3302" y1="-0.4699" x2="0.8303" y2="0.4801" layer="51"/>
</package>
<package name="0207/10">
<wire x1="5.08" y1="0" x2="4.064" y2="0" width="0.6096" layer="51"/>
<wire x1="-5.08" y1="0" x2="-4.064" y2="0" width="0.6096" layer="51"/>
<wire x1="-3.175" y1="0.889" x2="-2.921" y2="1.143" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-2.921" y2="-1.143" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="-1.143" x2="3.175" y2="-0.889" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="1.143" x2="3.175" y2="0.889" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-3.175" y2="0.889" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="1.143" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="1.016" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="-1.143" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="-1.016" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="-2.413" y2="1.016" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="-2.413" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="2.921" y1="1.143" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.921" y1="-1.143" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-0.889" x2="3.175" y2="0.889" width="0.1524" layer="21"/>
<pad name="1" x="-5.08" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="5.08" y="0" drill="0.8128" shape="octagon"/>
<text x="-3.048" y="1.524" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.2606" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="3.175" y1="-0.3048" x2="4.0386" y2="0.3048" layer="21"/>
<rectangle x1="-4.0386" y1="-0.3048" x2="-3.175" y2="0.3048" layer="21"/>
</package>
<package name="C050-030X075">
<wire x1="-0.3048" y1="0.635" x2="-0.3048" y2="0" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="0" x2="-0.3048" y2="-0.635" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="0" x2="-1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="0.3302" y1="0.635" x2="0.3302" y2="0" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0" x2="0.3302" y2="-0.635" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0" x2="1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="-3.683" y1="1.27" x2="-3.683" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="-1.524" x2="3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.683" y1="-1.27" x2="3.683" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.429" y1="1.524" x2="-3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="3.429" y1="1.524" x2="3.683" y2="1.27" width="0.1524" layer="21" curve="-90"/>
<wire x1="3.429" y1="-1.524" x2="3.683" y2="-1.27" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="-1.27" x2="-3.429" y2="-1.524" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="1.27" x2="-3.429" y2="1.524" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" shape="octagon"/>
<text x="-3.556" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.556" y="-3.048" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="0603-POL">
<wire x1="-1.473" y1="0.983" x2="1.473" y2="0.983" width="0.0508" layer="25"/>
<wire x1="1.473" y1="0.983" x2="1.473" y2="-0.983" width="0.0508" layer="25"/>
<wire x1="1.473" y1="-0.983" x2="-1.473" y2="-0.983" width="0.0508" layer="25"/>
<wire x1="-1.473" y1="-0.983" x2="-1.473" y2="0.983" width="0.0508" layer="25"/>
<wire x1="-0.356" y1="0.432" x2="0.356" y2="0.432" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.419" x2="0.356" y2="-0.419" width="0.1016" layer="51"/>
<smd name="1" x="-0.85" y="0" dx="1.1" dy="1" layer="1"/>
<smd name="2" x="0.85" y="0" dx="1.1" dy="1" layer="1"/>
<text x="-0.635" y="0.635" size="0.762" layer="25">&gt;NAME</text>
<text x="-0.635" y="-1.905" size="0.762" layer="27">&gt;VALUE</text>
<rectangle x1="-0.8382" y1="-0.4699" x2="-0.3381" y2="0.4801" layer="51"/>
<rectangle x1="0.3302" y1="-0.4699" x2="0.8303" y2="0.4801" layer="51"/>
<wire x1="-1.0922" y1="-0.7112" x2="-0.5842" y2="-0.7112" width="0.127" layer="21"/>
<wire x1="0.635" y1="-0.7366" x2="1.143" y2="-0.7366" width="0.127" layer="21"/>
<wire x1="0.889" y1="-0.6096" x2="0.889" y2="-0.8636" width="0.127" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="R">
<wire x1="-2.54" y1="0" x2="-2.159" y2="1.016" width="0.2032" layer="94"/>
<wire x1="-2.159" y1="1.016" x2="-1.524" y2="-1.016" width="0.2032" layer="94"/>
<wire x1="-1.524" y1="-1.016" x2="-0.889" y2="1.016" width="0.2032" layer="94"/>
<wire x1="-0.889" y1="1.016" x2="-0.254" y2="-1.016" width="0.2032" layer="94"/>
<wire x1="-0.254" y1="-1.016" x2="0.381" y2="1.016" width="0.2032" layer="94"/>
<wire x1="0.381" y1="1.016" x2="1.016" y2="-1.016" width="0.2032" layer="94"/>
<wire x1="1.016" y1="-1.016" x2="1.651" y2="1.016" width="0.2032" layer="94"/>
<wire x1="1.651" y1="1.016" x2="2.286" y2="-1.016" width="0.2032" layer="94"/>
<wire x1="2.286" y1="-1.016" x2="2.54" y2="0" width="0.2032" layer="94"/>
<text x="-3.81" y="1.4986" size="1.778" layer="95">&gt;NAME</text>
<text x="-3.81" y="-3.302" size="1.778" layer="96">&gt;VALUE</text>
<pin name="P$1" x="-5.08" y="0" visible="off" length="short"/>
<pin name="P$2" x="5.08" y="0" visible="off" length="short" rot="R180"/>
</symbol>
<symbol name="C">
<wire x1="-2.54" y1="0" x2="-2.032" y2="0" width="0.1524" layer="94"/>
<wire x1="0" y1="0" x2="-0.508" y2="0" width="0.1524" layer="94"/>
<text x="-2.921" y="1.524" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<text x="2.159" y="1.524" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<rectangle x1="-2.794" y1="-0.254" x2="1.27" y2="0.254" layer="94" rot="R90"/>
<rectangle x1="-3.81" y1="-0.254" x2="0.254" y2="0.254" layer="94" rot="R90"/>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<pin name="2" x="2.54" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
<symbol name="C-POL">
<wire x1="1.524" y1="0" x2="1.27" y2="0" width="0.1524" layer="94"/>
<text x="-1.397" y="1.524" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<text x="3.683" y="1.524" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.27" y1="-0.254" x2="2.794" y2="0.254" layer="94" rot="R90"/>
<pin name="1" x="-2.54" y="0" visible="off" length="point" direction="pas" swaplevel="1"/>
<pin name="2" x="2.54" y="0" visible="off" length="point" direction="pas" swaplevel="1" rot="R180"/>
<wire x1="1.27" y1="0" x2="1.016" y2="0" width="0.1524" layer="94"/>
<wire x1="2.032" y1="1.778" x2="2.032" y2="0.254" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.016" x2="2.794" y2="1.016" width="0.254" layer="94"/>
<wire x1="-1.27" y1="2.032" x2="-1.27" y2="-2.032" width="0.254" layer="94" curve="-82.371883"/>
<wire x1="-2.54" y1="0" x2="-0.508" y2="0" width="0.1524" layer="94"/>
<wire x1="2.54" y1="0" x2="1.524" y2="0" width="0.1524" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="R" prefix="R" uservalue="yes">
<gates>
<gate name="G$1" symbol="R" x="0" y="0"/>
</gates>
<devices>
<device name="0402" package="0402">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0603" package="0603">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="" package="0207/10">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="C" prefix="C" uservalue="yes">
<gates>
<gate name="G$1" symbol="C" x="0" y="0"/>
</gates>
<devices>
<device name="0402" package="0402">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0603" package="0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="" package="C050-030X075">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="C-POL" prefix="C">
<gates>
<gate name="G$1" symbol="C-POL" x="0" y="0"/>
</gates>
<devices>
<device name="-T" package="0603-POL">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="CAP-TYPE" value="TANTALUM" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="pwr_gnd">
<packages>
</packages>
<symbols>
<symbol name="GND">
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<wire x1="-1.27" y1="-0.635" x2="1.27" y2="-0.635" width="0.254" layer="94"/>
<wire x1="-0.635" y1="-1.27" x2="0.635" y2="-1.27" width="0.254" layer="94"/>
</symbol>
<symbol name="12V">
<pin name="12V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
<text x="-2.54" y="1.27" size="1.27" layer="96">&gt;VALUE</text>
<circle x="0" y="0.635" radius="0.635" width="0.254" layer="94"/>
</symbol>
<symbol name="5V">
<pin name="5V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
<text x="-2.54" y="1.27" size="1.27" layer="96">&gt;VALUE</text>
<circle x="0" y="0.635" radius="0.635" width="0.254" layer="94"/>
</symbol>
<symbol name="3.3V">
<pin name="3.3V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
<text x="-2.54" y="1.27" size="1.27" layer="96">&gt;VALUE</text>
<circle x="0" y="0.635" radius="0.635" width="0.254" layer="94"/>
</symbol>
<symbol name="GND2">
<pin name="GND2" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
</symbol>
<symbol name="VCC2">
<pin name="VCC2" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
<polygon width="0.254" layer="94">
<vertex x="0" y="0"/>
<vertex x="-0.635" y="-1.27"/>
<vertex x="0.635" y="-1.27"/>
</polygon>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND">
<gates>
<gate name="G$1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="12V">
<gates>
<gate name="G$1" symbol="12V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="5V">
<gates>
<gate name="G$1" symbol="5V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="3.3V">
<gates>
<gate name="G$1" symbol="3.3V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="GND2">
<gates>
<gate name="G$1" symbol="GND2" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="VCC2">
<gates>
<gate name="G$1" symbol="VCC2" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="led">
<description>&lt;b&gt;LEDs&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;&lt;br&gt;
Extended by Federico Battaglin &lt;author&gt;&amp;lt;federico.rd@fdpinternational.com&amp;gt;&lt;/author&gt; with DUOLED</description>
<packages>
<package name="0603">
<smd name="OUT" x="0" y="0.877" dx="1" dy="1" layer="1" roundness="30"/>
<smd name="IN" x="0" y="-0.877" dx="1" dy="1" layer="1" roundness="30"/>
<text x="-0.6985" y="-0.889" size="0.4064" layer="25" rot="R90">&gt;NAME</text>
<text x="1.0795" y="-1.016" size="0.4064" layer="27" rot="R90">&gt;VALUE</text>
<wire x1="0" y1="-0.254" x2="0" y2="0.254" width="0.127" layer="21"/>
<polygon width="0.127" layer="21">
<vertex x="0" y="0.254"/>
<vertex x="-0.254" y="0"/>
<vertex x="0.254" y="0"/>
</polygon>
</package>
</packages>
<symbols>
<symbol name="LED-STD">
<pin name="IN" x="-5.08" y="0" visible="off" length="short"/>
<pin name="OUT" x="2.54" y="0" visible="off" length="short" rot="R180"/>
<wire x1="-2.54" y1="1.27" x2="-2.54" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-1.27" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-2.54" y2="1.27" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-0.635" y1="-1.27" x2="0.635" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-1.905" y1="-1.905" x2="-0.635" y2="-3.175" width="0.254" layer="94"/>
<polygon width="0.254" layer="94">
<vertex x="0.635" y="-1.905"/>
<vertex x="1.27" y="-3.175"/>
<vertex x="0" y="-2.54"/>
</polygon>
<polygon width="0.254" layer="94">
<vertex x="-0.635" y="-2.54"/>
<vertex x="0" y="-3.81"/>
<vertex x="-1.27" y="-3.175"/>
</polygon>
<text x="-2.54" y="2.54" size="1.27" layer="95">&gt;NAME</text>
<text x="-2.54" y="5.08" size="1.27" layer="96">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="LED-STD" uservalue="yes">
<gates>
<gate name="G$1" symbol="LED-STD" x="2.54" y="0"/>
</gates>
<devices>
<device name="" package="0603">
<connects>
<connect gate="G$1" pin="IN" pad="IN"/>
<connect gate="G$1" pin="OUT" pad="OUT"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ADC">
<packages>
<package name="DIL-20">
<wire x1="-2.159" y1="-17.78" x2="-2.159" y2="7.62" width="0.1524" layer="21"/>
<wire x1="-2.159" y1="-17.78" x2="-8.001" y2="-17.78" width="0.1524" layer="21"/>
<wire x1="-2.159" y1="7.62" x2="-4.064" y2="7.62" width="0.1524" layer="21"/>
<wire x1="-8.001" y1="7.62" x2="-6.096" y2="7.62" width="0.1524" layer="21"/>
<wire x1="-4.064" y1="7.62" x2="-6.096" y2="7.62" width="0.1524" layer="21" curve="-180"/>
<pad name="1" x="-8.89" y="6.35" drill="0.8128" shape="long"/>
<pad name="2" x="-8.89" y="3.81" drill="0.8128" shape="long"/>
<pad name="19" x="-1.27" y="3.81" drill="0.8128" shape="long"/>
<pad name="20" x="-1.27" y="6.35" drill="0.8128" shape="long"/>
<pad name="3" x="-8.89" y="1.27" drill="0.8128" shape="long"/>
<pad name="4" x="-8.89" y="-1.27" drill="0.8128" shape="long"/>
<pad name="18" x="-1.27" y="1.27" drill="0.8128" shape="long"/>
<pad name="17" x="-1.27" y="-1.27" drill="0.8128" shape="long"/>
<text x="-8.001" y="7.874" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.715" y="6.096" size="1.27" layer="27" ratio="10" rot="R270">&gt;VALUE</text>
<pad name="5" x="-8.89" y="-3.81" drill="0.8128" shape="long"/>
<pad name="6" x="-8.89" y="-6.35" drill="0.8128" shape="long"/>
<pad name="7" x="-8.89" y="-8.89" drill="0.8128" shape="long"/>
<pad name="8" x="-8.89" y="-11.43" drill="0.8128" shape="long"/>
<wire x1="-8.001" y1="7.62" x2="-8.001" y2="-17.78" width="0.1524" layer="21"/>
<pad name="9" x="-8.89" y="-13.97" drill="0.8128" shape="long"/>
<pad name="10" x="-8.89" y="-16.51" drill="0.8128" shape="long"/>
<pad name="16" x="-1.27" y="-3.81" drill="0.8128" shape="long"/>
<pad name="15" x="-1.27" y="-6.35" drill="0.8128" shape="long"/>
<pad name="14" x="-1.27" y="-8.89" drill="0.8128" shape="long"/>
<pad name="13" x="-1.27" y="-11.43" drill="0.8128" shape="long"/>
<pad name="12" x="-1.27" y="-13.97" drill="0.8128" shape="long"/>
<pad name="11" x="-1.27" y="-16.51" drill="0.8128" shape="long"/>
</package>
</packages>
<symbols>
<symbol name="TLC0831">
<wire x1="-20.32" y1="27.94" x2="20.32" y2="27.94" width="0.254" layer="94"/>
<wire x1="20.32" y1="27.94" x2="20.32" y2="-27.94" width="0.254" layer="94"/>
<wire x1="20.32" y1="-27.94" x2="-20.32" y2="-27.94" width="0.254" layer="94"/>
<wire x1="-20.32" y1="-27.94" x2="-20.32" y2="27.94" width="0.254" layer="94"/>
<pin name="VCC" x="27.94" y="22.86" rot="R180"/>
<pin name="EOC" x="27.94" y="17.78" rot="R180"/>
<pin name="I/O_CLOCK" x="27.94" y="12.7" rot="R180"/>
<pin name="DATA_INPUT" x="27.94" y="7.62" rot="R180"/>
<pin name="DATA_OUT" x="27.94" y="2.54" rot="R180"/>
<pin name="CS" x="27.94" y="-2.54" rot="R180"/>
<pin name="REF+" x="27.94" y="-7.62" rot="R180"/>
<pin name="REF-" x="27.94" y="-12.7" rot="R180"/>
<pin name="AIN0" x="-27.94" y="22.86"/>
<pin name="AIN1" x="-27.94" y="17.78"/>
<pin name="AIN2" x="-27.94" y="12.7"/>
<pin name="AIN3" x="-27.94" y="7.62"/>
<pin name="AIN4" x="-27.94" y="2.54"/>
<pin name="AIN5" x="-27.94" y="-2.54"/>
<pin name="AIN6" x="-27.94" y="-7.62"/>
<pin name="AIN7" x="-27.94" y="-12.7"/>
<pin name="AIN8" x="-27.94" y="-17.78"/>
<pin name="GND" x="-27.94" y="-22.86"/>
<pin name="AIN10" x="27.94" y="-17.78" rot="R180"/>
<pin name="AIN9" x="27.94" y="-22.86" rot="R180"/>
<rectangle x1="-12.7" y1="22.86" x2="-10.16" y2="25.4" layer="94"/>
<text x="-7.62" y="-2.54" size="1.778" layer="95">&gt;NAME</text>
<text x="-7.62" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<text x="-7.62" y="-12.7" size="1.778" layer="97">TLC2543</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="TLC2543IN">
<gates>
<gate name="G$1" symbol="TLC0831" x="0" y="0"/>
</gates>
<devices>
<device name="" package="DIL-20">
<connects>
<connect gate="G$1" pin="AIN0" pad="1"/>
<connect gate="G$1" pin="AIN1" pad="2"/>
<connect gate="G$1" pin="AIN10" pad="12"/>
<connect gate="G$1" pin="AIN2" pad="3"/>
<connect gate="G$1" pin="AIN3" pad="4"/>
<connect gate="G$1" pin="AIN4" pad="5"/>
<connect gate="G$1" pin="AIN5" pad="6"/>
<connect gate="G$1" pin="AIN6" pad="7"/>
<connect gate="G$1" pin="AIN7" pad="8"/>
<connect gate="G$1" pin="AIN8" pad="9"/>
<connect gate="G$1" pin="AIN9" pad="11"/>
<connect gate="G$1" pin="CS" pad="15"/>
<connect gate="G$1" pin="DATA_INPUT" pad="17"/>
<connect gate="G$1" pin="DATA_OUT" pad="16"/>
<connect gate="G$1" pin="EOC" pad="19"/>
<connect gate="G$1" pin="GND" pad="10"/>
<connect gate="G$1" pin="I/O_CLOCK" pad="18"/>
<connect gate="G$1" pin="REF+" pad="14"/>
<connect gate="G$1" pin="REF-" pad="13"/>
<connect gate="G$1" pin="VCC" pad="20"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Optoisolation">
<packages>
<package name="DIL08-0.1P-6W">
<pad name="1" x="-5.08" y="5.08" drill="0.8" shape="square"/>
<pad name="2" x="-5.08" y="2.54" drill="0.8"/>
<pad name="3" x="-5.08" y="0" drill="0.8"/>
<pad name="4" x="-5.08" y="-2.54" drill="0.8"/>
<pad name="5" x="7.62" y="-2.54" drill="0.8"/>
<pad name="6" x="7.62" y="0" drill="0.8"/>
<pad name="7" x="7.62" y="2.54" drill="0.8"/>
<pad name="8" x="7.62" y="5.08" drill="0.8"/>
<wire x1="-7.62" y1="7.62" x2="-7.62" y2="-5.08" width="0.127" layer="21"/>
<wire x1="-7.62" y1="-5.08" x2="10.16" y2="-5.08" width="0.127" layer="21"/>
<wire x1="10.16" y1="-5.08" x2="10.16" y2="7.62" width="0.127" layer="21"/>
<wire x1="10.16" y1="7.62" x2="-7.62" y2="7.62" width="0.127" layer="21"/>
<text x="-2.54" y="-3.81" size="0.762" layer="21">Optoisolation</text>
<text x="-2.54" y="6.35" size="0.762" layer="21">BOB-09118 Breakout</text>
<text x="-3.81" y="5.08" size="0.762" layer="21">NC</text>
<text x="-3.81" y="2.54" size="0.762" layer="21">IN1</text>
<text x="-3.81" y="0" size="0.762" layer="21">IN2</text>
<text x="-3.81" y="-2.54" size="0.762" layer="21">GND</text>
<text x="3.81" y="-2.54" size="0.762" layer="21">HVG</text>
<text x="3.81" y="0" size="0.762" layer="21">OUT2</text>
<text x="3.81" y="2.54" size="0.762" layer="21">HV</text>
<text x="3.81" y="5.08" size="0.762" layer="21">OUT1</text>
</package>
</packages>
<symbols>
<symbol name="BOB-09118">
<wire x1="-7.62" y1="7.62" x2="-7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-5.08" x2="7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="-5.08" x2="7.62" y2="7.62" width="0.254" layer="94"/>
<wire x1="7.62" y1="7.62" x2="-7.62" y2="7.62" width="0.254" layer="94"/>
<pin name="NC" x="-12.7" y="5.08" length="middle"/>
<pin name="IN1" x="-12.7" y="2.54" length="middle"/>
<pin name="IN2" x="-12.7" y="0" length="middle"/>
<pin name="GND" x="-12.7" y="-2.54" length="middle"/>
<pin name="HVG" x="12.7" y="-2.54" length="middle" rot="R180"/>
<pin name="OUT2" x="12.7" y="0" length="middle" rot="R180"/>
<pin name="HV" x="12.7" y="2.54" length="middle" rot="R180"/>
<pin name="OUT1" x="12.7" y="5.08" length="middle" rot="R180"/>
<text x="-7.62" y="7.62" size="1.778" layer="95">&gt;NAME</text>
<text x="-5.08" y="-5.08" size="0.762" layer="97">BOB-09118 Optoisolator</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="BOB-09118" prefix="U">
<gates>
<gate name="G$1" symbol="BOB-09118" x="0" y="0"/>
</gates>
<devices>
<device name="" package="DIL08-0.1P-6W">
<connects>
<connect gate="G$1" pin="GND" pad="4"/>
<connect gate="G$1" pin="HV" pad="7"/>
<connect gate="G$1" pin="HVG" pad="5"/>
<connect gate="G$1" pin="IN1" pad="2"/>
<connect gate="G$1" pin="IN2" pad="3"/>
<connect gate="G$1" pin="NC" pad="1"/>
<connect gate="G$1" pin="OUT1" pad="8"/>
<connect gate="G$1" pin="OUT2" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Voltage Regulators">
<packages>
<package name="TO-220">
<pad name="1" x="0" y="-2.54" drill="1.1" diameter="1.778" shape="square"/>
<pad name="2" x="0" y="0" drill="1.1" diameter="1.778" shape="octagon"/>
<pad name="3" x="0" y="2.54" drill="1.1" diameter="1.778" shape="octagon"/>
<wire x1="-5.08" y1="5.08" x2="2.54" y2="5.08" width="0.127" layer="21"/>
<wire x1="2.54" y1="5.08" x2="2.54" y2="-5.08" width="0.127" layer="21"/>
<wire x1="2.54" y1="-5.08" x2="-5.08" y2="-5.08" width="0.127" layer="21"/>
<wire x1="-5.08" y1="-5.08" x2="-5.08" y2="5.08" width="0.127" layer="21"/>
<text x="-3.81" y="2.54" size="0.762" layer="21">VIN</text>
<text x="-3.81" y="0" size="0.762" layer="21">VOUT</text>
<text x="-3.81" y="-3.81" size="0.762" layer="21">ADJ/
GND</text>
</package>
</packages>
<symbols>
<symbol name="IN-OUT-ADJ">
<wire x1="-10.16" y1="5.08" x2="-10.16" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-5.08" x2="10.16" y2="-5.08" width="0.254" layer="94"/>
<wire x1="10.16" y1="-5.08" x2="10.16" y2="5.08" width="0.254" layer="94"/>
<wire x1="10.16" y1="5.08" x2="-10.16" y2="5.08" width="0.254" layer="94"/>
<pin name="VIN" x="-15.24" y="0" length="middle"/>
<pin name="VOUT" x="15.24" y="2.54" length="middle" rot="R180"/>
<pin name="ADJ" x="15.24" y="-2.54" length="middle" rot="R180"/>
<text x="-10.16" y="5.08" size="1.27" layer="95">&gt;NAME</text>
<text x="-10.16" y="-5.08" size="1.27" layer="96">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="LM1084" prefix="VR" uservalue="yes">
<gates>
<gate name="G$1" symbol="IN-OUT-ADJ" x="0" y="0"/>
</gates>
<devices>
<device name="" package="TO-220">
<connects>
<connect gate="G$1" pin="ADJ" pad="1"/>
<connect gate="G$1" pin="VIN" pad="3"/>
<connect gate="G$1" pin="VOUT" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="SparkFun-PowerIC">
<description>&lt;h3&gt;SparkFun Electronics' preferred foot prints&lt;/h3&gt;
In this library you'll find drivers, regulators, and amplifiers.&lt;br&gt;&lt;br&gt;
We've spent an enormous amount of time creating and checking these footprints and parts, but it is the end user's responsibility to ensure correctness and suitablity for a given componet or application. If you enjoy using this library, please buy one of our products at www.sparkfun.com.
&lt;br&gt;&lt;br&gt;
&lt;b&gt;Licensing:&lt;/b&gt; Creative Commons ShareAlike 4.0 International - https://creativecommons.org/licenses/by-sa/4.0/ 
&lt;br&gt;&lt;br&gt;
You are welcome to use this library for commercial purposes. For attribution, we ask that when you begin to sell your device using our footprint, you email us with a link to the product being sold. We want bragging rights that we helped (in a very small part) to create your 8th world wonder. We would like the opportunity to feature your device on our homepage.</description>
<packages>
<package name="SOT23-5">
<description>&lt;b&gt;Small Outline Transistor&lt;/b&gt;</description>
<wire x1="1.27" y1="0.4294" x2="1.27" y2="-0.4294" width="0.2032" layer="21"/>
<wire x1="1.4" y1="-0.8" x2="-1.4" y2="-0.8" width="0.1524" layer="51"/>
<wire x1="-1.27" y1="-0.4294" x2="-1.27" y2="0.4294" width="0.2032" layer="21"/>
<wire x1="-1.4" y1="0.8" x2="1.4" y2="0.8" width="0.1524" layer="51"/>
<wire x1="-0.2684" y1="0.7088" x2="0.2684" y2="0.7088" width="0.2032" layer="21"/>
<wire x1="1.4" y1="0.8" x2="1.4" y2="-0.8" width="0.1524" layer="51"/>
<wire x1="-1.4" y1="0.8" x2="-1.4" y2="-0.8" width="0.1524" layer="51"/>
<rectangle x1="-1.2" y1="-1.5" x2="-0.7" y2="-0.85" layer="51"/>
<rectangle x1="-0.25" y1="-1.5" x2="0.25" y2="-0.85" layer="51"/>
<rectangle x1="0.7" y1="-1.5" x2="1.2" y2="-0.85" layer="51"/>
<rectangle x1="0.7" y1="0.85" x2="1.2" y2="1.5" layer="51"/>
<rectangle x1="-1.2" y1="0.85" x2="-0.7" y2="1.5" layer="51"/>
<smd name="1" x="-0.95" y="-1.3001" dx="0.55" dy="1.2" layer="1"/>
<smd name="2" x="0" y="-1.3001" dx="0.55" dy="1.2" layer="1"/>
<smd name="3" x="0.95" y="-1.3001" dx="0.55" dy="1.2" layer="1"/>
<smd name="4" x="0.95" y="1.3001" dx="0.55" dy="1.2" layer="1"/>
<smd name="5" x="-0.95" y="1.3001" dx="0.55" dy="1.2" layer="1"/>
<text x="-0.889" y="2.159" size="0.4064" layer="25">&gt;NAME</text>
<text x="-0.9525" y="-0.1905" size="0.4064" layer="27">&gt;VALUE</text>
<circle x="-1.6002" y="-1.016" radius="0.127" width="0" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="V-REG-LDO">
<wire x1="-7.62" y1="-7.62" x2="5.08" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="5.08" y1="-7.62" x2="5.08" y2="7.62" width="0.4064" layer="94"/>
<wire x1="5.08" y1="7.62" x2="-7.62" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-7.62" y1="7.62" x2="-7.62" y2="-7.62" width="0.4064" layer="94"/>
<text x="-7.62" y="9.144" size="1.778" layer="95">&gt;NAME</text>
<text x="-7.62" y="-11.43" size="1.778" layer="96">&gt;VALUE</text>
<pin name="IN" x="-10.16" y="5.08" visible="pin" length="short" direction="in"/>
<pin name="GND" x="-10.16" y="-5.08" visible="pin" length="short" direction="in"/>
<pin name="OUT" x="7.62" y="5.08" visible="pin" length="short" direction="pas" rot="R180"/>
<pin name="EN" x="-10.16" y="0" visible="pin" length="short" direction="in"/>
<pin name="BP" x="7.62" y="-5.08" visible="pin" length="short" direction="in" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="V_REG_MIC5219" prefix="U" uservalue="yes">
<description>&lt;b&gt;V_REG MIC5219&lt;/b&gt;
Standard 3.3V and 5V 500mA LDO voltage regulator in SOT-23 layout. Micrel part MIC5219. BP (by-pass) pin is used to lower output noise with 470pF cap, may be left open.</description>
<gates>
<gate name="G$1" symbol="V-REG-LDO" x="2.54" y="0"/>
</gates>
<devices>
<device name="3.3V" package="SOT23-5">
<connects>
<connect gate="G$1" pin="BP" pad="4"/>
<connect gate="G$1" pin="EN" pad="3"/>
<connect gate="G$1" pin="GND" pad="2"/>
<connect gate="G$1" pin="IN" pad="1"/>
<connect gate="G$1" pin="OUT" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="VREG-09872"/>
<attribute name="VALUE" value="MIC5219 3.3V" constant="no"/>
</technology>
</technologies>
</device>
<device name="5V" package="SOT23-5">
<connects>
<connect gate="G$1" pin="BP" pad="4"/>
<connect gate="G$1" pin="EN" pad="3"/>
<connect gate="G$1" pin="GND" pad="2"/>
<connect gate="G$1" pin="IN" pad="1"/>
<connect gate="G$1" pin="OUT" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="VREG-10107"/>
<attribute name="VALUE" value="MIC5219 5V" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="SparkFun-Electromechanical">
<description>&lt;h3&gt;SparkFun Electronics' preferred foot prints&lt;/h3&gt;
In this library you'll find anything that moves- switches, relays, buttons, potentiometers. Also, anything that goes on a board but isn't electrical in nature- screws, standoffs, etc.&lt;br&gt;&lt;br&gt;
We've spent an enormous amount of time creating and checking these footprints and parts, but it is the end user's responsibility to ensure correctness and suitablity for a given componet or application. If you enjoy using this library, please buy one of our products at www.sparkfun.com.
&lt;br&gt;&lt;br&gt;
&lt;b&gt;Licensing:&lt;/b&gt; Creative Commons ShareAlike 4.0 International - https://creativecommons.org/licenses/by-sa/4.0/ 
&lt;br&gt;&lt;br&gt;
You are welcome to use this library for commercial purposes. For attribution, we ask that when you begin to sell your device using our footprint, you email us with a link to the product being sold. We want bragging rights that we helped (in a very small part) to create your 8th world wonder. We would like the opportunity to feature your device on our homepage.</description>
<packages>
<package name="TACTILE-PTH">
<description>&lt;b&gt;OMRON SWITCH&lt;/b&gt;</description>
<wire x1="3.048" y1="1.016" x2="3.048" y2="2.54" width="0.2032" layer="51"/>
<wire x1="3.048" y1="2.54" x2="2.54" y2="3.048" width="0.2032" layer="51"/>
<wire x1="2.54" y1="-3.048" x2="3.048" y2="-2.54" width="0.2032" layer="51"/>
<wire x1="3.048" y1="-2.54" x2="3.048" y2="-1.016" width="0.2032" layer="51"/>
<wire x1="-2.54" y1="3.048" x2="-3.048" y2="2.54" width="0.2032" layer="51"/>
<wire x1="-3.048" y1="2.54" x2="-3.048" y2="1.016" width="0.2032" layer="51"/>
<wire x1="-2.54" y1="-3.048" x2="-3.048" y2="-2.54" width="0.2032" layer="51"/>
<wire x1="-3.048" y1="-2.54" x2="-3.048" y2="-1.016" width="0.2032" layer="51"/>
<wire x1="2.54" y1="-3.048" x2="2.159" y2="-3.048" width="0.2032" layer="51"/>
<wire x1="-2.54" y1="-3.048" x2="-2.159" y2="-3.048" width="0.2032" layer="51"/>
<wire x1="-2.54" y1="3.048" x2="-2.159" y2="3.048" width="0.2032" layer="51"/>
<wire x1="2.54" y1="3.048" x2="2.159" y2="3.048" width="0.2032" layer="51"/>
<wire x1="2.159" y1="3.048" x2="-2.159" y2="3.048" width="0.2032" layer="21"/>
<wire x1="-2.159" y1="-3.048" x2="2.159" y2="-3.048" width="0.2032" layer="21"/>
<wire x1="3.048" y1="0.998" x2="3.048" y2="-1.016" width="0.2032" layer="21"/>
<wire x1="-3.048" y1="1.028" x2="-3.048" y2="-1.016" width="0.2032" layer="21"/>
<wire x1="-2.54" y1="1.27" x2="-2.54" y2="0.508" width="0.2032" layer="51"/>
<wire x1="-2.54" y1="-0.508" x2="-2.54" y2="-1.27" width="0.2032" layer="51"/>
<wire x1="-2.54" y1="0.508" x2="-2.159" y2="-0.381" width="0.2032" layer="51"/>
<circle x="0" y="0" radius="1.778" width="0.2032" layer="21"/>
<pad name="1" x="-3.2512" y="2.2606" drill="1.016" diameter="1.8796"/>
<pad name="2" x="3.2512" y="2.2606" drill="1.016" diameter="1.8796"/>
<pad name="3" x="-3.2512" y="-2.2606" drill="1.016" diameter="1.8796"/>
<pad name="4" x="3.2512" y="-2.2606" drill="1.016" diameter="1.8796"/>
<text x="-2.54" y="3.81" size="1.27" layer="25" ratio="10">&gt;NAME</text>
</package>
<package name="TACTILE_SWITCH_SMD-2">
<wire x1="1.905" y1="1.27" x2="1.905" y2="0.445" width="0.127" layer="51"/>
<wire x1="1.905" y1="0.445" x2="2.16" y2="-0.01" width="0.127" layer="51"/>
<wire x1="1.905" y1="-0.23" x2="1.905" y2="-1.115" width="0.127" layer="51"/>
<wire x1="-2.25" y1="2.25" x2="2.25" y2="2.25" width="0.127" layer="51"/>
<wire x1="2.25" y1="2.25" x2="2.25" y2="-2.25" width="0.127" layer="51"/>
<wire x1="2.25" y1="-2.25" x2="-2.25" y2="-2.25" width="0.127" layer="51"/>
<wire x1="-2.25" y1="-2.25" x2="-2.25" y2="2.25" width="0.127" layer="51"/>
<wire x1="-2.2" y1="0.8" x2="-2.2" y2="-0.8" width="0.2032" layer="21"/>
<wire x1="1.3" y1="2.2" x2="-1.3" y2="2.2" width="0.2032" layer="21"/>
<wire x1="2.2" y1="-0.8" x2="2.2" y2="0.8" width="0.2032" layer="21"/>
<wire x1="-1.3" y1="-2.2" x2="1.3" y2="-2.2" width="0.2032" layer="21"/>
<wire x1="2.2" y1="0.8" x2="1.8" y2="0.8" width="0.2032" layer="21"/>
<wire x1="2.2" y1="-0.8" x2="1.8" y2="-0.8" width="0.2032" layer="21"/>
<wire x1="-1.8" y1="0.8" x2="-2.2" y2="0.8" width="0.2032" layer="21"/>
<wire x1="-1.8" y1="-0.8" x2="-2.2" y2="-0.8" width="0.2032" layer="21"/>
<circle x="0" y="0" radius="1.27" width="0.2032" layer="21"/>
<smd name="1" x="2.225" y="1.75" dx="1.1" dy="0.7" layer="1" rot="R90"/>
<smd name="2" x="2.225" y="-1.75" dx="1.1" dy="0.7" layer="1" rot="R90"/>
<smd name="3" x="-2.225" y="-1.75" dx="1.1" dy="0.7" layer="1" rot="R90"/>
<smd name="4" x="-2.225" y="1.75" dx="1.1" dy="0.7" layer="1" rot="R90"/>
<text x="-0.889" y="1.778" size="0.4064" layer="25">&gt;NAME</text>
<text x="-0.889" y="-2.032" size="0.4064" layer="27">&gt;Value</text>
</package>
<package name="TACTILE-PTH-12MM">
<wire x1="5" y1="-1.3" x2="5" y2="-0.7" width="0.2032" layer="51"/>
<wire x1="5" y1="-0.7" x2="4.5" y2="-0.2" width="0.2032" layer="51"/>
<wire x1="5" y1="0.2" x2="5" y2="1" width="0.2032" layer="51"/>
<wire x1="-6" y1="4" x2="-6" y2="5" width="0.2032" layer="21"/>
<wire x1="-5" y1="6" x2="5" y2="6" width="0.2032" layer="21"/>
<wire x1="6" y1="5" x2="6" y2="4" width="0.2032" layer="21"/>
<wire x1="6" y1="1" x2="6" y2="-1" width="0.2032" layer="21"/>
<wire x1="6" y1="-4" x2="6" y2="-5" width="0.2032" layer="21"/>
<wire x1="5" y1="-6" x2="-5" y2="-6" width="0.2032" layer="21"/>
<wire x1="-6" y1="-5" x2="-6" y2="-4" width="0.2032" layer="21"/>
<wire x1="-6" y1="-1" x2="-6" y2="1" width="0.2032" layer="21"/>
<wire x1="-6" y1="5" x2="-5" y2="6" width="0.2032" layer="21" curve="-90"/>
<wire x1="5" y1="6" x2="6" y2="5" width="0.2032" layer="21" curve="-90"/>
<wire x1="6" y1="-5" x2="5" y2="-6" width="0.2032" layer="21" curve="-90"/>
<wire x1="-5" y1="-6" x2="-6" y2="-5" width="0.2032" layer="21" curve="-90"/>
<circle x="0" y="0" radius="3.5" width="0.2032" layer="21"/>
<circle x="-4.5" y="4.5" radius="0.3" width="0.7" layer="21"/>
<circle x="4.5" y="4.5" radius="0.3" width="0.7" layer="21"/>
<circle x="4.5" y="-4.5" radius="0.3" width="0.7" layer="21"/>
<circle x="-4.5" y="-4.5" radius="0.3" width="0.7" layer="21"/>
<pad name="4" x="-6.25" y="2.5" drill="1.2" diameter="2.159"/>
<pad name="2" x="-6.25" y="-2.5" drill="1.2" diameter="2.159"/>
<pad name="1" x="6.25" y="-2.5" drill="1.2" diameter="2.159"/>
<pad name="3" x="6.25" y="2.5" drill="1.2" diameter="2.159"/>
</package>
<package name="TACTILE-SWITCH-1101NE">
<description>SparkFun SKU# COM-08229</description>
<wire x1="-3" y1="1.1" x2="-3" y2="-1.1" width="0.127" layer="51"/>
<wire x1="3" y1="1.1" x2="3" y2="-1.1" width="0.127" layer="51"/>
<wire x1="-2.75" y1="1.75" x2="-3" y2="1.5" width="0.2032" layer="21" curve="90"/>
<wire x1="-2.75" y1="1.75" x2="2.75" y2="1.75" width="0.2032" layer="21"/>
<wire x1="2.75" y1="1.75" x2="3" y2="1.5" width="0.2032" layer="21" curve="-90"/>
<wire x1="3" y1="-1.5" x2="2.75" y2="-1.75" width="0.2032" layer="21" curve="-90"/>
<wire x1="2.75" y1="-1.75" x2="-2.75" y2="-1.75" width="0.2032" layer="21"/>
<wire x1="-3" y1="-1.5" x2="-2.75" y2="-1.75" width="0.2032" layer="21" curve="90"/>
<wire x1="-3" y1="-1.5" x2="-3" y2="-1.1" width="0.2032" layer="21"/>
<wire x1="-3" y1="1.1" x2="-3" y2="1.5" width="0.2032" layer="21"/>
<wire x1="3" y1="1.1" x2="3" y2="1.5" width="0.2032" layer="21"/>
<wire x1="3" y1="-1.5" x2="3" y2="-1.1" width="0.2032" layer="21"/>
<wire x1="-1.5" y1="0.75" x2="1.5" y2="0.75" width="0.2032" layer="21"/>
<wire x1="1.5" y1="-0.75" x2="-1.5" y2="-0.75" width="0.2032" layer="21"/>
<wire x1="-1.5" y1="-0.75" x2="-1.5" y2="0.75" width="0.2032" layer="21"/>
<wire x1="1.5" y1="-0.75" x2="1.5" y2="0.75" width="0.2032" layer="21"/>
<wire x1="-2" y1="0" x2="-1" y2="0" width="0.127" layer="51"/>
<wire x1="-1" y1="0" x2="0.1" y2="0.5" width="0.127" layer="51"/>
<wire x1="0.3" y1="0" x2="2" y2="0" width="0.127" layer="51"/>
<smd name="1" x="-3.15" y="0" dx="2.3" dy="1.6" layer="1" rot="R180"/>
<smd name="2" x="3.15" y="0" dx="2.3" dy="1.6" layer="1" rot="R180"/>
<text x="-3" y="2" size="0.762" layer="25">&gt;NAME</text>
<text x="-3" y="-2.7" size="0.762" layer="27">&gt;VALUE</text>
</package>
<package name="REED_SWITCH_PTH">
<wire x1="-6.985" y1="-0.635" x2="6.985" y2="-0.635" width="0.127" layer="21"/>
<wire x1="-6.985" y1="-0.635" x2="-6.985" y2="0" width="0.127" layer="21"/>
<wire x1="-6.985" y1="0" x2="-6.985" y2="0.635" width="0.127" layer="21"/>
<wire x1="-6.985" y1="0.635" x2="6.985" y2="0.635" width="0.127" layer="21"/>
<wire x1="6.985" y1="0.635" x2="6.985" y2="0" width="0.127" layer="21"/>
<wire x1="6.985" y1="0" x2="6.985" y2="-0.635" width="0.127" layer="21"/>
<wire x1="-6.985" y1="0" x2="-7.62" y2="0" width="0.127" layer="21"/>
<wire x1="6.985" y1="0" x2="7.62" y2="0" width="0.127" layer="21"/>
<pad name="P$1" x="-8.89" y="0" drill="1.016" diameter="1.8796"/>
<pad name="P$2" x="8.89" y="0" drill="1.016" diameter="1.8796"/>
</package>
<package name="TACTILE_SWITCH_TALL">
<wire x1="-3" y1="-3" x2="3" y2="-3" width="0.254" layer="21"/>
<wire x1="3" y1="-3" x2="3" y2="3" width="0.254" layer="21"/>
<wire x1="3" y1="3" x2="-3" y2="3" width="0.254" layer="21"/>
<wire x1="-3" y1="3" x2="-3" y2="-3" width="0.254" layer="21"/>
<circle x="0" y="0" radius="1.75" width="0.254" layer="21"/>
<smd name="A1" x="-3.975" y="-2.25" dx="1.3" dy="1.55" layer="1" rot="R90"/>
<smd name="A2" x="3.975" y="-2.25" dx="1.3" dy="1.55" layer="1" rot="R90"/>
<smd name="B1" x="-3.975" y="2.25" dx="1.3" dy="1.55" layer="1" rot="R90"/>
<smd name="B2" x="3.975" y="2.25" dx="1.3" dy="1.55" layer="1" rot="R90"/>
</package>
<package name="REED_SWITCH_PLASTIC">
<wire x1="-7.5" y1="-1.65" x2="7.5" y2="-1.65" width="0.127" layer="21"/>
<wire x1="-7.5" y1="-1.65" x2="-7.5" y2="0" width="0.127" layer="21"/>
<wire x1="-7.5" y1="0" x2="-7.5" y2="1.65" width="0.127" layer="21"/>
<wire x1="-7.5" y1="1.65" x2="7.5" y2="1.65" width="0.127" layer="21"/>
<wire x1="7.5" y1="1.65" x2="7.5" y2="0" width="0.127" layer="21"/>
<wire x1="7.5" y1="0" x2="7.5" y2="-1.65" width="0.127" layer="21"/>
<wire x1="-7.5" y1="0" x2="-7.72" y2="0" width="0.127" layer="21"/>
<wire x1="7.5" y1="0" x2="7.72" y2="0" width="0.127" layer="21"/>
<pad name="P$1" x="-8.89" y="0" drill="1.016" diameter="1.8796"/>
<pad name="P$2" x="8.89" y="0" drill="1.016" diameter="1.8796"/>
</package>
<package name="TACTILE-PTH-SIDEEZ">
<wire x1="1.5" y1="-3.8" x2="-1.5" y2="-3.8" width="0.2032" layer="51"/>
<wire x1="-3.65" y1="-2" x2="-3.65" y2="3.5" width="0.2032" layer="51"/>
<wire x1="-3.65" y1="3.5" x2="-3" y2="3.5" width="0.2032" layer="51"/>
<wire x1="3" y1="3.5" x2="3.65" y2="3.5" width="0.2032" layer="51"/>
<wire x1="3.65" y1="3.5" x2="3.65" y2="-2" width="0.2032" layer="51"/>
<wire x1="-3" y1="2" x2="3" y2="2" width="0.2032" layer="51"/>
<wire x1="-3" y1="2" x2="-3" y2="3.5" width="0.2032" layer="51"/>
<wire x1="3" y1="2" x2="3" y2="3.5" width="0.2032" layer="51"/>
<wire x1="-3.65" y1="-2" x2="-1.5" y2="-2" width="0.2032" layer="51"/>
<wire x1="-1.5" y1="-2" x2="1.5" y2="-2" width="0.2032" layer="51"/>
<wire x1="1.5" y1="-2" x2="3.65" y2="-2" width="0.2032" layer="51"/>
<wire x1="1.5" y1="-2" x2="1.5" y2="-3.8" width="0.2032" layer="51"/>
<wire x1="-1.5" y1="-2" x2="-1.5" y2="-3.8" width="0.2032" layer="51"/>
<wire x1="-3.65" y1="1" x2="-3.65" y2="-2" width="0.2032" layer="21"/>
<wire x1="-3.65" y1="-2" x2="3.65" y2="-2" width="0.2032" layer="21"/>
<wire x1="3.65" y1="-2" x2="3.65" y2="1" width="0.2032" layer="21"/>
<wire x1="2" y1="2" x2="-2" y2="2" width="0.2032" layer="21"/>
<pad name="ANCHOR1" x="-3.5" y="2.5" drill="1.2" diameter="2.2" stop="no"/>
<pad name="ANCHOR2" x="3.5" y="2.5" drill="1.2" diameter="2.2" stop="no"/>
<pad name="1" x="-2.5" y="0" drill="0.8" diameter="1.7" stop="no"/>
<pad name="2" x="2.5" y="0" drill="0.8" diameter="1.7" stop="no"/>
<text x="-2.54" y="3.81" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<circle x="2.5" y="0" radius="0.4445" width="0" layer="29"/>
<circle x="-2.5" y="0" radius="0.4445" width="0" layer="29"/>
<circle x="-3.5" y="2.5" radius="0.635" width="0" layer="29"/>
<circle x="3.5" y="2.5" radius="0.635" width="0" layer="29"/>
<circle x="-3.5" y="2.5" radius="1.143" width="0" layer="30"/>
<circle x="2.5" y="0" radius="0.889" width="0" layer="30"/>
<circle x="-2.5" y="0" radius="0.889" width="0" layer="30"/>
<circle x="3.5" y="2.5" radius="1.143" width="0" layer="30"/>
</package>
<package name="TACTILE_SWITCH_SMD-3">
<wire x1="-2.04" y1="-0.44" x2="-2.04" y2="0.47" width="0.2032" layer="21"/>
<wire x1="-1.04" y1="1.14" x2="1.04" y2="1.14" width="0.2032" layer="21"/>
<circle x="0" y="0" radius="0.8" width="0.15" layer="21"/>
<smd name="1" x="-1.8" y="1.1" dx="0.8" dy="1" layer="1" rot="R90"/>
<smd name="2" x="1.8" y="1.1" dx="0.8" dy="1" layer="1" rot="R90"/>
<smd name="3" x="-1.8" y="-1.1" dx="0.8" dy="1" layer="1" rot="R90"/>
<smd name="4" x="1.8" y="-1.1" dx="0.8" dy="1" layer="1" rot="R90"/>
<wire x1="2.06" y1="-0.44" x2="2.06" y2="0.47" width="0.2032" layer="21"/>
<wire x1="-1.04" y1="-1.16" x2="1.04" y2="-1.16" width="0.2032" layer="21"/>
</package>
<package name="TACTILE-SMD-12MM">
<wire x1="5" y1="-1.3" x2="5" y2="-0.7" width="0.2032" layer="51"/>
<wire x1="5" y1="-0.7" x2="4.5" y2="-0.2" width="0.2032" layer="51"/>
<wire x1="5" y1="0.2" x2="5" y2="1" width="0.2032" layer="51"/>
<wire x1="-6" y1="4" x2="-6" y2="5" width="0.2032" layer="21"/>
<wire x1="-5" y1="6" x2="5" y2="6" width="0.2032" layer="21"/>
<wire x1="6" y1="5" x2="6" y2="4" width="0.2032" layer="21"/>
<wire x1="6" y1="1" x2="6" y2="-1" width="0.2032" layer="21"/>
<wire x1="6" y1="-4" x2="6" y2="-5" width="0.2032" layer="21"/>
<wire x1="5" y1="-6" x2="-5" y2="-6" width="0.2032" layer="21"/>
<wire x1="-6" y1="-5" x2="-6" y2="-4" width="0.2032" layer="21"/>
<wire x1="-6" y1="-1" x2="-6" y2="1" width="0.2032" layer="21"/>
<circle x="0" y="0" radius="3.5" width="0.2032" layer="21"/>
<circle x="-4.5" y="4.5" radius="0.3" width="0.7" layer="21"/>
<circle x="4.5" y="4.5" radius="0.3" width="0.7" layer="21"/>
<circle x="4.5" y="-4.5" radius="0.3" width="0.7" layer="21"/>
<circle x="-4.5" y="-4.5" radius="0.3" width="0.7" layer="21"/>
<smd name="4" x="-6.975" y="2.5" dx="1.6" dy="1.55" layer="1"/>
<smd name="2" x="-6.975" y="-2.5" dx="1.6" dy="1.55" layer="1"/>
<smd name="1" x="6.975" y="-2.5" dx="1.6" dy="1.55" layer="1"/>
<smd name="3" x="6.975" y="2.5" dx="1.6" dy="1.55" layer="1"/>
<wire x1="-6" y1="-5" x2="-5" y2="-6" width="0.2032" layer="21"/>
<wire x1="6" y1="-5" x2="5" y2="-6" width="0.2032" layer="21"/>
<wire x1="6" y1="5" x2="5" y2="6" width="0.2032" layer="21"/>
<wire x1="-5" y1="6" x2="-6" y2="5" width="0.2032" layer="21"/>
</package>
<package name="TACTILE-PTH-EZ">
<wire x1="3.048" y1="1.016" x2="3.048" y2="2.54" width="0.2032" layer="51"/>
<wire x1="3.048" y1="2.54" x2="2.54" y2="3.048" width="0.2032" layer="51"/>
<wire x1="2.54" y1="-3.048" x2="3.048" y2="-2.54" width="0.2032" layer="51"/>
<wire x1="3.048" y1="-2.54" x2="3.048" y2="-1.016" width="0.2032" layer="51"/>
<wire x1="-2.54" y1="3.048" x2="-3.048" y2="2.54" width="0.2032" layer="51"/>
<wire x1="-3.048" y1="2.54" x2="-3.048" y2="1.016" width="0.2032" layer="51"/>
<wire x1="-2.54" y1="-3.048" x2="-3.048" y2="-2.54" width="0.2032" layer="51"/>
<wire x1="-3.048" y1="-2.54" x2="-3.048" y2="-1.016" width="0.2032" layer="51"/>
<wire x1="2.54" y1="-3.048" x2="2.159" y2="-3.048" width="0.2032" layer="51"/>
<wire x1="-2.54" y1="-3.048" x2="-2.159" y2="-3.048" width="0.2032" layer="51"/>
<wire x1="-2.54" y1="3.048" x2="-2.159" y2="3.048" width="0.2032" layer="51"/>
<wire x1="2.54" y1="3.048" x2="2.159" y2="3.048" width="0.2032" layer="51"/>
<wire x1="2.159" y1="3.048" x2="-2.159" y2="3.048" width="0.2032" layer="21"/>
<wire x1="-2.159" y1="-3.048" x2="2.159" y2="-3.048" width="0.2032" layer="21"/>
<wire x1="3.048" y1="0.998" x2="3.048" y2="-1.016" width="0.2032" layer="21"/>
<wire x1="-3.048" y1="1.028" x2="-3.048" y2="-1.016" width="0.2032" layer="21"/>
<wire x1="-2.54" y1="1.27" x2="-2.54" y2="0.508" width="0.2032" layer="51"/>
<wire x1="-2.54" y1="-0.508" x2="-2.54" y2="-1.27" width="0.2032" layer="51"/>
<wire x1="-2.54" y1="0.508" x2="-2.159" y2="-0.381" width="0.2032" layer="51"/>
<circle x="0" y="0" radius="1.778" width="0.2032" layer="21"/>
<pad name="1" x="-3.2512" y="2.2606" drill="1.016" diameter="1.8796" stop="no"/>
<pad name="2" x="3.2512" y="2.2606" drill="1.016" diameter="1.8796" stop="no"/>
<pad name="3" x="-3.2512" y="-2.2606" drill="1.016" diameter="1.8796" stop="no"/>
<pad name="4" x="3.2512" y="-2.2606" drill="1.016" diameter="1.8796" stop="no"/>
<text x="-2.54" y="3.81" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<polygon width="0.127" layer="30">
<vertex x="-3.2664" y="3.142"/>
<vertex x="-3.2589" y="3.1445" curve="89.986886"/>
<vertex x="-4.1326" y="2.286"/>
<vertex x="-4.1351" y="2.2657" curve="90.00652"/>
<vertex x="-3.2563" y="1.392"/>
<vertex x="-3.2487" y="1.3869" curve="90.006616"/>
<vertex x="-2.3826" y="2.2403"/>
<vertex x="-2.3775" y="2.2683" curve="89.98711"/>
</polygon>
<polygon width="0.127" layer="29">
<vertex x="-3.2462" y="2.7026"/>
<vertex x="-3.2589" y="2.7051" curve="90.026544"/>
<vertex x="-3.6881" y="2.2733"/>
<vertex x="-3.6881" y="2.2632" curve="89.974074"/>
<vertex x="-3.2562" y="1.8213"/>
<vertex x="-3.2259" y="1.8186" curve="90.051271"/>
<vertex x="-2.8093" y="2.2658"/>
<vertex x="-2.8093" y="2.2606" curve="90.012964"/>
</polygon>
<polygon width="0.127" layer="30">
<vertex x="3.2411" y="3.1395"/>
<vertex x="3.2486" y="3.142" curve="89.986886"/>
<vertex x="2.3749" y="2.2835"/>
<vertex x="2.3724" y="2.2632" curve="90.00652"/>
<vertex x="3.2512" y="1.3895"/>
<vertex x="3.2588" y="1.3844" curve="90.006616"/>
<vertex x="4.1249" y="2.2378"/>
<vertex x="4.13" y="2.2658" curve="89.98711"/>
</polygon>
<polygon width="0.127" layer="29">
<vertex x="3.2613" y="2.7001"/>
<vertex x="3.2486" y="2.7026" curve="90.026544"/>
<vertex x="2.8194" y="2.2708"/>
<vertex x="2.8194" y="2.2607" curve="89.974074"/>
<vertex x="3.2513" y="1.8188"/>
<vertex x="3.2816" y="1.8161" curve="90.051271"/>
<vertex x="3.6982" y="2.2633"/>
<vertex x="3.6982" y="2.2581" curve="90.012964"/>
</polygon>
<polygon width="0.127" layer="30">
<vertex x="-3.2613" y="-1.3868"/>
<vertex x="-3.2538" y="-1.3843" curve="89.986886"/>
<vertex x="-4.1275" y="-2.2428"/>
<vertex x="-4.13" y="-2.2631" curve="90.00652"/>
<vertex x="-3.2512" y="-3.1368"/>
<vertex x="-3.2436" y="-3.1419" curve="90.006616"/>
<vertex x="-2.3775" y="-2.2885"/>
<vertex x="-2.3724" y="-2.2605" curve="89.98711"/>
</polygon>
<polygon width="0.127" layer="29">
<vertex x="-3.2411" y="-1.8262"/>
<vertex x="-3.2538" y="-1.8237" curve="90.026544"/>
<vertex x="-3.683" y="-2.2555"/>
<vertex x="-3.683" y="-2.2656" curve="89.974074"/>
<vertex x="-3.2511" y="-2.7075"/>
<vertex x="-3.2208" y="-2.7102" curve="90.051271"/>
<vertex x="-2.8042" y="-2.263"/>
<vertex x="-2.8042" y="-2.2682" curve="90.012964"/>
</polygon>
<polygon width="0.127" layer="30">
<vertex x="3.2411" y="-1.3843"/>
<vertex x="3.2486" y="-1.3818" curve="89.986886"/>
<vertex x="2.3749" y="-2.2403"/>
<vertex x="2.3724" y="-2.2606" curve="90.00652"/>
<vertex x="3.2512" y="-3.1343"/>
<vertex x="3.2588" y="-3.1394" curve="90.006616"/>
<vertex x="4.1249" y="-2.286"/>
<vertex x="4.13" y="-2.258" curve="89.98711"/>
</polygon>
<polygon width="0.127" layer="29">
<vertex x="3.2613" y="-1.8237"/>
<vertex x="3.2486" y="-1.8212" curve="90.026544"/>
<vertex x="2.8194" y="-2.253"/>
<vertex x="2.8194" y="-2.2631" curve="89.974074"/>
<vertex x="3.2513" y="-2.705"/>
<vertex x="3.2816" y="-2.7077" curve="90.051271"/>
<vertex x="3.6982" y="-2.2605"/>
<vertex x="3.6982" y="-2.2657" curve="90.012964"/>
</polygon>
</package>
<package name="TACTILE-SWITCH-SMD">
<wire x1="-1.54" y1="-2.54" x2="-2.54" y2="-1.54" width="0.2032" layer="51"/>
<wire x1="-2.54" y1="-1.24" x2="-2.54" y2="1.27" width="0.2032" layer="21"/>
<wire x1="-2.54" y1="1.54" x2="-1.54" y2="2.54" width="0.2032" layer="51"/>
<wire x1="-1.54" y1="2.54" x2="1.54" y2="2.54" width="0.2032" layer="21"/>
<wire x1="1.54" y1="2.54" x2="2.54" y2="1.54" width="0.2032" layer="51"/>
<wire x1="2.54" y1="1.24" x2="2.54" y2="-1.24" width="0.2032" layer="21"/>
<wire x1="2.54" y1="-1.54" x2="1.54" y2="-2.54" width="0.2032" layer="51"/>
<wire x1="1.54" y1="-2.54" x2="-1.54" y2="-2.54" width="0.2032" layer="21"/>
<wire x1="1.905" y1="1.27" x2="1.905" y2="0.445" width="0.127" layer="51"/>
<wire x1="1.905" y1="0.445" x2="2.16" y2="-0.01" width="0.127" layer="51"/>
<wire x1="1.905" y1="-0.23" x2="1.905" y2="-1.115" width="0.127" layer="51"/>
<circle x="0" y="0" radius="1.27" width="0.2032" layer="21"/>
<smd name="1" x="-2.794" y="1.905" dx="0.762" dy="1.524" layer="1" rot="R90"/>
<smd name="2" x="2.794" y="1.905" dx="0.762" dy="1.524" layer="1" rot="R90"/>
<smd name="3" x="-2.794" y="-1.905" dx="0.762" dy="1.524" layer="1" rot="R90"/>
<smd name="4" x="2.794" y="-1.905" dx="0.762" dy="1.524" layer="1" rot="R90"/>
<text x="-0.889" y="1.778" size="0.4064" layer="25">&gt;NAME</text>
<text x="-0.889" y="-2.032" size="0.4064" layer="27">&gt;Value</text>
</package>
<package name="TACTILE_SWITCH-SMD-RIGHT-ANGLE">
<hole x="0" y="0.9" drill="0.7"/>
<hole x="0" y="-0.9" drill="0.7"/>
<smd name="1" x="-1.95" y="0" dx="2" dy="1.1" layer="1" rot="R90"/>
<smd name="2" x="1.95" y="0" dx="2" dy="1.1" layer="1" rot="R90"/>
<wire x1="-2" y1="1.2" x2="-2" y2="1.5" width="0.127" layer="21"/>
<wire x1="-2" y1="1.5" x2="2" y2="1.5" width="0.127" layer="21"/>
<wire x1="2" y1="1.5" x2="2" y2="1.2" width="0.127" layer="21"/>
<wire x1="-2" y1="-1.2" x2="-2" y2="-1.5" width="0.127" layer="21"/>
<wire x1="-2" y1="-1.5" x2="-0.7" y2="-1.5" width="0.127" layer="21"/>
<wire x1="-0.7" y1="-1.5" x2="0.7" y2="-1.5" width="0.127" layer="21"/>
<wire x1="0.7" y1="-1.5" x2="2" y2="-1.5" width="0.127" layer="21"/>
<wire x1="2" y1="-1.5" x2="2" y2="-1.2" width="0.127" layer="21"/>
<wire x1="-0.7" y1="-2.1" x2="0.7" y2="-2.1" width="0.127" layer="21"/>
<wire x1="0.7" y1="-2.1" x2="0.7" y2="-1.5" width="0.127" layer="21"/>
<wire x1="-0.7" y1="-2.1" x2="-0.7" y2="-1.5" width="0.127" layer="21"/>
<text x="-2" y="1.7" size="0.8128" layer="25" ratio="15">&gt;NAME</text>
</package>
<package name="TACTILE_SWITCH_SMD_4.6X2.8MM">
<description>&lt;h3&gt;4.6 x 2.8mm Tactile Switch&lt;/h3&gt;

&lt;p&gt;&lt;a href="http://www.digikey.com/product-detail/en/KMR231NG%20LFS/CKN10246CT-ND/2176497"&gt;Example&lt;/a&gt;&lt;/p&gt;</description>
<smd name="3" x="2.05" y="0.8" dx="0.9" dy="1" layer="1"/>
<smd name="2" x="2.05" y="-0.8" dx="0.9" dy="1" layer="1"/>
<smd name="1" x="-2.05" y="-0.8" dx="0.9" dy="1" layer="1"/>
<smd name="4" x="-2.05" y="0.8" dx="0.9" dy="1" layer="1"/>
<wire x1="-2.1" y1="1.4" x2="-2.1" y2="-1.4" width="0.127" layer="51"/>
<wire x1="2.1" y1="-1.4" x2="2.1" y2="1.4" width="0.127" layer="51"/>
<wire x1="-2.1" y1="1.4" x2="2.1" y2="1.4" width="0.127" layer="51"/>
<wire x1="-2.1" y1="-1.4" x2="2.1" y2="-1.4" width="0.127" layer="51"/>
<circle x="0" y="0" radius="0.805" width="0.127" layer="21"/>
<wire x1="1.338" y1="-1.4" x2="-1.338" y2="-1.4" width="0.2032" layer="21"/>
<wire x1="-1.338" y1="1.4" x2="1.338" y2="1.4" width="0.2032" layer="21"/>
<wire x1="-2.1" y1="0.13" x2="-2.1" y2="-0.13" width="0.2032" layer="21"/>
<wire x1="2.1" y1="-0.13" x2="2.1" y2="0.13" width="0.2032" layer="21"/>
<text x="-2.54" y="1.524" size="0.8128" layer="25">&gt;Name</text>
<text x="-2.54" y="-1.524" size="0.8128" layer="27" align="top-left">&gt;Value</text>
<rectangle x1="-2.3" y1="0.5" x2="-2.1" y2="1.1" layer="51"/>
<rectangle x1="-2.3" y1="-1.1" x2="-2.1" y2="-0.5" layer="51"/>
<rectangle x1="2.1" y1="-1.1" x2="2.3" y2="-0.5" layer="51" rot="R180"/>
<rectangle x1="2.1" y1="0.5" x2="2.3" y2="1.1" layer="51" rot="R180"/>
</package>
</packages>
<symbols>
<symbol name="SWITCH-MOMENTARY-2">
<wire x1="1.905" y1="0" x2="2.54" y2="0" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="1.905" y2="1.27" width="0.254" layer="94"/>
<circle x="-2.54" y="0" radius="0.127" width="0.4064" layer="94"/>
<circle x="2.54" y="0" radius="0.127" width="0.4064" layer="94"/>
<text x="-2.54" y="2.54" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="2"/>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="SWITCH-MOMENTARY-2" prefix="S">
<description>Various NO switches- pushbuttons, reed, etc</description>
<gates>
<gate name="G$1" symbol="SWITCH-MOMENTARY-2" x="0" y="0"/>
</gates>
<devices>
<device name="PTH" package="TACTILE-PTH">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="3"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value=" SWCH-08441" constant="no"/>
</technology>
</technologies>
</device>
<device name="SMD-2" package="TACTILE_SWITCH_SMD-2">
<connects>
<connect gate="G$1" pin="1" pad="2"/>
<connect gate="G$1" pin="2" pad="1"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="SWCH-09213"/>
</technology>
</technologies>
</device>
<device name="12MM" package="TACTILE-PTH-12MM">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="3"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="SWCH-09185" constant="no"/>
</technology>
</technologies>
</device>
<device name="SMD-1101NE" package="TACTILE-SWITCH-1101NE">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="SWCH-00815" constant="no"/>
</technology>
</technologies>
</device>
<device name="PTH_REED" package="REED_SWITCH_PTH">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SMD-4" package="TACTILE_SWITCH_TALL">
<connects>
<connect gate="G$1" pin="1" pad="A2"/>
<connect gate="G$1" pin="2" pad="B2"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="SWCH-11966" constant="no"/>
</technology>
</technologies>
</device>
<device name="PTH_REED2" package="REED_SWITCH_PLASTIC">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="SWCH-10467" constant="no"/>
</technology>
</technologies>
</device>
<device name="SIDE_EZ" package="TACTILE-PTH-SIDEEZ">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SMD-3" package="TACTILE_SWITCH_SMD-3">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SMD-12MM" package="TACTILE-SMD-12MM">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PTH_EZ" package="TACTILE-PTH-EZ">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SMD" package="TACTILE-SWITCH-SMD">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="3"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="SWCH-08247" constant="no"/>
</technology>
</technologies>
</device>
<device name="SMD-REDUNDANT" package="TACTILE-SWITCH-SMD">
<connects>
<connect gate="G$1" pin="1" pad="1 2"/>
<connect gate="G$1" pin="2" pad="3 4"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="SWCH-08247" constant="no"/>
</technology>
</technologies>
</device>
<device name="TACTILE-SWITCH-SMD-RIGHT-ANGLE" package="TACTILE_SWITCH-SMD-RIGHT-ANGLE">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="COMP-12265" constant="no"/>
</technology>
</technologies>
</device>
<device name="SMD-4.6X2.8MM" package="TACTILE_SWITCH_SMD_4.6X2.8MM">
<connects>
<connect gate="G$1" pin="1" pad="1 2"/>
<connect gate="G$1" pin="2" pad="3 4"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="SWCH-13065"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="RF">
<packages>
<package name="XBEE-STD">
<wire x1="-5" y1="16.17" x2="5" y2="16.17" width="0.2032" layer="21"/>
<wire x1="-12.25" y1="9.82" x2="-5" y2="16.17" width="0.2032" layer="21"/>
<wire x1="12.25" y1="9.82" x2="5" y2="16.17" width="0.2032" layer="21"/>
<wire x1="-12.25" y1="-10.13" x2="-12.25" y2="-10.68" width="0.2032" layer="21"/>
<wire x1="-12.25" y1="-10.68" x2="-12.25" y2="-11.43" width="0.2032" layer="21"/>
<wire x1="12.25" y1="-10.68" x2="12.25" y2="-11.43" width="0.2032" layer="21"/>
<wire x1="-12.25" y1="-11.43" x2="12.25" y2="-11.43" width="0.2032" layer="21"/>
<wire x1="12.25" y1="-11.43" x2="12.25" y2="-17.68" width="0.2032" layer="51"/>
<wire x1="-12.25" y1="-11.43" x2="-12.25" y2="-17.68" width="0.2032" layer="51"/>
<wire x1="-12.25" y1="-17.68" x2="12.25" y2="-17.68" width="0.2032" layer="51"/>
<wire x1="-12.25" y1="-10.68" x2="-12.25" y2="9.82" width="0.2032" layer="51"/>
<wire x1="-9.75" y1="9.82" x2="-9.75" y2="-10.68" width="0.2032" layer="51"/>
<wire x1="-12.25" y1="-10.68" x2="-9.75" y2="-10.68" width="0.2032" layer="51"/>
<wire x1="-12.25" y1="9.82" x2="-9.75" y2="9.82" width="0.2032" layer="51"/>
<wire x1="-12.25" y1="-10.68" x2="-9.75" y2="-10.68" width="0.2032" layer="21"/>
<wire x1="-9.75" y1="-10.68" x2="-9.75" y2="-10.13" width="0.2032" layer="21"/>
<wire x1="-9.75" y1="9.17" x2="-9.75" y2="9.82" width="0.2032" layer="21"/>
<wire x1="-9.75" y1="9.82" x2="-12.25" y2="9.82" width="0.2032" layer="21"/>
<wire x1="-12.25" y1="9.82" x2="-12.25" y2="9.17" width="0.2032" layer="21"/>
<wire x1="9.75" y1="-10.68" x2="9.75" y2="9.82" width="0.2032" layer="51"/>
<wire x1="12.25" y1="9.82" x2="12.25" y2="-10.68" width="0.2032" layer="51"/>
<wire x1="9.75" y1="-10.68" x2="12.25" y2="-10.68" width="0.2032" layer="51"/>
<wire x1="9.75" y1="9.82" x2="12.25" y2="9.82" width="0.2032" layer="51"/>
<wire x1="9.75" y1="-10.68" x2="9.75" y2="-10.13" width="0.2032" layer="21"/>
<wire x1="9.75" y1="-10.68" x2="12.25" y2="-10.68" width="0.2032" layer="21"/>
<wire x1="12.25" y1="-10.68" x2="12.25" y2="-10.13" width="0.2032" layer="21"/>
<wire x1="12.25" y1="9.17" x2="12.25" y2="9.82" width="0.2032" layer="21"/>
<wire x1="12.25" y1="9.82" x2="9.75" y2="9.82" width="0.2032" layer="21"/>
<wire x1="9.75" y1="9.82" x2="9.75" y2="9.17" width="0.2032" layer="21"/>
<smd name="1" x="-12.5" y="8.57" dx="0.85" dy="1.7" layer="1" rot="R90"/>
<smd name="2" x="-9.5" y="6.57" dx="0.85" dy="1.7" layer="1" rot="R90"/>
<smd name="3" x="-12.5" y="4.57" dx="0.85" dy="1.7" layer="1" rot="R90"/>
<smd name="4" x="-9.5" y="2.57" dx="0.85" dy="1.7" layer="1" rot="R90"/>
<smd name="5" x="-12.5" y="0.57" dx="0.85" dy="1.7" layer="1" rot="R90"/>
<smd name="6" x="-9.5" y="-1.43" dx="0.85" dy="1.7" layer="1" rot="R90"/>
<smd name="7" x="-12.5" y="-3.43" dx="0.85" dy="1.7" layer="1" rot="R90"/>
<smd name="8" x="-9.5" y="-5.43" dx="0.85" dy="1.7" layer="1" rot="R90"/>
<smd name="9" x="-12.5" y="-7.43" dx="0.85" dy="1.7" layer="1" rot="R90"/>
<smd name="10" x="-9.5" y="-9.43" dx="0.85" dy="1.7" layer="1" rot="R90"/>
<smd name="11" x="12.5" y="-9.43" dx="0.85" dy="1.7" layer="1" rot="R90"/>
<smd name="12" x="9.5" y="-7.43" dx="0.85" dy="1.7" layer="1" rot="R90"/>
<smd name="13" x="12.5" y="-5.43" dx="0.85" dy="1.7" layer="1" rot="R90"/>
<smd name="14" x="9.5" y="-3.43" dx="0.85" dy="1.7" layer="1" rot="R90"/>
<smd name="15" x="12.5" y="-1.43" dx="0.85" dy="1.7" layer="1" rot="R90"/>
<smd name="16" x="9.5" y="0.57" dx="0.85" dy="1.7" layer="1" rot="R90"/>
<smd name="17" x="12.5" y="2.57" dx="0.85" dy="1.7" layer="1" rot="R90"/>
<smd name="18" x="9.5" y="4.57" dx="0.85" dy="1.7" layer="1" rot="R90"/>
<smd name="19" x="12.5" y="6.57" dx="0.85" dy="1.7" layer="1" rot="R90"/>
<smd name="20" x="9.5" y="8.57" dx="0.85" dy="1.7" layer="1" rot="R90"/>
<text x="-8.89" y="-8.89" size="0.4064" layer="25">&gt;Name</text>
<text x="-8.89" y="-10.16" size="0.4064" layer="27">&gt;Value</text>
<text x="-1.27" y="-15.24" size="1.27" layer="21">XBEE</text>
</package>
</packages>
<symbols>
<symbol name="XBEE-GEN">
<wire x1="-15.24" y1="15.24" x2="15.24" y2="15.24" width="0.254" layer="94"/>
<wire x1="15.24" y1="15.24" x2="15.24" y2="-12.7" width="0.254" layer="94"/>
<wire x1="15.24" y1="-12.7" x2="-15.24" y2="-12.7" width="0.254" layer="94"/>
<wire x1="-15.24" y1="-12.7" x2="-15.24" y2="15.24" width="0.254" layer="94"/>
<pin name="VCC" x="-20.32" y="12.7" length="middle"/>
<pin name="DOUT/D13" x="-20.32" y="10.16" length="middle"/>
<pin name="DIN/D14" x="-20.32" y="7.62" length="middle"/>
<pin name="D12" x="-20.32" y="5.08" length="middle"/>
<pin name="RST" x="-20.32" y="2.54" length="middle"/>
<pin name="D10/RSSI" x="-20.32" y="0" length="middle"/>
<pin name="D11" x="-20.32" y="-2.54" length="middle"/>
<pin name="NC" x="-20.32" y="-5.08" length="middle"/>
<pin name="D8" x="-20.32" y="-7.62" length="middle"/>
<pin name="GND" x="-20.32" y="-10.16" length="middle"/>
<pin name="D4" x="20.32" y="-10.16" length="middle" rot="R180"/>
<pin name="D7" x="20.32" y="-7.62" length="middle" rot="R180"/>
<pin name="D9" x="20.32" y="-5.08" length="middle" rot="R180"/>
<pin name="VREF/NC" x="20.32" y="-2.54" length="middle" rot="R180"/>
<pin name="D5/ASSOC" x="20.32" y="0" length="middle" rot="R180"/>
<pin name="D6" x="20.32" y="2.54" length="middle" rot="R180"/>
<pin name="D3" x="20.32" y="5.08" length="middle" rot="R180"/>
<pin name="D2" x="20.32" y="7.62" length="middle" rot="R180"/>
<pin name="D1" x="20.32" y="10.16" length="middle" rot="R180"/>
<pin name="D0" x="20.32" y="12.7" length="middle" rot="R180"/>
<text x="-2.54" y="12.7" size="1.27" layer="95">&gt;NAME</text>
<text x="-2.54" y="-10.16" size="1.27" layer="96">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="XBEE-WIFI">
<gates>
<gate name="G$1" symbol="XBEE-GEN" x="0" y="0"/>
</gates>
<devices>
<device name="" package="XBEE-STD">
<connects>
<connect gate="G$1" pin="D0" pad="20"/>
<connect gate="G$1" pin="D1" pad="19"/>
<connect gate="G$1" pin="D10/RSSI" pad="6"/>
<connect gate="G$1" pin="D11" pad="7"/>
<connect gate="G$1" pin="D12" pad="4"/>
<connect gate="G$1" pin="D2" pad="18"/>
<connect gate="G$1" pin="D3" pad="17"/>
<connect gate="G$1" pin="D4" pad="11"/>
<connect gate="G$1" pin="D5/ASSOC" pad="15"/>
<connect gate="G$1" pin="D6" pad="16"/>
<connect gate="G$1" pin="D7" pad="12"/>
<connect gate="G$1" pin="D8" pad="9"/>
<connect gate="G$1" pin="D9" pad="13"/>
<connect gate="G$1" pin="DIN/D14" pad="3"/>
<connect gate="G$1" pin="DOUT/D13" pad="2"/>
<connect gate="G$1" pin="GND" pad="10"/>
<connect gate="G$1" pin="NC" pad="8"/>
<connect gate="G$1" pin="RST" pad="5"/>
<connect gate="G$1" pin="VCC" pad="1"/>
<connect gate="G$1" pin="VREF/NC" pad="14"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="audio-connectors">
<packages>
<package name="SJ1-42534-SMT">
<smd name="4-1" x="0.5" y="4.7" dx="3" dy="3" layer="1"/>
<smd name="4-2" x="0.5" y="-4.7" dx="3" dy="3" layer="1"/>
<smd name="3" x="4.5" y="3.6" dx="1.8" dy="3" layer="1"/>
<smd name="2" x="4.5" y="-3.6" dx="1.8" dy="3" layer="1"/>
<smd name="6" x="7" y="2.8" dx="1.8" dy="2.8" layer="1"/>
<smd name="5" x="7" y="-2.8" dx="1.8" dy="2.8" layer="1"/>
<smd name="1" x="7.5" y="0" dx="1.8" dy="2.8" layer="1" rot="R90"/>
<wire x1="-3" y1="4" x2="6" y2="4" width="0.127" layer="21"/>
<wire x1="6" y1="4" x2="6" y2="2.5" width="0.127" layer="21"/>
<wire x1="6" y1="2.5" x2="7.5" y2="2.5" width="0.127" layer="21"/>
<wire x1="7.5" y1="2.5" x2="7.5" y2="-2.5" width="0.127" layer="21"/>
<wire x1="7.5" y1="-2.5" x2="6" y2="-2.5" width="0.127" layer="21"/>
<wire x1="6" y1="-2.5" x2="6" y2="-4" width="0.127" layer="21"/>
<wire x1="6" y1="-4" x2="-3" y2="-4" width="0.127" layer="21"/>
<wire x1="-4.5" y1="3" x2="-4.5" y2="-3" width="0.127" layer="21"/>
<wire x1="-3" y1="4" x2="-3" y2="3" width="0.127" layer="21"/>
<wire x1="-3" y1="3" x2="-4.5" y2="3" width="0.127" layer="21"/>
<wire x1="-4.5" y1="-3" x2="-3" y2="-3" width="0.127" layer="21"/>
<wire x1="-3" y1="-3" x2="-3" y2="-4" width="0.127" layer="21"/>
<text x="-2.5" y="1.5" size="0.6096" layer="21">&gt;NAME</text>
<text x="-2.5" y="-2" size="0.6096" layer="21">&gt;VALUE</text>
<hole x="0" y="0" drill="1.4"/>
<hole x="4.5" y="0" drill="1.4"/>
</package>
</packages>
<symbols>
<symbol name="5-WIRE_5TS2">
<wire x1="2.54" y1="7.62" x2="2.54" y2="-7.62" width="0.254" layer="94"/>
<wire x1="2.54" y1="-7.62" x2="-7.62" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-7.62" x2="-7.62" y2="7.62" width="0.254" layer="94"/>
<wire x1="-7.62" y1="7.62" x2="2.54" y2="7.62" width="0.254" layer="94"/>
<pin name="SLEEVE" x="5.08" y="5.08" length="short" rot="R180"/>
<pin name="TIP" x="5.08" y="2.54" length="short" rot="R180"/>
<pin name="RING1" x="5.08" y="0" length="short" rot="R180"/>
<pin name="RING2" x="5.08" y="-2.54" length="short" rot="R180"/>
<pin name="TS" x="5.08" y="-5.08" length="short" rot="R180"/>
<wire x1="2.54" y1="-5.08" x2="1.27" y2="-5.08" width="0.254" layer="97"/>
<wire x1="1.27" y1="-5.08" x2="1.27" y2="2.54" width="0.254" layer="97"/>
<wire x1="1.27" y1="2.54" x2="2.54" y2="2.54" width="0.254" layer="97"/>
<text x="-7.62" y="-7.62" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<polygon width="0.254" layer="97">
<vertex x="2.54" y="2.54"/>
<vertex x="1.905" y="3.175"/>
<vertex x="1.905" y="1.905"/>
</polygon>
</symbol>
</symbols>
<devicesets>
<deviceset name="SJ1-42535">
<gates>
<gate name="G$1" symbol="5-WIRE_5TS2" x="0" y="0"/>
</gates>
<devices>
<device name="TS" package="SJ1-42534-SMT">
<connects>
<connect gate="G$1" pin="RING1" pad="3"/>
<connect gate="G$1" pin="RING2" pad="4-1"/>
<connect gate="G$1" pin="SLEEVE" pad="1"/>
<connect gate="G$1" pin="TIP" pad="2"/>
<connect gate="G$1" pin="TS" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="MNT" value="SMT" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="PWR-Connectors">
<packages>
<package name="BARREL-SPFUN-BRBRD">
<wire x1="0" y1="0" x2="0" y2="8.6" width="0.127" layer="21"/>
<wire x1="0" y1="8.6" x2="13.6" y2="8.6" width="0.127" layer="21"/>
<pad name="2" x="7.8" y="4.8" drill="1.6" shape="square"/>
<pad name="1" x="13.6" y="4.8" drill="1.6" shape="square"/>
<pad name="3" x="10.6" y="0" drill="1.6" shape="square"/>
<wire x1="0" y1="0" x2="9" y2="0" width="0.127" layer="21"/>
<wire x1="9" y1="0" x2="9" y2="-1.5" width="0.127" layer="21"/>
<wire x1="9" y1="-1.5" x2="12" y2="-1.5" width="0.127" layer="21"/>
<wire x1="12" y1="-1.5" x2="12" y2="0" width="0.127" layer="21"/>
<wire x1="12" y1="0" x2="13.5" y2="0" width="0.127" layer="21"/>
<wire x1="13.5" y1="0" x2="13.5" y2="3" width="0.127" layer="21"/>
<wire x1="13.5" y1="3" x2="15" y2="3" width="0.127" layer="21"/>
<wire x1="15" y1="3" x2="15" y2="6.5" width="0.127" layer="21"/>
<wire x1="15" y1="6.5" x2="14" y2="6.5" width="0.127" layer="21"/>
<wire x1="14" y1="6.5" x2="14" y2="8.6" width="0.127" layer="21"/>
<wire x1="14" y1="8.6" x2="13.6" y2="8.6" width="0.127" layer="21"/>
<text x="0" y="6.35" size="1.27" layer="21">&gt;NAME</text>
<text x="0" y="3.81" size="1.27" layer="21">&gt;VALUE</text>
</package>
<package name="PJ-002BH-SMT-TR">
<text x="-2.54" y="1" size="1.27" layer="21">&gt;NAME</text>
<text x="-2.54" y="-3.54" size="1.27" layer="21">&gt;VALUE</text>
<wire x1="-7" y1="3.8" x2="7.6" y2="3.8" width="0.127" layer="21"/>
<wire x1="7.6" y1="3.8" x2="7.6" y2="-5.2" width="0.127" layer="21"/>
<wire x1="7.6" y1="-5.2" x2="-7" y2="-5.2" width="0.127" layer="21"/>
<wire x1="-7" y1="-5.2" x2="-7" y2="3.8" width="0.127" layer="21"/>
<hole x="-2" y="-0.7" drill="1.6002"/>
<hole x="2.5" y="-0.7" drill="1.8034"/>
<text x="6.985" y="-1.905" size="0.4064" layer="21" rot="R90">Cord Insert</text>
<wire x1="7.62" y1="1.905" x2="6.35" y2="1.905" width="0.127" layer="21"/>
<wire x1="6.35" y1="1.905" x2="6.35" y2="-2.54" width="0.127" layer="21"/>
<wire x1="6.35" y1="-2.54" x2="7.62" y2="-2.54" width="0.127" layer="21"/>
<smd name="1" x="-2" y="5.035" dx="2.8" dy="2.4" layer="1"/>
<smd name="1." x="4.1" y="5.08" dx="2.8" dy="2.4" layer="1"/>
<smd name="2" x="-2" y="-6.35" dx="2.8" dy="2.4" layer="1"/>
<smd name="3" x="4.1" y="-6.35" dx="2.8" dy="2.4" layer="1"/>
</package>
<package name="PJ-037A">
<wire x1="-4" y1="4" x2="4" y2="4" width="0.127" layer="21"/>
<wire x1="4" y1="4" x2="4" y2="-5.2" width="0.127" layer="21"/>
<wire x1="-4" y1="4" x2="-4" y2="-5.2" width="0.127" layer="21"/>
<wire x1="-4" y1="-5.2" x2="4" y2="-5.2" width="0.127" layer="21"/>
<text x="-2.2" y="0" size="1" layer="21">&gt;NAME</text>
<text x="-2.4" y="-1.4" size="1" layer="21">&gt;VALUE</text>
<hole x="0" y="2.5" drill="1"/>
<hole x="0" y="-2.5" drill="1"/>
<text x="-1.27" y="-5.08" size="0.4" layer="21">Cord Insert</text>
<wire x1="-1.905" y1="-5.08" x2="-1.905" y2="-4.445" width="0.127" layer="21"/>
<wire x1="-1.905" y1="-4.445" x2="1.905" y2="-4.445" width="0.127" layer="21"/>
<wire x1="1.905" y1="-4.445" x2="1.905" y2="-5.08" width="0.127" layer="21"/>
<smd name="2" x="-4.3" y="0.5" dx="2.2" dy="2.2" layer="1"/>
<smd name="3" x="-4.3" y="-4" dx="2.2" dy="2.2" layer="1"/>
<smd name="1" x="4.3" y="0.5" dx="2.2" dy="2.2" layer="1"/>
<smd name="1." x="4.3" y="-4" dx="2.2" dy="2.2" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="SINGLE-LINE">
<pin name="V+" x="7.62" y="2.54" length="short" rot="R180"/>
<pin name="V-" x="7.62" y="-2.54" length="short" rot="R180"/>
<wire x1="5.08" y1="5.08" x2="5.08" y2="-5.08" width="0.254" layer="94"/>
<wire x1="5.08" y1="-5.08" x2="-5.08" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-5.08" x2="-5.08" y2="5.08" width="0.254" layer="94"/>
<wire x1="-5.08" y1="5.08" x2="5.08" y2="5.08" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<text x="-5.08" y="5.08" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="SINGLE-LINE" prefix="P" uservalue="yes">
<description>4UCON Part Num: 18742</description>
<gates>
<gate name="G$1" symbol="SINGLE-LINE" x="0" y="0"/>
</gates>
<devices>
<device name="" package="BARREL-SPFUN-BRBRD">
<connects>
<connect gate="G$1" pin="V+" pad="1"/>
<connect gate="G$1" pin="V-" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="&quot;" package="PJ-002BH-SMT-TR">
<connects>
<connect gate="G$1" pin="V+" pad="2"/>
<connect gate="G$1" pin="V-" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="'" package="PJ-037A">
<connects>
<connect gate="G$1" pin="V+" pad="2"/>
<connect gate="G$1" pin="V-" pad="1 1."/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="headers">
<packages>
<package name="DIP0.1-1X10">
<pad name="1" x="0" y="-11.43" drill="1.016" shape="square"/>
<pad name="2" x="0" y="-8.89" drill="1.016" shape="octagon"/>
<pad name="3" x="0" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="4" x="0" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="5" x="0" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="6" x="0" y="1.27" drill="1.016" shape="octagon"/>
<pad name="7" x="0" y="3.81" drill="1.016" shape="octagon"/>
<wire x1="-1.27" y1="-12.7" x2="-1.27" y2="12.7" width="0.127" layer="21"/>
<wire x1="-1.27" y1="12.7" x2="1.27" y2="12.7" width="0.127" layer="21"/>
<wire x1="1.27" y1="12.7" x2="1.27" y2="-12.7" width="0.127" layer="21"/>
<wire x1="1.27" y1="-12.7" x2="-1.27" y2="-12.7" width="0.127" layer="21"/>
<text x="-1.27" y="-12.7" size="1.27" layer="21" rot="R90">&gt;NAME</text>
<text x="2.54" y="-12.7" size="1.27" layer="21" rot="R90">&gt;VALUE</text>
<pad name="8" x="0" y="6.35" drill="1.016" shape="octagon"/>
<pad name="9" x="0" y="8.89" drill="1.016" shape="octagon"/>
<pad name="10" x="0" y="11.43" drill="1.016" shape="octagon"/>
</package>
</packages>
<symbols>
<symbol name="1X10">
<wire x1="-2.54" y1="15.24" x2="2.54" y2="15.24" width="0.254" layer="94"/>
<wire x1="2.54" y1="15.24" x2="2.54" y2="-12.7" width="0.254" layer="94"/>
<wire x1="2.54" y1="-12.7" x2="-2.54" y2="-12.7" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-12.7" x2="-2.54" y2="15.24" width="0.254" layer="94"/>
<pin name="7" x="5.08" y="5.08" visible="pad" length="short" rot="R180"/>
<pin name="6" x="5.08" y="2.54" visible="pad" length="short" rot="R180"/>
<pin name="5" x="5.08" y="0" visible="pad" length="short" rot="R180"/>
<pin name="4" x="5.08" y="-2.54" visible="pad" length="short" rot="R180"/>
<pin name="3" x="5.08" y="-5.08" visible="pad" length="short" rot="R180"/>
<pin name="2" x="5.08" y="-7.62" visible="pad" length="short" rot="R180"/>
<pin name="1" x="5.08" y="-10.16" visible="pad" length="short" rot="R180"/>
<text x="0" y="0" size="1.27" layer="95" rot="R90">&gt;NAME</text>
<text x="0" y="-10.16" size="1.27" layer="96" rot="R90">&gt;VALUE</text>
<pin name="8" x="5.08" y="7.62" visible="pad" length="short" rot="R180"/>
<pin name="9" x="5.08" y="10.16" visible="pad" length="short" rot="R180"/>
<pin name="10" x="5.08" y="12.7" visible="pad" length="short" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="1X10" uservalue="yes">
<gates>
<gate name="G$1" symbol="1X10" x="0" y="0"/>
</gates>
<devices>
<device name="" package="DIP0.1-1X10">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="10" pad="10"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
<connect gate="G$1" pin="9" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="DIP" value="0.1" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="P1" library="Microcontrollers" deviceset="PROP-MINI" device=""/>
<part name="P2" library="Microcontrollers" deviceset="PROP-MINI" device=""/>
<part name="U$2" library="pwr_gnd" deviceset="GND" device=""/>
<part name="U1" library="ADC" deviceset="TLC2543IN" device=""/>
<part name="U2" library="Optoisolation" deviceset="BOB-09118" device=""/>
<part name="U$1" library="pwr_gnd" deviceset="12V" device=""/>
<part name="U$5" library="pwr_gnd" deviceset="GND" device=""/>
<part name="U$6" library="pwr_gnd" deviceset="5V" device=""/>
<part name="VR1" library="Voltage Regulators" deviceset="LM1084" device="" value="LM1084"/>
<part name="C1" library="RCL" deviceset="C" device="0603" value="10uF"/>
<part name="C2" library="RCL" deviceset="C" device="0603" value="10uF"/>
<part name="R2" library="RCL" deviceset="R" device="0603" value="121"/>
<part name="R3" library="RCL" deviceset="R" device="0603" value="365"/>
<part name="U$7" library="pwr_gnd" deviceset="GND" device=""/>
<part name="U$8" library="pwr_gnd" deviceset="GND" device=""/>
<part name="U$9" library="pwr_gnd" deviceset="12V" device=""/>
<part name="U$10" library="pwr_gnd" deviceset="12V" device=""/>
<part name="U$11" library="pwr_gnd" deviceset="3.3V" device=""/>
<part name="U$13" library="pwr_gnd" deviceset="GND" device=""/>
<part name="U$16" library="pwr_gnd" deviceset="GND" device=""/>
<part name="U$17" library="pwr_gnd" deviceset="GND" device=""/>
<part name="U4" library="SparkFun-PowerIC" deviceset="V_REG_MIC5219" device="3.3V" value="MIC5219 3.3V"/>
<part name="U$30" library="pwr_gnd" deviceset="3.3V" device=""/>
<part name="U$31" library="pwr_gnd" deviceset="5V" device=""/>
<part name="U$32" library="pwr_gnd" deviceset="GND" device=""/>
<part name="C8" library="RCL" deviceset="C" device="0603" value="0.1uF"/>
<part name="U$33" library="pwr_gnd" deviceset="GND" device=""/>
<part name="U$34" library="pwr_gnd" deviceset="GND" device=""/>
<part name="U$35" library="pwr_gnd" deviceset="GND" device=""/>
<part name="U$36" library="pwr_gnd" deviceset="3.3V" device=""/>
<part name="S1" library="SparkFun-Electromechanical" deviceset="SWITCH-MOMENTARY-2" device="SMD-2" value="XBEE-RST"/>
<part name="U$37" library="pwr_gnd" deviceset="GND" device=""/>
<part name="R11" library="RCL" deviceset="R" device="0603" value="1k"/>
<part name="RSSI" library="led" deviceset="LED-STD" device="" value="YELLOW"/>
<part name="U$4" library="pwr_gnd" deviceset="GND" device=""/>
<part name="XDO" library="led" deviceset="LED-STD" device="" value="RED"/>
<part name="XDI" library="led" deviceset="LED-STD" device="" value="BLUE"/>
<part name="R4" library="RCL" deviceset="R" device="0603" value="1k"/>
<part name="R5" library="RCL" deviceset="R" device="0603" value="1k"/>
<part name="U$19" library="RF" deviceset="XBEE-WIFI" device=""/>
<part name="R6" library="RCL" deviceset="R" device="0603" value="1k"/>
<part name="ASSOC" library="led" deviceset="LED-STD" device="" value="GREEN"/>
<part name="U$21" library="pwr_gnd" deviceset="GND" device=""/>
<part name="P1PWR" library="led" deviceset="LED-STD" device="" value="RED"/>
<part name="P2PWR" library="led" deviceset="LED-STD" device="" value="RED"/>
<part name="R12" library="RCL" deviceset="R" device="0603" value="1k"/>
<part name="R13" library="RCL" deviceset="R" device="0603" value="1k"/>
<part name="U$27" library="pwr_gnd" deviceset="GND" device=""/>
<part name="U$28" library="pwr_gnd" deviceset="GND" device=""/>
<part name="U$29" library="pwr_gnd" deviceset="GND" device=""/>
<part name="U$38" library="pwr_gnd" deviceset="3.3V" device=""/>
<part name="U$39" library="pwr_gnd" deviceset="GND" device=""/>
<part name="U$40" library="pwr_gnd" deviceset="GND" device=""/>
<part name="U$41" library="pwr_gnd" deviceset="GND" device=""/>
<part name="ADO" library="led" deviceset="LED-STD" device="" value="RED"/>
<part name="R14" library="RCL" deviceset="R" device="0603" value="1k"/>
<part name="U$43" library="pwr_gnd" deviceset="GND" device=""/>
<part name="ADI" library="led" deviceset="LED-STD" device="" value="BLUE"/>
<part name="R15" library="RCL" deviceset="R" device="0603" value="1k"/>
<part name="U$45" library="pwr_gnd" deviceset="GND" device=""/>
<part name="P2RX" library="led" deviceset="LED-STD" device="" value="BLUE"/>
<part name="R7" library="RCL" deviceset="R" device="0603" value="1k"/>
<part name="U$23" library="pwr_gnd" deviceset="GND" device=""/>
<part name="P2TX" library="led" deviceset="LED-STD" device="" value="RED"/>
<part name="R8" library="RCL" deviceset="R" device="0603" value="1k"/>
<part name="U$25" library="pwr_gnd" deviceset="GND" device=""/>
<part name="S2" library="SparkFun-Electromechanical" deviceset="SWITCH-MOMENTARY-2" device="SMD-2" value="PropRST"/>
<part name="U$46" library="pwr_gnd" deviceset="GND" device=""/>
<part name="P1I1" library="led" deviceset="LED-STD" device="" value="BLUE"/>
<part name="R9" library="RCL" deviceset="R" device="0603" value="1k"/>
<part name="U$48" library="pwr_gnd" deviceset="GND" device=""/>
<part name="P1I2" library="led" deviceset="LED-STD" device="" value="BLUE"/>
<part name="R1" library="RCL" deviceset="R" device="0603" value="1k"/>
<part name="U$3" library="pwr_gnd" deviceset="GND" device=""/>
<part name="P1I3" library="led" deviceset="LED-STD" device="" value="BLUE"/>
<part name="R16" library="RCL" deviceset="R" device="0603" value="1k"/>
<part name="U$12" library="pwr_gnd" deviceset="GND" device=""/>
<part name="P2I1" library="led" deviceset="LED-STD" device="" value="BLUE"/>
<part name="R10" library="RCL" deviceset="R" device="0603" value="1k"/>
<part name="U$14" library="pwr_gnd" deviceset="GND" device=""/>
<part name="P2I3" library="led" deviceset="LED-STD" device="" value="BLUE"/>
<part name="R17" library="RCL" deviceset="R" device="0603" value="1k"/>
<part name="U$15" library="pwr_gnd" deviceset="GND" device=""/>
<part name="P2I2" library="led" deviceset="LED-STD" device="" value="BLUE"/>
<part name="R18" library="RCL" deviceset="R" device="0603" value="1k"/>
<part name="U$18" library="pwr_gnd" deviceset="GND" device=""/>
<part name="U$20" library="pwr_gnd" deviceset="GND" device=""/>
<part name="U$22" library="pwr_gnd" deviceset="12V" device=""/>
<part name="U$24" library="pwr_gnd" deviceset="GND2" device=""/>
<part name="U$26" library="pwr_gnd" deviceset="VCC2" device=""/>
<part name="U$42" library="pwr_gnd" deviceset="VCC2" device=""/>
<part name="U$44" library="pwr_gnd" deviceset="GND2" device=""/>
<part name="R19" library="RCL" deviceset="R" device="0603" value="1k"/>
<part name="XBEE-PWR" library="led" deviceset="LED-STD" device="" value="RED"/>
<part name="U$47" library="pwr_gnd" deviceset="GND" device=""/>
<part name="J5" library="audio-connectors" deviceset="SJ1-42535" device="TS"/>
<part name="U$49" library="pwr_gnd" deviceset="VCC2" device=""/>
<part name="U$51" library="pwr_gnd" deviceset="GND2" device=""/>
<part name="R20" library="RCL" deviceset="R" device="0603" value="0"/>
<part name="R21" library="RCL" deviceset="R" device="0603" value="0"/>
<part name="R22" library="RCL" deviceset="R" device="0603" value="1k"/>
<part name="SIG-CONN" library="led" deviceset="LED-STD" device="" value="RED"/>
<part name="U$52" library="pwr_gnd" deviceset="GND2" device=""/>
<part name="C3" library="RCL" deviceset="C-POL" device="-T" value="10uF"/>
<part name="C4" library="RCL" deviceset="C-POL" device="-T" value="10uF"/>
<part name="P4" library="PWR-Connectors" deviceset="SINGLE-LINE" device="&quot;" value="MOTOR V"/>
<part name="P5" library="PWR-Connectors" deviceset="SINGLE-LINE" device="'" value="CONTROL V"/>
<part name="U$50" library="headers" deviceset="1X10" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<text x="317.5" y="83.82" size="0.762" layer="97">*Tantalum</text>
<text x="302.26" y="76.2" size="0.762" layer="97" rot="R90">1%</text>
<text x="302.26" y="60.96" size="0.762" layer="97" rot="R90">1%</text>
<wire x1="246.38" y1="109.22" x2="335.28" y2="109.22" width="0.1524" layer="97"/>
<wire x1="335.28" y1="109.22" x2="335.28" y2="43.18" width="0.1524" layer="97"/>
<wire x1="335.28" y1="43.18" x2="246.38" y2="43.18" width="0.1524" layer="97"/>
<wire x1="246.38" y1="43.18" x2="246.38" y2="109.22" width="0.1524" layer="97"/>
<text x="279.4" y="104.14" size="2.54" layer="97">5V Regulation</text>
<wire x1="243.84" y1="162.56" x2="243.84" y2="124.46" width="0.1524" layer="97"/>
<wire x1="243.84" y1="124.46" x2="314.96" y2="124.46" width="0.1524" layer="97"/>
<wire x1="314.96" y1="124.46" x2="314.96" y2="162.56" width="0.1524" layer="97"/>
<wire x1="314.96" y1="162.56" x2="243.84" y2="162.56" width="0.1524" layer="97"/>
<text x="269.24" y="157.48" size="2.54" layer="97">3.3V Regulation</text>
</plain>
<instances>
<instance part="P1" gate="G$1" x="-83.82" y="22.86"/>
<instance part="P2" gate="G$1" x="66.04" y="22.86"/>
<instance part="U$2" gate="G$1" x="99.06" y="0"/>
<instance part="U1" gate="G$1" x="116.84" y="116.84"/>
<instance part="U2" gate="G$1" x="111.76" y="7.62"/>
<instance part="U$1" gate="G$1" x="261.62" y="93.98"/>
<instance part="U$5" gate="G$1" x="297.18" y="53.34"/>
<instance part="U$6" gate="G$1" x="314.96" y="96.52"/>
<instance part="VR1" gate="G$1" x="276.86" y="88.9" smashed="yes">
<attribute name="NAME" x="275.59" y="85.09" size="1.27" layer="95"/>
<attribute name="VALUE" x="267.97" y="91.44" size="1.27" layer="96"/>
</instance>
<instance part="C1" gate="G$1" x="261.62" y="81.28" rot="R90"/>
<instance part="C2" gate="G$1" x="314.96" y="81.28" rot="R90"/>
<instance part="R2" gate="G$1" x="297.18" y="78.74" rot="R90"/>
<instance part="R3" gate="G$1" x="297.18" y="63.5" rot="R90"/>
<instance part="U$7" gate="G$1" x="261.62" y="71.12"/>
<instance part="U$8" gate="G$1" x="314.96" y="71.12"/>
<instance part="U$9" gate="G$1" x="88.9" y="52.07"/>
<instance part="U$10" gate="G$1" x="-63.5" y="52.07"/>
<instance part="U$11" gate="G$1" x="154.94" y="144.78"/>
<instance part="U$13" gate="G$1" x="-55.88" y="33.02"/>
<instance part="U$16" gate="G$1" x="93.98" y="33.02"/>
<instance part="U$17" gate="G$1" x="78.74" y="88.9"/>
<instance part="U4" gate="G$1" x="281.94" y="142.24"/>
<instance part="U$30" gate="G$1" x="294.64" y="152.4"/>
<instance part="U$31" gate="G$1" x="266.7" y="152.4"/>
<instance part="U$32" gate="G$1" x="269.24" y="132.08"/>
<instance part="C8" gate="G$1" x="309.88" y="142.24" rot="R90"/>
<instance part="U$33" gate="G$1" x="299.72" y="132.08"/>
<instance part="U$34" gate="G$1" x="309.88" y="132.08"/>
<instance part="U$35" gate="G$1" x="-7.62" y="83.82"/>
<instance part="U$36" gate="G$1" x="-7.62" y="116.84"/>
<instance part="S1" gate="G$1" x="-38.1" y="101.6" smashed="yes">
<attribute name="NAME" x="-40.64" y="104.14" size="1.778" layer="95"/>
<attribute name="VALUE" x="-45.72" y="99.06" size="0.762" layer="96"/>
</instance>
<instance part="U$37" gate="G$1" x="-48.26" y="96.52"/>
<instance part="R11" gate="G$1" x="-30.48" y="91.44" rot="R90"/>
<instance part="RSSI" gate="G$1" x="-30.48" y="78.74" rot="R270"/>
<instance part="U$4" gate="G$1" x="-30.48" y="71.12"/>
<instance part="XDO" gate="G$1" x="-68.58" y="78.74" rot="R270"/>
<instance part="XDI" gate="G$1" x="-53.34" y="78.74" rot="R270"/>
<instance part="R4" gate="G$1" x="-68.58" y="91.44" smashed="yes" rot="R90">
<attribute name="NAME" x="-70.0786" y="87.63" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="-70.358" y="92.71" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="R5" gate="G$1" x="-53.34" y="91.44" smashed="yes" rot="R90">
<attribute name="NAME" x="-54.8386" y="92.71" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="-55.118" y="87.63" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="U$19" gate="G$1" x="15.24" y="99.06"/>
<instance part="R6" gate="G$1" x="48.26" y="91.44" rot="R90"/>
<instance part="ASSOC" gate="G$1" x="48.26" y="78.74" rot="R270"/>
<instance part="U$21" gate="G$1" x="48.26" y="71.12"/>
<instance part="P1PWR" gate="G$1" x="-109.22" y="-10.16" rot="R270"/>
<instance part="P2PWR" gate="G$1" x="43.18" y="-10.16" rot="R270"/>
<instance part="R12" gate="G$1" x="-109.22" y="2.54" rot="R90"/>
<instance part="R13" gate="G$1" x="43.18" y="2.54" rot="R90"/>
<instance part="U$27" gate="G$1" x="43.18" y="-17.78"/>
<instance part="U$28" gate="G$1" x="-109.22" y="-17.78"/>
<instance part="U$29" gate="G$1" x="167.64" y="99.06"/>
<instance part="U$38" gate="G$1" x="167.64" y="114.3"/>
<instance part="U$39" gate="G$1" x="-68.58" y="71.12"/>
<instance part="U$40" gate="G$1" x="-53.34" y="71.12"/>
<instance part="U$41" gate="G$1" x="154.94" y="111.76"/>
<instance part="ADO" gate="G$1" x="180.34" y="96.52" rot="R270"/>
<instance part="R14" gate="G$1" x="180.34" y="109.22" rot="R90"/>
<instance part="U$43" gate="G$1" x="180.34" y="88.9"/>
<instance part="ADI" gate="G$1" x="205.74" y="96.52" rot="R270"/>
<instance part="R15" gate="G$1" x="205.74" y="109.22" rot="R90"/>
<instance part="U$45" gate="G$1" x="205.74" y="88.9"/>
<instance part="P2RX" gate="G$1" x="-60.96" y="-10.16" rot="R270"/>
<instance part="R7" gate="G$1" x="-60.96" y="2.54" rot="R90"/>
<instance part="U$23" gate="G$1" x="-60.96" y="-17.78"/>
<instance part="P2TX" gate="G$1" x="83.82" y="-10.16" rot="R270"/>
<instance part="R8" gate="G$1" x="83.82" y="2.54" rot="R90"/>
<instance part="U$25" gate="G$1" x="83.82" y="-17.78"/>
<instance part="S2" gate="G$1" x="-86.36" y="53.34" smashed="yes">
<attribute name="NAME" x="-88.9" y="55.88" size="1.778" layer="95"/>
<attribute name="VALUE" x="-93.98" y="50.8" size="0.762" layer="96"/>
</instance>
<instance part="U$46" gate="G$1" x="-96.52" y="48.26"/>
<instance part="P1I1" gate="G$1" x="-154.94" y="-10.16" rot="R270"/>
<instance part="R9" gate="G$1" x="-154.94" y="2.54" rot="R90"/>
<instance part="U$48" gate="G$1" x="-154.94" y="-17.78"/>
<instance part="P1I2" gate="G$1" x="-134.62" y="-10.16" rot="R270"/>
<instance part="R1" gate="G$1" x="-134.62" y="2.54" rot="R90"/>
<instance part="U$3" gate="G$1" x="-134.62" y="-17.78"/>
<instance part="P1I3" gate="G$1" x="-144.78" y="-10.16" rot="R270"/>
<instance part="R16" gate="G$1" x="-144.78" y="2.54" rot="R90"/>
<instance part="U$12" gate="G$1" x="-144.78" y="-17.78"/>
<instance part="P2I1" gate="G$1" x="-5.08" y="-10.16" rot="R270"/>
<instance part="R10" gate="G$1" x="-5.08" y="2.54" rot="R90"/>
<instance part="U$14" gate="G$1" x="-5.08" y="-17.78"/>
<instance part="P2I3" gate="G$1" x="15.24" y="-10.16" rot="R270"/>
<instance part="R17" gate="G$1" x="15.24" y="2.54" rot="R90"/>
<instance part="U$15" gate="G$1" x="15.24" y="-17.78"/>
<instance part="P2I2" gate="G$1" x="5.08" y="-10.16" rot="R270"/>
<instance part="R18" gate="G$1" x="5.08" y="2.54" rot="R90"/>
<instance part="U$18" gate="G$1" x="5.08" y="-17.78"/>
<instance part="U$20" gate="G$1" x="345.44" y="109.22"/>
<instance part="U$22" gate="G$1" x="345.44" y="124.46"/>
<instance part="U$24" gate="G$1" x="345.44" y="134.62"/>
<instance part="U$26" gate="G$1" x="345.44" y="149.86"/>
<instance part="U$42" gate="G$1" x="132.08" y="15.24"/>
<instance part="U$44" gate="G$1" x="132.08" y="0"/>
<instance part="R19" gate="G$1" x="-88.9" y="91.44" smashed="yes" rot="R90">
<attribute name="NAME" x="-90.3986" y="87.63" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="-90.678" y="92.71" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="XBEE-PWR" gate="G$1" x="-88.9" y="78.74" rot="R270"/>
<instance part="U$47" gate="G$1" x="-88.9" y="71.12"/>
<instance part="J5" gate="G$1" x="160.02" y="12.7" rot="MR0"/>
<instance part="U$49" gate="G$1" x="147.32" y="33.02"/>
<instance part="U$51" gate="G$1" x="170.18" y="15.24"/>
<instance part="R20" gate="G$1" x="147.32" y="22.86" rot="R90"/>
<instance part="R21" gate="G$1" x="162.56" y="25.4" rot="R180"/>
<instance part="R22" gate="G$1" x="152.4" y="2.54" rot="R90"/>
<instance part="SIG-CONN" gate="G$1" x="152.4" y="-10.16" rot="R270"/>
<instance part="U$52" gate="G$1" x="152.4" y="-17.78"/>
<instance part="C3" gate="G$1" x="299.72" y="142.24" rot="R90"/>
<instance part="C4" gate="G$1" x="261.62" y="144.78" rot="R90"/>
<instance part="P4" gate="G$1" x="337.82" y="142.24"/>
<instance part="P5" gate="G$1" x="337.82" y="116.84"/>
<instance part="U$50" gate="G$1" x="48.26" y="124.46" rot="MR180"/>
</instances>
<busses>
</busses>
<nets>
<net name="P2RX" class="0">
<segment>
<pinref part="P1" gate="G$1" pin="P9"/>
<wire x1="-68.58" y1="12.7" x2="-60.96" y2="12.7" width="0.1524" layer="91"/>
<label x="-58.42" y="12.7" size="1.27" layer="95" xref="yes"/>
<pinref part="R7" gate="G$1" pin="P$2"/>
<wire x1="-60.96" y1="12.7" x2="-58.42" y2="12.7" width="0.1524" layer="91"/>
<wire x1="-60.96" y1="12.7" x2="-60.96" y2="7.62" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="P2" gate="G$1" pin="P9"/>
<wire x1="81.28" y1="12.7" x2="83.82" y2="12.7" width="0.1524" layer="91"/>
<label x="83.82" y="12.7" size="1.27" layer="95" xref="yes"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="R3" gate="G$1" pin="P$1"/>
<pinref part="U$5" gate="G$1" pin="GND"/>
<wire x1="297.18" y1="58.42" x2="297.18" y2="55.88" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C1" gate="G$1" pin="1"/>
<pinref part="U$7" gate="G$1" pin="GND"/>
<wire x1="261.62" y1="76.2" x2="261.62" y2="73.66" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C2" gate="G$1" pin="1"/>
<pinref part="U$8" gate="G$1" pin="GND"/>
<wire x1="314.96" y1="76.2" x2="314.96" y2="73.66" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="P1" gate="G$1" pin="GND"/>
<pinref part="U$13" gate="G$1" pin="GND"/>
<wire x1="-68.58" y1="35.56" x2="-55.88" y2="35.56" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="P2" gate="G$1" pin="GND"/>
<pinref part="U$16" gate="G$1" pin="GND"/>
<wire x1="81.28" y1="35.56" x2="93.98" y2="35.56" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GND"/>
<wire x1="88.9" y1="93.98" x2="78.74" y2="93.98" width="0.1524" layer="91"/>
<wire x1="78.74" y1="93.98" x2="78.74" y2="91.44" width="0.1524" layer="91"/>
<pinref part="U$17" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="U$33" gate="G$1" pin="GND"/>
<pinref part="C3" gate="G$1" pin="1"/>
<wire x1="299.72" y1="139.7" x2="299.72" y2="134.62" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C8" gate="G$1" pin="1"/>
<pinref part="U$34" gate="G$1" pin="GND"/>
<wire x1="309.88" y1="137.16" x2="309.88" y2="134.62" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="GND"/>
<pinref part="U$32" gate="G$1" pin="GND"/>
<wire x1="271.78" y1="137.16" x2="269.24" y2="137.16" width="0.1524" layer="91"/>
<wire x1="269.24" y1="137.16" x2="269.24" y2="134.62" width="0.1524" layer="91"/>
<wire x1="261.62" y1="137.16" x2="269.24" y2="137.16" width="0.1524" layer="91"/>
<junction x="269.24" y="137.16"/>
<pinref part="C4" gate="G$1" pin="1"/>
<wire x1="261.62" y1="142.24" x2="261.62" y2="137.16" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$35" gate="G$1" pin="GND"/>
<wire x1="-7.62" y1="88.9" x2="-7.62" y2="86.36" width="0.1524" layer="91"/>
<pinref part="U$19" gate="G$1" pin="GND"/>
<wire x1="-7.62" y1="88.9" x2="-5.08" y2="88.9" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="S1" gate="G$1" pin="1"/>
<pinref part="U$37" gate="G$1" pin="GND"/>
<wire x1="-43.18" y1="101.6" x2="-48.26" y2="101.6" width="0.1524" layer="91"/>
<wire x1="-48.26" y1="101.6" x2="-48.26" y2="99.06" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="RSSI" gate="G$1" pin="OUT"/>
<pinref part="U$4" gate="G$1" pin="GND"/>
<wire x1="-30.48" y1="76.2" x2="-30.48" y2="73.66" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="ASSOC" gate="G$1" pin="OUT"/>
<pinref part="U$21" gate="G$1" pin="GND"/>
<wire x1="48.26" y1="76.2" x2="48.26" y2="73.66" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="REF-"/>
<wire x1="144.78" y1="104.14" x2="167.64" y2="104.14" width="0.1524" layer="91"/>
<wire x1="167.64" y1="104.14" x2="167.64" y2="101.6" width="0.1524" layer="91"/>
<pinref part="U$29" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="XDI" gate="G$1" pin="OUT"/>
<pinref part="U$40" gate="G$1" pin="GND"/>
<wire x1="-53.34" y1="76.2" x2="-53.34" y2="73.66" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="CS"/>
<pinref part="U$41" gate="G$1" pin="GND"/>
<wire x1="144.78" y1="114.3" x2="154.94" y2="114.3" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="S2" gate="G$1" pin="1"/>
<pinref part="U$46" gate="G$1" pin="GND"/>
<wire x1="-91.44" y1="53.34" x2="-96.52" y2="53.34" width="0.1524" layer="91"/>
<wire x1="-96.52" y1="53.34" x2="-96.52" y2="50.8" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="ADO" gate="G$1" pin="OUT"/>
<pinref part="U$43" gate="G$1" pin="GND"/>
<wire x1="180.34" y1="93.98" x2="180.34" y2="91.44" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="ADI" gate="G$1" pin="OUT"/>
<pinref part="U$45" gate="G$1" pin="GND"/>
<wire x1="205.74" y1="93.98" x2="205.74" y2="91.44" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$39" gate="G$1" pin="GND"/>
<pinref part="XDO" gate="G$1" pin="OUT"/>
<wire x1="-68.58" y1="73.66" x2="-68.58" y2="76.2" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="P1I1" gate="G$1" pin="OUT"/>
<pinref part="U$48" gate="G$1" pin="GND"/>
<wire x1="-154.94" y1="-12.7" x2="-154.94" y2="-15.24" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="P1I3" gate="G$1" pin="OUT"/>
<pinref part="U$12" gate="G$1" pin="GND"/>
<wire x1="-144.78" y1="-12.7" x2="-144.78" y2="-15.24" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="P1I2" gate="G$1" pin="OUT"/>
<pinref part="U$3" gate="G$1" pin="GND"/>
<wire x1="-134.62" y1="-12.7" x2="-134.62" y2="-15.24" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="P1PWR" gate="G$1" pin="OUT"/>
<pinref part="U$28" gate="G$1" pin="GND"/>
<wire x1="-109.22" y1="-12.7" x2="-109.22" y2="-15.24" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="P2RX" gate="G$1" pin="OUT"/>
<pinref part="U$23" gate="G$1" pin="GND"/>
<wire x1="-60.96" y1="-12.7" x2="-60.96" y2="-15.24" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="P2I1" gate="G$1" pin="OUT"/>
<pinref part="U$14" gate="G$1" pin="GND"/>
<wire x1="-5.08" y1="-12.7" x2="-5.08" y2="-15.24" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="P2I2" gate="G$1" pin="OUT"/>
<pinref part="U$18" gate="G$1" pin="GND"/>
<wire x1="5.08" y1="-12.7" x2="5.08" y2="-15.24" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="P2I3" gate="G$1" pin="OUT"/>
<pinref part="U$15" gate="G$1" pin="GND"/>
<wire x1="15.24" y1="-12.7" x2="15.24" y2="-15.24" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="P2PWR" gate="G$1" pin="OUT"/>
<pinref part="U$27" gate="G$1" pin="GND"/>
<wire x1="43.18" y1="-12.7" x2="43.18" y2="-15.24" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="P2TX" gate="G$1" pin="OUT"/>
<pinref part="U$25" gate="G$1" pin="GND"/>
<wire x1="83.82" y1="-12.7" x2="83.82" y2="-15.24" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$20" gate="G$1" pin="GND"/>
<wire x1="345.44" y1="114.3" x2="345.44" y2="111.76" width="0.1524" layer="91"/>
<pinref part="P5" gate="G$1" pin="V-"/>
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="GND"/>
<pinref part="U$2" gate="G$1" pin="GND"/>
<wire x1="99.06" y1="5.08" x2="99.06" y2="2.54" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="XBEE-PWR" gate="G$1" pin="OUT"/>
<pinref part="U$47" gate="G$1" pin="GND"/>
<wire x1="-88.9" y1="76.2" x2="-88.9" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="P2TX" class="0">
<segment>
<pinref part="P2" gate="G$1" pin="P8"/>
<pinref part="U2" gate="G$1" pin="IN1"/>
<label x="91.44" y="10.16" size="1.27" layer="95"/>
<wire x1="81.28" y1="10.16" x2="83.82" y2="10.16" width="0.1524" layer="91"/>
<pinref part="R8" gate="G$1" pin="P$2"/>
<wire x1="83.82" y1="10.16" x2="99.06" y2="10.16" width="0.1524" layer="91"/>
<wire x1="83.82" y1="10.16" x2="83.82" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<pinref part="VR1" gate="G$1" pin="ADJ"/>
<wire x1="292.1" y1="86.36" x2="292.1" y2="71.12" width="0.1524" layer="91"/>
<wire x1="292.1" y1="71.12" x2="297.18" y2="71.12" width="0.1524" layer="91"/>
<pinref part="R2" gate="G$1" pin="P$1"/>
<wire x1="297.18" y1="73.66" x2="297.18" y2="71.12" width="0.1524" layer="91"/>
<pinref part="R3" gate="G$1" pin="P$2"/>
<wire x1="297.18" y1="71.12" x2="297.18" y2="68.58" width="0.1524" layer="91"/>
<junction x="297.18" y="71.12"/>
</segment>
</net>
<net name="12V" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="12V"/>
<pinref part="VR1" gate="G$1" pin="VIN"/>
<wire x1="261.62" y1="91.44" x2="261.62" y2="88.9" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="2"/>
<wire x1="261.62" y1="88.9" x2="261.62" y2="83.82" width="0.1524" layer="91"/>
<junction x="261.62" y="88.9"/>
</segment>
<segment>
<pinref part="P2" gate="G$1" pin="VIN"/>
<wire x1="81.28" y1="38.1" x2="88.9" y2="38.1" width="0.1524" layer="91"/>
<pinref part="U$9" gate="G$1" pin="12V"/>
<wire x1="88.9" y1="38.1" x2="88.9" y2="49.53" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="P1" gate="G$1" pin="VIN"/>
<wire x1="-68.58" y1="38.1" x2="-63.5" y2="38.1" width="0.1524" layer="91"/>
<pinref part="U$10" gate="G$1" pin="12V"/>
<wire x1="-63.5" y1="49.53" x2="-63.5" y2="38.1" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$22" gate="G$1" pin="12V"/>
<pinref part="P5" gate="G$1" pin="V+"/>
<wire x1="345.44" y1="121.92" x2="345.44" y2="119.38" width="0.1524" layer="91"/>
</segment>
</net>
<net name="5V" class="0">
<segment>
<pinref part="VR1" gate="G$1" pin="VOUT"/>
<pinref part="R2" gate="G$1" pin="P$2"/>
<wire x1="292.1" y1="91.44" x2="297.18" y2="91.44" width="0.1524" layer="91"/>
<wire x1="297.18" y1="91.44" x2="297.18" y2="83.82" width="0.1524" layer="91"/>
<pinref part="C2" gate="G$1" pin="2"/>
<wire x1="297.18" y1="91.44" x2="314.96" y2="91.44" width="0.1524" layer="91"/>
<wire x1="314.96" y1="91.44" x2="314.96" y2="83.82" width="0.1524" layer="91"/>
<pinref part="U$6" gate="G$1" pin="5V"/>
<wire x1="314.96" y1="91.44" x2="314.96" y2="93.98" width="0.1524" layer="91"/>
<junction x="314.96" y="91.44"/>
<junction x="297.18" y="91.44"/>
</segment>
<segment>
<pinref part="U$31" gate="G$1" pin="5V"/>
<wire x1="266.7" y1="149.86" x2="266.7" y2="147.32" width="0.1524" layer="91"/>
<pinref part="U4" gate="G$1" pin="IN"/>
<wire x1="266.7" y1="147.32" x2="271.78" y2="147.32" width="0.1524" layer="91"/>
<pinref part="U4" gate="G$1" pin="EN"/>
<wire x1="271.78" y1="142.24" x2="266.7" y2="142.24" width="0.1524" layer="91"/>
<wire x1="266.7" y1="142.24" x2="266.7" y2="147.32" width="0.1524" layer="91"/>
<junction x="266.7" y="147.32"/>
<wire x1="266.7" y1="147.32" x2="261.62" y2="147.32" width="0.1524" layer="91"/>
<pinref part="C4" gate="G$1" pin="2"/>
</segment>
</net>
<net name="3.3V" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="VCC"/>
<wire x1="154.94" y1="139.7" x2="144.78" y2="139.7" width="0.1524" layer="91"/>
<pinref part="U$11" gate="G$1" pin="3.3V"/>
<wire x1="154.94" y1="139.7" x2="154.94" y2="142.24" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="OUT"/>
<pinref part="U$30" gate="G$1" pin="3.3V"/>
<wire x1="289.56" y1="147.32" x2="294.64" y2="147.32" width="0.1524" layer="91"/>
<wire x1="294.64" y1="147.32" x2="294.64" y2="149.86" width="0.1524" layer="91"/>
<wire x1="294.64" y1="147.32" x2="299.72" y2="147.32" width="0.1524" layer="91"/>
<wire x1="299.72" y1="147.32" x2="299.72" y2="144.78" width="0.1524" layer="91"/>
<pinref part="C8" gate="G$1" pin="2"/>
<wire x1="299.72" y1="147.32" x2="309.88" y2="147.32" width="0.1524" layer="91"/>
<wire x1="309.88" y1="147.32" x2="309.88" y2="144.78" width="0.1524" layer="91"/>
<junction x="299.72" y="147.32"/>
<junction x="294.64" y="147.32"/>
<pinref part="C3" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="U$36" gate="G$1" pin="3.3V"/>
<wire x1="-7.62" y1="114.3" x2="-7.62" y2="111.76" width="0.1524" layer="91"/>
<pinref part="U$19" gate="G$1" pin="VCC"/>
<wire x1="-7.62" y1="111.76" x2="-5.08" y2="111.76" width="0.1524" layer="91"/>
<pinref part="R19" gate="G$1" pin="P$2"/>
<wire x1="-7.62" y1="111.76" x2="-88.9" y2="111.76" width="0.1524" layer="91"/>
<wire x1="-88.9" y1="111.76" x2="-88.9" y2="96.52" width="0.1524" layer="91"/>
<junction x="-7.62" y="111.76"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="REF+"/>
<wire x1="144.78" y1="109.22" x2="167.64" y2="109.22" width="0.1524" layer="91"/>
<wire x1="167.64" y1="109.22" x2="167.64" y2="111.76" width="0.1524" layer="91"/>
<pinref part="U$38" gate="G$1" pin="3.3V"/>
</segment>
</net>
<net name="AIN0" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="AIN0"/>
<label x="78.74" y="139.7" size="1.27" layer="95" rot="R180" xref="yes"/>
<wire x1="88.9" y1="139.7" x2="81.28" y2="139.7" width="0.1524" layer="91"/>
<wire x1="81.28" y1="139.7" x2="78.74" y2="139.7" width="0.1524" layer="91"/>
<wire x1="81.28" y1="139.7" x2="81.28" y2="137.16" width="0.1524" layer="91"/>
<wire x1="81.28" y1="137.16" x2="53.34" y2="137.16" width="0.1524" layer="91"/>
<pinref part="U$50" gate="G$1" pin="1"/>
<wire x1="53.34" y1="137.16" x2="53.34" y2="134.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="AIN1" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="AIN1"/>
<wire x1="88.9" y1="134.62" x2="81.28" y2="134.62" width="0.1524" layer="91"/>
<label x="78.74" y="134.62" size="1.27" layer="95" rot="R180" xref="yes"/>
<wire x1="81.28" y1="134.62" x2="78.74" y2="134.62" width="0.1524" layer="91"/>
<wire x1="81.28" y1="134.62" x2="81.28" y2="132.08" width="0.1524" layer="91"/>
<pinref part="U$50" gate="G$1" pin="2"/>
<wire x1="81.28" y1="132.08" x2="53.34" y2="132.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="AIN2" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="AIN2"/>
<wire x1="88.9" y1="129.54" x2="81.28" y2="129.54" width="0.1524" layer="91"/>
<label x="78.74" y="129.54" size="1.27" layer="95" rot="R180" xref="yes"/>
<wire x1="81.28" y1="129.54" x2="78.74" y2="129.54" width="0.1524" layer="91"/>
<wire x1="81.28" y1="129.54" x2="81.28" y2="127" width="0.1524" layer="91"/>
<wire x1="81.28" y1="127" x2="71.12" y2="127" width="0.1524" layer="91"/>
<wire x1="71.12" y1="127" x2="71.12" y2="129.54" width="0.1524" layer="91"/>
<wire x1="71.12" y1="129.54" x2="53.34" y2="129.54" width="0.1524" layer="91"/>
</segment>
</net>
<net name="AIN3" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="AIN3"/>
<wire x1="88.9" y1="124.46" x2="81.28" y2="124.46" width="0.1524" layer="91"/>
<label x="78.74" y="124.46" size="1.27" layer="95" rot="R180" xref="yes"/>
<wire x1="81.28" y1="124.46" x2="78.74" y2="124.46" width="0.1524" layer="91"/>
<wire x1="81.28" y1="124.46" x2="81.28" y2="121.92" width="0.1524" layer="91"/>
<wire x1="81.28" y1="121.92" x2="68.58" y2="121.92" width="0.1524" layer="91"/>
<wire x1="68.58" y1="121.92" x2="68.58" y2="127" width="0.1524" layer="91"/>
<pinref part="U$50" gate="G$1" pin="4"/>
<wire x1="68.58" y1="127" x2="53.34" y2="127" width="0.1524" layer="91"/>
</segment>
</net>
<net name="AIN4" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="AIN4"/>
<wire x1="88.9" y1="119.38" x2="81.28" y2="119.38" width="0.1524" layer="91"/>
<label x="78.74" y="119.38" size="1.27" layer="95" rot="R180" xref="yes"/>
<wire x1="81.28" y1="119.38" x2="78.74" y2="119.38" width="0.1524" layer="91"/>
<wire x1="81.28" y1="119.38" x2="81.28" y2="116.84" width="0.1524" layer="91"/>
<wire x1="81.28" y1="116.84" x2="66.04" y2="116.84" width="0.1524" layer="91"/>
<pinref part="U$50" gate="G$1" pin="5"/>
<wire x1="66.04" y1="116.84" x2="66.04" y2="124.46" width="0.1524" layer="91"/>
<wire x1="66.04" y1="124.46" x2="53.34" y2="124.46" width="0.1524" layer="91"/>
</segment>
</net>
<net name="AIN5" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="AIN5"/>
<wire x1="88.9" y1="114.3" x2="81.28" y2="114.3" width="0.1524" layer="91"/>
<label x="78.74" y="114.3" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="U$50" gate="G$1" pin="6"/>
<wire x1="81.28" y1="114.3" x2="78.74" y2="114.3" width="0.1524" layer="91"/>
<wire x1="53.34" y1="121.92" x2="63.5" y2="121.92" width="0.1524" layer="91"/>
<wire x1="63.5" y1="121.92" x2="63.5" y2="111.76" width="0.1524" layer="91"/>
<wire x1="63.5" y1="111.76" x2="81.28" y2="111.76" width="0.1524" layer="91"/>
<wire x1="81.28" y1="111.76" x2="81.28" y2="114.3" width="0.1524" layer="91"/>
</segment>
</net>
<net name="AIN6" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="AIN6"/>
<wire x1="88.9" y1="109.22" x2="81.28" y2="109.22" width="0.1524" layer="91"/>
<label x="78.74" y="109.22" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="U$50" gate="G$1" pin="7"/>
<wire x1="81.28" y1="109.22" x2="78.74" y2="109.22" width="0.1524" layer="91"/>
<wire x1="53.34" y1="119.38" x2="60.96" y2="119.38" width="0.1524" layer="91"/>
<wire x1="60.96" y1="119.38" x2="60.96" y2="106.68" width="0.1524" layer="91"/>
<wire x1="60.96" y1="106.68" x2="81.28" y2="106.68" width="0.1524" layer="91"/>
<wire x1="81.28" y1="106.68" x2="81.28" y2="109.22" width="0.1524" layer="91"/>
</segment>
</net>
<net name="AIN7" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="AIN7"/>
<wire x1="88.9" y1="104.14" x2="81.28" y2="104.14" width="0.1524" layer="91"/>
<label x="78.74" y="104.14" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="U$50" gate="G$1" pin="8"/>
<wire x1="81.28" y1="104.14" x2="78.74" y2="104.14" width="0.1524" layer="91"/>
<wire x1="53.34" y1="116.84" x2="58.42" y2="116.84" width="0.1524" layer="91"/>
<wire x1="58.42" y1="116.84" x2="58.42" y2="101.6" width="0.1524" layer="91"/>
<wire x1="58.42" y1="101.6" x2="81.28" y2="101.6" width="0.1524" layer="91"/>
<wire x1="81.28" y1="101.6" x2="81.28" y2="104.14" width="0.1524" layer="91"/>
</segment>
</net>
<net name="AIN8" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="AIN8"/>
<wire x1="88.9" y1="99.06" x2="81.28" y2="99.06" width="0.1524" layer="91"/>
<label x="78.74" y="99.06" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="U$50" gate="G$1" pin="9"/>
<wire x1="81.28" y1="99.06" x2="78.74" y2="99.06" width="0.1524" layer="91"/>
<wire x1="53.34" y1="114.3" x2="55.88" y2="114.3" width="0.1524" layer="91"/>
<wire x1="55.88" y1="114.3" x2="55.88" y2="96.52" width="0.1524" layer="91"/>
<wire x1="55.88" y1="96.52" x2="81.28" y2="96.52" width="0.1524" layer="91"/>
<wire x1="81.28" y1="96.52" x2="81.28" y2="99.06" width="0.1524" layer="91"/>
</segment>
</net>
<net name="AIN9" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="AIN9"/>
<wire x1="144.78" y1="93.98" x2="147.32" y2="93.98" width="0.1524" layer="91"/>
<label x="154.94" y="93.98" size="1.27" layer="95" xref="yes"/>
<pinref part="U$50" gate="G$1" pin="10"/>
<wire x1="147.32" y1="93.98" x2="154.94" y2="93.98" width="0.1524" layer="91"/>
<wire x1="53.34" y1="111.76" x2="53.34" y2="93.98" width="0.1524" layer="91"/>
<wire x1="53.34" y1="93.98" x2="71.12" y2="93.98" width="0.1524" layer="91"/>
<wire x1="71.12" y1="93.98" x2="71.12" y2="83.82" width="0.1524" layer="91"/>
<wire x1="71.12" y1="83.82" x2="147.32" y2="83.82" width="0.1524" layer="91"/>
<wire x1="147.32" y1="83.82" x2="147.32" y2="93.98" width="0.1524" layer="91"/>
</segment>
</net>
<net name="AIN10" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="AIN10"/>
<wire x1="144.78" y1="99.06" x2="154.94" y2="99.06" width="0.1524" layer="91"/>
<label x="154.94" y="99.06" size="1.27" layer="95" xref="yes"/>
</segment>
</net>
<net name="ADO" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="DATA_OUT"/>
<wire x1="144.78" y1="119.38" x2="180.34" y2="119.38" width="0.1524" layer="91"/>
<label x="193.04" y="119.38" size="1.27" layer="95" xref="yes"/>
<pinref part="R14" gate="G$1" pin="P$2"/>
<wire x1="180.34" y1="119.38" x2="193.04" y2="119.38" width="0.1524" layer="91"/>
<wire x1="180.34" y1="114.3" x2="180.34" y2="119.38" width="0.1524" layer="91"/>
<junction x="180.34" y="119.38"/>
</segment>
<segment>
<pinref part="P2" gate="G$1" pin="P12"/>
<wire x1="81.28" y1="20.32" x2="106.68" y2="20.32" width="0.1524" layer="91"/>
<wire x1="106.68" y1="20.32" x2="106.68" y2="38.1" width="0.1524" layer="91"/>
<label x="106.68" y="38.1" size="1.27" layer="95" rot="R90" xref="yes"/>
</segment>
</net>
<net name="ADI" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="DATA_INPUT"/>
<wire x1="144.78" y1="124.46" x2="205.74" y2="124.46" width="0.1524" layer="91"/>
<label x="210.82" y="124.46" size="1.27" layer="95" xref="yes"/>
<pinref part="R15" gate="G$1" pin="P$2"/>
<wire x1="205.74" y1="124.46" x2="210.82" y2="124.46" width="0.1524" layer="91"/>
<wire x1="205.74" y1="114.3" x2="205.74" y2="124.46" width="0.1524" layer="91"/>
<junction x="205.74" y="124.46"/>
</segment>
<segment>
<pinref part="P2" gate="G$1" pin="P13"/>
<wire x1="81.28" y1="22.86" x2="104.14" y2="22.86" width="0.1524" layer="91"/>
<wire x1="104.14" y1="22.86" x2="104.14" y2="38.1" width="0.1524" layer="91"/>
<label x="104.14" y="38.1" size="1.27" layer="95" rot="R90" xref="yes"/>
</segment>
</net>
<net name="AIO" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="I/O_CLOCK"/>
<wire x1="144.78" y1="129.54" x2="154.94" y2="129.54" width="0.1524" layer="91"/>
<label x="154.94" y="129.54" size="1.27" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="P2" gate="G$1" pin="P14"/>
<wire x1="81.28" y1="25.4" x2="101.6" y2="25.4" width="0.1524" layer="91"/>
<wire x1="101.6" y1="25.4" x2="101.6" y2="38.1" width="0.1524" layer="91"/>
<label x="101.6" y="38.1" size="1.27" layer="95" rot="R90" xref="yes"/>
</segment>
</net>
<net name="AEOC" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="EOC"/>
<wire x1="144.78" y1="134.62" x2="154.94" y2="134.62" width="0.1524" layer="91"/>
<label x="154.94" y="134.62" size="1.27" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="P2" gate="G$1" pin="P15"/>
<wire x1="81.28" y1="27.94" x2="99.06" y2="27.94" width="0.1524" layer="91"/>
<wire x1="99.06" y1="27.94" x2="99.06" y2="38.1" width="0.1524" layer="91"/>
<label x="99.06" y="38.1" size="1.27" layer="95" rot="R90" xref="yes"/>
</segment>
</net>
<net name="XBEEDIN" class="0">
<segment>
<pinref part="P1" gate="G$1" pin="P14"/>
<wire x1="-68.58" y1="25.4" x2="-55.88" y2="25.4" width="0.1524" layer="91"/>
<label x="-55.88" y="25.4" size="1.27" layer="95" xref="yes"/>
</segment>
<segment>
<label x="-55.88" y="106.68" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="R5" gate="G$1" pin="P$2"/>
<wire x1="-55.88" y1="106.68" x2="-53.34" y2="106.68" width="0.1524" layer="91"/>
<wire x1="-53.34" y1="106.68" x2="-53.34" y2="96.52" width="0.1524" layer="91"/>
<pinref part="U$19" gate="G$1" pin="DIN/D14"/>
<wire x1="-53.34" y1="106.68" x2="-5.08" y2="106.68" width="0.1524" layer="91"/>
<junction x="-53.34" y="106.68"/>
</segment>
</net>
<net name="XBEEDOUT" class="0">
<segment>
<pinref part="P1" gate="G$1" pin="P15"/>
<wire x1="-68.58" y1="27.94" x2="-55.88" y2="27.94" width="0.1524" layer="91"/>
<label x="-55.88" y="27.94" size="1.27" layer="95" xref="yes"/>
</segment>
<segment>
<label x="-71.12" y="109.22" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="U$19" gate="G$1" pin="DOUT/D13"/>
<wire x1="-5.08" y1="109.22" x2="-68.58" y2="109.22" width="0.1524" layer="91"/>
<pinref part="R4" gate="G$1" pin="P$2"/>
<wire x1="-68.58" y1="109.22" x2="-71.12" y2="109.22" width="0.1524" layer="91"/>
<wire x1="-68.58" y1="96.52" x2="-68.58" y2="109.22" width="0.1524" layer="91"/>
<junction x="-68.58" y="109.22"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<pinref part="S1" gate="G$1" pin="2"/>
<wire x1="-5.08" y1="101.6" x2="-33.02" y2="101.6" width="0.1524" layer="91"/>
<pinref part="U$19" gate="G$1" pin="RST"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<wire x1="-5.08" y1="99.06" x2="-30.48" y2="99.06" width="0.1524" layer="91"/>
<wire x1="-30.48" y1="99.06" x2="-30.48" y2="96.52" width="0.1524" layer="91"/>
<pinref part="R11" gate="G$1" pin="P$2"/>
<pinref part="U$19" gate="G$1" pin="D10/RSSI"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="R11" gate="G$1" pin="P$1"/>
<pinref part="RSSI" gate="G$1" pin="IN"/>
<wire x1="-30.48" y1="83.82" x2="-30.48" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="XDI" gate="G$1" pin="IN"/>
<pinref part="R5" gate="G$1" pin="P$1"/>
<wire x1="-53.34" y1="83.82" x2="-53.34" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="U$19" gate="G$1" pin="D5/ASSOC"/>
<pinref part="R6" gate="G$1" pin="P$2"/>
<wire x1="35.56" y1="99.06" x2="48.26" y2="99.06" width="0.1524" layer="91"/>
<wire x1="48.26" y1="99.06" x2="48.26" y2="96.52" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="R6" gate="G$1" pin="P$1"/>
<pinref part="ASSOC" gate="G$1" pin="IN"/>
<wire x1="48.26" y1="86.36" x2="48.26" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="PRST" class="0">
<segment>
<pinref part="S2" gate="G$1" pin="2"/>
<wire x1="-81.28" y1="53.34" x2="-78.74" y2="53.34" width="0.1524" layer="91"/>
<label x="-78.74" y="53.34" size="1.27" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="P1" gate="G$1" pin="RST"/>
<wire x1="-68.58" y1="33.02" x2="-66.04" y2="33.02" width="0.1524" layer="91"/>
<label x="-66.04" y="33.02" size="1.27" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="P2" gate="G$1" pin="RST"/>
<wire x1="81.28" y1="33.02" x2="83.82" y2="33.02" width="0.1524" layer="91"/>
<label x="83.82" y="33.02" size="1.27" layer="95" xref="yes"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<pinref part="P1" gate="G$1" pin="P16"/>
<wire x1="-154.94" y1="38.1" x2="-99.06" y2="38.1" width="0.1524" layer="91"/>
<wire x1="-154.94" y1="38.1" x2="-154.94" y2="7.62" width="0.1524" layer="91"/>
<pinref part="R9" gate="G$1" pin="P$2"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="P1" gate="G$1" pin="P18"/>
<wire x1="-99.06" y1="33.02" x2="-134.62" y2="33.02" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="P$2"/>
<wire x1="-134.62" y1="33.02" x2="-134.62" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$27" class="0">
<segment>
<pinref part="P1" gate="G$1" pin="P17"/>
<wire x1="-144.78" y1="35.56" x2="-99.06" y2="35.56" width="0.1524" layer="91"/>
<pinref part="R16" gate="G$1" pin="P$2"/>
<wire x1="-144.78" y1="35.56" x2="-144.78" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="P1" gate="G$1" pin="3.3V"/>
<wire x1="-99.06" y1="30.48" x2="-109.22" y2="30.48" width="0.1524" layer="91"/>
<pinref part="R12" gate="G$1" pin="P$2"/>
<wire x1="-109.22" y1="30.48" x2="-109.22" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="P2" gate="G$1" pin="3.3V"/>
<wire x1="50.8" y1="30.48" x2="43.18" y2="30.48" width="0.1524" layer="91"/>
<pinref part="R13" gate="G$1" pin="P$2"/>
<wire x1="43.18" y1="30.48" x2="43.18" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="R14" gate="G$1" pin="P$1"/>
<pinref part="ADO" gate="G$1" pin="IN"/>
<wire x1="180.34" y1="104.14" x2="180.34" y2="101.6" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="R15" gate="G$1" pin="P$1"/>
<pinref part="ADI" gate="G$1" pin="IN"/>
<wire x1="205.74" y1="104.14" x2="205.74" y2="101.6" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="XDO" gate="G$1" pin="IN"/>
<pinref part="R4" gate="G$1" pin="P$1"/>
<wire x1="-68.58" y1="83.82" x2="-68.58" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="R9" gate="G$1" pin="P$1"/>
<pinref part="P1I1" gate="G$1" pin="IN"/>
<wire x1="-154.94" y1="-2.54" x2="-154.94" y2="-5.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="R16" gate="G$1" pin="P$1"/>
<pinref part="P1I3" gate="G$1" pin="IN"/>
<wire x1="-144.78" y1="-2.54" x2="-144.78" y2="-5.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="R1" gate="G$1" pin="P$1"/>
<pinref part="P1I2" gate="G$1" pin="IN"/>
<wire x1="-134.62" y1="-2.54" x2="-134.62" y2="-5.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="R12" gate="G$1" pin="P$1"/>
<pinref part="P1PWR" gate="G$1" pin="IN"/>
<wire x1="-109.22" y1="-2.54" x2="-109.22" y2="-5.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<pinref part="R7" gate="G$1" pin="P$1"/>
<pinref part="P2RX" gate="G$1" pin="IN"/>
<wire x1="-60.96" y1="-2.54" x2="-60.96" y2="-5.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<pinref part="R10" gate="G$1" pin="P$1"/>
<pinref part="P2I1" gate="G$1" pin="IN"/>
<wire x1="-5.08" y1="-2.54" x2="-5.08" y2="-5.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<pinref part="R18" gate="G$1" pin="P$1"/>
<pinref part="P2I2" gate="G$1" pin="IN"/>
<wire x1="5.08" y1="-2.54" x2="5.08" y2="-5.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$26" class="0">
<segment>
<pinref part="R17" gate="G$1" pin="P$1"/>
<pinref part="P2I3" gate="G$1" pin="IN"/>
<wire x1="15.24" y1="-2.54" x2="15.24" y2="-5.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$28" class="0">
<segment>
<pinref part="R13" gate="G$1" pin="P$1"/>
<pinref part="P2PWR" gate="G$1" pin="IN"/>
<wire x1="43.18" y1="-2.54" x2="43.18" y2="-5.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$30" class="0">
<segment>
<pinref part="R8" gate="G$1" pin="P$1"/>
<pinref part="P2TX" gate="G$1" pin="IN"/>
<wire x1="83.82" y1="-2.54" x2="83.82" y2="-5.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="VCC2" class="0">
<segment>
<pinref part="U$26" gate="G$1" pin="VCC2"/>
<wire x1="345.44" y1="147.32" x2="345.44" y2="144.78" width="0.1524" layer="91"/>
<pinref part="P4" gate="G$1" pin="V+"/>
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="HV"/>
<pinref part="U$42" gate="G$1" pin="VCC2"/>
<wire x1="124.46" y1="10.16" x2="132.08" y2="10.16" width="0.1524" layer="91"/>
<wire x1="132.08" y1="10.16" x2="132.08" y2="12.7" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$49" gate="G$1" pin="VCC2"/>
<pinref part="R20" gate="G$1" pin="P$2"/>
<wire x1="147.32" y1="30.48" x2="147.32" y2="27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="GND2" class="0">
<segment>
<pinref part="U$24" gate="G$1" pin="GND2"/>
<wire x1="345.44" y1="139.7" x2="345.44" y2="137.16" width="0.1524" layer="91"/>
<pinref part="P4" gate="G$1" pin="V-"/>
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="HVG"/>
<pinref part="U$44" gate="G$1" pin="GND2"/>
<wire x1="124.46" y1="5.08" x2="132.08" y2="5.08" width="0.1524" layer="91"/>
<wire x1="132.08" y1="5.08" x2="132.08" y2="2.54" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$51" gate="G$1" pin="GND2"/>
<wire x1="170.18" y1="25.4" x2="170.18" y2="17.78" width="0.1524" layer="91"/>
<pinref part="R21" gate="G$1" pin="P$1"/>
<wire x1="167.64" y1="25.4" x2="170.18" y2="25.4" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="SIG-CONN" gate="G$1" pin="OUT"/>
<pinref part="U$52" gate="G$1" pin="GND2"/>
<wire x1="152.4" y1="-12.7" x2="152.4" y2="-15.24" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="OUT1"/>
<wire x1="124.46" y1="12.7" x2="129.54" y2="12.7" width="0.1524" layer="91"/>
<wire x1="129.54" y1="12.7" x2="129.54" y2="17.78" width="0.1524" layer="91"/>
<wire x1="129.54" y1="17.78" x2="137.16" y2="17.78" width="0.1524" layer="91"/>
<wire x1="137.16" y1="17.78" x2="137.16" y2="12.7" width="0.1524" layer="91"/>
<wire x1="137.16" y1="12.7" x2="154.94" y2="12.7" width="0.1524" layer="91"/>
<pinref part="J5" gate="G$1" pin="RING1"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="R19" gate="G$1" pin="P$1"/>
<pinref part="XBEE-PWR" gate="G$1" pin="IN"/>
<wire x1="-88.9" y1="86.36" x2="-88.9" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$32" class="0">
<segment>
<pinref part="J5" gate="G$1" pin="TIP"/>
<wire x1="154.94" y1="15.24" x2="147.32" y2="15.24" width="0.1524" layer="91"/>
<pinref part="R20" gate="G$1" pin="P$1"/>
<wire x1="147.32" y1="17.78" x2="147.32" y2="15.24" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="J5" gate="G$1" pin="SLEEVE"/>
<wire x1="154.94" y1="17.78" x2="152.4" y2="17.78" width="0.1524" layer="91"/>
<wire x1="152.4" y1="17.78" x2="152.4" y2="25.4" width="0.1524" layer="91"/>
<pinref part="R21" gate="G$1" pin="P$2"/>
<wire x1="152.4" y1="25.4" x2="157.48" y2="25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$33" class="0">
<segment>
<pinref part="R22" gate="G$1" pin="P$1"/>
<pinref part="SIG-CONN" gate="G$1" pin="IN"/>
<wire x1="152.4" y1="-2.54" x2="152.4" y2="-5.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$34" class="0">
<segment>
<pinref part="J5" gate="G$1" pin="TS"/>
<pinref part="R22" gate="G$1" pin="P$2"/>
<wire x1="154.94" y1="7.62" x2="152.4" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$29" class="0">
<segment>
<pinref part="P2" gate="G$1" pin="P18"/>
<pinref part="R17" gate="G$1" pin="P$2"/>
<wire x1="50.8" y1="33.02" x2="15.24" y2="33.02" width="0.1524" layer="91"/>
<wire x1="15.24" y1="33.02" x2="15.24" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<pinref part="P2" gate="G$1" pin="P16"/>
<pinref part="R10" gate="G$1" pin="P$2"/>
<wire x1="50.8" y1="38.1" x2="-5.08" y2="38.1" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="38.1" x2="-5.08" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$31" class="0">
<segment>
<pinref part="P2" gate="G$1" pin="P17"/>
<pinref part="R18" gate="G$1" pin="P$2"/>
<wire x1="50.8" y1="35.56" x2="5.08" y2="35.56" width="0.1524" layer="91"/>
<wire x1="5.08" y1="35.56" x2="5.08" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="6.3" minversion="6.2.2" severity="warning">
Since Version 6.2.2 text objects can contain more than one line,
which will not be processed correctly with this version.
</note>
</compatibility>
</eagle>
