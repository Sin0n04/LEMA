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
                        <td> <a href="{web}"><xsl:value-of select="nombre"/></a>
                      </td>
                      </tr>
                    </table>
                </li>
              </ul>
            </xsl:for-each>
                
          </nav>
          <xsl:for-each select = "almacen/producto" >
            <xsl:variable name="pvp"
                          select="precio * (1 + ../iva div 100)"/>
            
            
            <table>
              <tr>
                <th colspan="2" border="5"> <xsl:value-of select = "nombre" /> </th>
              </tr>
              <tr>
                <td> Precio: </td>
                <td> <xsl:value-of select="format-number($pvp, '#.00')"/> €
                                         </td>
              </tr>
              <tr>
                <td> Cantidad: </td>
                <td> <xsl:value-of select = "cantidad" /> </td>
              </tr>
              <tr>
                <td>Imagen:</td>
                <td><img src="imagenes/{imagen}" class="CalloutRightPhoto"/></td>
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
