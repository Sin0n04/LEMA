<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

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
                        <td> <a href="{web}" target="_blank"><xsl:value-of select="nombre"/></a>
                      </td>
                      </tr>
                    </table>
                </li>
              </ul>
            </xsl:for-each>
                
          </nav>
          <xsl:for-each select = "almacen/producto" >
            <xsl:variable name="pvp"
                          select="precio *(1 + ganancia div 100) * (1 + ../iva div 100)"/>
            
            
            <table>
              <tr>
                <th colspan="4" border="5"> <xsl:value-of select = "nombre" /> </th>
              </tr>
              <tr>
                <td class="precio" rowspan="2"> Precio: </td>
                <td> <xsl:value-of select="format-number($pvp, '#.00')"/> €
                                         </td>
              </tr>
              <tr></tr>
              <tr>
                <td class="cantidad"> Stock_status: </td>
                <xsl:choose>
                  <xsl:when test="cantidad = 0">
                    <td><span class="out">OUT OF STOCK</span></td>
                  </xsl:when>
                  <xsl:when test="cantidad &gt; 0 and cantidad &lt; 10">
                    <td><span class="low">LOW STOCK</span></td>
                  </xsl:when>
                  <xsl:otherwise>
                    <td><span class="in-stock">IN STOCK</span></td>
                  </xsl:otherwise>
                </xsl:choose>
              </tr>
              <tr>
                <td class="imagen">Imagen:</td>
                <td><img src="imagenes/{imagen}" class="CalloutRightPhoto"/></td>
              </tr>
              <tr>
                <td class="modelo"> Modelo: </td>
                <td> <xsl:value-of select = "modelo" /> </td>
                <td class="cantidad"> Cantidad: </td>
                <td> <xsl:value-of select = "cantidad" /> </td>
              </tr>
            </table>
          </xsl:for-each>

        </section>
        <footer>
          <p>2026 Emmanuel_Ani</p>

        </footer>
      </body>
    </html>
  </xsl:template>

  

</xsl:stylesheet>
