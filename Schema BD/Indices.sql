
create index idx_nombreAnuncio on ANUNCIO(Nombre);
create index idx_nombreCampaña on CAMPAÑA(Nombre);
create index idx_nombreConjuntoAnuncios on CONJUNTO_DE_ANUNCIOS(Nombre);
create index idx_descripcionFactura on FACTURA(Descripcion);
create index idx_idCantidadPagoFactura on FACTURA(Cantidad_Pago);