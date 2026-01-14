<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:array="http://www.w3.org/2005/xpath-functions/array"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                exclude-result-prefixes="#all"
                expand-text="yes"
                version="3.0">

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <link rel = "stylesheet" type="text/css" href="almacenEA.css"/>
    
      </head>
      <body>
        <header>

        </header>
        <section>
          <nav>
            
            <xsl:for-each select = "almacen/marcas/marca">
              <ul>
                <li>
                    <table>
                      <tr>
                        <th><xsl:value-of select = "nombre"/></th>
                      </tr>
                      <tr>
                        <td><a><xsl:value-of select = "web"/></a></td>
                      </tr>
                    </table>
                </li>
              </ul>
            </xsl:for-each>
                
          </nav>
          <xsl:for-each select = "almacen/producto" >
            <table>
              <tr>
                <th colspan="2" border="5"> <xsl:value-of select = "nombre" /> </th>
              </tr>
              <tr>
                <td> Precio: </td>
                <td> <xsl:value-of select = "precio" /> </td>
              </tr>
              <tr>
                <td> Cantidad: </td>
                <td> <xsl:value-of select = "cantidad" /> </td>
              </tr>
              <tr>
                <td></td>
                <td></td>
              </tr>
            </table>
          </xsl:for-each>

        </section>
        <footer>

        </footer>
      </body>
    </html>
  </xsl:template>

  

</xsl:stylesheet>
