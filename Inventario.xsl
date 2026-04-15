<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes" doctype-system="about:legacy-compat"/>

    <xsl:template match="/">
        <html lang="es">
        <head>
            <meta charset="UTF-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <title>Catálogo Digital - Mercadillo Escolar</title>
            <style>
                /* CSS Integrado (Fusión del diseño de plantilla_tarjeta.html) */
                body {
                    font-family: 'Segoe UI', Arial, sans-serif;
                    background-color: #f0f2f5;
                    margin: 0;
                    padding: 20px;
                    color: #333;
                }

                h1 {
                    text-align: center;
                    color: #2c3e50;
                    margin-bottom: 30px;
                }

                /* Contenedor principal usando GRID para Responsividad automática */
                .contenedor-grid {
                    display: grid;
                    /* Crea columnas automáticamente de mínimo 280px */
                    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
                    gap: 20px;
                    max-width: 1200px;
                    margin: 0 auto;
                }

                /* Estilo de la Tarjeta de Producto (Fase 2 Diseño) */
                .tarjeta {
                    background: white;
                    padding: 20px;
                    border-radius: 12px;
                    box-shadow: 0 4px 6px rgba(0,0,0,0.05);
                    display: flex;
                    flex-direction: column; /* Diseño en columna */
                    transition: transform 0.2s, box-shadow 0.2s;
                    border: 1px solid #eee;
                }

                .tarjeta:hover {
                    transform: translateY(-5px);
                    box-shadow: 0 8px 15px rgba(0,0,0,0.1);
                }

                .ref {
                    font-size: 0.75rem;
                    color: #999;
                    text-align: right;
                    margin-bottom: 5px;
                }

                h2 {
                    color: #e67e22;
                    margin: 0 0 15px 0;
                    font-size: 1.4rem;
                    border-bottom: 2px solid #f4f4f4;
                    padding-bottom: 10px;
                }

                .datos-clave p {
                    margin: 5px 0;
                    font-size: 0.9rem;
                }

                .datos-clave strong {
                    color: #555;
                }

                .descripcion {
                    margin: 15px 0;
                    font-style: italic;
                    color: #666;
                    font-size: 0.95rem;
                    flex-grow: 1; /* Empuja el QR hacia abajo si hay poca descripción */
                }

                /* Contenedor del QR (Lógica Fase 2) */
                .qr-zona {
                    text-align: center;
                    background: #f9f9f9;
                    padding: 15px;
                    border-radius: 8px;
                    margin-top: auto; /* Se pega abajo */
                    min-height: 150px; /* Evita saltos visuales al cargar */
                }

                .qr-zona img {
                    width: 130px;
                    height: 130px;
                    border: 1px solid #eee;
                    background: white;
                    padding: 5px;
                }

                .qr-help {
                    font-size: 0.75rem;
                    color: #888;
                    margin-top: 8px;
                    margin-bottom: 0;
                }

                .volver {
                    text-align: center;
                    margin-top: 40px;
                    margin-bottom: 20px;
                }
                .volver a {
                    text-decoration: none;
                    color: #2c3e50;
                    font-weight: bold;
                }

                /* Ajustes para pantallas muy pequeñas */
                @media (max-width: 400px) {
                    body { padding: 10px; }
                    .tarjeta { padding: 15px; }
                }
            </style>
        </head>
        <body>
            <h1>Catálogo Disponible</h1>

            <div class="contenedor-grid">
                <xsl:for-each select="inventario/item">
                    <div class="tarjeta">
                        <div class="ref">REF: #<xsl:value-of select="id"/></div>
                        <h2><xsl:value-of select="nombre"/></h2>
                        
                        <div class="datos-clave">
                            <p><strong>Categoría:</strong> <xsl:value-of select="categoria"/></p>
                            <p><strong>Estado:</strong> <xsl:value-of select="estado"/></p>
                            <p><strong>Vendedor:</strong> <xsl:value-of select="propietario"/></p>
                        </div>

                        <p class="descripcion"><xsl:value-of select="descripcion"/></p>

                        <div class="qr-zona">
                            <img alt="Código QR de información del producto">
                                <xsl:attribute name="src">
                                    <xsl:value-of select="concat('https://api.qrserver.com/v1/create-qr-code/?size=150x150&amp;data=detalle', id, '.html')"/>
                                </xsl:attribute>
                            </img>
                            <p class="qr-help">Escanea para ver detalles en tu móvil</p>
                        </div>
                    </div>
                </xsl:for-each>
            </div>

            <div class="volver">
                <a href="index.html">← Volver a la página principal</a>
            </div>

        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>